class Mark_Sphere {
  
  float xPos, yPos;
  color myColor_S;
  float myRot, myRotX;
  float angle = 0;

  Mark_Sphere() {
 
   xPos = thisX - width/2;
   yPos = thisY;
   
    myColor_S = aColor;
    myRot = globalRot;
    myRotX = globalRotX;
     
   audiospeed= (yPos*2)/479f;    
  
   drums.rate(audiospeed);
   chords.rate(audiospeed);
   
   //new_value = (old_value - old_min) * (new_max - new_min) / (old_max - old_min) + new_min;
   
  }
  
  void render() {
                      
    pushMatrix();  
    noStroke();
    fill(myColor_S);
    rotateX(radians(-myRotX));
    rotateY(radians(-myRot));
    translate(xPos, yPos, 0);   
    sphere(((xPos + yPos) * (random(0.06,0.03))));             
    popMatrix();
  }
  
  void renderCrazy() {
    pushMatrix();  
    noStroke();
    fill( color( random(255),random(255),random(255)));
    rotateX(radians(-myRotX));
    rotateY(radians(-myRot));
    translate(xPos, yPos, 0);   
    sphere((xPos + yPos) * (random(0.06,0.03)));
    popMatrix();
  }
  
}
