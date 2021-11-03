
table fuel_para (fuel,   pp_alli )     heat rate and prices of fuels


           fuelheat    fuelprice    trans
*price in $ per mcf, heatrate in mmbtu/mcf
ng           1.05         2.43      0
*price in $/ton, heatrate in mmbtu/ton
coal         19.04       19.03      0
*price in $/m3 ,heatrate in mmbtu/m3
biomass      0.019       1
* price dollar/barrel  fuel heat in  mmbtu/barrel
petroleum    38.29       5.885
;

parameter fixedcost(power_plant_all) fixed cost of exist power plants this is used for rebuilt /
*unit:million $

JTDeely                     121.80
JKSpruce                    240.00
OWSommers                    81.25
VHBraunig                   102.50
LeonCreek                    23.65
ArthurVon                    38.86
SanMiguel                    68.46
Formosa                      67.17
UnionCarbide                 23.65
CFBPowerPlant                54.46
Pearsall                     23.21
ColetoCreek                  91.89
GuadalupeGS                  89.48
RioNogales                   86.95
Barney                       92.28
NuecesBay                    69.59
CorpusRefinery               17.97
CorpusChristiEC              67.07
Gregory                      49.99
Ingleside                    51.35
Victoria                     56.13
VictoriaTexas                28.18
SamRayburn                   18.07
CovelGardens                  0.22
BlueWing                      0.17
SunECPS3                      0.17
SunECPS2                      0.17
SunECPS1                      0.17
CPS1                          0.17
NelsonGardens                 0.22
AlamoSolar                    0.17
Alamo2                        0.17
Alamo3                        0.17
Alamo5                        0.17
Tessman                       0.22
HarborWind                    0.13
ECRPapalote1                  0.14
ECRPapalote2                  0.14
Canyon                        0.43
MesquiteCreek                 0.22
TP3                           0.37
TP1                           0.37
H4                            0.43
H5                            0.43
Nolte                         0.43
TP4                           0.43
Alamo4                        0.17
AnacachoWind                  0.13
CedroHill                     0.13
Whitetail                     0.13
JavelinaWind                  0.13
Ticona                       16.89
*ValeroEast                   15.29
ValeroWest                   26.46
CorpusChristi                15.68
EaglePass                     0.43
TorrecillasWind               0.13
MarsSolar                     0.17
CommerceSolar                 0.17
HaysEnergy                   90.08
*SimGideon                    64.76
*FayettePowerProject          236.3
PatriotWind                   0.13
ChapmanRanch                  0.13
Karankawa                     0.13
MidwayWind                    0.13

/;


Table once_through_cooling(power_plant_all, power_plant_cooling, year, month)    once through cooling water use in acft

                                 Jan             Feb             Mar             Apr             May             Jun             Jul             Aug             Sep             Oct             Nov             Dec
NuecesBay  .on.  2011           37.39           35.61           29.62           33.17           45.56           52.39           57.11           56.77           53.12           51.13           32.97           35.82
NuecesBay  .on.  2012           36.74           31.74           29.29           59.51           64.69           61.82           61.92           67.54           64.18           68.11           49.53           53.59
NuecesBay  .on.  2013        22486.70        14645.15        19389.12        16408.47        25543.68        28796.21        30556.12        30074.77        29104.62        30120.99        28352.66        30611.96
NuecesBay  .on.  2014        30263.61        14603.83        12268.13        29885.39        29915.61        29590.05        30690.44        30668.56        27974.66        30414.38        19850.24         6224.85
NuecesBay  .on.  2015        10711.54        16608.92        29413.91        29505.36        17113.72        23723.97        29195.11        30555.46        28630.78        29699.30        19240.62        21242.32
NuecesBay  .on.  2016        23987.16        16235.06        20083.83        27688.20        30427.36        29376.28        30465.03        30402.79        30391.02        30623.51        24792.12        23493.86
Barney     .oc.  2011           32.71           35.86           23.02           41.93           48.24           64.01           77.35           79.01           73.69           68.73           32.36           18.49
Barney     .oc.  2012           32.87           33.90           61.72           86.64           95.80           89.78          100.01           95.87           99.86           64.99           76.66           87.04
Barney     .oc.  2013        38811.17        25145.35        11620.21        20466.96        26037.32        45316.88        46832.92        46849.22        43964.87        44004.79        45156.73        30649.95
Barney     .oc.  2014        27856.75        25957.21        32307.41        19931.96        35430.20        32844.92        38433.73        38097.31        37854.61        43230.21        31781.93        23183.84
Barney     .oc.  2015        17540.87        13061.99        20474.63        15558.20        19722.11        35008.69        36263.19        33368.48        28581.94        24336.93        19167.85        18199.13
Barney     .oc.  2016        21224.44        14139.61        19360.09        15091.26        19456.45        24843.58        29360.48        37117.00        44720.47        46174.21        41366.48        29963.11



