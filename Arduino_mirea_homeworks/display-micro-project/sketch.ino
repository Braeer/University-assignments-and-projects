#include <SevSeg.h>

SevSeg sevseg; // Создаем объект для работы с семисегментным дисплеем

void setup() {
  // Настройка семисегментного дисплея
  byte numDigits = 4;  // Количество разрядов
  byte digitPins[] = {3, 4, 5, 6}; // Пины для управления дисплеем
  byte segmentPins[] = {7, 8, 9, 10, 11, 12, 13}; // Пины для сегментов (a-g)
  bool resistorsOnSegments = false; // Рекомендуется включать резисторы на сегментах
  sevseg.begin(COMMON_CATHODE, numDigits, digitPins, segmentPins, resistorsOnSegments);
  sevseg.setBrightness(90); // Устанавливаем яркость
}

void loop() {
  // Считываем уровень звука с аналогового пина A0
  int soundLevel = analogRead(A0);
  
  // Нормализуем уровень звука для отображения (например, от 0 до 99)
  int displayValue = map(soundLevel, 0, 1023, 0, 99);
  
  // Отображаем на семисегментном дисплее
  sevseg.setNumber(displayValue);
  
  sevseg.refreshDisplay(); // Обновляем дисплей
  delay(500); // Задержка между обновлениями
}