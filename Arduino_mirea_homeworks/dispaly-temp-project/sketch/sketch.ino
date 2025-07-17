#include <SevSeg.h>
#include <iarduino_DHT.h>

SevSeg sevseg; // Создаем объект для работы с семисегментным дисплеем
iarduino_DHT DHT(2); // Создаем объект для DHT, указывая номер пина и тип датчика

void setup() {
  // Инициализация DHT
  // DHT.begin();

  // Настройка семисегментного дисплея
  byte numDigits = 4;  // Количество разрядов
  byte digitPins[] = {3, 4, 5, 6}; // Пины для управления дисплеем
  byte segmentPins[] = {7, 8, 9, 10, 11, 12, 13}; // Пины для сегментов (a-g)
  bool resistorsOnSegments = false; // Рекомендуется включать резисторы на сегментах
  sevseg.begin(COMMON_CATHODE, numDigits, digitPins, segmentPins, resistorsOnSegments);
  sevseg.setBrightness(90); // Устанавливаем яркость
}

void loop() {
  // Чтение температуры
  float temperature = DHT.read();

  // Проверка на ошибки чтения данных
  if (isnan(temperature)) {
    sevseg.setNumber(0); // Отображаем 0 в случае ошибки
  } else {
    // Показать температуру (округляем до целого числа)
    sevseg.setNumber((int)temperature);
  }
  delay(1);
  sevseg.refreshDisplay(); // Обновляем дисплей
}
