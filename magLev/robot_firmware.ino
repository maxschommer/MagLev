/*
 * robot_firmware - Brains of our Von Karman Challenge (VKC) Robot
 * Copyright (C) 2018 Andrew Miyaguchi <andrewmiyaguchi@gmail.com>
 * 
 * Recieving communications based off ROS Simple Drive system
 * <https://github.com/danielsnider/simple_drive>
 * 
 * Pins 5 and 6 were ignored even though they support PWM as their
 * duty cycle are affected by timer0, which is used for delay and mills();
 * 
 * |--Left Side
 * |  |-Pin 7 (!PWM) -> Enable
 * |  |-Pin 10 (PWM) -> Pos
 * |  |-Pin 11 (PWM) -> Neg
 * |
 * |--Right Side
 * |  |-Pin 8 (!PWM) -> Enable
 * |  |-Pin 3  (PWM) -> Pos
 * |  |-Pin 9  (PWM) -> Neg
 * 
 * index  type
 * 0    Left/Right Axis stick left
 * 1    Up/Down Axis stick left
 * 2    LT
 * 3    Left/Right Axis stick right
 * 4    Up/Down Axis stick right
 * 5    RT
 * 6    cross key left/right
 * 7    cross key up/down
 * 
 */

#include <ros.h>
#include <std_msgs/Empty.h>
#include <std_msgs/String.h>
#include <sensor_msgs/Joy.h>

#include "AQMH2407ND.h"
#include "Electromagnet.h"
#include "Utilities.h"

#define BAUDRATE 250000


AQMH2407ND *leftDriver;

void setup() {
  /* Setup serial connections */
  Serial.begin(BAUDRATE);
  Serial.println(F("Welcome to the VKC robot firmware"));
  Serial.println(F("INIT: Firmware booting..."));
  
  /* Setup the tank drive */
  dmesg("Starting Motor Controllers\n");
  leftDriver = new AQMH2407ND(A3, A2, A1);

  leftDriver->setReversed(true);

  leftDriver->enable();
  dmesg("Done\n");
}

void loop() {
  leftDriver->setSpeed(200);
}

//Read Joystic data 
void joystickCallback(const sensor_msgs::Joy& joy) {
  //Joystick Axes Constants
  const int DpadUpDownIndex = 7;
  const int LeftJoyStickIndex = 1;
  const int RightJoyStickIndex = 4;

  //Maximum range set for the motors
  const int MotorOutputRange = 200;

  /* Check if we press the RB Button */
  if(joy.buttons[5] && millis() - eMag_watchdog > 500) {
    eMag->toggle();

    /* Reset the button debounce */
    eMag_watchdog = millis();
  }

  //check if Dpad is being used
  int dpadDirection = joy.axes[DpadUpDownIndex];
  if(dpadDirection != 0)
  {
    //Move MARV in straight line based on Dpad direciton
    int straightSpeed = fmap(.5, -1, 1, -MotorOutputRange, MotorOutputRange);
    
    //set direction forwards or backwards
    straightSpeed = straightSpeed * dpadDirection; 
    leftDriver->setSpeed(straightSpeed);
    rightDriver->setSpeed(straightSpeed);
  }
  else
  {   
    //Direct MARV by joystick
    int leftJoyStick = fmap(joy.axes[LeftJoyStickIndex], -1, 1, -MotorOutputRange, MotorOutputRange);
    int rightJoyStick = fmap(joy.axes[RightJoyStickIndex], -1, 1, -MotorOutputRange, MotorOutputRange);
    leftDriver->setSpeed(leftJoyStick);
    rightDriver->setSpeed(rightJoyStick);  
  }
  
}
