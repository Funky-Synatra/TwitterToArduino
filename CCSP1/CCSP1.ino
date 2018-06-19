char val;
int ledPin1 = 9;
int ledPin2 = 6;
int ledPin3 = 11;

void setup() {
  // put your setup code here, to run once:
  pinMode(ledPin1, OUTPUT);
  pinMode(ledPin2, OUTPUT);
  pinMode(ledPin3, OUTPUT);
  Serial.begin(9600);

}

void loop() {
  // put your main code here, to run repeatedly:
  if (Serial.available())
  {
    val = Serial.read();
  }
  if (val == '1')
  {
    digitalWrite(ledPin1, HIGH);


  }
  if (val == '2')
  {
    digitalWrite(ledPin2, HIGH);


  }
  if (val == '3')
  {
    digitalWrite(ledPin3, HIGH);


  }
  if (val == '0')
  {
    digitalWrite(ledPin1, LOW);
    digitalWrite(ledPin2, LOW);
    digitalWrite(ledPin3, LOW);
  }
  //delay(10);




}
