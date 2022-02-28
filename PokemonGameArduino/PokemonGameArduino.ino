#include <Adafruit_NeoPixel.h>
const int pixelNum = 6;
const int pixelPin = 3;
Adafruit_NeoPixel strip(pixelNum,pixelPin);
const int pixelNum2 = 38;
const int pixelPin2 = 5;
Adafruit_NeoPixel strip2(pixelNum2,pixelPin2);

String message="";

uint32_t off = strip.Color(0,0,0);
uint32_t red = strip.Color(255,0,0);
uint32_t green = strip.Color(0,255,0);
uint32_t colorList[3];

int mod = 0;
uint32_t color1 = strip2.Color(20,255,20);
uint32_t color2 = strip2.Color(50,255,50);
uint32_t color3 = strip2.Color(0,255,0);
uint32_t color4 = strip2.Color(255,69,0);
uint32_t color5 = strip2.Color(184,134,11);
uint32_t color6 = strip2.Color(255,165,0);
uint32_t color7 = strip2.Color(255,0,0);
uint32_t color8 = strip2.Color(128,0,0);
uint32_t color9 = strip2.Color(255,30,0);
uint32_t color10 = strip2.Color(139,69,19);
uint32_t color11 = strip2.Color(184,134,11);
uint32_t color12 = strip2.Color(0,128,128);//strip2.Color(192,137,103);
uint32_t temp = strip.Color(0,0,0);
unsigned long startTime;
unsigned long endTime;
int interval;

int state1 = 0;
int state2 = 0;
int state3 = 0;
int state4 = 0;
int state5 = 0;
int state6 = 0;
int ambianceState = 0;
int stateList[6];


void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  //stateList = {state1,state2,state3,state4,state5,state6};
  stateList[0]=state1;
  stateList[1]=state2;
  stateList[2]=state3;
  stateList[3]=state4;
  stateList[4]=state5;
  stateList[5]=state6;
  //colorList = {off,red,green};
  colorList[0]=off;
  colorList[1]=red;
  colorList[2]=green;
  strip.begin();
  strip.setBrightness(200);
  strip.clear();
  strip.show();
  strip2.begin();
  strip2.setBrightness(50);
  strip2.clear();
  strip2.show();
  startTime = millis();
  interval = 250;
}

void loop() {
  // put your main code here, to run repeatedly:
  endTime = millis();
  recieve();
  updateList();
  neo();
}

void updateList()
{
  stateList[0]=state1;
  stateList[1]=state2;
  stateList[2]=state3;
  stateList[3]=state4;
  stateList[4]=state5;
  stateList[5]=state6;
}

void recieve()
{
  char start = '[';
  char endC = ']';
  while(Serial.available()>0)
  {
    char aChar = Serial.read();
    if(aChar == start)
      message = Serial.readStringUntil(endC);
    if(message != "\0")
    {
      message = message.substring(0,message.length());
      parseMessage();
      message = "\0";
    }
  }    
}

void neo()
{
  strip.clear();
  strip2.clear();
  for(int i = 0;i < sizeof(stateList);i++)
  {
    strip.setPixelColor(i,colorList[stateList[i]]);
  }
  switch(ambianceState)
  {
    case 0:
      for(int i = 0;i < pixelNum2;i++)
      {
        strip2.setPixelColor(i,strip2.Color(0,0,0));
      }
      break;
    case 1:
       if (endTime - startTime >= interval)
       {
          temp = color1;
          color1 = color2;
          color2 = color3;
          color3 = temp;
          startTime = millis();
       }

       for(int i = 0;i < pixelNum2;i++)
       {
          mod = i % 3;
          if(mod == 0)
            strip2.setPixelColor(i,color1);
          else if(mod == 1)
            strip2.setPixelColor(i,color2);
          else
            strip2.setPixelColor(i,color3);
       }
      break;
    case 2:
       if (endTime - startTime >= interval)
       {
          temp = color4;
          color4 = color5;
          color5 = color6;
          color6 = temp;
          startTime = millis();
       }

       for(int i = 0;i < pixelNum2;i++)
       {
          mod = i % 3;
          if(mod == 0)
            strip2.setPixelColor(i,color4);
          else if(mod == 1)
            strip2.setPixelColor(i,color5);
          else
            strip2.setPixelColor(i,color6);
       }
      break;
    case 3:
       if (endTime - startTime >= interval)
       {
          temp = color7;
          color7 = color8;
          color8 = color9;
          color9 = temp;
          startTime = millis();
       }

       for(int i = 0;i < pixelNum2;i++)
       {
          mod = i % 3;
          if(mod == 0)
            strip2.setPixelColor(i,color7);
          else if(mod == 1)
            strip2.setPixelColor(i,color8);
          else
            strip2.setPixelColor(i,color9);
       }
      break;
    case 4:
       if (endTime - startTime >= interval)
       {
          temp = color10;
          color10 = color11;
          color11 = color12;
          color12 = temp;
          startTime = millis();
       }

       for(int i = 0;i < pixelNum2;i++)
       {
          mod = i % 3;
          if(mod == 0)
            strip2.setPixelColor(i,color10);
          else if(mod == 1)
            strip2.setPixelColor(i,color11);
          else
            strip2.setPixelColor(i,color12);
       }
      break;
      
  }
  strip.show();
  strip2.show();
}

void parseMessage()
{
  int comma = message.indexOf(",");
  state1=message.substring(0,comma).toInt();
  message=message.substring(comma+1,message.length());
  comma=message.indexOf(",");
  state2=message.substring(0,comma).toInt();
  message=message.substring(comma+1,message.length());
  comma=message.indexOf(",");
  state3=message.substring(0,comma).toInt();
  message=message.substring(comma+1,message.length());
  comma=message.indexOf(",");
  state4=message.substring(0,comma).toInt();
  message=message.substring(comma+1,message.length());
  comma=message.indexOf(",");
  state5=message.substring(0,comma).toInt();
  message=message.substring(comma+1,message.length());
  comma=message.indexOf(",");
  state6=message.substring(0,comma).toInt();
  message=message.substring(comma+1,message.length());
  ambianceState=message.toInt();
  Serial.println("Your States are: " + String(state1) + "," + String(state2) + "," + String(state3) + "," + String(state4) + "," + String(state5) + "," + String(state6) + "," + String(ambianceState));
}
