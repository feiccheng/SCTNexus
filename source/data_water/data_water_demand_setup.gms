Set       parameterstructure              Parameters relate to water demand
         /
           quantity                Quantity of water demanded
           price                   Price of water demanded
           elasticity              Elasticity of water demanded
           pumpingcost             surface water pumping cost
           othercost               other maintainance and process cost
           treatment                the treatment cost
           tfac                    the truncated factor
         /

Set       allsteps                 Seperable quantity steps
         /  s1*s54  /

          steps(allsteps)          Restricted set of steps for testing
;
*        /  2,9,21,31,41,51,54  /;
          steps(allsteps)=yes;

PARAMETER
          QINC(allSTEPS)           Seperable quantity increments
         /
             s1   .10,     s2  .15,     s3  .20,     s4  .25,      s5  .30,      s6  .35,      s7  .40,      s8  .45,
             s9   .50,    s10  .55,    s11  .60,    s12  .65,     s13  .70,     s14  .75,     s15  .775,    s16  .80,
            s17   .82,    s18  .84,    s19  .86,    s20  .88,     s21  .90,     s22  .91,     s23  .92,     s24  .93,
            s25   .94,    s26  .95,    s27  .96,    s28  .97,     s29  .98,     s30  .99,     s31 1.00,     s32 1.01,
            s33  1.02,    s34 1.03,    s35 1.04,    s36 1.05,     s37 1.06,     s38 1.07,     s39 1.08,     s40 1.09,
            s41  1.10,    s42 1.12,    s43 1.14,    s44 1.16,     s45 1.18,     s46 1.20,     s47 1.25,     s48 1.30,
            s49  1.35,    s50 1.40,    s51 1.5,     s52 2.00,     s53 2.50,     s54 4.00
         / ;

Parameter
          Priceother(sector)                        water price for sectors
          / rec 0.0009,  oth 0.0008, hyd 0.0001/;

parameter PriceElasticity(Month)  Monthly municipal price elasticites from GCD aggregate data model (Griffin & David)
               /
* This is the new version of price elasticity from David Bell(4-20-2006)
                     JAN      -0.168
                     feb      -0.164
                     mar      -0.209
                     apr      -0.268
                     may      -0.291
                     jun      -0.335
                     jul      -0.327
                     aug      -0.359
                     sep      -0.313
                     oct      -0.200
                     nov      -0.206
                     dec      -0.159
               /;
Scalar    IndMinelasticity                  Industrial water price elasticity from Tasana's industry water elaticity
         /  -0.540   /   ;

table citymun(city, source) city municiple water demand
*cities municipal demand
*http://conservenorthtexas.org/regional-indicators/municipal-capita-water-use-selected-texas-cities
*san antonio 140 gallon per person per day
*corpus christi 150 gallon per person per day
*victoria 169 gallon per person per day
* corpus number is changed to get nueces positive demand
                                     surface            ground
                   SanAntonio        8926              204192
                   VictoriaCity       9160               3268
                   CorpusChristi     33220               1510      ;
* add fake data here to make model run
*                   GonzalesCity      1130               2000    ;

