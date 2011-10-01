
const int ledCount = 10;
const int ledPins[] = { 
  2,3,4,5,6,7,8,9,10,11 };
const int potPin = A5;

const int stall = 1000;

int lastLvl = 0;

void setup()
{                
  for (int led = 0; led < ledCount; led++) {
    pinMode(ledPins[led], OUTPUT);
  }
  pinMode(potPin, INPUT);
  Serial.begin(9600);
}

void blinkie(int wait)
{
  int last = 0;
  int pin = 0;
  for (int led = 0; led < ledCount; led++) {
    do {
      pin = random(10);
      Serial.println(pin);
    } while (pin == last);
    digitalWrite(pin, HIGH);
    last = pin;
    delay(wait);
  }
  allOff();
}

void up(int wait, int on)
{
  for (int led = 0; led < ledCount; led++) {
    digitalWrite(ledPins[led], on);
    delay(wait);
  }
}

void down(int wait, int on)
{
  for (int x = ledCount-1; x >= 0; x--) {
    digitalWrite(ledPins[x], on);
    delay(wait);
  }
}

void bounce(int wait)
{
  up(wait, HIGH);
  down(wait, LOW);
}

void scroll(int wait)
{
  up(wait, HIGH);
  up(wait, LOW);
}

void knightrider(int wait)
{
  up(wait, HIGH);
  up(wait, LOW);
  down(wait, HIGH);
  down(wait, LOW);
}

int getLevel()
{
  int reading = analogRead(potPin);
  return map(reading, 0, 1023, 0, ledCount);
}

void allOff()
{
  for (int thisLed = 0; thisLed < ledCount; thisLed++) {
    digitalWrite(ledPins[thisLed], LOW);
  }
}

void graph(int level)
{
  for (int thisLed = 0; thisLed < ledCount; thisLed++) {
    if (thisLed < level) {
      digitalWrite(ledPins[thisLed], HIGH);
    }
    else {
      digitalWrite(ledPins[thisLed], LOW);
    }
  }
}

void loop()
{
  // int ledLevel = getLevel();

  // graph(ledLevel);
  // lastLvl = ledLevel;
  knightrider(getLevel() *10);
  
}






