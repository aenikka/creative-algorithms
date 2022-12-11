/* AMS 
Ana Isabel Blanco
Creative Algorithms Final 
2022-2
*/


import processing.sound.*;
import oscP5.*;
import netP5.*;

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;


ArrayList<Mark_Sphere> painting_Sphere = new ArrayList();
ArrayList<Mark_Cube> painting_Cube = new ArrayList();
ArrayList<Mark_CubeC> painting_CubeC = new ArrayList();


color globalColor = color(255,0,0);
float globalRot = 0;
float globalRotX = 0;

int mode = 1;
color aColor= color( random(255),random(255),random(255));
int angle = 0;
float audiospeed = 1;
float volume_c = 1;


float posX, posY;
float thisX, thisY;
float prox;

OscP5 oscP5;  
NetAddress myRemoteLocation;
SoundFile drums, chords, synth;



void setup() {
  
  size(640,480,P3D);
  noStroke();
  oscP5 = new OscP5(this, 6448);
  drums = new SoundFile(this, "drumbeat_def.wav", false);
  chords = new SoundFile(this, "chords_def.wav", false);
  synth = new SoundFile(this, "synth.wav", false);
  
 
  drums.loop();
  chords.loop();
}

void draw() {
   
  thisY = (posY - 6) * (0 - 479) / (-87 - 6) + 479;
  thisX = (posX - 150) * (639 - 0) / (-30 - 150) + 0;
  
  //new_value = (old_value - old_min) * (new_max - new_min) / (old_max - old_min) + new_min;  
  
  background(0);
  lights();
  
  float step = map(sin(frameCount*0.2),-1,1,22,88);
  
  ambientLight(map(thisX, 0, width, 122, 222), map(thisX, 0, width, 122, 222), map(thisX, 0, width, 122, 222));
  float dirX = (thisX / width - 0.5) * 2;
  float dirY = (thisY / height - 0.5) * 2;
  directionalLight(map(thisX, 0, width, 122, 222), map(thisX, 0, width, 122, 222), map(thisX, 0, width, 122, 222), -dirX, -dirY, -1);
  specular(step*2, step*2, step);
 
  fill(aColor);
  translate(width/2, 0, 0);
  rotateY(radians(globalRot));
  rotateX(radians(globalRotX));
  
  if (mode ==1) 
  {
    
   painting_Sphere.add(new Mark_Sphere());

  }
  
  if (mode==2)
  {
    
  painting_Cube.add(new Mark_Cube());
  
  }
  
  if (mode ==3)
  {  
  painting_CubeC.add(new Mark_CubeC());
  }
  
  for(Mark_Sphere eachMark_Sphere: painting_Sphere) {
    
    if (mode==4)
    {
    eachMark_Sphere.renderCrazy();
    }
    else eachMark_Sphere.render();
    
    
  }
   for(Mark_Cube eachMark_Cube: painting_Cube) {
     if (mode ==4)
     {
     eachMark_Cube.render2Crazy();
     }     
    else eachMark_Cube.render2();
  }
  
  for(Mark_CubeC eachMark_CubeC: painting_CubeC) {
    if (mode ==4)
    {
    eachMark_CubeC.render3Crazy();
    
    }
    else eachMark_CubeC.render3();
    
  }
  
  
}

void randomize()
{
  aColor = color( random(255),random(255),random(255));
}

 void oscEvent(OscMessage theOscMessage) {     
   
   // COORDINATES 
  
  if (theOscMessage.checkAddrPattern("/multisense/orientation/yaw")==true) {
    posX = theOscMessage.get(0).floatValue();  
    
  }
  if (theOscMessage.checkAddrPattern("/multisense/orientation/pitch")==true) {
    posY = theOscMessage.get(0).floatValue();  
    
  }
  
  //MODES BUTTONS
  
  if (theOscMessage.checkAddrPattern("/beat")==true) {
    if(theOscMessage.get(0).floatValue() == 1)
    {
    mode = 1;
    randomize();
    }    
  }
  
  if (theOscMessage.checkAddrPattern("/amp")==true) {
    if(theOscMessage.get(0).floatValue() == 1)
    {
    mode = 3;
    randomize();
    }    
  }
  
  if (theOscMessage.checkAddrPattern("/synth")==true) {
    if(theOscMessage.get(0).floatValue() == 1)
    {
    mode = 2;
    randomize();
    }    
  }
  
  if (theOscMessage.checkAddrPattern("/crazy")==true) {
    if(theOscMessage.get(0).floatValue() == 1)
    {
    mode = 4;
    randomize();
    }    
  }
  
    if (theOscMessage.checkAddrPattern("/stopD")==true) {
    if(theOscMessage.get(0).floatValue() == 1)
    {
    mode = 5;
    randomize();
    }    
  }
  
  
  // ROTATION BUTTONS
  
  if (theOscMessage.checkAddrPattern("/rotR")==true) {
    if(theOscMessage.get(0).floatValue() == 1)
    {
    globalRot += 6;
    }    
  }
  
  if (theOscMessage.checkAddrPattern("/rotL")==true) {
    if(theOscMessage.get(0).floatValue() == 1)
    {
    globalRot -= 6;
    }    
  }
  
  if (theOscMessage.checkAddrPattern("/rotU")==true) {
    if(theOscMessage.get(0).floatValue() == 1)
    {
    globalRotX += 6;
    }    
  }
  
  if (theOscMessage.checkAddrPattern("/rotD")==true) {
    if(theOscMessage.get(0).floatValue() == 1)
    {
    globalRotX -= 6;
    }    
  }
  
  
  
  // SAVE BUTTON
  if (theOscMessage.checkAddrPattern("/save")==true) {
    if(theOscMessage.get(0).floatValue() == 1)
    {
    saveFrame("screenshot.png");
    }    
  }
  
  
 }
