class Mark_Cube{

  float xPos, yPos;
  color myColor_C;
  float myRot, myRotX;
  float new_value, old_value, old_min, new_max, new_min, old_max;
  float synth_audiospeed;
  
 
  Mark_Cube() {
    
    xPos = thisX - width/2;
    yPos = thisY;  
    myColor_C = aColor;
    myRot = globalRot;
    myRotX = globalRotX;
         
    if (synth.isPlaying()== false)
    {
    synth.play();
    }      

   synth_audiospeed= (thisX*2)/639f;
   synth.rate(synth_audiospeed);
 
  }
  
  void render2() {     
    
    pushMatrix();    
    noFill();
    stroke(myColor_C,60);
    rotateX(radians(-myRotX));
    rotateY(radians(-myRot));
    translate(xPos, yPos, 0);      
    box(20);
    rotateX(radians(-myRotX+45));
    rotateY(radians(-myRot+45));   
    box(20);
    rotateX(radians(-myRotX+45));
    rotateY(radians(-myRot+45));
    box(15);  
    popMatrix();
    
  }
  
  void render2Crazy() {   
    
    pushMatrix();    
    noFill();
    stroke(color( random(255),random(255),random(255)));
    rotateX(radians(-myRotX));
    rotateY(radians(-myRot));
    translate(xPos, yPos, 0);      
    box(20);
    rotateX(radians(-myRotX+45));
    rotateY(radians(-myRot+45));   
    box(20);
    rotateX(radians(-myRotX+45));
    rotateY(radians(-myRot+45));
    box(15);    
    popMatrix();
  }
 

}
