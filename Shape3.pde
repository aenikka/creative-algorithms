class Mark_CubeC{

  float xPos, yPos;
  color myColor_CC;
  float myRot, myRotX;
  

  Mark_CubeC() {

    xPos = thisX - width/2;
    yPos = thisY; 
    myColor_CC = aColor;
    myRot = globalRot;
    myRotX = globalRotX;
    synth.stop();
    
   volume_c = (xPos - 0) * (1 - (0)) / (639f - 0f) + (0);
   chords.amp(volume_c);   
  }
  

  void render3() {
    
    pushMatrix();
    noStroke();
    fill(myColor_CC,80);
    rotateX(radians(-myRotX));
    rotateY(radians(-myRot));
    translate(xPos, yPos, 0);    
    translate(random(-15,15),random(-15,15),random(-15,15));
    box(5);    
    popMatrix();
  }
  
  void render3Crazy() {
    
    pushMatrix();
    noStroke();
    fill( color( random(255),random(255),random(255)));
    rotateX(radians(-myRotX));
    rotateY(radians(-myRot));
    translate(xPos, yPos, 0);    
    translate(random(-15,15),random(-15,15),random(-15,15));
    box(5);   
    popMatrix();
  }

}