;

Table cooling_existcost(power_plant_all,  power_plant_cooling, pp_alli)       the cooling system cost of existing thermal power plants
*heat rate in mmBtu/Mwh
*fuel price in dollar per mmbtu
*fuel heat in mmbtu per ton
                         cooling_fixed_om   boiler_fixed_om    heatrate
NuecesBay           .on                          16712            8.228
Victoria            .rc              1950        15722            8.219
SamRayburn          .ri              4239        27250            9.150
Barney              .oc                          12366            7.205
ColetoCreek         .rc              2664        35113            9.874
JTDeely             .rc              2294        28873           10.240
SanMiguel           .ri              6202        44317           16.110
JKSpruce            .rc              4778        24668           13.390
ArthurVon           .rc              1795        15618            7.131
Formosa             .rc              1344        16255            8.489
Gregory             .rc              1925        19653            8.919
RioNogales          .ri              1580        14755            8.351
GuadalupeGS         .ri              1517        12858            7.155
CorpusChristiEC     .rc              1818        18752            9.742
Ingleside           .rc              1749        16561            7.514
LeonCreek           .ri              4072        25217            8.496
Pearsall            .ri              4362        28711            9.398
UnionCarbide        .ri              5476        33185           10.050
CorpusRefinery      .rc             14468       100000           10.050
VictoriaTexas       .rc              2218        21440           10.050
CFBPowerplant       .rc              3661        18903            6.742
OWSommers           .rc              2462        12713            6.742
VHBraunig           .rc              1620        12320            6.919
Ticona              .rc              2472        18340           10.124
*ValeroEast          .rc              2400        17634           14.697
ValeroWest          .rc              4218        20977           17.14
CorpusChristi       .rc              3216        18230            6.913
*FayettePowerProject .ri              8876       111834            7.500
HaysEnergy          .ri              1498        15988            7.500
*SimGideon           .ri              1567        15799            7.500
;

set link_boiler_fuel(power_plant_type, fuel)          link the fuel types of the thermal power plants
  /
        coal   .   coal
        ngst   .   ng
        ngcc   .    ng
        nggt   .    ng
        biomass.    biomass
        petroleum  .  petroleum


          /;


Table cooling_retrofitcost(power_plant_all, power_plant_cooling, power_plant_cooling_retrofit, pp_alli)
*unit dollar per mw
* the value is the difference between retrofited cost and the original cost


                                          cooling_capital_cost         cooling_fixed_om             capacity
