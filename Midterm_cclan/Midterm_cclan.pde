/*
arduino_input

Demonstrates the reading of digital and analog pins of an Arduino board
running the StandardFirmata firmware.

To use:
* Using the Arduino software, upload the StandardFirmata example (located
  in Examples > Firmata > StandardFirmata) to your Arduino board.
* Run this sketch and look at the list of serial ports printed in the
  message area below. Note the index of the port corresponding to your
  Arduino board (the numbering starts at 0).  (Unless your Arduino board
  happens to be at index 0 in the list, the sketch probably won't work.
  Stop it and proceed with the instructions.)
* Modify the "arduino = new Arduino(...)" line below, changing the number
  in Arduino.list()[0] to the number corresponding to the serial port of
  your Arduino board.  Alternatively, you can replace Arduino.list()[0]
  with the name of the serial port, in double quotes, e.g. "COM5" on Windows
  or "/dev/tty.usbmodem621" on Mac.
* Run this sketch. The squares show the values of the digital inputs (HIGH
  pins are filled, LOW pins are not). The circles show the values of the
  analog inputs (the bigger the circle, the higher the reading on the
  corresponding analog input pin). The pins are laid out as if the Arduino
  were held with the logo upright (i.e. pin 13 is at the upper left). Note
  that the readings from unconnected pins will fluctuate randomly. 
  
For more information, see: http://playground.arduino.cc/Interfacing/Processing
*/

import processing.serial.*;

import cc.arduino.*;
float reading1;

Arduino arduino;


float angle;
float leftEffect = 1;
float rightEffect = 1;
float lenMultiplier = 0.67;


float leftEffect2 = 1;
float rightEffect2 = 1;
float lenMultiplier2 = 0.67;

void setup() {
  size(1200, 600);

  // Prints out the available serial ports.
  println(Arduino.list());
  
  // Modify this line, by changing the "0" to the index of the serial
  // port corresponding to your Arduino board (as it appears in the list
  // printed by the line above).
  arduino = new Arduino(this, Arduino.list()[1], 57600);
  
  // Alternatively, use the name of the serial port corresponding to your
  // Arduino (in double-quotes), as in the following line.
  //arduino = new Arduino(this, "/dev/tty.usbmodem621", 57600);
  
  // Set the Arduino digital pins as inputs.
  for (int i = 0; i <= 13; i++)
    arduino.pinMode(i, Arduino.INPUT);
}

void draw() {
  background(51);
  fill(155);
  
    
  //---------------------1
  translate(450, height);
  drawLine(200);
// Draw a circle whose size corresponds to the value of an analog input.
  noFill();
  for (int i = 0; i <= 5; i++) { 
     stroke(arduino.analogRead(i),arduino.analogRead(i)/1.5,0);
    reading1 = map(arduino.analogRead(i),0,500,500,0);
    reading1=(int(reading1*10.0))/10.0;
     angle = (reading1 / 2.5) / 67.251;

    println(reading1);
   }
   
   
//---------------------2   
   translate(400, height/3);
  drawLine(100);
// Draw a circle whose size corresponds to the value of an analog input.
  noFill();
  for (int i = 0; i <= 5; i++) {
     stroke(arduino.analogRead(i),arduino.analogRead(i)/3,0);
    reading1 = map(arduino.analogRead(i),0,500,500,0);
    reading1=(int(reading1*10.0))/10.0;
     angle = (reading1 / 2.5) / 67.251;
  
 
    println(reading1);
   }

   
//---------------------3   
   
     translate(-250, height/6);
  drawLine(50);
// Draw a circle whose size corresponds to the value of an analog input.
  noFill();
  for (int i = 0; i <= 5; i++) {
     stroke(arduino.analogRead(i),arduino.analogRead(i)/2,0);
    reading1 = map(arduino.analogRead(i),0,500,500,0);
    reading1=(int(reading1*10.0))/10.0;
     angle = (reading1 / 2.5) / 67.251;

   
   }

   
//---------------------4
   
   
    translate(-450, height/12);
  drawLine(80);
// Draw a circle whose size corresponds to the value of an analog input.
  noFill();
  for (int i = 0; i <= 5; i++) {
     stroke(arduino.analogRead(i)/2,arduino.analogRead(i)/2,0);
    reading1 = map(arduino.analogRead(i),0,500,500,0);
    reading1=(int(reading1*10.0))/10.0;
     angle = (reading1 / 2.5) / 67.251;
  

    println(reading1);
   }
    
 //---------------------5   
    
     translate(900, height/6);
  drawLine(45);
// Draw a circle whose size corresponds to the value of an analog input.
  noFill();
  for (int i = 0; i <= 5; i++) {
     stroke(arduino.analogRead(i)/2.5,arduino.analogRead(i),0);
    reading1 = map(arduino.analogRead(i),0,500,500,0);
    reading1=(int(reading1*10.0))/10.0;
     angle = (reading1 / 2.5) / 67.251;
    println(reading1);
   }
    
    
     
}

void drawLine(float len){
  line(0, 0, 0, -len);
  translate(0, -len);
  
  if(len > 4){
  pushMatrix();
  rotate(angle * rightEffect);
  drawLine(len * lenMultiplier);
  popMatrix();
  pushMatrix();
  rotate(-angle * leftEffect);
  drawLine(len * lenMultiplier);
  popMatrix();
  }
  
  
  
}
  