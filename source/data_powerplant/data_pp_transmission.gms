$ifthen not declared transloss
set transline         the name of transmission lines
/
HighLine1
HighLine2
HighLine3
MediumLine4
MediumLine5
MediumLine6
MediumLine7
MediumLine8
MediumLine9
LowLine10
LowLine11
LowLine12
LowLine13
LowLine14
LowLine15

/

Highline(transline)  high voltage transmission line can trans elec cross counties   345kv
/
HighLine1
HighLine2
HighLine3
/

Mediumline(transline)  medium voltage transmission line can trans elec cross counties  138kv
/
MediumLine4
MediumLine5
MediumLine6
MediumLine7
MediumLine8
MediumLine9
/
Lowline(transline)  the low voltage transmission line for local usage  69kv
/
LowLine10
LowLine11
LowLine12
LowLine13
LowLine14
LowLine15/;

alias (transline, transline1);

*source : https://web.ecs.baylor.edu/faculty/grady/_13_EE392J_2_Spring11_AEP_Transmission_Facts.pdf
parameter transmissionloss(transline)    the transmission loss rate per 100 miles;
transmissionloss(Highline(transline))   = 0.042;
transmissionloss(Mediumline(transline)) = 0.052;
transmissionloss(lowline(transline))    = 0.062;


Parameter distance_transline(transline,county,county)    the length of transmission line between counties in miles
 /
HighLine1          .        Bexar       .        Atascosa        30.7
HighLine1          .        Atascosa    .        Frio            48
HighLine1          .        Atascosa    .        Karnes          51.8
HighLine1          .        Frio        .        Uvalde          73.7
HighLine1          .        Bexar       .        Kendall         54
HighLine1          .        Comal       .        Kendall         6.8
HighLine1          .        Atascosa    .        Webb            146.41
HighLine1          .        Karnes      .        Goliad          85
HighLine1          .        Bexar       .        Guadalupe       26
HighLine1          .        Comal       .        Hays            12.59
HighLine1          .        Hays        .        Guadalupe       4.07
HighLine1          .        Guadalupe   .        Caldwell        36.8
HighLine1          .        Caldwell    .        Bastrop         20
*HighLine1          .        Bastrop     .        Travis          13.5
HighLine2          .        Atascosa    .        Frio            51
HighLine3          .        Victoria    .        Refugio         50.82
MediumLine4        .        Bexar       .        Wilson          8.4
MediumLine4        .        Bexar       .        Guadalupe       6.37
MediumLine4        .        Bexar       .        Comal           3.88
MediumLine4        .        Bexar       .        Kendall         18.07
MediumLine4        .        Bexar       .        Medina          11
MediumLine4        .        Kendall     .        Gillespie       32.64
MediumLine4        .        Kendall     .        Kerr            18.3
MediumLine4        .        Kendall     .        Bandera         13.64
MediumLine4        .        Kendall     .        Blanco          56.7
MediumLine4        .        Kendall     .        Comal           6.46
MediumLine4        .        Medina      .        Uvalde          25.28
MediumLine4        .        Uvalde      .        Kinney          18.9
MediumLine4        .        Uvalde      .        Zavala          32.8
MediumLine4        .        Zavala      .        Dimmit          57.12
MediumLine4        .        Kinney      .        Maverick        114.8
MediumLine4        .        Medina      .        Frio            22.4
MediumLine4        .        Comal       .        Hays            11.13
MediumLine4        .        Hays        .        Caldwell        5.22
*MediumLine4        .        Hays        .        Travis          6.78
MediumLine4        .        Blanco      .        Hays            15.76
MediumLine4        .        Guadalupe   .        Wilson          12.86
MediumLine4        .        Comal       .        Guadalupe       4.05
*MediumLine4        .        Travis      .        Bastrop         8.8
MediumLine4        .        Bastrop     .        Fayette         23.45
MediumLine5        .        Medina      .        Frio            9.57
MediumLine5        .        Frio        .        Atascosa        54.9
MediumLine5        .        Frio        .        LaSalle         19.42
MediumLine5        .        LaSalle     .        Webb            84.9
MediumLine5        .        Atascosa    .        Karnes          44.86
MediumLine6        .        Caldwell    .        Gonzales        16.08
MediumLine7        .        Gonzales    .        Karnes          40.29
MediumLine8        .        Victoria    .        Goliad          23.92
MediumLine9        .        Calhoun     .        Victoria        14.64
MediumLine9        .        SanPatricio .        Aransas         26.4
MediumLine9        .        SanPatricio .        Nueces          24.74
MediumLine9        .        Nueces      .        JimWells        25.73
MediumLine9        .        Duval       .        Webb            24.8
MediumLine9        .        Nueces      .        Refugio         60.52
LowLine10          .        Uvalde      .        Real            59.59
LowLine11          .        Victoria    .        DeWitt          22.6
*LowLine12          .        Caldwell    .        Travis          15.6
*LowLine13          .        Bastrop     .        Travis          8.1
LowLine14          .        Caldwell    .        Guadalupe       9.76
HighLine1          .        Atascosa    .        McMullen        25.27
HighLine1          .        Karnes      .        Bee             42.13
HighLine1          .        Karnes      .        LiveOak         40.83
LowLine10          .        Real        .        Edwards         43.25
LowLine15          .        Gonzales    .        Lavaca          26.93

   /;