NuecesBay       . on    .   ri                       6837                  1810                        722
NuecesBay       . on    .   DryCooling              22924                  4222                        708
Victoria        . rc    .   DryCooling              30683                  6514                        366
SamRayburn      . ri    .   DryCooling              23820                  3497                        206
Barney          . oc    .   DryCooling              14096                  2675                       1057
Barney          . oc    .   ri                       6489                  1522                       1077
ColetoCreek     . rc    .   DryCooling              37924                  3538                        602
JTDeely         . rc    .   DryCooling              40371                  3596                        863
SanMiguel       . ri    .   DryCooling              80024                  6007                        402
JKSpruce        . rc    .   DryCooling              61751                  3274                       1399
ArthurVon       . rc    .   DryCooling               8609                  1459                        539
Formosa         . rc    .   DryCooling               9195                  1258                        683
Gregory         . rc    .   DryCooling               9749                  1629                        425
RioNogales      . ri    .   DryCooling              13904                  1181                        917
GuadalupeGS     . ri    .   DryCooling              14049                  1117                       1072
CorpusChristiEC . rc    .   DryCooling               8951                  1354                        588
Ingleside       . rc    .   DryCooling               8218                  1231                        510
LeonCreek       . ri    .   DryCooling              31788                  4237                        226
Pearsall        . ri    .   DryCooling              17716                  3598                        261
UnionCarbide    . ri    .   DryCooling              18750                  3000                        160
CorpusRefinery  . rc    .   DryCooling              50000                  5500                         40
VictoriaTexas   . rc    .   DryCooling              11557                  1913                         99
CFBPowerplant   . rc    .   DryCooling              55143                  3089                        301
OWSommers       . rc    .   DryCooling              29060                  2121                        840
VHBraunig       . rc    .   DryCooling              17032                  1321                       1105
Ticona          . rc    .   DryCooling              14022                   492                         43
CorpusChristi   . rc    .   DryCooling              20032                   480                         39
*ValeroEast      . rc    .   DryCooling              50000                  3987                         38
ValeroWest      . rc    .   DryCooling              64890                  3440                         68
*FayettePowerProject. ri .   DryCooling              27502                  4485                       1690
HaysEnergy         .  ri .   DryCooling             15987                  1345                        989
*SimGideon           . ri .   DryCooling              9785                  1498                        623

;

Table boiler_cost(power_plant_all, pp_alli)                           the bioler cost of existing coal plants used for calculating retrofiting cost
*unit dollar per mw
                    boiler_fixed_om            capacity       heatrate

ColetoCreek           34791                     622.4            9.874
JTDeely               27950                     932.0           10.240
SanMiguel             44731                     410.0           16.430
JKSpruce              24667                    1444.0           13.650
*FayettePowerProject   22686                    1690.0            7.500
;

parameter  exist_variable_cost(power_plant_all, power_plant_cooling)    the variable cost of existing power plants and new ngcc
*Variable costs include the costs of reagents, chemicals, water, and other materials consumed during
*plant operation. Variable operating costs and consumables are directly proportional to the amount of
*kilowatts produced and are referred to as incremental costs.
*$/mwh
  /
