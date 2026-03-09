// variavel da porta que está conectada no arduino 
const int PINO_SENSOR_TEMPERATURA = A0;

//variavel que armazena o calculo da temperatura
float temperaturaCelsius;

//inicialização de conexão
void setup() {
  Serial.begin(9600); //9600 é valor padrão
}
// função
void loop() {
  // pegando valor da porta conectada
  int valorLeitura = analogRead(PINO_SENSOR_TEMPERATURA);
  //calculo de temperatura (1023 é valor padrão de conversão de temperatura)
  temperaturaCelsius = (valorLeitura * 5.0/1023.0)/ 0.01;

// output
  Serial.print("Temperatura: ");
  Serial.print(temperaturaCelsius);
  Serial.print(" C");
  // delay funciona em milisegundos, entao 2000 equivale a 2 segundos
  delay(2000);
}