set linklines(transline, transline,county)         the point that the transline links with the other
/
HighLine1      .  MediumLine4    .    Bexar
HighLine1      .  MediumLine4    .    Kendall
HighLine1      .  MediumLine4    .    Uvalde
HighLine1      .  MediumLine4    .    Frio
HighLine1      .  MediumLine4    .    Comal
HighLine1      .  MediumLine4    .    Hays
*HighLine1      .  MediumLine4    .    Travis
HighLine1      .  MediumLine4    .    Guadalupe
HighLine1      .  MediumLine4    .    Bastrop
HighLine1      .  MediumLine5    .    Frio
HighLine2      .  MediumLine5    .    Frio
HighLine2      .  MediumLine5    .    Atascosa
HighLine1      .  MediumLine5    .    Atascosa
MediumLine6    .    LowLine14    .    Caldwell
*LowLine17      .  MediumLine4    .    Caldwell
HighLine1      .  MediumLine7    .    Karnes
HighLine1      .  MediumLine8    .    Goliad
HighLine1      .  MediumLine9    .    SanPatricio
HighLine1      .  MediumLine9    .    Nueces
MediumLine4    .    LowLine10    .    Uvalde
MediumLine8    .    LowLine11    .    Victoria
MediumLine4    .    LowLine12    .    Caldwell
MediumLine4    .    LowLine13    .    Bastrop
MediumLine6    .    LowLine15    .    Gonzales

/;

set Link_pp_transline1(power_plant_all, county,transline)  how the power plants are linked to the grid
/
AnacachoWind                .    Kinney        .  MediumLine4
Alamo4                      .    Kinney        .  MediumLine4
 Alamo5                     .    Uvalde        .  HighLine1
