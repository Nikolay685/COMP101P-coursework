#define LDRPIN A0

#define THERMPIN A1
#define THERMNOMINAL 4700
#define TEMPNORMAL 280

#define NUMSAMPLES 5
#define BCOEFFICIENT 3950
#define SRESISTOR 10000

int ldrValue = 0;
uint16_t samples[NUMSAMPLES];

void setup() {
Serial.begin(9600);
}
void loop() {
  uint8_t i;
  float averageTherm;
 
  // take N samples in a row, with a slight delay
  for (i=0; i< NUMSAMPLES; i++) {
   samples[i] = analogRead(THERMPIN);
   delay(10);
  }
 
  // average all the samples out
  averageTherm = 0;
  for (i=0; i< NUMSAMPLES; i++) {
     averageTherm += samples[i];
  }
  averageTherm /= NUMSAMPLES;

  averageTherm = (1024 / averageTherm) - 1;

  float steinhart;
  
  // Changing average value to Degrees celcuis
  steinhart = averageTherm;
  steinhart = log(steinhart);
  steinhart /= BCOEFFICIENT;
  steinhart += 1.0 / (TEMPNORMAL);
  steinhart = 1.0 / steinhart;
  steinhart -= 273.15;
  
  ldrValue = analogRead(LDRPIN);

  // Sending the values
  Serial.print(ldrValue, DEC);
  Serial.print("a");
  Serial.print(steinhart);
  Serial.print("\n");
delay(1000);
}
