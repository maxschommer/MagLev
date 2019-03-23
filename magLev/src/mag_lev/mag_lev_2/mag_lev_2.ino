//=========================================================|
//     Ekobots Innovation Ltda - www.ekobots.com.br        |
//        Juan Sirgado y Antico - www.jsya.com.br          |
//---------------------------------------------------------|
//        Program Magnetic Levitator - 2016/02/06          |
//               All rights reserved 2016                  |
//=========================================================|
int anaPin = A2;   // Arduino Analogic Pin 1;
int digPin = 5;   // Arduino Digital  Pin 5;
int subPin = 7;   // Arduino Digital  Pin 7;
int addPin = 8;   // Arduino Digital  Pin 8;
//
int     anaVal = 0;   // Analogic Read(Hall Sensor) Value;
boolean digVal = 0;   // Digital Write(Electromagnet) Value;
//
int levVal = 228;   // Levitation Poit Value;
int dlyVal = 250;   // Delay Value Micro Seconds;
//---------------------------------------------------------|
void setup()
{
   // Levitator initialization Begin; 
   Serial.begin(57600);
   Serial.println("Levitator by JSyA");
   Serial.println("Starting...");
   // Digital Pins Work Mode Setup;
   pinMode(digPin, OUTPUT);
//   pinMode(subPin, INPUT_PULLUP);
//   pinMode(addPin, INPUT_PULLUP);
   // Levitator initialization End; 
   Serial.println("Started.");
}
//---------------------------------------------------------|
void loop() 
{
   // Hall Sensor Read (Magnetic Field Intensity);
   anaVal = analogRead(anaPin);
   // Increase The Value Of Levitation Point;
   if (digitalRead(addPin) == LOW) 
   {
      levVal++;
      value_log();
      delay(250);
   }
   // Decrease The Value Of Levitation Point;
   if (digitalRead(subPin) == LOW) 
   {
      levVal--;
      value_log();
      delay(250);
   }
   // Check the Levitation Point;
   if (anaVal < levVal) 
   {
      digVal = LOW;
   }
   else // if (anaVal > levVal) 
   {
      digVal = HIGH;
   }
   //
   // Turn ON/OFF The Electromagnet;
   // With Base on Sensor Value and the Levitation Point;
   digitalWrite(digPin, digVal);
   delayMicroseconds(dlyVal);
}
//---------------------------------------------------------|
void value_log()
// Analogic/Digital/Levitation Values Print;
{
   // Show the Hall Sensor Value;
   Serial.print("anaVal=[");
   Serial.print(anaVal); 
   Serial.print("]-");
   // Show the Electromagnet state On=1/Off=0;
   Serial.print("digVal=[");
   Serial.print(digVal);
   Serial.print("]-");
   // Show the Levitation Point Value;
   Serial.print("levVal=[");
   Serial.print(levVal);
   Serial.println("];");
}
//=========================================================|
