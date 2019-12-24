from flask import Flask
from flask_restful import Resource, Api
from flask_restful import reqparse
from webscrapping import mailDetails 

app = Flask(__name__)
api = Api(app)


parser = reqparse.RequestParser()
parser.add_argument('a',type=int);
parser.add_argument('b',type=int);

MAILS = {
    '#mails':'',
    '#urgent':''
}
ERROR ={
    "message":"",
}
class mails(Resource):
    def get(self,token):
        # TODO: set your token
        if token == "your_token":
            details = mailDetails()
            if (details.get("error")):
                ERROR["message"] = details["error"]
                return ERROR
            else:    
                MAILS['#mails']  = details["mails"]
                MAILS['#urgent'] = details["urgent"]
                MAILS['#movie']  = details["movie"]
                return MAILS
        ERROR["message"] = "Invalid Token!"
        return ERROR

api.add_resource(mails, '/mails/<string:token>')

if __name__ == '__main__':
    app.run(debug=True)
