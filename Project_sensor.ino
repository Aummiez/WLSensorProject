#include <Firebase_ESP_Client.h>

#include <Arduino.h>
#include <ESP8266WiFi.h>

// Sensor Library
#include "DHT.h"
#include <SoftwareSerial.h>

// Additional Library
#include "addons/TokenHelper.h"
#include "addons/RTDBHelper.h"

// #define WIFI_SSID "1306"
// #define WIFI_PASSWORD "13063918"
#define WIFI_SSID "Aummiez"
#define WIFI_PASSWORD "eieieiei"

#define DHTPIN 2
#define DHTTYPE DHT22
DHT dht(DHTPIN, DHTTYPE);

SoftwareSerial mySerial(4,5); // TX, RX
unsigned int pm1 = 0;
unsigned int pm2_5 = 0;
unsigned int pm10 = 0;

#define API_KEY "AIzaSyDbGoUShYGact91h26C7H16R1CGJQpfcrA"
#define DATABASE_URL "wlsensorproject-default-rtdb.firebaseio.com"

#define USER_EMAIL "aumatchaya@gmail.com"
#define USER_PASSWORD "Aum1512"

FirebaseData fbdo;
FirebaseAuth auth;
FirebaseConfig config;


void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
  
  // Connect Wi-Fi
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  Serial.print("Connecting to Wi-Fi");
  while (WiFi.status() != WL_CONNECTED){
    Serial.print(".");
    delay(300);
  }
  Serial.println();
  Serial.print("Connected with IP: ");
  Serial.println(WiFi.localIP());
  Serial.println();

  // Setting Sensors
  pinMode(DHTPIN, INPUT);
  dht.begin();
  while (!Serial) ;
  mySerial.begin(9600);

  // Firebase
  config.api_key = API_KEY;
  config.database_url = DATABASE_URL;

  auth.user.email = USER_EMAIL;
  auth.user.password = USER_PASSWORD;

  config.token_status_callback = tokenStatusCallback;
  
  Firebase.begin(&config, &auth);
  Firebase.reconnectWiFi(true);
}

void loop() {
  ///////// Temp + Humidity /////////
  delay(1000);
  Serial.println("Temperature & Humidity");
  float h = dht.readHumidity();
  float t = dht.readTemperature();

  if (isnan(h) || isnan(t))
  {
    Serial.println(F("Failed to read DHT sensor !!"));
    return;
  }

  if (Firebase.ready()) {
    if (Firebase.RTDB.setFloat(&fbdo, "DHT/humidity", h)) {
      Serial.print("Humidity: ");
      Serial.print(h);
      Serial.println(" %");
    }
    else {
      Serial.println("FAILED !!");
      Serial.println("Reason: " + fbdo.errorReason());
    }

    if (Firebase.RTDB.setFloat(&fbdo, "DHT/temperature", t)) {
      Serial.print("Temperature: ");
      Serial.print(t);
      Serial.println(" C ");
    }
    else {
      Serial.println("FAILED !!");
      Serial.println("Reason: " + fbdo.errorReason());
    }    
  }
  Serial.println("");

  ///////// Air Pollution /////////
  int index = 0;
  char value;
  char previousValue;
  
  Serial.println("Air Pollution");
  
  while (mySerial.available()) {
    value = mySerial.read();
    if ((index == 0 && value != 0x42) || (index == 1 && value != 0x4d)){
      Serial.println("Cannot find the data header.");
      break;
    }
  
    if (index == 4 || index == 6 || index == 8 || index == 10 || index == 12 || index == 14) {
      previousValue = value;
    }
    else if (index == 5) {
      pm1 = 256 * previousValue + value;
      if (Firebase.RTDB.setFloat(&fbdo, "AirPollution/pm1",pm1)){
        Serial.print("{ ");
        Serial.print("\"pm1\": ");
        Serial.print(pm1);
        Serial.print(" ug/m3");
        Serial.print(", ");
      
      }
      else {
        Serial.println("FAILED");
        Serial.println("REASON: " + fbdo.errorReason());
      }
    }
    else if (index == 7) {
      pm2_5 = 256 * previousValue + value;
      if (Firebase.RTDB.setFloat(&fbdo, "AirPollution/pm2_5",pm2_5)){
        Serial.print("\"pm2_5\": ");
        Serial.print(pm2_5);
        Serial.print(" ug/m3");
        Serial.print(", ");
      
      }
      else {
        Serial.println("FAILED");
        Serial.println("REASON: " + fbdo.errorReason());
      }
    }
    else if (index == 9) {
      pm10 = 256 * previousValue + value;
      if (Firebase.RTDB.setFloat(&fbdo, "AirPollution/pm10",pm10)){
        Serial.print("\"pm10\": ");
        Serial.print(pm10);
        Serial.print(" ug/m3");
      }
      else {
        Serial.println("FAILED");
        Serial.println("REASON: " + fbdo.errorReason());
      }
    } 
    else if (index > 15) {
      break;
    }
    index++;
  }
  while(mySerial.available()) mySerial.read();
  Serial.println(" }");
  Serial.println("");
  Serial.println("/////////////////////////////////");
  Serial.println("");  
}