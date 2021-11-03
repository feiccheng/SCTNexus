*~~~~~~~~~~~~~~~~~~~~~
* pumping steps
*~~~~~~~~~~~~~~~~~~~~~

scalar    PumpCostPerFoot             Pumping Cost Per Foot ($0.1325 per AcreFoot per Foot) Source: Ag Extension Crop Budget  /0.1325/   ;

set          allstepsw                 Seperable quantity steps    for water pumping
         /  w1*w43  /

          stepw(allstepsw)
;
         stepw(allstepsw)=yes;

PARAMETER
          QINCW(allSTEPSw)           Seperable quantity increments    for water pumping
         /
             w1  EPS,      w2  .10,     w3  .20,     w4  .30,      w5  .40,      w6  .50,      w7  .60,      w8   .70,
             w9   .80,     w10  .90,    w11  .95,    w12   1,     w13   1.05,    w14  1.1,     w15  1.2,    w16   1.3,
             w17   1.4,    w18  1.5,    w19  1.6,    w20  1.7,     w21  1.8,     w22  1.9,     w23  2.0,     w24   2.2,
             w25   2.4,    w26  2.6,    w27  2.8,    w28  3.0,     w29  3.5,     w30  4,       w31  4.5,     w32   5
             w33   6,      w34   7,     w35    8,    w36   10,     w37 13  ,     w38  16,      w39   20,     w40   25,
             w41   30,     w42   35,    w43    40
*,    w44   20
*,     s45   22,     s46   24,     s47   26,     s48    28,
*            s49    30,    s50   35,    s51   40,    s52   45,     s53   50,     s54   60
         /;

parameter baselift(sector)           the baseline lift distance for surface and other source diversion and also for groundwater if lift distance is missing

/
  ag   80
*  mun  300
*  ind  300
*  min  300
  oth  80
  rec  0
*  cool 300


/ ;
