#include "MegunoLink.h"
 
void setup()
{
  Serial.begin(9600);
} 
 
void loop()
{
  TimePlot MyPlot;
  MyPlot.SendData("Input0", analogRead(0));
  delay(100);
}
