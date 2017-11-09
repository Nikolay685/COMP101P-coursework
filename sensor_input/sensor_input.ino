#define LDRPIN A0

#define THERMPIN A1
#define THERMNOMINAL 10000
#define TEMPNORMAL 25

#define NUMSAMPLES 5
#define BCOEFFICIENT 3950
#define SRESISTOR 4700

int ldrValue = 0;
int thermValue = 0;
uint16_t samples[NUMSAMPLES];

void setup() {
Serial.begin(9600);
}
void loop() {
  uint8_t i;
  float average;
 
  // take N samples in a row, with a slight delay
  for (i=0; i< NUMSAMPLES; i++) {
   samples[i] = analogRead(THERMPIN);
   delay(10);
  }
 
  // average all the samples out
  average = 0;
  for (i=0; i< NUMSAMPLES; i++) {
     average += samples[i];
  }
  average /= NUMSAMPLES;

  average = 1023 / average - 1;
  average = SRESISTOR / average;

  float steinhart;
  steinhart = average / THERMNOMINAL;     // (R/Ro)
  steinhart = log(steinhart);                  // ln(R/Ro)
  steinhart /= BCOEFFICIENT;                   // 1/B * ln(R/Ro)
  steinhart += 1.0 / (TEMPNORMAL + 273.15); // + (1/To)
  steinhart = 1.0 / steinhart;                 // Invert
  steinhart -= 273.15;
  ldrValue = analogRead(LDRPIN);
  Serial.print(ldrValue, DEC);
  Serial.print("a");
  Serial.print(steinhart);
  Serial.print("\n");
delay(900);
}
