#include <Wire.h>
#include <LiquidCrystal_I2C.h>
#include <iarduino_DHT.h>

// Укажите адрес вашего I2C дисплея (обычно 0x27 или 0x3F)
LiquidCrystal_I2C lcd(0x27, 16, 2);

// Создайте объект DHT, укажите тип датчика и номер пина
iarduino_DHT sensor(2);     // объявляем  переменную для работы с датчиком DHT, указывая номер цифрового вывода к которому подключён датчик (сейчас 2pin)

void setup() {
  // Инициализация дисплея
  lcd.init();
  lcd.backlight();
  sensor.read();

  // Инициализация датчика DHT
}

void loop() {
  // Получение температуры в градусах Цельсия
  float temperature = sensor.tem;

  // Проверка на ошибки чтения данных
  if (isnan(temperature)) {
    lcd.clear();
    lcd.setCursor(0, 0);
    lcd.print("Error");
  } else {
    // Очистка дисплея и вывод данных
    lcd.clear();
    lcd.setCursor(0, 0);
    lcd.print("Temp");
    lcd.setCursor(0, 1);
    lcd.print(temperature);
    lcd.print(" C");
  }

  // Задержка перед следующим обновлением данных
  delay(2000);
}