#include <string.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/event_groups.h"
#include "esp_system.h"
#include "esp_wifi.h"
#include "esp_event.h"
#include "esp_log.h"
#include "nvs_flash.h"
#include "esp_http_client.h"
#include "lwip/err.h"
#include "lwip/sys.h"
#include "cJSON.h"
#include "driver/gpio.h"

//TODO: add your wifi name and password
#define EXAMPLE_ESP_WIFI_SSID      "wifi_name"
#define EXAMPLE_ESP_WIFI_PASS      "wifi_password"
#define EXAMPLE_ESP_MAXIMUM_RETRY  CONFIG_ESP_MAXIMUM_RETRY

#define STATION_SLEEP_TIME 60000


#define GPIO_OUTPUT_IO_g 13
#define GPIO_OUTPUT_IO_d 12
#define GPIO_OUTPUT_IO_e 14
#define GPIO_OUTPUT_IO_f 27
#define GPIO_OUTPUT_IO_a 26
#define GPIO_OUTPUT_IO_b 25
#define GPIO_OUTPUT_IO_c 33
#define GPIO_OUTPUT_IO_tn 22
#define GPIO_OUTPUT_IO_un 23

#define GPIO_OUTPUT_IO_ur 21
#define GPIO_OUTPUT_IO_wf 19

uint8_t g_mails = 0,g_urgent = 0,g_movie = 0;



/* FreeRTOS event group to signal when we are connected*/
static EventGroupHandle_t s_wifi_event_group;

/* The event group allows multiple bits for each event, but we only care about one event 
 * - are we connected to the AP with an IP? */
const int WIFI_CONNECTED_BIT = BIT0;

static const char *TAG = "wifi station";

static int s_retry_num = 0;
bool is_sta_connected = false;

unsigned long delayBetweenChecks = 60000;
unsigned long whenDueToCheck = 0;
uint8_t  ur_led = 0;
uint8_t wf_led = 0; 

void setUpPin(){
    gpio_pad_select_gpio(GPIO_OUTPUT_IO_g);
    gpio_pad_select_gpio(GPIO_OUTPUT_IO_d);
    gpio_pad_select_gpio(GPIO_OUTPUT_IO_e);
    gpio_pad_select_gpio(GPIO_OUTPUT_IO_f);
    gpio_pad_select_gpio(GPIO_OUTPUT_IO_a);
    gpio_pad_select_gpio(GPIO_OUTPUT_IO_b);
    gpio_pad_select_gpio(GPIO_OUTPUT_IO_c);
    gpio_pad_select_gpio(GPIO_OUTPUT_IO_tn);
    gpio_pad_select_gpio(GPIO_OUTPUT_IO_un);
    gpio_pad_select_gpio(GPIO_OUTPUT_IO_ur);
    gpio_pad_select_gpio(GPIO_OUTPUT_IO_wf);

    gpio_set_direction(GPIO_OUTPUT_IO_g,GPIO_MODE_OUTPUT);
    gpio_set_direction(GPIO_OUTPUT_IO_d,GPIO_MODE_OUTPUT);
    gpio_set_direction(GPIO_OUTPUT_IO_e,GPIO_MODE_OUTPUT);
    gpio_set_direction(GPIO_OUTPUT_IO_f,GPIO_MODE_OUTPUT);
    gpio_set_direction(GPIO_OUTPUT_IO_a,GPIO_MODE_OUTPUT);
    gpio_set_direction(GPIO_OUTPUT_IO_b,GPIO_MODE_OUTPUT);
    gpio_set_direction(GPIO_OUTPUT_IO_c,GPIO_MODE_OUTPUT);
    gpio_set_direction(GPIO_OUTPUT_IO_tn,GPIO_MODE_OUTPUT);
    gpio_set_direction(GPIO_OUTPUT_IO_un,GPIO_MODE_OUTPUT);
    gpio_set_direction(GPIO_OUTPUT_IO_ur,GPIO_MODE_OUTPUT);
    gpio_set_direction(GPIO_OUTPUT_IO_wf,GPIO_MODE_OUTPUT);
    
    gpio_set_level(GPIO_OUTPUT_IO_g, 1);
    gpio_set_level(GPIO_OUTPUT_IO_d, 1);
    gpio_set_level(GPIO_OUTPUT_IO_e, 1);
    gpio_set_level(GPIO_OUTPUT_IO_f, 1);
    gpio_set_level(GPIO_OUTPUT_IO_a, 1);
    gpio_set_level(GPIO_OUTPUT_IO_b, 1);
    gpio_set_level(GPIO_OUTPUT_IO_c, 1);
    gpio_set_level(GPIO_OUTPUT_IO_tn, 0);
    gpio_set_level(GPIO_OUTPUT_IO_un, 0);
    gpio_set_level(GPIO_OUTPUT_IO_ur, 1);
    gpio_set_level(GPIO_OUTPUT_IO_wf, 1);
}