EaglePass                   .    Maverick      .  MediumLine4
CedroHill                   .    Webb          .  MediumLine5
Whitetail                   .    Webb          .  HighLine1
JavelinaWind                .    Webb          .  MediumLine9
TorrecillasWind             .    Webb          .  MediumLine9
MarsSolar                   .    Webb          .  MediumLine9
Pearsall                    .    Frio          .  MediumLine5
SanMiguel                   .    Atascosa      .  MediumLine5
JKSpruce                    .    Bexar         .  MediumLine4
ArthurVon                   .    Bexar         .  MediumLine4
Tessman                     .    Bexar         .  MediumLine4
CovelGardens                .    Bexar         .  MediumLine4
BlueWing                    .    Bexar         .  MediumLine4
SunECPS3                    .    Bexar         .  MediumLine4
SunECPS2                    .    Bexar         .  MediumLine4
SunECPS1                    .    Bexar         .  MediumLine4
AlamoSolar                  .    Bexar         .  MediumLine4
Alamo2                      .    Bexar         .  MediumLine4
Alamo3                      .    Bexar         .  MediumLine4
NelsonGardens               .    Bexar         .  MediumLine4
CPS1                        .    Bexar         .  MediumLine4
*CommerceESS                 .    Bexar         .  MediumLine4
CommerceSolar               .    Bexar         .  MediumLine4
JTDeely                     .    Bexar         .  MediumLine4
VHBraunig                   .    Bexar         .  MediumLine4
OWSommers                   .    Bexar         .  MediumLine4
LeonCreek                   .    Bexar         .  MediumLine4
MesquiteCreek               .    Comal         .  MediumLine4
Canyon                      .    Comal         .  MediumLine4
TP3                         .    Guadalupe     .  MediumLine4
TP1                         .    Guadalupe     .  MediumLine4
Nolte                       .    Guadalupe     .  MediumLine4
TP4                         .    Guadalupe     .  MediumLine4
RioNogales                  .    Guadalupe     .  MediumLine4
GuadalupeGS                 .    Guadalupe     .  MediumLine4
HaysEnergy                  .    Hays          .  MediumLine4
*DeckerCreek                 .    Travis        .  MediumLine4
*Austin                      .    Travis        .  MediumLine4
*MarshallFord                .    Travis        .  MediumLine4
*SandHill                    .    Travis        .  MediumLine4
*RobertMueller               .    Travis        .  MediumLine4
*AustinGasRecovery           .    Travis        .  MediumLine4
*Webberville                 .    Travis        .  MediumLine4
*PowerFinKingsbery           .    Travis        .  MediumLine4
*KingsberryEnergyStorage    .    Travis        .  MediumLine4
*SystemControlCenter         .    Travis        .  MediumLine4
*SimGideon                   .    Bastrop       .  LowLine13
*FayettePowerProject         .    Fayette       .  HighLine1
H4                          .    Gonzales      .  MediumLine6
H5                          .    Gonzales      .  MediumLine6
*GonzalesHydro               .    Gonzales      .  MediumLine6
ColetoCreek                 .    Goliad        .  HighLine1
VictoriaTexas               .    Victoria      .  MediumLine8
*VictoriaCityPower           .    Victoria      .  MediumLine8
*VictoriaPortPower           .    Victoria      .  MediumLine8
Victoria                    .    Victoria      .  MediumLine9
SamRayburn                  .    Victoria      .  MediumLine9
HarborWind                  .    Nueces        .  MediumLine9
PatriotWind                 .    Nueces        .  MediumLine9
ChapmanRanch                .    Nueces        .  MediumLine9
NuecesBay                   .    Nueces        .  MediumLine9
Barney                      .    Nueces        .  MediumLine9
Ticona                      .    Nueces        .  MediumLine9
CorpusChristiEC             .    Nueces        .  MediumLine9
Gregory                     .    SanPatricio   .  MediumLine9
ECRPapalote1                 .    SanPatricio   .  MediumLine9
ECRPapalote2                .    SanPatricio   .  MediumLine9
Karankawa                   .    SanPatricio   .  MediumLine9
MidwayWind                  .    SanPatricio   .  MediumLine9
Ingleside                 .       SanPatricio    . MediumLine9
ValeroWest                .       Nueces         . MediumLine9
CorpusRefinery            .       Nueces         . MediumLine9
CorpusChristi             .       Nueces         . MediumLine9
CFBPowerPlant             .       Calhoun        . MediumLine9
Formosa                   .       Calhoun        . MediumLine9
UnionCarbide              .       Calhoun        . MediumLine9




