
#include <Wire.h>
#include <Adafruit_MotorShield.h>
//#include "MegunoLink.h"

// Create the motor shield object with the default I2C address
Adafruit_MotorShield AFMS = Adafruit_MotorShield(); 

// Select which 'port' M1, M2, M3 or M4. In this case, M1
Adafruit_DCMotor *electroMagnet = AFMS.getMotor(1);


int levVal = 330;
int dlyVal = 200;
//TimePlot MyPlot;


float P = 4;
float I;
float D = - 100;
//float D = 0;
float DvalNew;
float DvalOld;
int setPoint = -100;


int hallSensor = A2;

// Set up times for delta calc
unsigned long currentTime;
unsigned long lastTime;
float dT = 1;
float tLenSensor = 4;
float tLenDval = 20;
float tLenMagVal = 30;
// Set up magnet control variables
int sensorValue;
int lastSensorValue;

int magVal;
int magValOld;
float lastInputVal;

float dSensorValue = 0;
int magnetPower;
int lastMagnetPower;


float removeElectromagnetEffect(int sensorValue, float dSensorValue,  int currentValue)
{
  return sensorValue + -518.7234 +  currentValue * 0.2921 - dSensorValue*15;
}

void PIDControl(float input, float dT){
  // Serial.println(DT, 6);
  DvalNew = (input - lastInputVal) / dT;
  
  lastInputVal = input;
  DvalOld = (1.0/tLenDval * DvalNew + (tLenDval - 1)/tLenDval * DvalOld);
  magVal = P * (input - setPoint) - D * DvalOld;
  magValOld = (1.0/tLenMagVal * magVal + (tLenMagVal - 1)/tLenMagVal * magValOld);

  if (magValOld > 255){
    magValOld = 255;
  }
  if (magValOld < -255){
    magValOld = -255;
  }
  
//  int thresh = 10;
//  if ((magVal - magValOld) > thresh){
//    magVal = magValOld + thresh;
//  }
//  if ((magVal - magValOld) < -thresh){
//    magVal = magValOld - thresh;
//  }
  Serial.println(magValOld);
//  Serial.println(magVal-magValOld);
//  magValOld = magVal;
//  Serial.print(300*DvalOld);
//  Serial.print(",");
//  Serial.println(magVal);
  setMagnet(magValOld);
}

void setMagnet(int input){
  magnetPower = int(1/10.0 * input +9/10.0 * lastMagnetPower);
  lastMagnetPower = magnetPower;
  if (input < 0 ){
    if(input < -255)
    {
      input = -255;
    }
    electroMagnet->run(BACKWARD);
  }
  else
  {
    if(input > 255)
    {
      input = 255;
    }
    electroMagnet->run(FORWARD);
  }
  // Serial.println(magnetPower);
  electroMagnet->setSpeed(abs(magnetPower));
}


void setup() {
  // put your setup code here, to run once:
//  pinMode(A0, OUTPUT);
//  digitalWrite(A0, LOW);
//  pinMode(A1, OUTPUT);
//  digitalWrite(A1, HIGH);
  pinMode(hallSensor, INPUT);
  
  Serial.begin(115200);

  AFMS.begin();  // create with the default frequency 1.6KHz
}


// My PID code
//void loop() {
//  sensorValue = analogRead(hallSensor);
//  currentTime = millis();
////  magnetPower = 100 * sin(currentTime / 2.0);
////  setMagnet(magnetPower);
////  sensorValue = 100 * sin(currentTime / 50.0);
//  dSensorValue = (tLenSensor-1)/tLenSensor * dSensorValue + 1/tLenSensor * (sensorValue-lastSensorValue)/dT;
////  Serial.print(100 * sin(currentTime / 400.0));
////  Serial.print(",");
////  Serial.println(sensorValue);
////  
////  Serial.print(40 * dSensorValue);
////  Serial.print(",");
////  Serial.println(removeElectromagnetEffect(sensorValue, dSensorValue, magnetPower));
////  Serial.println(sensorValue);
//
//  PIDControl(removeElectromagnetEffect(sensorValue, dSensorValue, magnetPower), dT);
////  Serial.println(dT);
//  lastSensorValue = sensorValue;
//  delay(1);
//  dT = (currentTime - lastTime)*2;
//  lastTime = currentTime;
//}

// My BangBang code
void loop() {
  sensorValue = analogRead(hallSensor);
//  Serial.println(sensorValue);

  if (sensorValue > levVal){
    setMagnet(255);
    
  }
  else{
    setMagnet(-255);
  }
  delayMicroseconds(dlyVal);
}