void toggle_urgent(){
    ur_led =!ur_led;
    gpio_set_level(GPIO_OUTPUT_IO_ur,ur_led);
}

void toggle_wf(){
    printf("Called\n");
    wf_led =!wf_led;
    gpio_set_level(GPIO_OUTPUT_IO_wf,wf_led);
}

void unset_urgent(){
    ur_led = 0;
    gpio_set_level(GPIO_OUTPUT_IO_ur,1);
}
void unset_wf(){
    wf_led = 0;
    gpio_set_level(GPIO_OUTPUT_IO_wf,1);
}
void disp_d(uint8_t c){

    switch (c){
    case 0:
        c = 64;
        break;
    case 1:
        c = 103;
        break;
    case 2:
        c = 9;
        break;
    case 3:
        c = 3;
        break;
    case 4:
        c = 38;
        break;
    case 5:
        c = 18;
        break;
    case 6:
        c =16;
        break;
    case 7:
        c = 71;
        break;
    case 8:
        c = 0;
        break;
    case 9:
        c = 2;
        break;
    default:
    
        break;
    }
 
    gpio_set_level(GPIO_OUTPUT_IO_c, c & 1);
    c = c>>1;
    gpio_set_level(GPIO_OUTPUT_IO_b, c & 1);
    c = c>>1;
    gpio_set_level(GPIO_OUTPUT_IO_a, c & 1);
    c = c>>1;
    gpio_set_level(GPIO_OUTPUT_IO_f, c & 1);
    c = c>>1;
    gpio_set_level(GPIO_OUTPUT_IO_e, c & 1);
    c = c>>1;
    gpio_set_level(GPIO_OUTPUT_IO_d, c & 1);
    c = c>>1;
    gpio_set_level(GPIO_OUTPUT_IO_g, c & 1);
}

void disp_num(uint8_t num){
    // printf("%d\n",num);
    if(num>9){
        uint8_t tn = num/10;
        num = num - ((num/10)*10);
        // gpio_set_level(GPIO_OUTPUT_IO_un,0);
        gpio_set_level(GPIO_OUTPUT_IO_tn,1);
        disp_d(tn);
        vTaskDelay(10 / portTICK_PERIOD_MS);
        gpio_set_level(GPIO_OUTPUT_IO_tn,0);
        
    }
    
    // gpio_set_level(GPIO_OUTPUT_IO_tn,0);
    gpio_set_level(GPIO_OUTPUT_IO_un,1);
    disp_d(num);
    vTaskDelay(10 / portTICK_PERIOD_MS);
    gpio_set_level(GPIO_OUTPUT_IO_un,0);
     
}

