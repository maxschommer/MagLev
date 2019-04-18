/*
  Analog Input

  Demonstrates analog input by reading an analog sensor on analog pin 0 and
  turning on and off a light emitting diode(LED) connected to digital pin 13.
  The amount of time the LED will be on and off depends on the value obtained
  by analogRead().

  The circuit:
  - potentiometer
    center pin of the potentiometer to the analog input 0
    one side pin (either one) to ground
    the other side pin to +5V
  - LED
    anode (long leg) attached to digital output 13
    cathode (short leg) attached to ground

  - Note: because most Arduinos have a built-in LED attached to pin 13 on the
    board, the LED is optional.

  created by David Cuartielles
  modified 30 Aug 2011
  By Tom Igoe

  This example code is in the public domain.

  http://www.arduino.cc/en/Tutorial/AnalogInput
*/

int sensorPin_1 = A3;    // select the input pin for the potentiometer
int sensorPin_2 = A4; 
int sensorPin_3 = A5;
int sensorValue_1 = 0;  // variable to store the value coming from the sensor
int sensorValue_2 = 0;
int sensorValue_3 = 0;

void setup() {
  Serial.begin(9600);
}

void loop() {
  // read the value from the sensor:
  sensorValue_1 = analogRead(sensorPin_1);
  sensorValue_2 = analogRead(sensorPin_2);
  sensorValue_3 = analogRead(sensorPin_3);
  Serial.print("Sensor 1: ");
  Serial.print(sensorValue_1);

  Serial.print(", Sensor 2: ");
  Serial.print(sensorValue_2);

  Serial.print(", Sensor 3: ");
  Serial.println(sensorValue_3);

  
}
