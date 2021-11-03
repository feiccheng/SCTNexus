parameter powerplantcap(county, power_plant_all, power_plant_type)    power plant capacity in mw in 2016

      /
Bexar          .    JTDeely         .  coal                        932.0
Bexar          .    JKSpruce        .  coal                        1444.0
Bexar          .    OWSommers       .  ngst                         892.0
Bexar          .    VHBraunig       .  ngst                        1138.0
Bexar          .    LeonCreek       .  nggt                         229.6
Bexar          .    ArthurVon       .  ngcc                         550.0
Bexar          .    CovelGardens    .  biomass                        9.6
Bexar          .    BlueWing        .  solar                         13.9
Bexar          .    SunECPS3        .  solar                         10.6
Bexar          .    SunECPS2        .  solar                         10.0
Bexar          .    SunECPS1        .  solar                         10.0
Bexar          .    CPS1            .  solar                          1.0
Bexar          .    NelsonGardens   .  biomass                        4.4
Bexar          .    AlamoSolar      .  solar                         41.7
Bexar          .    Alamo2          .  solar                          4.4
Bexar          .    Alamo3          .  solar                          5.5
Uvalde         .    Alamo5          .  solar                        100.0
Bexar          .    Tessman         .  biomass                        9.8
Atascosa       .    SanMiguel       .  coal                         410.0
Calhoun        .    Formosa         .  ngcc                         689.4
Calhoun        .    UnionCarbide    .  ngcc                         168.0
Calhoun        .    CFBPowerPlant   .  ngst                         310.0
Frio           .    Pearsall        .  ngst                         267.6
Goliad         .    ColetoCreek     .  coal                         622.4
Guadalupe      .    GuadalupeGS     .  ngcc                        1088.2
Guadalupe      .    RioNogales      .  ngcc                         940.2
Nueces         .    Barney          .  ngcc                        1082.2
Nueces         .    NuecesBay       .  ngcc                         730.2
Nueces         .    CorpusRefinery  .  nggt                          47.0
Nueces         .    CorpusChristiEC .  ngcc                         593.3
Nueces         .    HarborWind      .  wind                           9.0
SanPatricio    .    Gregory         .  ngcc                         432.0
SanPatricio    .    Ingleside       .  ngcc                         517.0
SanPatricio    .    ECRPapalote1    .  wind                         180.0
SanPatricio    .    ECRPapalote2    .  wind                         200.1
Victoria       .    VictoriaTexas   .  nggt                         102.4
Victoria       .    Victoria        .  ngcc                         376.9
Victoria       .    SamRayburn      .  ngcc                         215.2
Comal          .    Canyon          .  hydro                          6.0
Comal          .    MesquiteCreek   .  biomass                        3.2
Guadalupe      .    TP3             .  hydro                          2.8
Guadalupe      .    TP1             .  hydro                          3.6
Gonzales       .    H4              .  hydro                          2.4
Gonzales       .    H5              .  hydro                          2.4
Guadalupe      .    Nolte           .  hydro                          2.4
Guadalupe      .    TP4             .  hydro                          2.4
Kinney        .     Alamo4         .  solar                         39.6
Kinney        .     AnacachoWind   .  wind                          99.8
Webb          .     CedroHill      .  wind                         150.0
Webb          .     Whitetail      .  wind                          92.0
Webb          .     JavelinaWind   .  wind                         449.7
Nueces        .     Ticona          .  nggt                        44.2
*Nueces        .     ValeroEast      .  nggt                        40
Nueces        .     ValeroWest      . petroleum                      69.2
Nueces        .     CorpusChristi   .  nggt                        41

*add a few more plants
Maverick      .     EaglePass          .hydro                      9.6
Webb          .     TorrecillasWind    .wind                       300
Webb          .     MarsSolar          .solar                      10
Bexar         .     CommerceSolar      .solar                      5
Hays          .     HaysEnergy         .ngcc                       989
*Bastrop       .     SimGideon          .ngst                       623
*Fayette       .     FayettePowerProject .coal                      1690
Nueces        .     PatriotWind         .wind                      226.1
Nueces        .     ChapmanRanch        .wind                      236
SanPatricio   .     Karankawa           .wind                      200
SanPatricio   .     MidwayWind          .wind                      162.9

 /
;


parameter capacity_factor(power_plant_all)     capacity factor for existing power plants
* source: egrid

/
TP3                           0.56
AnacachoWind                  0.39
Barney                        0.13
BlueWing                      0.19
Canyon                        0.37
CedroHill                     0.37
CFBPowerPlant                 0.23
ColetoCreek                   0.57
CorpusChristiEC               0.46
CorpusRefinery                0.67
CovelGardens                  0.72
CPS1                          0.08
TP1                           0.55
ECRPapalote1                  0.30
ECRPapalote2                  0.29
Formosa                       0.60
GuadalupeGS                   0.55
H4                            0.57
H5                            0.10
Ingleside                     0.67
JKSpruce                      0.44
JTDeely                       0.30
JavelinaWind                  0.42
LeonCreek                     0.03
MesquiteCreek                 0.39
NelsonGardens                 0.47
Nolte                         0.47
NuecesBay                     0.22
OWSommers                     0.05
Alamo2                        0.11
Alamo3                        0.25
Alamo4                        0.23
Alamo5                        0.25
AlamoSolar                    0.10
Pearsall                      0.12
RioNogales                    0.38
SamRayburn                    0.04
SanMiguel                     0.66
SunECPS1                      0.22
SunECPS2                      0.22
SunECPS3                      0.23
Tessman                       0.68
TP4                           0.60
UnionCarbide                  0.35
VHBraunig                     0.20
VictoriaTexas                 0.65
Victoria                      0.19
ArthurVon                     0.50
Gregory                       0.50
HarborWind                    0.34
Whitetail                     0.34
Ticona                        0.52
*ValeroEast                    0.30
ValeroWest                    0.30
CorpusChristi                 0.16
EaglePass                     0.38
TorrecillasWind               0.43
MarsSolar                     0.25
CommerceSolar                 0.22
HaysEnergy                    0.46
*SimGideon                     0.07
*FayettePowerProject           0.59
PatriotWind                   0.27
ChapmanRanch                  0.33
Karankawa                     0.57
MidwayWind                    0.34
   /;

capacity_factor(power_plant_all) $(capacity_factor(power_plant_all) >1)=0.95;


set pp_location(county, power_plant_all)  county of power plants

option pp_location< powerplantcap;
