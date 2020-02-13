String readString;
char c;
int red = 13;
int green = 6;
int blue = 7;
int red_toggle = 0, green_toggle = 0,blue_toggle = 0;
int i=0;
void setup()
{
  Serial.begin(9600);
  //Serial.println("SETUP LINE ONE");
  //Serial.println("SETUP LINE TWO");

  pinMode(red, OUTPUT);
  pinMode(green, OUTPUT);
  pinMode(blue, OUTPUT);
}

void loop() {
  // CHECK BUFFER FOR RECEIVED DATA *********** //
  while (Serial.available()){
    // Read everthing in buffer to clear it
    delay(3);
    c = Serial.read();
    readString += c;
  }

  if(readString[0] == 'r'){
    digitalWrite(red, red_toggle=!red_toggle);
  }
  if(readString[0] == 'g'){
    digitalWrite(green, green_toggle=!green_toggle);
  }
  if(readString[0] == 'b'){
    digitalWrite(blue, blue_toggle=!blue_toggle);
  }
  // SEND 
  if (readString.length() > 0){
    //Serial.print("Data received: ");
    //Serial.print(readString);
    //Serial.println(" [Arduino Buffer Cleared]");
    readString = "";
  } 
  //****************************************** //
  Serial.println(i);
  i++;
  delay(10);
}