newngcc1_calhoun            .    calhoun       .  MediumLine9
newngcc2_calhoun            .    calhoun       .  MediumLine9
newngcc3_calhoun            .    calhoun       .  MediumLine9
newngcc4_calhoun            .    calhoun       .  MediumLine9
newngcc5_calhoun            .    calhoun       .  MediumLine9
newngcc6_calhoun            .    calhoun       .  MediumLine9
newngcc7_calhoun            .    calhoun       .  MediumLine9
newngcc8_calhoun            .    calhoun       .  MediumLine9
newngcc9_calhoun            .    calhoun       .  MediumLine9
newngcc10_calhoun            .    calhoun       .  MediumLine9
newngcc11_calhoun            .    calhoun       .  MediumLine9
newngcc12_calhoun            .    calhoun       .  MediumLine9
newngcc13_calhoun            .    calhoun       .  MediumLine9
newngcc14_calhoun            .    calhoun       .  MediumLine9
newngcc15_calhoun            .    calhoun       .  MediumLine9

newngcc1_nueces             .    nueces        .  MediumLine9
newngcc2_nueces             .    nueces        .  MediumLine9
newngcc3_nueces             .    nueces        .  MediumLine9
newngcc4_nueces             .    nueces        .  MediumLine9
newngcc5_nueces             .    nueces        .  MediumLine9
newngcc6_nueces             .    nueces        .  MediumLine9
newngcc7_nueces             .    nueces        .  MediumLine9
newngcc8_nueces             .    nueces        .  MediumLine9
newngcc9_nueces             .    nueces        .  MediumLine9
newngcc10_nueces             .    nueces        .  MediumLine9
newngcc11_nueces             .    nueces        .  MediumLine9
newngcc12_nueces             .    nueces        .  MediumLine9
newngcc13_nueces             .    nueces        .  MediumLine9
newngcc14_nueces             .    nueces        .  MediumLine9
newngcc15_nueces             .    nueces        .  MediumLine9

newngcc1_victoria           .    victoria      .  MediumLine8
newngcc2_victoria           .    victoria      .  MediumLine8
newngcc3_victoria           .    victoria      .  MediumLine8
newngcc4_victoria           .    victoria      .  MediumLine8
newngcc5_victoria           .    victoria      .  MediumLine8
newngcc6_victoria           .    victoria      .  MediumLine8
newngcc7_victoria           .    victoria      .  MediumLine8
newngcc8_victoria           .    victoria      .  MediumLine8
newngcc9_victoria           .    victoria      .  MediumLine8
newngcc10_victoria           .    victoria      .  MediumLine8
newngcc11_victoria           .    victoria      .  MediumLine8
newngcc12_victoria           .    victoria      .  MediumLine8
newngcc13_victoria           .    victoria      .  MediumLine8
newngcc14_victoria           .    victoria      .  MediumLine8
newngcc15_victoria           .    victoria      .  MediumLine8

newngccdry1_calhoun         .    calhoun       .  MediumLine9
newngccdry2_calhoun         .    calhoun       .  MediumLine9
newngccdry3_calhoun         .    calhoun       .  MediumLine9
newngccdry4_calhoun         .    calhoun       .  MediumLine9
newngccdry5_calhoun         .    calhoun       .  MediumLine9
newngccdry6_calhoun         .    calhoun       .  MediumLine9
newngccdry7_calhoun         .    calhoun       .  MediumLine9
newngccdry8_calhoun         .    calhoun       .  MediumLine9
newngccdry9_calhoun         .    calhoun       .  MediumLine9
newngccdry10_calhoun         .    calhoun       .  MediumLine9
newngccdry11_calhoun         .    calhoun       .  MediumLine9

newngccdry1_nueces          .    nueces        .  MediumLine9
newngccdry2_nueces          .    nueces        .  MediumLine9
newngccdry3_nueces          .    nueces        .  MediumLine9
newngccdry4_nueces          .    nueces        .  MediumLine9
newngccdry5_nueces          .    nueces        .  MediumLine9
newngccdry6_nueces          .    nueces        .  MediumLine9
newngccdry7_nueces          .    nueces        .  MediumLine9
newngccdry8_nueces          .    nueces        .  MediumLine9
newngccdry9_nueces          .    nueces        .  MediumLine9
newngccdry10_nueces          .    nueces        .  MediumLine9
newngccdry11_nueces          .    nueces        .  MediumLine9

