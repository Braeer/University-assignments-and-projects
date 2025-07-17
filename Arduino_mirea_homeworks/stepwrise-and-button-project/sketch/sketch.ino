const int potPin = A0; // Пин для потенциометра
const int motorPin = 9; // Пин управления двигателем (PWM)

void setup() {
  pinMode(motorPin, OUTPUT);
}

void loop() {
  int potValue = analogRead(potPin); // Чтение значения с потенциометра
  int motorSpeed = map(potValue, 0, 1023, 0, 255); // Преобразование в диапазон скоростей
  analogWrite(motorPin, motorSpeed); // Установка скорости
  delay(100); // Задержка
}