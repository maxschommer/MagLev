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

int sensorPin = A1;    // select the input pin for the potentiometer
int magnetPinA = A2;    
int magnetPinB = A3;
int sensorValue = 0;  // variable to store the value coming from the sensor
int n = 0; // Speed of motor
String readString; //String captured from serial port

void setup() {
  
  Serial.begin(9600);
  pinMode(magnetPinA, OUTPUT);
  pinMode(magnetPinB, OUTPUT);
}


void loop() {
  digitalWrite(magnetPinA, HIGH);
  digitalWrite(magnetPinB, HIGH);
  delay(1000);
  digitalWrite(magnetPinA, LOW);
  digitalWrite(magnetPinB, HIGH);
  delay(1000);
//  digitalWrite(magnetPinA, HIGH);
//  digitalWrite(magnetPinB, LOW);
//  delay(1000);
//  digitalWrite(magnetPinA, LOW);
//  digitalWrite(magnetPinB, LOW);
//  delay(1000);
////  // read the value from the sensor:
////  sensorValue = analogRead(sensorPin);
////  Serial.println(sensorValue);
//  while (Serial.available()) {
//    char c = Serial.read();  //gets one byte from serial buffer
//    readString += c; //makes the string readString
//    delay(2);  //slow looping to allow buffer to fill with next character
//  }
//
//  if (readString.length() >0) {
//    Serial.println(readString);  //so you can see the captured string 
//
//    n = readString.toInt();  //convert readString into a number
//      Serial.print("writing Speed: ");
//      Serial.println(n);
//      analogWrite(magnetPinA, n); 
//
//    bailout: //reenter code loop
//    Serial.print("Last magnet command position: ");    
//    Serial.println(n);
//    Serial.println();
//    readString=""; //empty for next input
//    }

}
