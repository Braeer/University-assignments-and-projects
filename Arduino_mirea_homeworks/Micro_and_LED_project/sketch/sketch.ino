// Пины
const int micPin = A0;       // Пин, к которому подключен выход микрофона
const int ledPin = 13;       // Пин для светодиода

// Пороговое значение для детектирования звука
const int soundThreshold = 100;  

void setup() {
  pinMode(ledPin, OUTPUT);    // Установка пина для светодиода как выход
  pinMode(micPin, INPUT);     // Установка пина микрофона как вход
  Serial.begin(9600);         // Инициализация сериал для отладки
}

void loop() {
  // Чтение значения с микрофона
  int soundLevel = analogRead(micPin);

  // Вывод уровня сигнала для отладки
  Serial.println(soundLevel);

  // Если уровень звука превышает пороговое значение, включаем светодиод
  if (soundLevel > soundThreshold) {
    digitalWrite(ledPin, HIGH);  // Включить светодиод
  } else {
    digitalWrite(ledPin, LOW);   // Выключить светодиод
  }

  delay(100);  // Задержка перед следующим чтением
}