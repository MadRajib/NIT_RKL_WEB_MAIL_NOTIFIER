
# Requirements
# Create environment variable 
# NIT_USR : Your User Name in Nit mail server
# NIT_PW : Your mail server password
# MAIL_USR : Your gmail server username
# MAIL_PW : Your gmail server password
# MAIL_SND : To which mail the notification to send to


import os,re
import requests
from bs4 import BeautifulSoup


_ERROR = -1
ER_WEBPAGE_UNAVAILABLE = "couldn't connect to url";

headers = {
    'User-Agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.157 Safari/537.36'
}
login_data ={
    'loginOp': 'login',
    'client': 'standard',
}
login_data['username'] = os.environ.get("NIT_USR")
login_data['password'] = os.environ.get("NIT_PW")


def check4Urgent(msg):
    try:
        return msg.find("img").attrs['alt'] == "High Priority"
    except:
        return False
    
def check4Movie(msg):
    text = ""
    try:
        text = str(msg.find("span",attrs={'class':"Fragment"}))
    except:
        return False
    matches = re.search(r"[M|m]ovie[s]?", text, re.MULTILINE)
    if matches != None: return True
    return False
        
def webscrape():
    with requests.Session() as s:
        url = "https://mail.nitrkl.ac.in/"
        try:
            r= s.get(url,headers=headers)
        except:
            return _ERROR
        soup = BeautifulSoup(r.content,features="html.parser")
        login_data["login_csrf"] = soup.find('input',attrs={'name':'login_csrf'})['value']
        
        r= s.post(url,data=login_data,headers=headers)
        soup = BeautifulSoup(r.content)
        inbox = soup.find("tbody", {"id": "mess_list_tbody"})
        message_list =list(inbox.find_all("tr",{"class":"Unread"}))
        return message_list
def mailDetails():
    detail = dict()

    mgs = webscrape()

    if mgs == _ERROR:
        detail["error"] = ER_WEBPAGE_UNAVAILABLE
        return detail

    urgent = len(list(filter(check4Urgent,mgs)))
    movie  = len(list(filter(check4Movie,mgs)))
    
    detail["mails"]  = len(mgs)
    detail["urgent"] = urgent
    detail["movie"]  = movie

    return detail

if __name__ == "__main__":
    # numberOfMails()
    print(mailDetails())
    pass




