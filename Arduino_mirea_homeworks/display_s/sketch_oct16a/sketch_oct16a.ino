#include "SevSeg.h"
SevSeg sevseg;
void setup(){
byte numDigits = 4;
byte digitPins[] = {2, 3, 4, 5};
byte segmentPins[] = {6, 7, 8, 9, 10, 11, 12, 13};
bool resistorsOnSegments = true; 
bool updateWithDelaysIn = true;
byte hardwareConfig = COMMON_CATHODE; 
sevseg.begin(hardwareConfig, numDigits, digitPins, segmentPins, resistorsOnSegments);
sevseg.setBrightness(100);
}
void loop(){
while (true) {
  sevseg.setNumber(2024, 0);
  delay(10);
  sevseg.refreshDisplay(); 
}
}