#include <Wire.h>
#include <LiquidCrystal_I2C.h>
#include <iarduino_DHT.h>

// Укажите адрес вашего I2C дисплея (обычно 0x27 или 0x3F)
LiquidCrystal_I2C lcd(0x27, 16, 2); 

// Создайте объект DHT, укажитaе тип датчика и номер пина
iarduino_DHT sensor(2);    
  // Инициализация дисплея
void setup() {

  lcd.init();
  lcd.backlight();

  // Инициализация датчика DHT
  sensor.read();
}

void loop() {
  // Получение температуры и влажности
  float temperature = sensor.tem;
  float humidity = sensor.hum;

  // Проверка на ошибки чтения данных
  if (isnan(temperature) || isnan(humidity)) {
    lcd.clear();
    lcd.setCursor(0, 0);
    lcd.print("Error");
  } else {
    // Очистка дисплея и вывод данных
    lcd.clear();
    lcd.setCursor(0, 0);
    lcd.print("Temp: ");
    lcd.print(temperature);
    lcd.print(" C");
    lcd.setCursor(0, 1);
    lcd.print("Hum: ");
    lcd.print(humidity);
    lcd.print(" %");
  }

  // Задержка перед следующим обновлением данных
  delay(2000);
}