NuecesBay             .   ri            203.66
NuecesBay             .   on            204.75
Victoria              .   rc            75.10
SamRayburn            .   ri            62.41
Barney                .   ri            302.33
Barney                .   oc            301.59
ColetoCreek           .   rc            6.15
JTDeely               .   rc            5.96
SanMiguel             .   ri            10.44
JKSpruce              .   rc            8.90
ArthurVon             .   rc            77.33
Formosa               .   rc            61.76
Gregory               .   rc            98.46
RioNogales            .   ri            60.04
GuadalupeGS           .   ri            52.30
CorpusChristiEC       .   rc            71.99
Ingleside             .   rc            61.40
LeonCreek             .   ri            61.85
Pearsall              .   ri            44.08
UnionCarbide          .   ri            109.13
CorpusRefinery        .   rc            80.73
VictoriaTexas         .   rc            123.09
CFBPowerplant         .   rc            148.98
OWSommers             .   rc            47.86
VHBraunig             .   rc            49.71
Ticona                .   rc            65.46
ValeroEast            .   rc            85.35
ValeroWest            .   rc            99.75
CorpusChristi         .   rc            68.01
*FayettePowerProject   .   ri            100.89
HaysEnergy            .   ri            67.98
*SimGideon             .   ri            67.23
NuecesBay             .   DryCooling    204.75
Victoria              .   DryCooling    76.61
SamRayburn            .   DryCooling    64.66
Barney                .   DryCooling    301.59
ColetoCreek           .   DryCooling    5.50
JTDeely               .   DryCooling    5.67
SanMiguel             .   DryCooling    8.85
JKSpruce              .   DryCooling    7.40
ArthurVon             .   DryCooling    78.36
Formosa               .   DryCooling    61.92
Gregory               .   DryCooling    99.38
RioNogales            .   DryCooling    61.23
GuadalupeGS           .   DryCooling    52.76
CorpusChristiEC       .   DryCooling    72.04
Ingleside             .   DryCooling    61.80
LeonCreek             .   DryCooling    62.13
Pearsall              .   DryCooling    44.83
UnionCarbide          .   DryCooling    112.81
CorpusRefinery        .   DryCooling    94.18
VictoriaTexas         .   DryCooling    126.43
CFBPowerplant         .   DryCooling    152.51
OWSommers             .   DryCooling    50.15
VHBraunig             .   DryCooling    50.82
Ticona                .   DryCooling    66.57
ValeroEast            .   DryCooling    88.68
ValeroWest            .   DryCooling    100.17
CorpusChristi         .   DryCooling    70.73
*FayettePowerProject   .   DryCooling    127.9
HaysEnergy            .   DryCooling    68.14
*SimGideon             .   DryCooling    57.23

newngcc1_calhoun  .  DryCooling          49.8
newngcc2_calhoun  .  DryCooling          49.8
newngcc3_calhoun  .  DryCooling          49.7
newngcc4_calhoun  .  DryCooling          49.7
newngcc5_calhoun  .  DryCooling          49.7
newngcc1_nueces   .  DryCooling          49.8
newngcc2_nueces   .  DryCooling          49.8
newngcc3_nueces   .  DryCooling          49.7
newngcc4_nueces   .  DryCooling          49.7
newngcc5_nueces   .  DryCooling          49.7
newngcc1_victoria .  DryCooling          49.8
newngcc2_victoria .  DryCooling          49.8
newngcc3_victoria .  DryCooling          49.7
newngcc4_victoria .  DryCooling          49.7
newngcc5_victoria .  DryCooling          49.7

newngcc6_calhoun   .  DryCooling          49.7
newngcc7_calhoun   .  DryCooling          49.7
newngcc6_nueces    .  DryCooling          49.7
newngcc7_nueces    .  DryCooling          49.7
newngcc6_victoria  .  DryCooling          49.7
newngcc7_victoria  .  DryCooling          49.7

newngcc8_calhoun   .  DryCooling          49.7
newngcc9_calhoun   .  DryCooling          49.7
newngcc8_nueces    .  DryCooling          49.7
newngcc9_nueces    .  DryCooling          49.7
newngcc8_victoria  .  DryCooling          49.7
newngcc9_victoria  .  DryCooling          49.7

newngcc10_calhoun   .  DryCooling          49.7
newngcc11_calhoun   .  DryCooling          49.7
newngcc10_nueces    .  DryCooling          49.7
newngcc11_nueces    .  DryCooling          49.7
newngcc10_victoria  .  DryCooling          49.7
newngcc11_victoria  .  DryCooling          49.7

newngcc12_calhoun   .  DryCooling          49.7
newngcc13_calhoun   .  DryCooling          49.7
newngcc12_nueces    .  DryCooling          49.7
newngcc13_nueces    .  DryCooling          49.7
newngcc12_victoria  .  DryCooling          49.7
newngcc13_victoria  .  DryCooling          49.7

newngcc14_calhoun   .  DryCooling          49.7
newngcc15_calhoun   .  DryCooling          49.7
newngcc14_nueces    .  DryCooling          49.7
newngcc15_nueces    .  DryCooling          49.7
newngcc14_victoria  .  DryCooling          49.7
newngcc15_victoria  .  DryCooling          49.7
/
;