TaskHandle_t Task1;
void codeForTask1( void * pvParameters ){
    long previousMillis = 0;
    long interval = 1000;
 for( ;; ){

    disp_num(g_mails);

    unsigned long timeNow = esp_log_timestamp();
    if(timeNow - previousMillis > interval) {
        
        previousMillis = timeNow;   
        if(g_urgent > 0) toggle_urgent();
        if(!is_sta_connected) toggle_wf();
        
    }
    
    if(g_urgent == 0 ) unset_urgent();
    if(is_sta_connected) unset_wf();
 }
}
esp_err_t _http_event_handle(esp_http_client_event_t *evt)
{
    switch(evt->event_id) {
        case HTTP_EVENT_ERROR:
            ESP_LOGI(TAG, "HTTP_EVENT_ERROR");
            break;
        case HTTP_EVENT_ON_CONNECTED:
            ESP_LOGI(TAG, "HTTP_EVENT_ON_CONNECTED");
            break;
        case HTTP_EVENT_HEADER_SENT:
            ESP_LOGI(TAG, "HTTP_EVENT_HEADER_SENT");
            break;
        case HTTP_EVENT_ON_HEADER:
            ESP_LOGI(TAG, "HTTP_EVENT_ON_HEADER");
            printf("%.*s", evt->data_len, (char*)evt->data);
            break;
        case HTTP_EVENT_ON_DATA:
            ESP_LOGI(TAG, "HTTP_EVENT_ON_DATA, len=%d", evt->data_len);
            
            
            
            if (!esp_http_client_is_chunked_response(evt->client)) {
    
                cJSON *json = cJSON_Parse((char*)evt->data);
                printf("%.*s", evt->data_len, (char*)evt->data);
                const cJSON *msg = NULL;
                msg = cJSON_GetObjectItemCaseSensitive(json, "message");

                if (cJSON_IsString(msg) && (msg->valuestring != NULL)){

                    printf("Error : \"%s\"\n", msg->valuestring);
                
                }else{
                    const cJSON *mails = cJSON_GetObjectItemCaseSensitive(json, "#mails");
                    const cJSON *urgent = cJSON_GetObjectItemCaseSensitive(json, "#urgent");
                    const cJSON *movie = cJSON_GetObjectItemCaseSensitive(json, "#movie");
                    printf("mails \"%d\"\n", mails->valueint);
                    printf("Urgent \"%d\"\n", urgent->valueint);
                    printf("movies \"%d\"\n", movie->valueint);
                    g_mails = mails->valueint;
                    g_urgent = urgent->valueint;
                }
            }
            break;
        case HTTP_EVENT_ON_FINISH:
            ESP_LOGI(TAG, "HTTP_EVENT_ON_FINISH");
            break;
        case HTTP_EVENT_DISCONNECTED:
            ESP_LOGI(TAG, "HTTP_EVENT_DISCONNECTED");
            break;
    }
    return ESP_OK;
}

void httpRequest(){

    //TODO: add your api url with token
    esp_http_client_config_t config = {
        .url = "https://api-url/token",
        .event_handler = _http_event_handle,
    };
    esp_http_client_handle_t client = esp_http_client_init(&config);
     
    esp_err_t err = esp_http_client_perform(client);

    if (err == ESP_OK) {
    ESP_LOGI(TAG, "Status = %d, content_length = %d",
            esp_http_client_get_status_code(client),
            esp_http_client_get_content_length(client));
    }
    esp_http_client_cleanup(client);
}

void http_Task(){
     ESP_LOGI(TAG,"http called");
     
     for(;;){
                unsigned long timeNow = esp_log_timestamp();
                if ((timeNow > whenDueToCheck))  {
                    httpRequest();
                    whenDueToCheck = timeNow + delayBetweenChecks;
                }

    }
}



