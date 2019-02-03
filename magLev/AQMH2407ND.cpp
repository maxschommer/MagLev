#include "AQMH2407ND.h"

/* Initilize in mirror mode, useful for lowering pwm pin count */
AQMH2407ND::AQMH2407ND(int enA, int in1, int in2) {
  pin_enA = enA;
  pin_in[0] = in1;
  pin_in[1] = in2;
  
  /* Setup the required pins for the motor controllers */
  pinMode(pin_enA, OUTPUT);
  
  for(int mot = 0; mot < 2; mot ++)
    pinMode(pin_in[mot], OUTPUT);
  
  /* Disable the controller just in case */
  disable();
}

/* Initialize as separate outputs */
AQMH2407ND::AQMH2407ND(int enA, int enB, int in1, int in2, int in3, int in4) {
  AQMH2407ND(enA, in1, in2);
  mirrorMode = false;
  
  pin_enB = enB;
  pin_in[2] = in3;
  pin_in[3] = in4;
  
  /* Setup the required pins for the motor controllers */
  pinMode(pin_enB, OUTPUT);

  for(int mot = 2; mot < 4; mot ++)
    pinMode(pin_in[mot], OUTPUT);

  /* Disable the controller just in case */
  disable();
}

/* est speed for both motors */
void AQMH2407ND::setSpeed(int speed) {
  if(mirrorMode) {
    setSpeed(SIDE_A, speed);
  } else {
    setSpeed(SIDE_A, speed);
    setSpeed(SIDE_B, speed);
  }
}

void AQMH2407ND::setReversed(boolean a) {
  reversed_a = a;
}

void AQMH2407ND::setReversed(boolean a, boolean b) {
  reversed_a = a;
  reversed_b = b;
}

/* set the speed of a motor */
void AQMH2407ND::setSpeed(int side, int speed) {
  int pos;
  int neg;

  /* Get the side to be set */
  switch(side) {
    case SIDE_A:
      if(!reversed_a) {
        pos = pin_in[0];
        neg = pin_in[1];
      } else {
        neg = pin_in[0];
        pos = pin_in[1];
      }
      
      for(int mot = 0; mot < 2; mot ++)
        analogWrite(pin_in[mot], 0);
      break;
    case SIDE_B:
      if(!reversed_b) {
        pos = pin_in[2];
        neg = pin_in[3];
      } else {
        neg = pin_in[2];
        pos = pin_in[3];
      }
      
      for(int mot = 2; mot < 4; mot ++)
        analogWrite(pin_in[mot], 0);
      break;
    default:
      /* Oops, something bad happened */
      return;
  }

  /* Early return if speed is within the joystick's deadzone */
  const int joystickDeadzone = 40; 
  if(-joystickDeadzone < speed && speed < joystickDeadzone)
    return;
    
  /* Add overduty protections */
  speed = min(max(speed, -255), 255);
  int mappedSpeed = map(speed, -255, 255, -max_duty_cycle, max_duty_cycle);

  /* Set the pwm duty cycle appropriate for forward or reverse */  
  if(speed > 0) {
    analogWrite(pos, mappedSpeed);
  } else if(speed < 0) {
    analogWrite(neg, -mappedSpeed);
  }
}

/* 
 *  Limit the controller to a max duty cycle to allow
 *  lower voltage motors to run on higher voltage controllers
 */
void AQMH2407ND::setMaxDuty(int duty) {
  duty = min(max(duty, 0), 255);
  max_duty_cycle = duty;
}

/* Enable the controller */
void AQMH2407ND::enable() {
  digitalWrite(pin_enA, HIGH);
  if(!mirrorMode)
    digitalWrite(pin_enB, HIGH);
}


/* Disable the controller */
void AQMH2407ND::disable() {
  digitalWrite(pin_enA, LOW);
  
  if(!mirrorMode)
    digitalWrite(pin_enB, LOW);
  
  /* Clear the set speed */
  for(int mot = 0; mot < 4; mot ++) {
    digitalWrite(pin_in[mot], LOW);
    analogWrite(pin_in[mot], 0);
    
    if(mirrorMode && mot == 1)
      break;
  }
}


