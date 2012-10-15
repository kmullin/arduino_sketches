#include <LiquidCrystal.h>

/*#include <stdarg.h>
 void p(char *fmt, ... ){
 char tmp[128]; // resulting string limited to 128 chars
 va_list args;
 va_start (args, fmt );
 vsnprintf(tmp, 128, fmt, args);
 va_end (args);
 Serial.print(tmp);
 }*/
// initialize the library with the numbers of the interface pins
LiquidCrystal lcd(12, 11, 5, 4, 3, 2);

void setup(){
  // set up the LCD's number of columns and rows:
  lcd.begin(16, 2);
  // initialize the serial communications:
  //Serial.begin(9600);
  format("hello, I am arduino, pleased to meet you. I can talk a lot", 4);
  delay(3000);
  format("poop on your face yo, multiline", 0);
}

void format(char *str, int sec)
{
  char p_str[17]; // line buffer
  int cur = 0; // counter
  int i;

  //  Serial.print("clear\n");
  lcd.clear();
  while (cur < strlen(str)) {
    strncpy(p_str, str + cur, sizeof(p_str)); // get next 16 chars
    cur += 16;
    lcd.write(p_str);

    if (cur % (16 * 2) != 0) { // if not end of line
      lcd.setCursor(0, 1); // goto second line first column
    }
    else { // otherwise wait a couple seconds
      delay(sec * 1000);
      i = strlen(str) - cur;
      if (i > 0) { // more to go
        //        p("eq: %d\n", i);
        lcd.clear();
      }
    }
  }
}

void loop()
{
  // just loop
}










