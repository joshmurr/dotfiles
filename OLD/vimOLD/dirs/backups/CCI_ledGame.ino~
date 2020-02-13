const int buttonPins[] = {6, 7, 8, 9};
const int ledPins[] = {2, 3, 4, 5};
const int ledCount, buttonCount = 4;
const int MAX_GOES = 10;

int buttonCounter, buttonState, turn = 0;
int lastButtonState[] = {0, 0, 0, 0};
int computersTurn[MAX_GOES] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
int playersTurn[MAX_GOES] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};

long randomNum;


void setup() {
  for(int i=0; i<buttonCount; i++){
    pinMode(buttonPins[i], INPUT);
  }
  
  for(int i=0; i<ledCount; i++){
    pinMode(ledPins[i], OUTPUT);
  }

  Serial.begin(9600);

  randomSeed(analogRead(0));

  computer_init();
  // computers_turn(turn);
}

void loop() {
  
  
}

void players_turn(){
  for(int i=0; i<buttonCount; i++){
    buttonState = digitalRead(buttonPins[i]);
    
    if(buttonState != lastButtonState[i]){
      if(buttonState == HIGH){
        buttonCounter++;
        Serial.print(buttonCounter);
      }
      delay(50);
    }
    lastButtonState[i] = buttonState;
  }
  // Write state to LEDs
  for(int i=0; i<buttonCount; i++){
    if(lastButtonState[i]){
      digitalWrite(ledPins[i], HIGH);
    } else {
      digitalWrite(ledPins[i], LOW);
    }
  }
}

void computer_init(){
  for(int i=0; i<MAX_GOES; i++){
    computersTurn[i] = int round(random(0, 4));
  } 
}

void computers_turn(int t){
  // Turn off all LEDs
  /*for(int j=0; j<ledCount; j++){
    digitalWrite(ledPins[j], LOW);
  }*/

  // Flash sequence up until turn number
  int i = 0;
  while(i < t){
    digitalWrite(ledPins[computersTurn[i]], HIGH);
    delay(300);
    digitalWrite(ledPins[computersTurn[i]], LOW);
    delay(300);
    i++;
  }
}