static void event_handler(void* arg, esp_event_base_t event_base,  int32_t event_id, void* event_data){

    if ( event_base == WIFI_EVENT && event_id == WIFI_EVENT_STA_START ) {
        esp_wifi_connect();
    }else if ( event_base == WIFI_EVENT && event_id == WIFI_EVENT_STA_DISCONNECTED) {
        is_sta_connected = false;
        ESP_LOGI(TAG,"Connection to AP failed!");
            
        if (s_retry_num < EXAMPLE_ESP_MAXIMUM_RETRY) {
            ESP_LOGI(TAG,"Retrying to connect to AP...");
            esp_wifi_connect();
            xEventGroupClearBits(s_wifi_event_group, WIFI_CONNECTED_BIT);
            s_retry_num++;

        }else{
            ESP_LOGI(TAG,"Maximum Retries!");
            ESP_LOGI(TAG,"Retrying after 20 secs!");
            ESP_LOGI(TAG,"Stoping wifi!");
            ESP_ERROR_CHECK(esp_wifi_stop());
            vTaskDelay(STATION_SLEEP_TIME / portTICK_PERIOD_MS);
            ESP_ERROR_CHECK(esp_wifi_start());
            s_retry_num = 0;
            
        }
        
 
    }else if(event_base == WIFI_EVENT && event_id == WIFI_EVENT_STA_CONNECTED){
        ESP_LOGI(TAG,"Connected to app!");

    }else if (event_base == IP_EVENT && event_id == IP_EVENT_STA_GOT_IP) {
     
        ip_event_got_ip_t* event = (ip_event_got_ip_t*) event_data;
        ESP_LOGI(TAG, "got ip:" IPSTR, IP2STR(&event->ip_info.ip));
        s_retry_num = 0;
        xEventGroupSetBits(s_wifi_event_group, WIFI_CONNECTED_BIT);
    

        ESP_LOGI(TAG,"Now it is connected call the api");
        
        // http_Task();
        is_sta_connected = true;
        
    }
}

void wifi_init_sta(void)
{
    s_wifi_event_group = xEventGroupCreate();

    ESP_ERROR_CHECK(esp_netif_init());

    ESP_ERROR_CHECK(esp_event_loop_create_default());
    esp_netif_create_default_wifi_sta();

    wifi_init_config_t cfg = WIFI_INIT_CONFIG_DEFAULT();
    ESP_ERROR_CHECK(esp_wifi_init(&cfg));

    //Callback functions listens to events!
    
    ESP_ERROR_CHECK(esp_event_handler_register(WIFI_EVENT, ESP_EVENT_ANY_ID, &event_handler, NULL));
    ESP_ERROR_CHECK(esp_event_handler_register(IP_EVENT, IP_EVENT_STA_GOT_IP, &event_handler, NULL));

    wifi_config_t wifi_config = {
        .sta = {
            .ssid = EXAMPLE_ESP_WIFI_SSID,
            .password = EXAMPLE_ESP_WIFI_PASS
        },
    };
    ESP_ERROR_CHECK(esp_wifi_set_mode(WIFI_MODE_STA) );
    ESP_ERROR_CHECK(esp_wifi_set_config(ESP_IF_WIFI_STA, &wifi_config) );

    ESP_LOGI(TAG, "Esp_wifi started");
    ESP_ERROR_CHECK(esp_wifi_start() );

    ESP_LOGI(TAG, "wifi_init_sta finished.");
    ESP_LOGI(TAG, "connect to ap SSID:%s password:%s",
             EXAMPLE_ESP_WIFI_SSID, EXAMPLE_ESP_WIFI_PASS);
}







void app_main(void)
{

    //Initialize NVS
    esp_err_t ret = nvs_flash_init();
    if (ret == ESP_ERR_NVS_NO_FREE_PAGES || ret == ESP_ERR_NVS_NEW_VERSION_FOUND) {
      ESP_ERROR_CHECK(nvs_flash_erase());
      ret = nvs_flash_init();
    }
    ESP_ERROR_CHECK(ret);
    
    ESP_LOGI(TAG, "ESP_WIFI_MODE_STA");

    // Initialize wifi and connect to ap
    wifi_init_sta();

    setUpPin();
    printf("%d\n",xPortGetCoreID());

    xTaskCreatePinnedToCore(
            codeForTask1,            /* Task function. */
            "Task_1",                 /* name of task. */
            1000,                    /* Stack size of task */
            NULL,                     /* parameter of the task */
            1,                        /* priority of the task */
            &Task1,                   /* Task handle to keep track of created task */
            1);                       /* Core */

    ESP_LOGI(TAG,"http called");
    
    while(!is_sta_connected);

    for(;;){
         if(is_sta_connected){
             unsigned long timeNow = esp_log_timestamp();
                if ((timeNow > whenDueToCheck))  {
                    httpRequest();
                    whenDueToCheck = timeNow + delayBetweenChecks;
                }
         }else{

            //  ESP_LOGI(TAG,"Disconnected Sta");
         }  

    }
}
