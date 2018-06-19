
#define MAXDATA 50
#define TIMEOUT 10


int num1 = 0;
int num2 = 0;
int num3 = 0;
int ledPin1 = 9;
int ledPin2 = 10;
int ledPin3 = 11;
String number;

void setup() {
  // put your setup code here, to run once:
  pinMode(ledPin1, OUTPUT);
  pinMode(ledPin2, OUTPUT);
  pinMode(ledPin3, OUTPUT);
  Serial.begin(9600);


}
long timeoutOver;
char data[MAXDATA];

void loop() {
  // put your main code here, to run repeatedly:

  String received = receivedString();


  if (received.charAt(0) == 'a')
  {
    number = received.substring(1);
    num1 = number.toInt();
    analogWrite(ledPin1, num1);
  }

  if (received.charAt(0) == 'b')
  {
    number = received.substring(1);
    num2 = number.toInt();
    analogWrite(ledPin2, num2);
  }
  if (received.charAt(0) == 'c')
  {
    number = received.substring(1);
    num3 = number.toInt();
    analogWrite(ledPin3, num3);

  }

  //delay(10);


}

String receivedString()
{
  boolean somethingReceived = false;
  int pos = 0;
  if (Serial.available())
  {
    somethingReceived = true;
    do
    {
      while (Serial.available())
      {
        data[min(pos, MAXDATA - 1)] = Serial.read();
        timeoutOver = millis() + TIMEOUT;
        pos++;
      }
    }
    while (millis() < timeoutOver);
    data[pos] = '\0';
  }

  String collected(data);

  return collected;
}
