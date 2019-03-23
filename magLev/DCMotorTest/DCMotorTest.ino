/* 
This is a test sketch for the Adafruit assembled Motor Shield for Arduino v2
It won't work with v1.x motor shields! Only for the v2's with built in PWM
control

For use with the Adafruit Motor Shield v2 
---->	http://www.adafruit.com/products/1438
*/

#include <Wire.h>
#include <Adafruit_MotorShield.h>
#include "MegunoLink.h"

// Create the motor shield object with the default I2C address
Adafruit_MotorShield AFMS = Adafruit_MotorShield(); 
// Or, create it with a different I2C address (say for stacking)
// Adafruit_MotorShield AFMS = Adafruit_MotorShield(0x61); 

// Select which 'port' M1, M2, M3 or M4. In this case, M1
Adafruit_DCMotor *electroMagnet = AFMS.getMotor(1);

TimePlot MyPlot;
float P = 3.3;
float I;
float D =- .450;
float DvalNew;
float DvalOld;
unsigned long currentTime;
unsigned long lastTime;

int setPoint = -80;
int sensorValue;
int lastSensorValue;
int magnetPower;
int lastMagnetPower;

int magVal;
float lastInputVal;

int hallSensor = A2;




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

void PIDControl(float input){
//  float DT = (currentTime - lastTime)/100000.0;
  // Serial.println(DT, 6);
  DvalNew = (input - lastInputVal) / DT;
  lastInputVal = input;
  DvalOld = (1.0/80.0 * DvalNew + 79.0/80.0 * DvalOld);
  magVal = P * (input - setPoint) - D * DvalOld; 
  
  // setMagnet(magVal);
}

float removeElectromagnetEffect(int sensorValue, int currentValue)
{
  
  return sensorValue + -518.0703 + currentValue * 0.2994;
}

void setup() {
  pinMode(A0, OUTPUT);
  digitalWrite(A0, LOW);
  pinMode(A1, OUTPUT);
  digitalWrite(A1, HIGH);
  pinMode(hallSensor, INPUT);
  
  Serial.begin(115200);           // set up Serial library at 9600 bps
  Serial.println("Adafruit Motorshield v2 - DC Motor test!");

  AFMS.begin();  // create with the default frequency 1.6KHz
  //AFMS.begin(1000);  // OR with a different frequency, say 1KHz
  
  // Set the speed to start, from 0 (off) to 255 (max speed)
  electroMagnet->setSpeed(150);
  electroMagnet->run(FORWARD);
  electroMagnet->run(RELEASE);
}



void loop() {
  
  sensorValue = analogRead(hallSensor);
  currentTime = micros();

  float dT = (currentTime - lastTime)/100000.0;
  lastTime = currentTime;
  dIdt = (sensorValue - lastSensorValue)/dT;
  
  //Serial.println(DvalOld);
//  Serial.println(removeElectromagnetEffect(sensorValue, magnetPower));
//  PIDControl(removeElectromagnetEffect(sensorValue, magnetPower));
  //delayMicroseconds(10);


  int i = -255;
  int fFreq = 1;
  for (i=-255; i<255; i += fFreq) {
    setMagnet(i);  
    sensorValue = analogRead(hallSensor);
    
    MyPlot.SendData("HallSensor", sensorValue);
//    MyPlot.SendData("i", i);
    MyPlot.SendData("ElectromagnetRemoved", removeElectromagnetEffect(sensorValue, i));
//    Serial.println(analogRead(hallSensor));
    //delayMicroseconds(10);
  }
  for (i=255; i>-255; i-= fFreq) {
    setMagnet(i); 
    sensorValue = analogRead(hallSensor);
    MyPlot.SendData("HallSensor", sensorValue);
    MyPlot.SendData("ElectromagnetRemoved", removeElectromagnetEffect(sensorValue, i));
//    MyPlot.SendData("i", i);
    //delayMicroseconds(10);
  }
}
