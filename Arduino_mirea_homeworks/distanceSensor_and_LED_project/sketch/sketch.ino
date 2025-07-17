#include <iarduino_HC_SR04.h> // Подключаем библиотеку для ультразвукового датчика

// Объявляем объект класса iarduino_HC_SR04
// iarduino_HC_SR04 ultrasonic(9, 10); // Указываем пины для триггера (9) и эхо (10)
iarduino_HC_SR04 hcsr(2,3);

const int ledPin = 13;       // Пин для светодиода
const int distanceThreshold = 30;  // Пороговое расстояние для включения светодиода (в сантиметрах)

void setup() {
  pinMode(ledPin, OUTPUT);   // Настраиваем пин для светодиода как выход
  Serial.begin(9600);        // Настраиваем скорость передачи данных для монитора порта
}

void loop() {
  // Получаем расстояние до объекта в сантиметрах
  int distance = hcsr.distance();  

  // Печатаем расстояние в монитор порта
  Serial.print("Distance: ");
  Serial.print(distance);
  Serial.println(" cm");

  // Включаем светодиод, если объект ближе порогового значения
  if (distance > 0 && distance < distanceThreshold) {
    digitalWrite(ledPin, HIGH);  // Включаем светодиод
  } else {
    digitalWrite(ledPin, LOW);   // Выключаем светодиод
  }

  delay(100); // Небольшая задержка для стабильности
}