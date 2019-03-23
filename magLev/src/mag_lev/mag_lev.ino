
#include <Wire.h>
#include <Adafruit_MotorShield.h>
//#include "MegunoLink.h"

// Create the motor shield object with the default I2C address
Adafruit_MotorShield AFMS = Adafruit_MotorShield(); 

// Select which 'port' M1, M2, M3 or M4. In this case, M1
Adafruit_DCMotor *electroMagnet = AFMS.getMotor(1);


//TimePlot MyPlot;



int hallSensor = A2;

// Set up times for delta calc
unsigned long currentTime;
unsigned long lastTime;
float dT = 1;
float tLen = 4;
// Set up magnet control variables
int setPoint = -80;
int sensorValue;
int lastSensorValue;
float dSensorValue = 0;
int magnetPower;
int lastMagnetPower;


float removeElectromagnetEffect(int sensorValue, float dSensorValue,  int currentValue)
{
  return sensorValue + -518.7234 +  currentValue * 0.2921 - dSensorValue*15;
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

void loop() {
  sensorValue = analogRead(hallSensor);
  currentTime = millis();
  magnetPower = 100 * sin(currentTime / 2.0);
  setMagnet(magnetPower);
//  sensorValue = 100 * sin(currentTime / 50.0);
  dSensorValue = (tLen-1)/tLen * dSensorValue + 1/tLen * (sensorValue-lastSensorValue)/dT;
//  Serial.print(100 * sin(currentTime / 400.0));
//  Serial.print(",");
//  Serial.println(sensorValue);
//  
//  Serial.print(40 * dSensorValue);
//  Serial.print(",");
  Serial.println(removeElectromagnetEffect(sensorValue, dSensorValue, magnetPower));
//  Serial.println(sensorValue);

  lastSensorValue = sensorValue;
  delay(1);
  dT = (currentTime - lastTime)*2;
  lastTime = currentTime;
}