newngccdry1_victoria        .    victoria      .  MediumLine8
newngccdry2_victoria        .    victoria      .  MediumLine8
newngccdry3_victoria        .    victoria      .  MediumLine8
newngccdry4_victoria        .    victoria      .  MediumLine8
newngccdry5_victoria        .    victoria      .  MediumLine8
newngccdry6_victoria        .    victoria      .  MediumLine8
newngccdry7_victoria        .    victoria      .  MediumLine8
newngccdry8_victoria        .    victoria      .  MediumLine8
newngccdry9_victoria        .    victoria      .  MediumLine8
newngccdry10_victoria        .    victoria      .  MediumLine8
newngccdry11_victoria        .    victoria      .  MediumLine8

/  ;
* need to link the solar and wind power plants

set missingpp(power_plant_all)                check the power plant not linking to the lines;

missingpp(power_plant_all)$sum(( power_plant_type, power_plant_cooling), pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling, 'capacity'))=yes;

missingpp(power_plant_all)$sum((county,transline),Link_pp_transline1(power_plant_all, county,transline))=no;

display missingpp;

* temperaly make a simple one
set link_trans_county(county,county)         link the potential transmission between counties from to;
parameter transloss(county,county)          the transmission loss between counties
          transloss1(county,county)
          transloss2(county,county)
             ;
set county_notingrid(county)    ;
$endif

link_trans_county(county, county1)=no;

link_trans_county(county, county1)
         $(sum(Lowline(transline),distance_transline(transline,county,county1)) and sum(linklines(transline1,Lowline(transline),county), 1))= yes;
link_trans_county(county1, county)
         $(sum(Lowline(transline),distance_transline(transline,county1,county)) and sum(linklines(transline1,Lowline(transline),county1), 1))= yes;
link_trans_county(county, county1)
         $(sum(transline$(not Lowline(transline)),distance_transline(transline,county,county1)) and (not link_trans_county(county, county1))) = yes;
display link_trans_county;
link_trans_county(county, county1)
         $(sum(transline$(not Lowline(transline)),distance_transline(transline,county1,county)) and (not link_trans_county(county, county1))) = yes;
display link_trans_county;

set notasstart(county)  the county that not used as supply of electricity
  /
   JIMWELLS,  BLANCO
/;

link_trans_county(notasstart(county), county1)=no;
link_trans_county(county, county)$population(county)= yes;



transloss1(county,county1)
         =smin(transline$(distance_transline(transline,county,county1)*transmissionloss(transline)),
                 distance_transline(transline,county,county1)*transmissionloss(transline))/100;
transloss2(county,county1)
         =smin(transline$(distance_transline(transline,county1,county)*transmissionloss(transline)),
                 distance_transline(transline,county1,county)*transmissionloss(transline))/100;

display transloss1, transloss2;
transloss(county,county1)$(transloss1(county,county1) and  (transloss2(county,county1)=0)) =transloss1(county,county1);
display transloss;
transloss(county,county1)$(transloss2(county,county1) and  (transloss1(county,county1)=0)) =transloss2(county,county1);
display transloss;
transloss(county,county1)$(transloss2(county,county1) and transloss1(county,county1))
         =min(transloss1(county,county1), transloss2(county,county1));
display transloss;
transloss(county,county)$population(county)=0.001;

transloss(county,county1)$(not link_trans_county(county, county1))= 0;

display link_trans_county, transloss ;



county_notingrid(county)$(sum(link_trans_county(county1, county),1) le 1)= yes;

county_notingrid(county)$(population(county)=0) = no;

display county_notingrid;














































































































































































































