#include <SevSeg.h>
#include <iarduino_RTC.h>

// Объявляем объекты
SevSeg sevseg;
iarduino_RTC rtc(RTC_DS1307); // Укажите ваш тип RTC (например, RTC_DS3231, если у вас другой модуль)

// Пин подключения сегментов дисплея (указать ваши пины)
byte segmentPins[] = {2, 3, 4, 5, 6, 7, 8};
// Пин подключения управления дисплеем
byte digitPins[] = {9, 10, 11, 12};

void setup() {
  // Настраиваем 7-сегментный дисплей
  sevseg.begin(COMMON_ANODE, 4, digitPins, segmentPins);
  sevseg.setBrightness(10); // Яркость дисплея

  // Инициализация RTC
  rtc.begin();

  // Установка времени (необходимо выполнить один раз)
  // rtc.settime(30, 59, 23); // Установка времени: ЧЧ:ММ:СС
  // rtc.setdate(5, 1, 12, 23); // Установка даты: ДЕНЬ, ДЕНЬ НЕДЕЛИ, МЕСЯЦ, ГОД
}

void loop() {
  rtc.gettime(); // Получаем время из RTC

  // Формируем отображение времени в формате ЧЧ:ММ
  int displayNumber = rtc.Hours * 100 + rtc.minutes;
  
  sevseg.setNumber(displayNumber, 2); // Устанавливаем число для отображения с двумя ведущими нулями
  sevseg.refreshDisplay(); // Обновляем дисплей

  delay(1000); // Обновление каждые 1000ms (каждую секунду)
}