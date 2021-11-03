*CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
* ground water usage upper bound (MAG in twdb water plan)
*CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC

table  MAG(county, aquifer) the upper bar of ground water pumping in regional water plan
* already adjusted the region by river basin

* page 3-18 of region N plan
*sparta is layer one of carrizo , queen city is  layr 3 of carrizo
                    carrizo      gulfcoast      EdwardsTrinity
aransas                            1862
bee                  394          20098
duval                             364
jimwells                          3962
liveoak              2399         11434
mcmullen             1955           689
nueces                             9009
sanpatricio                       19013
Atascosa           75808                         0
bexar              26107                         45077
Caldwell           43560                         0
Calhoun                           2995           0
Comal                                            39498
DeWitt                            14616          0
Dimmit             3359                          0
Frio               70030                         0
Goliad                            11699          0
Gonzales           75970          2083           0
Guadalupe          14041                         0
Hays                                             7270
karnes             1280           3116           0
Kendall                                          11457
LaSalle            6454                          0
Medina             2533                          7869
Refugio                           29328          0
Uvalde             828                           2274
Victoria                          35694          0
Wilson             44794                         0
Zavala             34969                         0
* page 11-5 in region J plan
BANDERA                                         7967
EDWARDS                                         3332
KERR                                            15623
KINNEY                                          76659
REAL                                            7529
BASTROP            6055
FAYETTE             748
*Travis                             39            7
GILLESPIE                                       182
BLANCO                                          1251
Webb                92             82
Maverick           777
lavaca                             41
;


* potential other aquifer water sources
parameter otheraquiferwater_MAG(county)
/
Maverick    11969

/
;

Table currentusage(county, aquifer) current groundwater usage argued by twdb in regional water plan

                 Carrizo    gulfcoast   EdwardsTrinity
Atascosa           43020                     0
bexar              13919                   22858
Caldwell            7545                     0
Calhoun                         2974         0
Comal                                      23586
DeWitt                         11363         0
Dimmit              3359                     0
Frio               64203                     0
Goliad                         7702          0
Gonzales           39880        35           0
Guadalupe           5167                     0
Hays                                        7270
karnes              1078       3075          0
Kendall                                     5056
LaSalle             6454                     0
Medina              2533                   7869
Refugio                        3348          0
Uvalde               828                   2274
Victoria                       34532        0
Wilson             22198                    0
Zavala             34969                    0
ARANSAS                        688
BEE                          11915
*BROOKS                        6267
DUVAL                         12025
Jimwells                     10066
*KENEDY                        1079
*KLEBERG                      10331
Liveoak                       8171
MCMULLEN                       355
NUECES                        8158
SanPatricio                  18776
BANDERA                                  4101
EDWARDS                                  2075
KERR                                     8466
KINNEY                                   5611
REAL

;
