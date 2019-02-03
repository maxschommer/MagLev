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
// You can also make another motor on port M2
//Adafruit_DCMotor *myOtherMotor = AFMS.getMotor(2);


float P = 3.3;
float I;
float D = - .250;
float DvalNew;
float DvalOld;
unsigned long currentTime;
unsigned long lastTime;

int setPoint = -80;
int sensorValue;
int magnetPower;
int lastMagnetPower;

int magVal;
float lastInputVal;

int hallSensor = A2;




void setMagnet(int input){
  magnetPower = int(1/40.0 * input +39/40.0 * lastMagnetPower);
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
  electroMagnet->setSpeed(abs(input));
}

void PIDControl(float input){
  float DT = (currentTime - lastTime)/100000.0;
  // Serial.println(DT, 6);
  DvalNew = (input - lastInputVal) / DT;
  lastInputVal = input;
  lastTime = currentTime;
  DvalOld = (1.0/20.0 * DvalNew + 19.0/20.0 * DvalOld);
  magVal = P * (input - setPoint) - D * DvalOld; 

  setMagnet(magVal);
}

float removeElectromagnetEffect(int sensorValue, int currentValue)
{
  return sensorValue + -515.6785 + currentValue * 0.4456;
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
  // turn on motor
  electroMagnet->run(RELEASE);
}



void loop() {
  TimePlot MyPlot;
  sensorValue = analogRead(hallSensor);
  currentTime = micros();
  //Serial.println(DvalOld);
//  Serial.println(removeElectromagnetEffect(sensorValue, magnetPower));
  PIDControl(removeElectromagnetEffect(sensorValue, magnetPower));
  delayMicroseconds(10);
}

//  int i = -255;
//  for (i=-255; i<255; i++) {
//    setMagnet(i);  
//    sensorValue = analogRead(hallSensor);
//    
//    MyPlot.SendData("HallSensor", sensorValue);
//    MyPlot.SendData("i", i);
//    MyPlot.SendData("ElectromagnetRemoved", removeElectromagnetEffect(sensorValue, i));
////    Serial.println(analogRead(hallSensor));
//    //delayMicroseconds(10);
//  }
//  for (i=255; i>-255; i--) {
//    setMagnet(i); 
//    sensorValue = analogRead(hallSensor);
//    MyPlot.SendData("HallSensor", sensorValue);
//    MyPlot.SendData("ElectromagnetRemoved", removeElectromagnetEffect(sensorValue, i));
//    MyPlot.SendData("i", i);
//    //delayMicroseconds(10);
//  }
//}
