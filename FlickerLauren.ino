/*
  Present order of 3 flicker presentations randomly in counterbalanced order
*/

// the setup function runs once when you press reset or power the board
void setup() {
  Serial.begin(9600);//opens serial port, sets data rate to 9600bps
}
        
int order;
    
void trial(int order) {
  if (order==0)
  {
    
    tone(9,60000);
    Serial.print(" beginning ");
    delay(60000);
    noTone(9);  
    delay(10000);
    
    tone(9,60);
    Serial.print(" slow ");
    delay(60000);
    noTone(9);  
    delay(10000);

    tone(9,120);
    Serial.print(" mid ");
    delay(60000);
    noTone(9);
    delay(10000);
    
    tone(9,60000);
    Serial.print(" fast ");
    delay(60000);
    noTone(9);
    delay(10000);

    tone(9,60);
    Serial.print(" slow ");
    delay(60000);
    noTone(9);
    delay(10000);

    tone(9,60000);
    Serial.print(" fast ");
    delay(60000);
    noTone(9);
    delay(10000);

   tone(9,120);
    Serial.print(" mid ");
    delay(60000);
    noTone(9); 
    delay(10000);
   
    tone(9,120);
    Serial.print(" mid ");
    delay(60000);
    noTone(9);  
    delay(10000);

    tone(9,60);
    Serial.print(" slow ");
    delay(60000);
    noTone(9);
    delay(10000);
    
    tone(9,60000);
    Serial.print(" fast ");
    delay(60000);
    noTone(9);
    delay(10000);

    tone(9,120);
    Serial.print(" mid ");
    delay(60000);
    noTone(9);
    delay(10000);

    tone(9,60000);
    Serial.print(" fast ");
    delay(60000);
    noTone(9);
    delay(10000);

    tone(9,60);
    Serial.print(" slow ");
    delay(60000);
    noTone(9);  
    delay(10000);
    
    tone(9,60000);
    Serial.print(" fast ");
    delay(60000);
    noTone(9);
    delay(10000);
    
    tone(9,60);
    Serial.print(" slow ");
    delay(60000);
    noTone(9);  
    delay(10000);

    tone(9,120);
    Serial.print(" mid ");
    delay(60000);
    noTone(9);
    delay(10000);

    tone(9,60000);
    Serial.print(" fast ");
    delay(60000);
    noTone(9);
    delay(10000);

    tone(9,120);
    Serial.print(" mid ");
    delay(60000);
    noTone(9);  
    delay(10000);

    tone(9,60);
    Serial.print(" slow ");
    delay(60000);
    noTone(9);
    Serial.print(" All done ");
    delay(10000);
   
  }

void loop() 
{ 
  for (int i = 1; i <= 1; i++) {
    order=0; // orders 0-5
    Serial.print(order);
    trial(order);
    }
 }
