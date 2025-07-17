#include <Servo.h>

Servo myServo; // Создаем объект сервопривода

const int buttonIncreasePin = 2; // Пин для кнопки увеличения
const int buttonDecreasePin = 3; // Пин для кнопки уменьшения

int pos = 0; // Начальная позиция сервопривода

void setup() {
  myServo.attach(9); // Подключаем сервопривод к пину 9
  pinMode(buttonIncreasePin, INPUT_PULLUP); // Настраиваем кнопку увеличения
  pinMode(buttonDecreasePin, INPUT_PULLUP); // Настраиваем кнопку уменьшения

  myServo.write(pos); // Устанавливаем начальную позицию
}

void loop() {
  // Проверяем, нажата ли кнопка увеличения
  if (digitalRead(buttonIncreasePin) == LOW) {
    pos += 1; // Увеличиваем позицию
    if (pos > 180) pos = 180; // Ограничиваем до 180 градусов
    myServo.write(pos); // Устанавливаем новую позицию
    delay(15); // Небольшая задержка для плавности движения
  }

  // Проверяем, нажата ли кнопка уменьшения
  if (digitalRead(buttonDecreasePin) == LOW) {
    pos -= 1; // Уменьшаем позицию
    if (pos < 0) pos = 0; // Ограничиваем до 0 градусов
    myServo.write(pos); // Устанавливаем новую позицию
    delay(15); // Небольшая задержка для плавности движения
  }
}