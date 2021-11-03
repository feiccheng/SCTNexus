$ontext
From Ding's Model
*  CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
    EPIC simulations of crop yield and water use were conducted for selected crops, vegetables, and sorghum-hay for the Edwards
aquifer area. The selected crops and vegetables were corn, cotton, sorghum, oats, winter-wheat, peanut, cabbage, lettuce, spinach,
carrot, cucumber, cantaloupe, and onion.

   Seventeen actual weather year data for Uvalde County were used for EPIC simulations.These years were 1956, 1951, 1963, 1962, 1988,
1980, 1982, 1969,1974, 1972, 1976, 1977, 1979, 1981, 1958, 1987, and 1996. These years account for the most dry, most wet, and
average (normal)years.


   For crops, irrigation strategies were used for alternative soil moisture scenarios (50% and 75% soil moisture), alternative
irrigation ending dates (e.g. Apr 30, May 30, June 30 etc.) and alternative irrigation methods (furrow and sprinkler). An
irrigation strategy of C50-May-F thus implies a simulation for corn when soil moisture reaches 50%, irrigation application ends
on May 30 and when furrow irrigation is used. Similarly, C75-May-S implies a simulation for corn with 75% soil moisture,
irrigation ending date of May 30 and sprinkler irrigation.  For cotton, the irrigation ending dates were based on early bloom (EB),
first bloom (FB), and first open boll (FO) which correspond to irrigation ending dates of May 31, June 30, and July 31,
respectively. Simulations for dryland scenario were also conducted for all crops.

  For vegetables, simulations were conducted for alternative soil moistures and irrigation methods (furrow and sprinkler).
Alternative irrigation ending dates were not used for vegetables since vegetables require continuous irrigation.

  Simulations for hay were based on fraction of growing season (a procedure used in EPIC) where hay was harvested several times
throughout the year.

  4" and 1.5" of water per application were used for furrow and sprinkler irrigation, respectively. Irrigation efficiency was
assumed to be 70% and 95% for furrow and sprinkler irrigation, respectively, implying that for furrow irrigation, 30% of the
water was lost through runoff, evaporation, and/or percolation whereas only 5% was lost under sprinkler irrigation.


$offtext

set  allstrat                 ALL irrigation strategies (EPIC and Pena)
         /

           C50-May-F,   C50-Jun-F,   C75-May-F,   C75-Jun-F,
           C50-May-S,   C50-Jun-S,   C75-May-S,   C75-Jun-S,
           C-Dryland,
           S50-May-F,   S50-Jun-F,   S75-May-F,   S75-Jun-F,
           S50-May-S,   S50-Jun-S,   S75-May-S,   S75-Jun-S,
           S-Dryland,
*           O50-Mar-F,   O50-Apr-F,   O75-Mar-F,   O75-Apr-F,
*           O50-Mar-S,   O50-Apr-S,   O75-Mar-S,   O75-Apr-S,
           O-Dryland,
           W50-Mar-F,   W50-Apr-F,   W75-Mar-F,   W75-Apr-F,
           W50-Mar-S,   W50-Apr-S,   W75-Mar-S,   W75-Apr-S,
           W-Dryland,
           Pnut50-F,     Pnut75-F, P50-May-F,    P75-May-F,
           Pnut50-S,     Pnut75-S, P50-May-S,    P75-May-S,
           Pnut-dryland,
           broc50-F,     broc75-F, broc50-S,     broc75-S,
           rice50-S,     rice50-F, rice75-S,     rice75-F,

           Oni50-F,    Oni75-F,
           Oni50-S,    Oni75-S,
           Cabb50-F,  Cabb75-F,
           Cabb50-S,   Cabb75-S,
           Carr50-F,  Carr75-F,
           Carr50-S,   Carr75-S,
           Cant50-F,  Cant75-F,
           Cant50-S,   Cant75-S,
           Cuc50-F,   Cuc75-F,
           Cuc50-S,    Cuc75-S,
           Let50-F,   Let75-F,
           Let50-S,    Let75-S,
           Spin50-F,  Spin75-F,
           Spin50-S,   Spin75-S,
           Hay50-F,   Hay75-F,
           Hay50-S,    Hay75-S,
           Hay-dryland,
           H50-May-F, H75-May-F,
           H50-May-S,  H75-May-S,
           Cot50-EB-F, Cot50-FB-F, Cot50-FO-F,
           Cot75-EB-F, Cot75-FB-F, Cot75-FO-F,
           Cot50-EB-S, Cot50-FB-S, Cot50-FO-S,
           Cot75-EB-S, Cot75-FB-S, Cot75-FO-S,
           Cot-dryland,
           oth-dryland   dryland strategies ,
           full-f       full irrigation using furrow
           full-S     full irrigation using sprinkler
           p1         limited in apr may june
           p2         limited in july aug sep
           p12        limited in phases 1 and 2
           a1         to dryland land after april
           a1-s       to dryland land after april
           a2         to dryland land after july
            75-S, 50-S, 25-S  ,75-f, 50-f, 25-f, noirrig
         /
    baseline(allstrat)/C75-Jun-S,S75-Jun-S,  W75-Apr-S, Cot75-FO-S, Oni75-S
                       Cabb75-S, Cant75-S , Cuc75-S , Spin75-S ,  Hay75-S, rice75-S, Pnut75-S /   ;
set  Marstrat(allstrat) /      W50-Mar-F,    W75-Mar-F,
                               W50-Mar-S,    W75-Mar-S /
     Aprstrat(allstrat)  /     W50-Apr-F,     W75-Apr-F,
                               W50-Apr-S,     W75-Apr-S/
     maystrat(allstrat)  / C50-May-F,   C75-May-F,  C50-May-S,     C75-May-S
                         S50-May-F,    S75-May-F,  S50-May-S,     S75-May-S,
                         Cot50-EB-F,   Cot75-EB-F,  Cot50-EB-S,   Cot75-EB-S/
    Junstrat(allstrat) /     C50-Jun-F,     C75-Jun-F,  C50-Jun-S,     C75-Jun-S,
                             S50-Jun-F,     S75-Jun-F,  S50-Jun-S,     S75-Jun-S,
                             Cot50-FB-F,   Cot75-FB-F,  Cot50-FB-S,    Cot75-FB-S/
    Julstrat(allstrat) / Cot50-FO-F, Cot75-FO-F, Cot50-FO-S, Cot75-FO-S /;

set    mapcropstrat(crops, allstrat )         mapping EPIC water strategies to crops
         /

   corn.(  C50-May-F,   C50-Jun-F,   C75-May-F,   C75-Jun-F,
           C50-May-S,   C50-Jun-S,   C75-May-S,   C75-Jun-S,
           C-Dryland ),
   sorghum.(S50-May-F,   S50-Jun-F,   S75-May-F,   S75-Jun-F,
           S50-May-S,   S50-Jun-S,   S75-May-S,   S75-Jun-S,
           S-Dryland ),
*           O50-Mar-F,   O50-Apr-F,   O75-Mar-F,   O75-Apr-F,
*           O50-Mar-S,   O50-Apr-S,   O75-Mar-S,   O75-Apr-S,
   oats.   O-Dryland,
   wheat.( W50-Mar-F,   W50-Apr-F,   W75-Mar-F,   W75-Apr-F,
           W50-Mar-S,   W50-Apr-S,   W75-Mar-S,   W75-Apr-S,
           W-Dryland),
   Peanut.(Pnut50-F,     Pnut75-F
*, P50-May-F,    P75-May-F,
           Pnut50-S,     Pnut75-S
*, P50-May-S,    P75-May-S,
           Pnut-dryland ),
*           broc50-F,     broc75-F, broc50-S,     broc75-S,
   ricefirst.(        rice50-S,     rice50-F, rice75-S,     rice75-F)
   ricesecond.(        rice50-S,     rice50-F, rice75-S,     rice75-F)
   Onion. (Oni50-F,    Oni75-F,
           Oni50-S,    Oni75-S ),
   Cabbage.(Cabb50-F,  Cabb75-F,
           Cabb50-S,   Cabb75-S),
*           Carr50-F,  Carr75-F,
*           Carr50-S,   Carr75-S,
cantaloupe. ( Cant50-F,  Cant75-F,
           Cant50-S,   Cant75-S ),
cucumber.( Cuc50-F,   Cuc75-F,
           Cuc50-S,    Cuc75-S) ,
*           Let50-F,   Let75-F,
*           Let50-S,    Let75-S,
 SPINACH.( Spin50-F,  Spin75-F,
           Spin50-S,   Spin75-S),
 (sorghumhay,hay, pasture).(Hay50-F,   Hay75-F,
           Hay50-S,    Hay75-S,
           Hay-dryland),
*           H50-May-F, H75-May-F,
*           H50-May-S,  H75-May-S,
  cotton.(  Cot50-EB-F, Cot50-FB-F, Cot50-FO-F,
           Cot75-EB-F, Cot75-FB-F, Cot75-FO-F,
           Cot50-EB-S, Cot50-FB-S, Cot50-FO-S,
           Cot75-EB-S, Cot75-FB-S, Cot75-FO-S,
           Cot-dryland)     ,
 (soybeans, sesame, honeydew, watermelon, barley). (full-s, full-f, oth-dryland)/

majorcrops(crops)/ corn, sorghum ,  wheat, peanut, ricefirst, ricesecond, onion, cabbage, cantaloupe, cucumber, spinach, cotton/


    PenaStrat(allstrat)   Irrigation strategies from Pena
             / full-F    full irrigation
               full-S  full irrigation using sprinkler
               p1      limited in apr may june
               p2      limited in july aug sep
               p12     limited in phases 1 and 2
               a1-s    to dry land after april
               a1      to dry land after april
               a2      to dry land after july
             /

   waterstat(allstrat)   Irrigation strategies from Pena
   spkstat(allstrat)     Sprinkler strategies for Pena crops
   fstat(allstrat)       Furrow strategies for Pena crops
   strategy(allstrat)    Irrigation strategies from EPIC ;

   waterstat(PenaStrat) = yes;
   spkstat("full-S") = yes ;
   spkstat("a1-S") = yes ;
   fstat(PenaStrat) = yes ;
   fstat(spkstat) = no ;
   strategy(allstrat) = yes ;
   strategy(waterstat) = no ;
;

sets   drystrat(allstrat)  EPIC Dryland Strategies
       / C-Dryland, Cot-Dryland, S-Dryland, O-Dryland,
         W-Dryland, Pnut-dryland, Hay-Dryland , oth-dryland/

       wetstrat(allstrat)  EPIC Irrigation Strategies
       spkstrat(allstrat)  EPIC Sprinkler Strategies
       fstrat(allstrat)    EPIC Furrow Strategies
       /
*corn
         C50-May-F,   C50-Jun-F,   C75-May-F,   C75-Jun-F,
*sorghum
         S50-May-F,   S50-Jun-F,   S75-May-F,   S75-Jun-F,
*         O50-Mar-F,   O50-Apr-F,   O75-Mar-F,   O75-Apr-F,
*wheat
         W50-Mar-F,   W50-Apr-F,   W75-Mar-F,   W75-Apr-F,
         Pnut50-F,     Pnut75-F,   P50-May-F,   P75-May-F,
         Oni50-F,   Oni75-F,
         Cabb50-F,  Cabb75-F,
*         Carr50-F,  Carr75-F,
         Cant50-F,  Cant75-F,
         Cuc50-F,   Cuc75-F,
*         Let50-F,   Let75-F,
         Spin50-F,  Spin75-F,
         Hay50-F,   Hay75-F,
*         H50-May-F, H75-May-F,
*cotton
         Cot50-EB-F, Cot50-FB-F, Cot50-FO-F,
         Cot75-EB-F, Cot75-FB-F, Cot75-FO-F
         full-F/
           ;
set      epicitem(alli)   Items produced by EPIC (yield & water) ;
      epicitem(watr) = yes ;
      epicitem("yield") = yes ;
      wetstrat(strategy) = yes ;

*   This says whether dryland is an irrigation strategy
      wetstrat(drystrat)$(not sameas(drystrat,"full-s")) = no ;
       wetstrat("full-s") = yes ;
        wetstrat("full-f") = yes ;

      spkstrat(wetstrat) = yes ;
      spkstrat(fstrat) = no ;
      fstat(fstrat)=yes;

set       Crop2(Crops)       Crops used in EPIC Crop simulator
        /corn,sorghum,wheat,cabbage,cantaloupe,cucumber,
         onion,PEANUT,SPINACH ,SORGHUMHAY,Cotton,rice,oats /
          Crop1(crops)      Crops not used in EPIC Crop simulator ;
          Crop1(Crops)      = yes ;
          Crop1(Crop2)     = no ;
          Crop1("sesame")  = no ;
          Crop1("wheat")   = no ;


*  CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
*   EPIC YIELD and WATER USE output by IRRIATION STRATEGY
*  CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC

table  corn(alli, years, allstrat)


                    C50-May-F      C50-Jun-F      C75-May-F      C75-Jun-F      C50-May-S      C50-Jun-S      C75-May-S      C75-Jun-S    C-Dryland
Yield.1956              93             100            114            128            98            113            105            132            50
Jan-Water.1956          4              4              4              4              3              3              3              3
Feb-Water.1956
Mar-Water.1956
Apr-Water.1956          12             12             16             16             7.5            7.5            9              9
May-Water.1956          12             12             16             16             7.5            7.5            9              9
Jun-Water.1956                         12                            16                            7.5                           9
Jul-Water.1956
Aug-Water.1956
Sep-Water.1956
Oct-Water.1956
Nov-Water.1956
Dec-Water.1956

Yield.1951              117            138            128            156            122            143            133            162            61
Jan-Water.1951          4              4              4              4              3              3              3              3
Feb-Water.1951
Mar-Water.1951
Apr-Water.1951          12             12             16             16             7.5            7.5            9              9
May-Water.1951          8              8              12             12             6              6              7.5            7.5
Jun-Water.1951                         12                            16                            7.5                           9
Jul-Water.1951
Aug-Water.1951
Sep-Water.1951
Oct-Water.1951
Nov-Water.1951
Dec-Water.1951

Yield.1963              123            142            135            162            128            149            140            168            67
Jan-Water.1963          4              4              4              4              3              3              3              3
Feb-Water.1963
Mar-Water.1963
Apr-Water.1963          12             12             16             16             7.5            7.5            9              9
May-Water.1963          8              8              12             12             6              6              7.5            7.5
Jun-Water.1963                         12                            16                            7.5                           9
Jul-Water.1963
Aug-Water.1963
Sep-Water.1963
Oct-Water.1963
Nov-Water.1963
Dec-Water.1963

Yield.1989              95             111            101            130            100            116            109            133            54
Jan-Water.1989          4              4              4              4              3              3              3              3
Feb-Water.1989
Mar-Water.1989
Apr-Water.1989          12             12             16             16             7.5            7.5            9              9
May-Water.1989          8              8              12             12             6              6              7.5            7.5
Jun-Water.1989                         12                            16                            7.5                           9
Jul-Water.1989
Aug-Water.1989
Sep-Water.1989
Oct-Water.1989
Nov-Water.1989
Dec-Water.1989

Yield.1952              114            133            125            155            119            140            130            158            59
Jan-Water.1952          4              4              4              4              3              3              3              3
Feb-Water.1952
Mar-Water.1952
Apr-Water.1952          12             12             16             16             7.5            7.5            9              9
May-Water.1952          8              8              12             12             6              6              7.5            7.5
Jun-Water.1952                         12                            16                            7.5                           9
Jul-Water.1952
Aug-Water.1952
Sep-Water.1952
Oct-Water.1952
Nov-Water.1952
Dec-Water.1952

Yield.1996              97             115            105            133            105            119            114            137            58
Jan-Water.1996          4              4              4              4              3              3              3              3
Feb-Water.1996
Mar-Water.1996
Apr-Water.1996          12             12             16             16             7.5            7.5            9              9
May-Water.1996          8              8              12             12             6              6              7.5            7.5
Jun-Water.1996                         12                            16                            7.5                           9
Jul-Water.1996
Aug-Water.1996
Sep-Water.1996
Oct-Water.1996
Nov-Water.1996
Dec-Water.1996

Yield.1980              119            139            130            158            124            145            135            164            64
Jan-Water.1980          4              4              4              4              3              3              3              3
Feb-Water.1980
Mar-Water.1980
Apr-Water.1980          12             12             16             16             7.5            7.5            9              9
May-Water.1980          8              8              12             12             6              6              7.5            7.5
Jun-Water.1980                         12                            16                            7.5                           9
Jul-Water.1980
Aug-Water.1980
Sep-Water.1980
Oct-Water.1980
Nov-Water.1980
Dec-Water.1980

Yield.1982              117            138            128            156            122            143            133            162            61
Jan-Water.1982          4              4              4              4              3              3              3              3
Feb-Water.1982
Mar-Water.1982
Apr-Water.1982          12             12             16             16             7.5            7.5            9              9
May-Water.1982          8              8              12             12             6              6              7.5            7.5
Jun-Water.1982                         12                            16                            7.5                           9
Jul-Water.1982
Aug-Water.1982
Sep-Water.1982
Oct-Water.1982
Nov-Water.1982
Dec-Water.1982

Yield.1969              121            140            132            160            126            147            137            166            65
Jan-Water.1969          4              4              4              4              3              3              3              3
Feb-Water.1969
Mar-Water.1969
Apr-Water.1969          12             12             16             16             7.5            7.5            9              9
May-Water.1969          8              8              12             12             6              6              7.5            7.5
Jun-Water.1969                         12                            16                            7.5                           9
Jul-Water.1969
Aug-Water.1969
Sep-Water.1969
Oct-Water.1969
Nov-Water.1969
Dec-Water.1969

Yield.1974              96             113            104            132            103            118            112            135            56
Jan-Water.1974          4              4              4              4              3              3              3              3
Feb-Water.1974
Mar-Water.1974
Apr-Water.1974          12             12             16             16             7.5            7.5            9              9
May-Water.1974          8              8              12             12             6              6              7.5            7.5
Jun-Water.1974                         12                            16                            7.5                           9
Jul-Water.1974
Aug-Water.1974
Sep-Water.1974
Oct-Water.1974
Nov-Water.1974
Dec-Water.1974

Yield.1972              95             112            102            130            101            116            110            134            55
Jan-Water.1972          4              4              4              4              3              3              3              3
Feb-Water.1972
Mar-Water.1972
Apr-Water.1972          12             12             16             16             7.5            7.5            9              9
May-Water.1972          8              8              12             12             6              6              7.5            7.5
Jun-Water.1972                         12                            16                            7.5                           9
Jul-Water.1972
Aug-Water.1972
Sep-Water.1972
Oct-Water.1972
Nov-Water.1972
Dec-Water.1972

Yield.1976              127            146            139            166            133            154            142            173            70
Jan-Water.1976          4              4              4              4              3              3              3              3
Feb-Water.1976
Mar-Water.1976
Apr-Water.1976          8              8              12             12             6              6              7.5            7.5
May-Water.1976          8              8              12             12             6              6              7.5            7.5
Jun-Water.1976                         12                            16                            7.5                           9
Jul-Water.1976
Aug-Water.1976
Sep-Water.1976
Oct-Water.1976
Nov-Water.1976
Dec-Water.1976

Yield.1977              115            135            126            155            120            141            132            160            60
Jan-Water.1977          4              4              4              4              3              3              3              3
Feb-Water.1977
Mar-Water.1977
Apr-Water.1977          12             12             16             16             7.5            7.5            9              9
May-Water.1977          8              8              12             12             6              6              7.5            7.5
Jun-Water.1977                         12                            16                            7.5                           9
Jul-Water.1977
Aug-Water.1977
Sep-Water.1977
Oct-Water.1977
Nov-Water.1977
Dec-Water.1977

Yield.1979              134            153            145            172            140            158            149            176            76
Jan-Water.1979          4              4              4              4              3              3              3              3
Feb-Water.1979
Mar-Water.1979
Apr-Water.1979          4              4              8              8              3              3              4.5            4.5
May-Water.1979          4              4              8              8              3              3              4.5            4.5
Jun-Water.1979                         4                             8                             3                             4.5
Jul-Water.1979
Aug-Water.1979
Sep-Water.1979
Oct-Water.1979
Nov-Water.1979
Dec-Water.1979

Yield.1981              129            148            141            168            135            156            144            175            72
Jan-Water.1981          4              4              4              4              3              3              3              3
Feb-Water.1981
Mar-Water.1981
Apr-Water.1981          8              8              12             12             6              6              7.5            7.5
May-Water.1981          8              8              12             12             6              6              7.5            7.5
Jun-Water.1981                         12                            16                            7.5                           9
Jul-Water.1981
Aug-Water.1981
Sep-Water.1981
Oct-Water.1981
Nov-Water.1981
Dec-Water.1981

Yield.1958              126            145            138            165            132            152            140            172            69
Jan-Water.1958          4              4              4              4              3              3              3              3
Feb-Water.1958
Mar-Water.1958
Apr-Water.1958          8              8              12             12             6              6              7.5            7.5
May-Water.1958          8              8              12             12             6              6              7.5            7.5
Jun-Water.1958                         12                            16                            7.5                           9
Jul-Water.1958
Aug-Water.1958
Sep-Water.1958
Oct-Water.1958
Nov-Water.1958
Dec-Water.1958

Yield.1987              136            155            147            174            142            160            151            178            78
Jan-Water.1987          4              4              4              4              3              3              3              3
Feb-Water.1987
Mar-Water.1987
Apr-Water.1987          4              4              8              8              3              3              4.5            4.5
May-Water.1987          4              4              8              8              3              3              4.5            4.5
Jun-Water.1987                         4                             8                             3                             4.5
Jul-Water.1987
Aug-Water.1987
Sep-Water.1987
Oct-Water.1987
Nov-Water.1987
Dec-Water.1987
;

table cotton(alli,years,allstrat)
                 Cot50-EB-F  Cot50-FB-F  Cot50-FO-F   Cot75-EB-F  Cot75-FB-F  Cot75-FO-F   Cot50-EB-S  Cot50-FB-S  Cot50-FO-S   Cot75-EB-S  Cot75-FB-S  Cot75-FO-S    Cot-Dryland
Yield.1956           502        541          579          536         603         662          511         547         587          543         609          668        303
Jan-Water.1956
Feb-Water.1956
Mar-Water.1956
Apr-Water.1956       8          8            8            12          12          12           4.5         4.5         4.5          6           6            6
May-Water.1956       8          8            8            12          12          12           4.5         4.5         4.5          7.5         7.5          7.5
Jun-Water.1956                  8            8                        12          12                       4.5         4.5                      7.5          7.5
Jul-Water.1956                               8                                    12                                   4.5                                   7.5
Aug-Water.1956
Sep-Water.1956
Oct-Water.1956
Nov-Water.1956
Dec-Water.1956

Yield.1951           552        593          629          587         656         714          562         600         636          593         661          718        341
Jan-Water.1951
Feb-Water.1951
Mar-Water.1951
Apr-Water.1951       4          4            4            8           8           8            3           3           3            4.5         4.5          4.5
May-Water.1951       8          8            8            12          12          12           4.5         4.5         4.5          7.5         7.5          7.5
Jun-Water.1951                  8            8                        12          12                       4.5         4.5                      7.5          7.5
Jul-Water.1951                               8                                    12                                   4.5                                   7.5
Aug-Water.1951
Sep-Water.1951
Oct-Water.1951
Nov-Water.1951
Dec-Water.1951

Yield.1963           561        604          639          596         665         720          571         610         647          602         672          727        352
Jan-Water.1963
Feb-Water.1963
Mar-Water.1963
Apr-Water.1963       4          4            4            8           8           8            3           3           3            4.5         4.5          4.5
May-Water.1963       8          8            8            12          12          12           4.5         4.5         4.5          7.5         7.5          7.5
Jun-Water.1963                  8            8                        12          12                       4.5         4.5                      7.5          7.5
Jul-Water.1963                               8                                    12                                   4.5                                   7.5
Aug-Water.1963
Sep-Water.1963
Oct-Water.1963
Nov-Water.1963
Dec-Water.1963

Yield.1989           541        579          618          575         643         699          549         586         624          579         648          707        323
Jan-Water.1989
Feb-Water.1989
Mar-Water.1989
Apr-Water.1989       8          8            8            12          12          12           4.5         4.5         4.5          6           6            6
May-Water.1989       8          8            8            12          12          12           4.5         4.5         4.5          7.5         7.5          7.5
Jun-Water.1989                  8            8                        12          12                       4.5         4.5                      7.5          7.5
Jul-Water.1989                               8                                    12                                   4.5                                   7.5
Aug-Water.1989
Sep-Water.1989
Oct-Water.1989
Nov-Water.1989
Dec-Water.1989

Yield.1952           553        593          629          587         656         714          562         599         636          593         662          718        341
Jan-Water.1952
Feb-Water.1952
Mar-Water.1952
Apr-Water.1952       4          4            4            8           8           8            3           3           3            4.5         4.5          4.5
May-Water.1952       8          8            8            12          12          12           4.5         4.5         4.5          7.5         7.5          7.5
Jun-Water.1952                  8            8                        12          12                       4.5         4.5                      7.5          7.5
Jul-Water.1952                               8                                    12                                   4.5                                   7.5
Aug-Water.1952
Sep-Water.1952
Oct-Water.1952
Nov-Water.1952
Dec-Water.1952

Yield.1996           555        597          633          589         660         714          564         603         641          596         666          721        349
Jan-Water.1996
Feb-Water.1996
Mar-Water.1996
Apr-Water.1996       4          4            4            8           8           8            3           3           3            4.5         4.5          4.5
May-Water.1996       8          8            8            12          12          12           4.5         4.5         4.5          7.5         7.5          7.5
Jun-Water.1996                  8            8                        12          12                       4.5         4.5                      7.5          7.5
Jul-Water.1996                               8                                    12                                   4.5                                   7.5
Aug-Water.1996
Sep-Water.1996
Oct-Water.1996
Nov-Water.1996
Dec-Water.1996

Yield.1980           554        595          631          588         658         715          563         601         638          595         663          719        344
Jan-Water.1980
Feb-Water.1980
Mar-Water.1980
Apr-Water.1980       4          4            4            8           8           8            3           3           3            4.5         4.5          4.5
May-Water.1980       8          8            8            12          12          12           4.5         4.5         4.5          7.5         7.5          7.5
Jun-Water.1980                  8            8                        12          12                       4.5         4.5                      7.5          7.5
Jul-Water.1980                               8                                    12                                   4.5                                   7.5
Aug-Water.1980
Sep-Water.1980
Oct-Water.1980
Nov-Water.1980
Dec-Water.1980

Yield.1982           582        624          661          617         684         742          591         631         669          623         694          747        370
Jan-Water.1982
Feb-Water.1982
Mar-Water.1982
Apr-Water.1982       4          4            4            8           8           8            3           3           3            4.5         4.5          4.5
May-Water.1982       8          8            8            12          12          12           4.5         4.5         4.5          7.5         7.5          7.5
Jun-Water.1982                  8            8                        12          12                       4.5         4.5                      7.5          7.5
Jul-Water.1982                               8                                    12                                   4.5                                   7.5
Aug-Water.1982
Sep-Water.1982
Oct-Water.1982
Nov-Water.1982
Dec-Water.1982

Yield.1969           562        605          640          597         665         722          572         711         648          603         673          728        355
Jan-Water.1969
Feb-Water.1969
Mar-Water.1969
Apr-Water.1969       4          4            4            8           8           8            3           3           3            4.5         4.5          4.5
May-Water.1969       8          8            8            12          12          12           4.5         4.5         4.5          7.5         7.5          7.5
Jun-Water.1969                  8            8                        12          12                       4.5         4.5                      7.5          7.5
Jul-Water.1969                               8                                    12                                   4.5                                   7.5
Aug-Water.1969
Sep-Water.1969
Oct-Water.1969
Nov-Water.1969
Dec-Water.1969

Yield.1974           544        583          622          579         647         704          553         590         628          584         652          709        329
Jan-Water.1974
Feb-Water.1974
Mar-Water.1974
Apr-Water.1974       8          8            8            12          12          12           4.5         4.5         4.5          6           6            6
May-Water.1974       8          8            8            12          12          12           4.5         4.5         4.5          7.5         7.5          7.5
Jun-Water.1974                  8            8                        12          12                       4.5         4.5                      7.5          7.5
Jul-Water.1974                               8                                    12                                   4.5                                   7.5
Aug-Water.1974
Sep-Water.1974
Oct-Water.1974
Nov-Water.1974
Dec-Water.1974

Yield.1972           542        581          620          578         646         702          551         589         627          583         650          708        327
Jan-Water.1972
Feb-Water.1972
Mar-Water.1972
Apr-Water.1972       8          8            8            12          12          12           4.5         4.5         4.5          6           6            6
May-Water.1972       8          8            8            12          12          12           4.5         4.5         4.5          7.5         7.5          7.5
Jun-Water.1972                  8            8                        12          12                       4.5         4.5                      7.5          7.5
Jul-Water.1972                               8                                    12                                   4.5                                   7.5
Aug-Water.1972
Sep-Water.1972
Oct-Water.1972
Nov-Water.1972
Dec-Water.1972

Yield.1976           710        754          790          750         816         870          720         761         798          750         820          875        452
Jan-Water.1976
Feb-Water.1976
Mar-Water.1976
Apr-Water.1976       0          0            0            0           0           0            0           0           0            0           0            0
May-Water.1976       4          4            4            8           8           8            3           3           3            4.5         4.5          4.5
Jun-Water.1976                  4            4                        8           8                        3           3                        4.5          4.5
Jul-Water.1976                               4                                    8                                    3                                     4.5
Aug-Water.1976
Sep-Water.1976
Oct-Water.1976
Nov-Water.1976
Dec-Water.1976

Yield.1977           549        589          626          584         652         710          558         596         633          589         657          714        340
Jan-Water.1977
Feb-Water.1977
Mar-Water.1977
Apr-Water.1977       4          4            4            8           8           8            3           3           3            4.5         4.5          4.5
May-Water.1977       8          8            8            12          12          12           4.5         4.5         4.5          7.5         7.5          7.5
Jun-Water.1977                  8            8                        12          12                       4.5         4.5                      7.5          7.5
Jul-Water.1977                               8                                    12                                   4.5                                   7.5
Aug-Water.1977
Sep-Water.1977
Oct-Water.1977
Nov-Water.1977
Dec-Water.1977

Yield.1979           715        760          795          756         821         875          725         766         804          755         826          882        459
Jan-Water.1979
Feb-Water.1979
Mar-Water.1979
Apr-Water.1979       0          0            0            0           0           0            0           0           0            0           0            0
May-Water.1979       4          4            4            8           8           8            3           3           3            4.5         4.5          4.5
Jun-Water.1979                  4            4                        8           8                        3           3                        4.5          4.5
Jul-Water.1979                               4                                    8                                    3                                     4.5
Aug-Water.1979
Sep-Water.1979
Oct-Water.1979
Nov-Water.1979
Dec-Water.1979

Yield.1981           619        662          697          655         721         779          628         667         706          657         730          785        395
Jan-Water.1981
Feb-Water.1981
Mar-Water.1981
Apr-Water.1981       4          4            4            8           8           8            3           3           3            4.5         4.5          4.5
May-Water.1981       4          4            4            8           8           8            3           3           3            4.5         4.5          4.5
Jun-Water.1981                  4            4                        8           8                        3           3                        4.5          4.5
Jul-Water.1981                               4                                    8                                    3                                     4.5
Aug-Water.1981
Sep-Water.1981
Oct-Water.1981
Nov-Water.1981
Dec-Water.1981

Yield.1958           613        655          691          648         715         772          621         661         700          654         724          778        390
Jan-Water.1958
Feb-Water.1958
Mar-Water.1958
Apr-Water.1958       4          4            4            8           8           8            3           3           3            4.5         4.5          4.5
May-Water.1958       4          4            4            8           8           8            3           3           3            4.5         4.5          4.5
Jun-Water.1958                  4            4                        8           8                        3           3                        4.5          4.5
Jul-Water.1958                               4                                    8                                    3                                     4.5
Aug-Water.1958
Sep-Water.1958
Oct-Water.1958
Nov-Water.1958
Dec-Water.1958

Yield.1987           755        802          836          796         862         914          764         804         843          796         864          923        486
Jan-Water.1987
Feb-Water.1987
Mar-Water.1987
Apr-Water.1987       0          0            0            0           0           0            0           0           0            0           0            0
May-Water.1987       4          4            4            8           8           8            3           3           3            4.5         4.5          4.5
Jun-Water.1987                  4            4                        8           8                        3           3                        4.5          4.5
Jul-Water.1987                               4                                    8                                    3                                     4.5
Aug-Water.1987
Sep-Water.1987
Oct-Water.1987
Nov-Water.1987
Dec-Water.1987
;

table sorghum(alli,years,allstrat)
                    S50-May-F      S50-Jun-F      S75-May-F      S75-Jun-F      S50-May-S      S50-Jun-S      S75-May-S      S75-Jun-S      S-Dryland
Yield.1956              36             47             42             50             38             48             44             54             22
Jan-Water.1956
Feb-Water.1956
Mar-Water.1956
Apr-Water.1956          12             12             16             16             7.5            7.5            9              9
May-Water.1956          12             12             16             16             7.5            7.5            9              9
Jun-Water.1956                         12                            16                            7.5                           9
Jul-Water.1956
Aug-Water.1956
Sep-Water.1956
Oct-Water.1956
Nov-Water.1956
Dec-Water.1956

Yield.1951              46             56             52             60             48            58              54             64             29
Jan-Water.1951
Feb-Water.1951
Mar-Water.1951
Apr-Water.1951          8              8              12             12             6              6              7.5            7.5
May-Water.1951          8              8              12             12             6              6              7.5            7.5
Jun-Water.1951                         12                            16                            7.5                           9
Jul-Water.1951
Aug-Water.1951
Sep-Water.1951
Oct-Water.1951
Nov-Water.1951
Dec-Water.1951

Yield.1963              47             58             52             61             49            58              55             63             30
Jan-Water.1963
Feb-Water.1963
Mar-Water.1963
Apr-Water.1963          8              8              12             12             6              6              7.5            7.5
May-Water.1963          8              8              12             12             6              6              7.5            7.5
Jun-Water.1963                         12                            16                            7.5                           9
Jul-Water.1963
Aug-Water.1963
Sep-Water.1963
Oct-Water.1963
Nov-Water.1963
Dec-Water.1963

Yield.1989              39             49             45             52             41             50             47             57             24
Jan-Water.1989
Feb-Water.1989
Mar-Water.1989
Apr-Water.1989          8              8              12             12             6              6              7.5            7.5
May-Water.1989          8              8              12             12             6              6              7.5            7.5
Jun-Water.1989                         12                            16                            7.5                           9
Jul-Water.1989
Aug-Water.1989
Sep-Water.1989
Oct-Water.1989
Nov-Water.1989
Dec-Water.1989

Yield.1952              44             54             50             57             46             56             52             61             27
Jan-Water.1952
Feb-Water.1952
Mar-Water.1952
Apr-Water.1952          8              8              12             12             6              6              7.5            7.5
May-Water.1952          8              8              12             12             6              6              7.5            7.5
Jun-Water.1952                         12                            16                            7.5                           9
Jul-Water.1952
Aug-Water.1952
Sep-Water.1952
Oct-Water.1952
Nov-Water.1952
Dec-Water.1952

Yield.1996              42             52             48             56             44             54             50             60             26
Jan-Water.1996
Feb-Water.1996
Mar-Water.1996
Apr-Water.1996          8              8              12             12             6              6              7.5            7.5
May-Water.1996          8              8              12             12             6              6              7.5            7.5
Jun-Water.1996                         12                            16                            7.5                           9
Jul-Water.1996
Aug-Water.1996
Sep-Water.1996
Oct-Water.1996
Nov-Water.1996
Dec-Water.1996

Yield.1980              46             56             52             60             48            58              54             64             29
Jan-Water.1980
Feb-Water.1980
Mar-Water.1980
Apr-Water.1980          8              8              12             12             6              6              7.5            7.5
May-Water.1980          8              8              12             12             6              6              7.5            7.5
Jun-Water.1980                         12                            16                            7.5                           9
Jul-Water.1980
Aug-Water.1980
Sep-Water.1980
Oct-Water.1980
Nov-Water.1980
Dec-Water.1980

Yield.1982              46             56             52             60             48            58              54             64             29
Jan-Water.1982
Feb-Water.1982
Mar-Water.1982
Apr-Water.1982          8              8              12             12             6              6              7.5            7.5
May-Water.1982          8              8              12             12             6              6              7.5            7.5
Jun-Water.1982                         12                            16                            7.5                           9
Jul-Water.1982
Aug-Water.1982
Sep-Water.1982
Oct-Water.1982
Nov-Water.1982
Dec-Water.1982

Yield.1969              46             56             52             60             48            58              54             64             29
Jan-Water.1969
Feb-Water.1969
Mar-Water.1969
Apr-Water.1969          8              8              12             12             6              6              7.5            7.5
May-Water.1969          8              8              12             12             6              6              7.5            7.5
Jun-Water.1969                         12                            16                            7.5                           9
Jul-Water.1969
Aug-Water.1969
Sep-Water.1969
Oct-Water.1969
Nov-Water.1969
Dec-Water.1969

Yield.1974              41             51             47             55             43             53             49             59             25
Jan-Water.1974
Feb-Water.1974
Mar-Water.1974
Apr-Water.1974          8              8              12             12             6              6              7.5            7.5
May-Water.1974          8              8              12             12             6              6              7.5            7.5
Jun-Water.1974                         12                            16                            7.5                           9
Jul-Water.1974
Aug-Water.1974
Sep-Water.1974
Oct-Water.1974
Nov-Water.1974
Dec-Water.1974

Yield.1972              40             50             46             54             42             52             48             58             25
Jan-Water.1972
Feb-Water.1972
Mar-Water.1972
Apr-Water.1972          8              8              12             12             6              6              7.5            7.5
May-Water.1972          8              8              12             12             6              6              7.5            7.5
Jun-Water.1972                         12                            16                            7.5                           9
Jul-Water.1972
Aug-Water.1972
Sep-Water.1972
Oct-Water.1972
Nov-Water.1972
Dec-Water.1972

Yield.1976              53             64             59             67             55             66             62             71             33
Jan-Water.1976
Feb-Water.1976
Mar-Water.1976
Apr-Water.1976          8              8              12             12             6              6              7.5            7.5
May-Water.1976          8              8              12             12             6              6              7.5            7.5
Jun-Water.1976                         12                            16                            7.5                           9
Jul-Water.1976
Aug-Water.1976
Sep-Water.1976
Oct-Water.1976
Nov-Water.1976
Dec-Water.1976

Yield.1977              45             55             51             59             47             57             53             63             28
Jan-Water.1977
Feb-Water.1977
Mar-Water.1977
Apr-Water.1977          8              8              12             12             6              6              7.5            7.5
May-Water.1977          8              8              12             12             6              6              7.5            7.5
Jun-Water.1977                         12                            16                            7.5                           9
Jul-Water.1977
Aug-Water.1977
Sep-Water.1977
Oct-Water.1977
Nov-Water.1977
Dec-Water.1977

Yield.1979              59             70             65             71             61             72             67             77             35
Jan-Water.1979
Feb-Water.1979
Mar-Water.1979
Apr-Water.1979          4              4              8              8              3              3              4.5            4.5
May-Water.1979          4              4              8              8              3              3              4.5            4.5
Jun-Water.1979                         4                             8                             3                             4.5
Jul-Water.1979
Aug-Water.1979
Sep-Water.1979
Oct-Water.1979
Nov-Water.1979
Dec-Water.1979

Yield.1981              54             65             60             68             56             67             63             72             33
Jan-Water.1981
Feb-Water.1981
Mar-Water.1981
Apr-Water.1981          8              8              12             12             6              6              7.5            7.5
May-Water.1981          8              8              12             12             6              6              7.5            7.5
Jun-Water.1981                         12                            16                            7.5                           9
Jul-Water.1981
Aug-Water.1981
Sep-Water.1981
Oct-Water.1981
Nov-Water.1981
Dec-Water.1981

Yield.1958              52             63             58             66             54             65             61             70             32
Jan-Water.1958
Feb-Water.1958
Mar-Water.1958
Apr-Water.1958          8              8              12             12             6              6              7.5            7.5
May-Water.1958          8              8              12             12             6              6              7.5            7.5
Jun-Water.1958                         12                            16                            7.5                           9
Jul-Water.1958
Aug-Water.1958
Sep-Water.1958
Oct-Water.1958
Nov-Water.1958
Dec-Water.1958

Yield.1987              60             71             66             72             62             73             68             78             35
Jan-Water.1987
Feb-Water.1987
Mar-Water.1987
Apr-Water.1987          4              4              8              8              3              3              4.5            4.5
May-Water.1987          4              4              8              8              3              3              4.5            4.5
Jun-Water.1987                         4                             8                             3                             4.5
Jul-Water.1987
Aug-Water.1987
Sep-Water.1987
Oct-Water.1987
Nov-Water.1987
Dec-Water.1987
;

table wheat(alli,years,allstrat)
                    W50-Mar-F      W50-Apr-F      W75-Mar-F      W75-Apr-F      W50-Mar-S      W50-Apr-S      W75-Mar-S      W75-Apr-S       W-Dryland
Yield.1956              30             35             37             40             32             36             38             42             15
Jan-Water.1956          4              4              4              4              3              3              3              3
Feb-Water.1956          4              4              4              4              3              3              3              3
Mar-Water.1956          4              4              4              4              1.5            1.5            1.5            1.5
Apr-Water.1956                         4                             4                             3                             3
May-Water.1956
Jun-Water.1956
Jul-Water.1956
Aug-Water.1956
Sep-Water.1956
Oct-Water.1956
Nov-Water.1956          4              4              8              8              3              3              4.5            4.5
Dec-Water.1956          4              4              8              8              3              3              4.5            4.5

Yield.1951              31             36             38             41             33             37             39             43             17
Jan-Water.1951          4              4              4              4              3              3              3              3
Feb-Water.1951          4              4              4              4              3              3              3              3
Mar-Water.1951          4              4              4              4              1.5            1.5            1.5            1.5
Apr-Water.1951                         4                             4                             3                             3
May-Water.1951
Jun-Water.1951
Jul-Water.1951
Aug-Water.1951
Sep-Water.1951
Oct-Water.1951
Nov-Water.1951          4              4              8              8              3              3              4.5            4.5
Dec-Water.1951          4              4              8              8              3              3              4.5            4.5

Yield.1963              35             39             41             45             36             40             42             46             20
Jan-Water.1963          4              4              4              4              3              3              3              3
Feb-Water.1963          4              4              4              4              3              3              3              3
Mar-Water.1963          4              4              4              4              1.5            1.5            1.5            1.5
Apr-Water.1963                         4                             4                             3                             3
May-Water.1963
Jun-Water.1963
Jul-Water.1963
Aug-Water.1963
Sep-Water.1963
Oct-Water.1963
Nov-Water.1963          0              0              4              4              0              0              1.5            1.5
Dec-Water.1963          4              4              8              8              3              3              4.5            4.5

Yield.1989              36             41             42             47             37             42             43             48             21
Jan-Water.1989          4              4              4              4              3              3              3              3
Feb-Water.1989          4              4              4              4              3              3              3              3
Mar-Water.1989          4              4              4              4              1.5            1.5            1.5            1.5
Apr-Water.1989                         4                             4                             3                             3
May-Water.1989
Jun-Water.1989
Jul-Water.1989
Aug-Water.1989
Sep-Water.1989
Oct-Water.1989
Nov-Water.1989          0              0              4              4              0              0              1.5            1.5
Dec-Water.1989          4              4              8              8              3              3              4.5            4.5

Yield.1952              37             42             43             47             38             43             45             49             22
Jan-Water.1952          4              4              4              4              3              3              3              3
Feb-Water.1952          4              4              4              4              3              3              3              3
Mar-Water.1952          4              4              4              4              1.5            1.5            1.5            1.5
Apr-Water.1952                         4                             4                             3                             3
May-Water.1952
Jun-Water.1952
Jul-Water.1952
Aug-Water.1952
Sep-Water.1952
Oct-Water.1952
Nov-Water.1952          0              0              4              4              0              0              1.5            1.5
Dec-Water.1952          4              4              8              8              3              3              4.5            4.5

Yield.1996              34             38             40             44             35             39             41             45             19
Jan-Water.1996          4              4              4              4              3              3              3              3
Feb-Water.1996          4              4              4              4              3              3              3              3
Mar-Water.1996          4              4              4              4              1.5            1.5            1.5            1.5
Apr-Water.1996                         4                             4                             3                             3
May-Water.1996
Jun-Water.1996
Jul-Water.1996
Aug-Water.1996
Sep-Water.1996
Oct-Water.1996
Nov-Water.1996          4              4              8              8              3              3              4.5            4.5
Dec-Water.1996          4              4              8              8              3              3              4.5            4.5

Yield.1980              35             39             41             45             36             40             42             46             20
Jan-Water.1980          4              4              4              4              3              3              3              3
Feb-Water.1980          4              4              4              4              3              3              3              3
Mar-Water.1980          4              4              4              4              1.5            1.5            1.5            1.5
Apr-Water.1980                         4                             4                             3                             3
May-Water.1980
Jun-Water.1980
Jul-Water.1980
Aug-Water.1980
Sep-Water.1980
Oct-Water.1980
Nov-Water.1980          0              0              4              4              0              0              1.5            1.5
Dec-Water.1980          4              4              8              8              3              3              4.5            4.5

Yield.1982              42             45             48             52             43             47             49             53             26
Jan-Water.1982          4              4              4              4              3              3              3              3
Feb-Water.1982
Mar-Water.1982          4              4              4              4              1.5            1.5            1.5            1.5
Apr-Water.1982                         4                             4                             3                             3
May-Water.1982
Jun-Water.1982
Jul-Water.1982
Aug-Water.1982
Sep-Water.1982
Oct-Water.1982
Nov-Water.1982          4              4              8              8              3              3              4.5            4.5
Dec-Water.1982          0              0              4              4              0              0              1.5            1.5

Yield.1969              38             42             44             48             39             43             45             49             23
Jan-Water.1969          4              4              4              4              3              3              3              3
Feb-Water.1969          4              4              4              4              3              3              3              3
Mar-Water.1969          4              4              4              4              1.5            1.5            1.5            1.5
Apr-Water.1969                         4                             4                             3                             3
May-Water.1969
Jun-Water.1969
Jul-Water.1969
Aug-Water.1969
Sep-Water.1969
Oct-Water.1969
Nov-Water.1969          0              0              4              4              0              0              1.5            1.5
Dec-Water.1969          4              4              8              8              3              3              4.5            4.5

Yield.1974              38             42             44             48             39             43             45             49             23
Jan-Water.1974          4              4              4              4              3              3              3              3
Feb-Water.1974          4              4              4              4              3              3              3              3
Mar-Water.1974          4              4              4              4              1.5            1.5            1.5            1.5
Apr-Water.1974                         4                             4                             3                             3
May-Water.1974
Jun-Water.1974
Jul-Water.1974
Aug-Water.1974
Sep-Water.1974
Oct-Water.1974
Nov-Water.1974          0              0              4              4              0              0              1.5            1.5
Dec-Water.1974          4              4              8              8              3              3              4.5            4.5

Yield.1972              30             35             37             40             32             36             38             42             15
Jan-Water.1972          4              4              4              4              3              3              3              3
Feb-Water.1972          4              4              4              4              3              3              3              3
Mar-Water.1972          4              4              4              4              1.5            1.5            1.5            1.5
Apr-Water.1972                         4                             4                             3                             3
May-Water.1972
Jun-Water.1972
Jul-Water.1972
Aug-Water.1972
Sep-Water.1972
Oct-Water.1972
Nov-Water.1972          4              4              8              8              3              3              4.5            4.5
Dec-Water.1972          4              4              8              8              3              3              4.5            4.5

Yield.1976              42             45             48             52             43             47             49             53             26
Jan-Water.1976          4              4              4              4              3              3              3              3
Feb-Water.1976
Mar-Water.1976          4              4              4              4              1.5            1.5            1.5            1.5
Apr-Water.1976                         4                             4                             3                             3
May-Water.1976
Jun-Water.1976
Jul-Water.1976
Aug-Water.1976
Sep-Water.1976
Oct-Water.1976
Nov-Water.1976          4              4              8              8              3              3              4.5            4.5
Dec-Water.1976          0              0              4              4              0              0              1.5            1.5

Yield.1977              39             43             45             49             40             44             46             50             24
Jan-Water.1977          4              4              4              4              3              3              3              3
Feb-Water.1977          4              4              4              4              3              3              3              3
Mar-Water.1977          4              4              4              4              1.5            1.5            1.5            1.5
Apr-Water.1977                         4                             4                             3                             3
May-Water.1977
Jun-Water.1977
Jul-Water.1977
Aug-Water.1977
Sep-Water.1977
Oct-Water.1977
Nov-Water.1977          0              0              4              4              0              0              1.5            1.5
Dec-Water.1977          4              4              8              8              3              3              4.5            4.5

Yield.1979              46             49             52             56             47             51             53             57             30
Jan-Water.1979          4              4              4              4              3              3              3              3
Feb-Water.1979
Mar-Water.1979          4              4              4              4              1.5            1.5            1.5            1.5
Apr-Water.1979                         4                             4                             3                             3
May-Water.1979
Jun-Water.1979
Jul-Water.1979
Aug-Water.1979
Sep-Water.1979
Oct-Water.1979
Nov-Water.1979          4              4              8              8              3              3              4.5            4.5
Dec-Water.1979          0              0              4              4              0              0              1.5            1.5

Yield.1981              44             47             50             54             45             49             51             55             28
Jan-Water.1981          4              4              4              4              3              3              3              3
Feb-Water.1981
Mar-Water.1981          4              4              4              4              1.5            1.5            1.5            1.5
Apr-Water.1981                         4                             4                             3                             3
May-Water.1981
Jun-Water.1981
Jul-Water.1981
Aug-Water.1981
Sep-Water.1981
Oct-Water.1981
Nov-Water.1981          4              4              8              8              3              3              4.5            4.5
Dec-Water.1981          0              0              4              4              0              0              1.5            1.5

Yield.1958              44             47             50             54             45             49             51             55             28
Jan-Water.1958          4              4              4              4              3              3              3              3
Feb-Water.1958
Mar-Water.1958          4              4              4              4              1.5            1.5            1.5            1.5
Apr-Water.1958                         4                             4                             3                             3
May-Water.1958
Jun-Water.1958
Jul-Water.1958
Aug-Water.1958
Sep-Water.1958
Oct-Water.1958
Nov-Water.1958          4              4              8              8              3              3              4.5            4.5
Dec-Water.1958          0              0              4              4              0              0              1.5            1.5

Yield.1987              44             47             50             54             45             49             51             55             28
Jan-Water.1987          4              4              4              4              3              3              3              3
Feb-Water.1987
Mar-Water.1987          4              4              4              4              1.5            1.5            1.5            1.5
Apr-Water.1987                         4                             4                             3                             3
May-Water.1987
Jun-Water.1987
Jul-Water.1987
Aug-Water.1987
Sep-Water.1987
Oct-Water.1987
Nov-Water.1987          4              4              8              8              3              3              4.5            4.5
Dec-Water.1987          0              0              4              4              0              0              1.5            1.5
;

table Peanuts(alli,years,allstrat)
                    Pnut50-F      Pnut75-F    Pnut50-S     Pnut75-S     Pnut-dryland
Yield.1956             20            24          21           26           7
Jan-Water.1956
Feb-Water.1956
Mar-Water.1956
Apr-Water.1956         8             12          4.5          6
May-Water.1956         8             12          4.5          6
Jun-Water.1956         16            20          10.5         13.5
Jul-Water.1956         12            16          9            10.5
Aug-Water.1956
Sep-Water.1956
Oct-Water.1956
Nov-Water.1956
Dec-Water.1956

Yield.1951             23.5          27          24.5         29           9
Jan-Water.1951
Feb-Water.1951
Mar-Water.1951
Apr-Water.1951         4             8           3            4.5
May-Water.1951         8             12          4.5          6
Jun-Water.1951         16            20          10.5         13.5
Jul-Water.1951         12            16          9            10.5
Aug-Water.1951
Sep-Water.1951
Oct-Water.1951
Nov-Water.1951
Dec-Water.1951

Yield.1963             25            29          27           31           9.5
Jan-Water.1963
Feb-Water.1963
Mar-Water.1963
Apr-Water.1963         4             8           3            4.5
May-Water.1963         8             12          4.5          6
Jun-Water.1963         16            20          10.5         13.5
Jul-Water.1963         12            16          9            10.5
Aug-Water.1963
Sep-Water.1963
Oct-Water.1963
Nov-Water.1963
Dec-Water.1963

Yield.1989             21            24.5        22.5         27           7.5
Jan-Water.1989
Feb-Water.1989
Mar-Water.1989
Apr-Water.1989         8             12          4.5          6
May-Water.1989         8             12          4.5          6
Jun-Water.1989         16            20          10.5         13.5
Jul-Water.1989         12            16          9            10.5
Aug-Water.1989
Sep-Water.1989
Oct-Water.1989
Nov-Water.1989
Dec-Water.1989

Yield.1952             24            27.5        25           29.5         9.5
Jan-Water.1952
Feb-Water.1952
Mar-Water.1952
Apr-Water.1952         4             8           3            4.5
May-Water.1952         8             12          4.5          6
Jun-Water.1952         16            20          10.5         13.5
Jul-Water.1952         12            16          9            10.5
Aug-Water.1952
Sep-Water.1952
Oct-Water.1952
Nov-Water.1952
Dec-Water.1952

Yield.1996             23.5          27          24.5         29           9
Jan-Water.1996
Feb-Water.1996
Mar-Water.1996
Apr-Water.1996         4             8           3            4.5
May-Water.1996         8             12          4.5          6
Jun-Water.1996         16            20          10.5         13.5
Jul-Water.1996         12            16          9            10.5
Aug-Water.1996
Sep-Water.1996
Oct-Water.1996
Nov-Water.1996
Dec-Water.1996

Yield.1980             26            30         27.5          32.5         10
Jan-Water.1980
Feb-Water.1980
Mar-Water.1980
Apr-Water.1980         4             8           3            4.5
May-Water.1980         8             12          4.5          6
Jun-Water.1980         16            20          10.5         13.5
Jul-Water.1980         12            16          9            10.5
Aug-Water.1980
Sep-Water.1980
Oct-Water.1980
Nov-Water.1980
Dec-Water.1980

Yield.1982             28            31.5        29           34           10.5
Jan-Water.1982
Feb-Water.1982
Mar-Water.1982
Apr-Water.1982         4             8           3            4.5
May-Water.1982         8             12          4.5          6
Jun-Water.1982         12            16          9            12
Jul-Water.1982         12            16          9            10.5
Aug-Water.1982
Sep-Water.1982
Oct-Water.1982
Nov-Water.1982
Dec-Water.1982

Yield.1969             26            30         27.5          32.5         10
Jan-Water.1969
Feb-Water.1969
Mar-Water.1969
Apr-Water.1969         4             8           3            4.5
May-Water.1969         8             12          4.5          6
Jun-Water.1969         16            20          10.5         13.5
Jul-Water.1969         12            16          9            10.5
Aug-Water.1969
Sep-Water.1969
Oct-Water.1969
Nov-Water.1969
Dec-Water.1969

Yield.1974             21.5          25          23           27.5         8
Jan-Water.1974
Feb-Water.1974
Mar-Water.1974
Apr-Water.1974         8             12          4.5          6
May-Water.1974         8             12          4.5          6
Jun-Water.1974         16            20          10.5         13.5
Jul-Water.1974         12            16          9            10.5
Aug-Water.1974
Sep-Water.1974
Oct-Water.1974
Nov-Water.1974
Dec-Water.1974

Yield.1972             22            26          23           28           8.5
Jan-Water.1972
Feb-Water.1972
Mar-Water.1972
Apr-Water.1972         4             8           3            4.5
May-Water.1972         8             12          4.5          6
Jun-Water.1972         16            20          10.5         13.5
Jul-Water.1972         12            16          9            10.5
Aug-Water.1972
Sep-Water.1972
Oct-Water.1972
Nov-Water.1972
Dec-Water.1972

Yield.1976             33            35.5        32.5         39           14
Jan-Water.1976
Feb-Water.1976
Mar-Water.1976
Apr-Water.1976         4             8           3            4.5
May-Water.1976         8             12          4.5          6
Jun-Water.1976         8             12          6            9
Jul-Water.1976         12            16          9            10.5
Aug-Water.1976
Sep-Water.1976
Oct-Water.1976
Nov-Water.1976
Dec-Water.1976

Yield.1977             24            28          26           29.5         9.5
Jan-Water.1977
Feb-Water.1977
Mar-Water.1977
Apr-Water.1977         4             8           3            4.5
May-Water.1977         8             12          4.5          6
Jun-Water.1977         16            20          10.5         13.5
Jul-Water.1977         12            16          9            10.5
Aug-Water.1977
Sep-Water.1977
Oct-Water.1977
Nov-Water.1977
Dec-Water.1977

Yield.1979             31            34          31.5         37           13
Jan-Water.1979
Feb-Water.1979
Mar-Water.1979
Apr-Water.1979         4             8           3            4.5
May-Water.1979         8             12          4.5          6
Jun-Water.1979         8             12          6            9
Jul-Water.1979         12            16          9            10.5
Aug-Water.1979
Sep-Water.1979
Oct-Water.1979
Nov-Water.1979
Dec-Water.1979

Yield.1981             30            33.5        30           35.5         11.5
Jan-Water.1981
Feb-Water.1981
Mar-Water.1981
Apr-Water.1981         4             8           3            4.5
May-Water.1981         8             12          4.5          6
Jun-Water.1981         12            16          9            12
Jul-Water.1981         12            16          9            10.5
Aug-Water.1981
Sep-Water.1981
Oct-Water.1981
Nov-Water.1981
Dec-Water.1981

Yield.1958             29            33          30           35           11
Jan-Water.1958
Feb-Water.1958
Mar-Water.1958
Apr-Water.1958         4             8           3            4.5
May-Water.1958         8             12          4.5          6
Jun-Water.1958         12            16          9            12
Jul-Water.1958         12            16          9            10.5
Aug-Water.1958
Sep-Water.1958
Oct-Water.1958
Nov-Water.1958
Dec-Water.1958

Yield.1987             34.5          37          34           41           16
Jan-Water.1987
Feb-Water.1987
Mar-Water.1987
Apr-Water.1987         4             8           3            4.5
May-Water.1987         4             8           3            4.5
Jun-Water.1987         12            16          9            10.5
Jul-Water.1987         4             8           3            4.5
Aug-Water.1987
Sep-Water.1987
Oct-Water.1987
Nov-Water.1987
Dec-Water.1987
;

table Onion(alli,years,allstrat)
                     Oni50-F       Oni75-F     Oni50-S      Oni75-S
Yield.1956             450           459         455          466
Jan-Water.1956         4             8           3            6
Feb-Water.1956         4             8           3            6
Mar-Water.1956         4             8           3            6
Apr-Water.1956         4             8           3            6
May-Water.1956
Jun-Water.1956
Jul-Water.1956
Aug-Water.1956
Sep-Water.1956
Oct-Water.1956         4             8           3            6
Nov-Water.1956
Dec-Water.1956         4             8           3            6

Yield.1951             451           460         456          467
Jan-Water.1951         4             8           3            6
Feb-Water.1951         4             8           3            6
Mar-Water.1951         4             8           3            6
Apr-Water.1951         4             8           3            6
May-Water.1951
Jun-Water.1951
Jul-Water.1951
Aug-Water.1951
Sep-Water.1951
Oct-Water.1951         4             8           3            6
Nov-Water.1951
Dec-Water.1951         4             8           3            6

Yield.1963             454           463         459          470
Jan-Water.1963         4             8           3            6
Feb-Water.1963         4             8           3            6
Mar-Water.1963         4             4           1.5          3
Apr-Water.1963         4             4           1.5          3
May-Water.1963
Jun-Water.1963
Jul-Water.1963
Aug-Water.1963
Sep-Water.1963
Oct-Water.1963         4             8           3            6
Nov-Water.1963
Dec-Water.1963         4             8           3            6

Yield.1989             458           465         462          472
Jan-Water.1989         4             8           3            6
Feb-Water.1989         4             8           3            6
Mar-Water.1989         4             4           1.5          3
Apr-Water.1989         4             4           1.5          3
May-Water.1989
Jun-Water.1989
Jul-Water.1989
Aug-Water.1989
Sep-Water.1989
Oct-Water.1989         4             8           3            6
Nov-Water.1989
Dec-Water.1989         4             8           3            6

Yield.1952             459           466         463          474
Jan-Water.1952         4             8           3            6
Feb-Water.1952         4             8           3            6
Mar-Water.1952         4             4           1.5          3
Apr-Water.1952         4             4           1.5          3
May-Water.1952
Jun-Water.1952
Jul-Water.1952
Aug-Water.1952
Sep-Water.1952
Oct-Water.1952         4             8           3            6
Nov-Water.1952
Dec-Water.1952         4             8           3            6

Yield.1996             454           463         459          470
Jan-Water.1996         4             8           3            6
Feb-Water.1996         4             8           3            6
Mar-Water.1996         4             4           1.5          3
Apr-Water.1996         4             4           1.5          3
May-Water.1996
Jun-Water.1996
Jul-Water.1996
Aug-Water.1996
Sep-Water.1996
Oct-Water.1996         4             8           3            6
Nov-Water.1996
Dec-Water.1996         4             8           3            6

Yield.1980             451           460         456          467
Jan-Water.1980         4             8           3            6
Feb-Water.1980         4             8           3            6
Mar-Water.1980         4             8           3            6
Apr-Water.1980         4             8           3            6
May-Water.1980
Jun-Water.1980
Jul-Water.1980
Aug-Water.1980
Sep-Water.1980
Oct-Water.1980         4             8           3            6
Nov-Water.1980
Dec-Water.1980         4             8           3            6

Yield.1982             459           464         462          470
Jan-Water.1982         4             8           3            6
Feb-Water.1982         4             8           3            6
Mar-Water.1982         4             4           1.5          3
Apr-Water.1982         4             4           1.5          3
May-Water.1982
Jun-Water.1982
Jul-Water.1982
Aug-Water.1982
Sep-Water.1982
Oct-Water.1982         4             8           3            6
Nov-Water.1982
Dec-Water.1982         4             8           3            6

Yield.1969             456           464         460          471
Jan-Water.1969         4             8           3            6
Feb-Water.1969         4             8           3            6
Mar-Water.1969         4             4           1.5          3
Apr-Water.1969         4             4           1.5          3
May-Water.1969
Jun-Water.1969
Jul-Water.1969
Aug-Water.1969
Sep-Water.1969
Oct-Water.1969         4             8           3            6
Nov-Water.1969
Dec-Water.1969         4             8           3            6

Yield.1974             457           464         460          470
Jan-Water.1974         4             8           3            6
Feb-Water.1974         4             8           3            6
Mar-Water.1974         4             4           1.5          3
Apr-Water.1974         4             4           1.5          3
May-Water.1974
Jun-Water.1974
Jul-Water.1974
Aug-Water.1974
Sep-Water.1974
Oct-Water.1974         4             8           3            6
Nov-Water.1974
Dec-Water.1974         4             8           3            6

Yield.1972             450           459         455          466
Jan-Water.1972         4             8           3            6
Feb-Water.1972         4             8           3            6
Mar-Water.1972         4             8           3            6
Apr-Water.1972         4             8           3            6
May-Water.1972
Jun-Water.1972
Jul-Water.1972
Aug-Water.1972
Sep-Water.1972
Oct-Water.1972         4             8           3            6
Nov-Water.1972
Dec-Water.1972         4             8           3            6

Yield.1976             463           469         467          475
Jan-Water.1976         4             4           3            3
Feb-Water.1976         4             8           3            6
Mar-Water.1976         4             4           1.5          3
Apr-Water.1976         4             0           1.5          0
May-Water.1976
Jun-Water.1976
Jul-Water.1976
Aug-Water.1976
Sep-Water.1976
Oct-Water.1976         4             0           3            0
Nov-Water.1976
Dec-Water.1976         4             4           1.5          3

Yield.1977             458           463         461          469
Jan-Water.1977         4             8           3            6
Feb-Water.1977         4             8           3            6
Mar-Water.1977         4             4           1.5          3
Apr-Water.1977         4             4           1.5          3
May-Water.1977
Jun-Water.1977
Jul-Water.1977
Aug-Water.1977
Sep-Water.1977
Oct-Water.1977         4             8           3            6
Nov-Water.1977
Dec-Water.1977         4             8           3            6

Yield.1979             468           474         472          480
Jan-Water.1979         4             4           3            3
Feb-Water.1979         4             8           3            6
Mar-Water.1979         4             4           1.5          3
Apr-Water.1979         4             0           1.5          0
May-Water.1979
Jun-Water.1979
Jul-Water.1979
Aug-Water.1979
Sep-Water.1979
Oct-Water.1979         4             0           3            0
Nov-Water.1979
Dec-Water.1979         4             4           1.5          3

Yield.1981             469           475         473          481
Jan-Water.1981         4             4           3            3
Feb-Water.1981         4             8           3            6
Mar-Water.1981         4             4           1.5          3
Apr-Water.1981         4             0           1.5          0
May-Water.1981
Jun-Water.1981
Jul-Water.1981
Aug-Water.1981
Sep-Water.1981
Oct-Water.1981         4             0           3            0
Nov-Water.1981
Dec-Water.1981         4             4           1.5          3

Yield.1958             465           471         469          477
Jan-Water.1958         4             4           3            3
Feb-Water.1958         4             8           3            6
Mar-Water.1958         4             4           1.5          3
Apr-Water.1958         4             0           1.5          0
May-Water.1958
Jun-Water.1958
Jul-Water.1958
Aug-Water.1958
Sep-Water.1958
Oct-Water.1958         4             0           3            0
Nov-Water.1958
Dec-Water.1958         4             4           1.5          3

Yield.1987             463           469         467          475
Jan-Water.1987         4             4           3            3
Feb-Water.1987         4             8           3            6
Mar-Water.1987         4             4           1.5          3
Apr-Water.1987         4             0           1.5          0
May-Water.1987
Jun-Water.1987
Jul-Water.1987
Aug-Water.1987
Sep-Water.1987
Oct-Water.1987         4             0           3            0
Nov-Water.1987
Dec-Water.1987         4             4           1.5          3
;

table Cabbage(alli,years,allstrat)
                     Cabb50-F      Cabb75-F    Cabb50-S     Cabb75-S
Yield.1956             580           590         592          603
Jan-Water.1956
Feb-Water.1956
Mar-Water.1956
Apr-Water.1956
May-Water.1956
Jun-Water.1956
Jul-Water.1956         8             12          4.5          6
Aug-Water.1956         8             8           4.5          4.5
Sep-Water.1956         8             8           4.5          4.5
Oct-Water.1956
Nov-Water.1956
Dec-Water.1956

Yield.1951             570           581         577          589
Jan-Water.1951
Feb-Water.1951
Mar-Water.1951
Apr-Water.1951
May-Water.1951
Jun-Water.1951
Jul-Water.1951         8             12          4.5          6
Aug-Water.1951         8             8           4.5          4.5
Sep-Water.1951         8             8           4.5          4.5
Oct-Water.1951
Nov-Water.1951
Dec-Water.1951

Yield.1963             571           579         576          590
Jan-Water.1963
Feb-Water.1963
Mar-Water.1963
Apr-Water.1963
May-Water.1963
Jun-Water.1963
Jul-Water.1963         8             12          4.5          6
Aug-Water.1963         8             8           4.5          4.5
Sep-Water.1963         8             8           4.5          4.5
Oct-Water.1963
Nov-Water.1963
Dec-Water.1963

Yield.1989             573           581         578          592
Jan-Water.1989
Feb-Water.1989
Mar-Water.1989
Apr-Water.1989
May-Water.1989
Jun-Water.1989
Jul-Water.1989         8             12          4.5          6
Aug-Water.1989         8             8           4.5          4.5
Sep-Water.1989         8             8           4.5          4.5
Oct-Water.1989
Nov-Water.1989
Dec-Water.1989

Yield.1952             572           580         577          591
Jan-Water.1952
Feb-Water.1952
Mar-Water.1952
Apr-Water.1952
May-Water.1952
Jun-Water.1952
Jul-Water.1952         8             12          4.5          6
Aug-Water.1952         8             8           4.5          4.5
Sep-Water.1952         8             8           4.5          4.5
Oct-Water.1952
Nov-Water.1952
Dec-Water.1952

Yield.1996             576           581         583          592
Jan-Water.1996
Feb-Water.1996
Mar-Water.1996
Apr-Water.1996
May-Water.1996
Jun-Water.1996
Jul-Water.1996         8             12          4.5          6
Aug-Water.1996         8             8           4.5          4.5
Sep-Water.1996         8             8           4.5          4.5
Oct-Water.1996
Nov-Water.1996
Dec-Water.1996

Yield.1980             610           620         619          627
Jan-Water.1980
Feb-Water.1980
Mar-Water.1980
Apr-Water.1980
May-Water.1980
Jun-Water.1980
Jul-Water.1980         8             12          4.5          6
Aug-Water.1980         4             4           3            3
Sep-Water.1980         4             8           3            4.5
Oct-Water.1980
Nov-Water.1980
Dec-Water.1980

Yield.1982             600           610         615          622
Jan-Water.1982
Feb-Water.1982
Mar-Water.1982
Apr-Water.1982
May-Water.1982
Jun-Water.1982
Jul-Water.1982         4             8           3            4.5
Aug-Water.1982         8             8           4.5          4.5
Sep-Water.1982         8             8           4.5          4.5
Oct-Water.1982
Nov-Water.1982
Dec-Water.1982

Yield.1969             620           627         630          639
Jan-Water.1969
Feb-Water.1969
Mar-Water.1969
Apr-Water.1969
May-Water.1969
Jun-Water.1969
Jul-Water.1969         4             8           3            4.5
Aug-Water.1969         4             8           3            4.5
Sep-Water.1969         4             4           3            3
Oct-Water.1969
Nov-Water.1969
Dec-Water.1969

Yield.1974             640           648         651          660
Jan-Water.1974
Feb-Water.1974
Mar-Water.1974
Apr-Water.1974
May-Water.1974
Jun-Water.1974
Jul-Water.1974         4             8           3            4.5
Aug-Water.1974         0             0           0            0
Sep-Water.1974         0             4           0            1.5
Oct-Water.1974
Nov-Water.1974
Dec-Water.1974

Yield.1972             610           620         622          630
Jan-Water.1972
Feb-Water.1972
Mar-Water.1972
Apr-Water.1972
May-Water.1972
Jun-Water.1972
Jul-Water.1972         4             8           3            4.5
Aug-Water.1972         4             8           3            4.5
Sep-Water.1972         4             4           3            3
Oct-Water.1972
Nov-Water.1972
Dec-Water.1972

Yield.1976             642           650         655          667
Jan-Water.1976
Feb-Water.1976
Mar-Water.1976
Apr-Water.1976
May-Water.1976
Jun-Water.1976
Jul-Water.1976         0             4           0            1.5
Aug-Water.1976         4             4           1.5          3
Sep-Water.1976         0             4           1.5          3
Oct-Water.1976
Nov-Water.1976
Dec-Water.1976

Yield.1977             570           577         574          585
Jan-Water.1977
Feb-Water.1977
Mar-Water.1977
Apr-Water.1977
May-Water.1977
Jun-Water.1977
Jul-Water.1977         8             12          4.5          6
Aug-Water.1977         8             8           4.5          4.5
Sep-Water.1977         8             8           4.5          4.5
Oct-Water.1977
Nov-Water.1977
Dec-Water.1977

Yield.1979             610           620         625          633
Jan-Water.1979
Feb-Water.1979
Mar-Water.1979
Apr-Water.1979
May-Water.1979
Jun-Water.1979
Jul-Water.1979         0             4           1.5          3
Aug-Water.1979         4             8           3            4.5
Sep-Water.1979         4             8           3            4.5
Oct-Water.1979
Nov-Water.1979
Dec-Water.1979

Yield.1981             590           597         594          605
Jan-Water.1981
Feb-Water.1981
Mar-Water.1981
Apr-Water.1981
May-Water.1981
Jun-Water.1981
Jul-Water.1981         8             8           3            4.5
Aug-Water.1981         4             8           3            4.5
Sep-Water.1981         4             8           3            4.5
Oct-Water.1981
Nov-Water.1981
Dec-Water.1981

Yield.1958             640           647         652          660
Jan-Water.1958
Feb-Water.1958
Mar-Water.1958
Apr-Water.1958
May-Water.1958
Jun-Water.1958
Jul-Water.1958         0             4           1.5          3
Aug-Water.1958         4             4           1.5          3
Sep-Water.1958         0             4           1.5          3
Oct-Water.1958
Nov-Water.1958
Dec-Water.1958

Yield.1987             649           655         661          672
Jan-Water.1987
Feb-Water.1987
Mar-Water.1987
Apr-Water.1987
May-Water.1987
Jun-Water.1987
Jul-Water.1987         0             4           1.5          1.5
Aug-Water.1987         4             4           1.5          3
Sep-Water.1987         4             4           1.5          3
Oct-Water.1987
Nov-Water.1987
Dec-Water.1987
;

table Cantalop(alli,years,allstrat)
                     Cant50-F      Cant75-F    Cant50-S     Cant75-S
Yield.1956             250           260         253          262
Jan-Water.1956
Feb-Water.1956         4             8           3            4.5
Mar-Water.1956         8             12          4.5          9
Apr-Water.1956         8             12          4.5          9
May-Water.1956         8             12          4.5          9
Jun-Water.1956
Jul-Water.1956
Aug-Water.1956
Sep-Water.1956
Oct-Water.1956
Nov-Water.1956
Dec-Water.1956

Yield.1951             260           268         263          270
Jan-Water.1951
Feb-Water.1951         4             8           3            4.5
Mar-Water.1951         4             8           3            4.5
Apr-Water.1951         8             12          4.5          9
May-Water.1951         8             12          4.5          9
Jun-Water.1951
Jul-Water.1951
Aug-Water.1951
Sep-Water.1951
Oct-Water.1951
Nov-Water.1951
Dec-Water.1951

Yield.1963             267           275         270          277
Jan-Water.1963
Feb-Water.1963         4             8           3            4.5
Mar-Water.1963         4             8           3            4.5
Apr-Water.1963         8             12          4.5          9
May-Water.1963         4             8           3            4.5
Jun-Water.1963
Jul-Water.1963
Aug-Water.1963
Sep-Water.1963
Oct-Water.1963
Nov-Water.1963
Dec-Water.1963

Yield.1989             254           262         257          264
Jan-Water.1989
Feb-Water.1989         4             8           3            4.5
Mar-Water.1989         8             12          4.5          9
Apr-Water.1989         8             12          4.5          9
May-Water.1989         8             12          4.5          9
Jun-Water.1989
Jul-Water.1989
Aug-Water.1989
Sep-Water.1989
Oct-Water.1989
Nov-Water.1989
Dec-Water.1989

Yield.1952             257           265         260          267
Jan-Water.1952
Feb-Water.1952         4             8           3            4.5
Mar-Water.1952         4             8           3            4.5
Apr-Water.1952         8             12          4.5          9
May-Water.1952         8             12          4.5          9
Jun-Water.1952
Jul-Water.1952
Aug-Water.1952
Sep-Water.1952
Oct-Water.1952
Nov-Water.1952
Dec-Water.1952

Yield.1996             256           264         259          266
Jan-Water.1996
Feb-Water.1996         4             8           3            4.5
Mar-Water.1996         4             8           3            4.5
Apr-Water.1996         8             12          4.5          9
May-Water.1996         8             12          4.5          9
Jun-Water.1996
Jul-Water.1996
Aug-Water.1996
Sep-Water.1996
Oct-Water.1996
Nov-Water.1996
Dec-Water.1996

Yield.1980             265           273         268          275
Jan-Water.1980
Feb-Water.1980         4             8           3            4.5
Mar-Water.1980         4             8           3            4.5
Apr-Water.1980         8             12          4.5          9
May-Water.1980         8             12          4.5          9
Jun-Water.1980
Jul-Water.1980
Aug-Water.1980
Sep-Water.1980
Oct-Water.1980
Nov-Water.1980
Dec-Water.1980

Yield.1982             269           277         272          280
Jan-Water.1982
Feb-Water.1982         4             8           3            4.5
Mar-Water.1982         4             8           3            4.5
Apr-Water.1982         8             12          4.5          9
May-Water.1982         4             8           3            4.5
Jun-Water.1982
Jul-Water.1982
Aug-Water.1982
Sep-Water.1982
Oct-Water.1982
Nov-Water.1982
Dec-Water.1982

Yield.1969             261           269         264          271
Jan-Water.1969
Feb-Water.1969         4             8           3            4.5
Mar-Water.1969         4             8           3            4.5
Apr-Water.1969         8             12          4.5          9
May-Water.1969         8             12          4.5          9
Jun-Water.1969
Jul-Water.1969
Aug-Water.1969
Sep-Water.1969
Oct-Water.1969
Nov-Water.1969
Dec-Water.1969

Yield.1974             255           263         258          265
Jan-Water.1974
Feb-Water.1974         4             8           3            4.5
Mar-Water.1974         4             8           3            4.5
Apr-Water.1974         8             12          4.5          9
May-Water.1974         8             12          4.5          9
Jun-Water.1974
Jul-Water.1974
Aug-Water.1974
Sep-Water.1974
Oct-Water.1974
Nov-Water.1974
Dec-Water.1974

Yield.1972             253           261         256          263
Jan-Water.1972
Feb-Water.1972         4             8           3            4.5
Mar-Water.1972         8             12          4.5          9
Apr-Water.1972         8             12          4.5          9
May-Water.1972         8             12          4.5          9
Jun-Water.1972
Jul-Water.1972
Aug-Water.1972
Sep-Water.1972
Oct-Water.1972
Nov-Water.1972
Dec-Water.1972

Yield.1976             277           284         279          287
Jan-Water.1976
Feb-Water.1976         4             8           3            4.5
Mar-Water.1976         4             8           3            4.5
Apr-Water.1976         8             12          4.5          9
May-Water.1976         4             8           3            4.5
Jun-Water.1976
Jul-Water.1976
Aug-Water.1976
Sep-Water.1976
Oct-Water.1976
Nov-Water.1976
Dec-Water.1976

Yield.1977             258           266         261          268
Jan-Water.1977
Feb-Water.1977         4             8           3            4.5
Mar-Water.1977         4             8           3            4.5
Apr-Water.1977         8             12          4.5          9
May-Water.1977         8             12          4.5          9
Jun-Water.1977
Jul-Water.1977
Aug-Water.1977
Sep-Water.1977
Oct-Water.1977
Nov-Water.1977
Dec-Water.1977

Yield.1979             273           280         275          283
Jan-Water.1979
Feb-Water.1979         4             8           3            4.5
Mar-Water.1979         4             8           3            4.5
Apr-Water.1979         8             12          4.5          9
May-Water.1979         4             8           3            4.5
Jun-Water.1979
Jul-Water.1979
Aug-Water.1979
Sep-Water.1979
Oct-Water.1979
Nov-Water.1979
Dec-Water.1979

Yield.1981             282           289         284          292
Jan-Water.1981
Feb-Water.1981         4             8           3            4.5
Mar-Water.1981         4             8           3            4.5
Apr-Water.1981         8             12          4.5          9
May-Water.1981         4             8           3            4.5
Jun-Water.1981
Jul-Water.1981
Aug-Water.1981
Sep-Water.1981
Oct-Water.1981
Nov-Water.1981
Dec-Water.1981

Yield.1958             263           271         266          273
Jan-Water.1958
Feb-Water.1958         4             8           3            4.5
Mar-Water.1958         4             8           3            4.5
Apr-Water.1958         8             12          4.5          9
May-Water.1958         8             12          4.5          9
Jun-Water.1958
Jul-Water.1958
Aug-Water.1958
Sep-Water.1958
Oct-Water.1958
Nov-Water.1958
Dec-Water.1958

Yield.1987             292           300         294          302
Jan-Water.1987
Feb-Water.1987         4             8           3            4.5
Mar-Water.1987         4             8           3            4.5
Apr-Water.1987         4             8           3            4.5
May-Water.1987         4             8           3            4.5
Jun-Water.1987
Jul-Water.1987
Aug-Water.1987
Sep-Water.1987
Oct-Water.1987
Nov-Water.1987
Dec-Water.1987
;

table Cucumber(alli,years,allstrat)
                    Cuc50-F       Cuc75-F     Cuc50-S      Cuc75-S
Yield.1956             221           232         224          238
Jan-Water.1956
Feb-Water.1956
Mar-Water.1956
Apr-Water.1956
May-Water.1956
Jun-Water.1956
Jul-Water.1956         8             12          4.5          6
Aug-Water.1956         8             12          4.5          9
Sep-Water.1956         8             12          4.5          9
Oct-Water.1956         4             8           3            4.5
Nov-Water.1956
Dec-Water.1956

Yield.1951             222           232         225          237
Jan-Water.1951
Feb-Water.1951
Mar-Water.1951
Apr-Water.1951
May-Water.1951
Jun-Water.1951
Jul-Water.1951         8             12          4.5          6
Aug-Water.1951         8             12          4.5          9
Sep-Water.1951         8             12          4.5          9
Oct-Water.1951         4             8           3            4.5
Nov-Water.1951
Dec-Water.1951

Yield.1963             183           193         187          196
Jan-Water.1963
Feb-Water.1963
Mar-Water.1963
Apr-Water.1963
May-Water.1963
Jun-Water.1963
Jul-Water.1963         8             12          4.5          6
Aug-Water.1963         8             12          4.5          9
Sep-Water.1963         8             12          4.5          9
Oct-Water.1963         8             12          6            9
Nov-Water.1963
Dec-Water.1963

Yield.1989             187           195         189          198
Jan-Water.1989
Feb-Water.1989
Mar-Water.1989
Apr-Water.1989
May-Water.1989
Jun-Water.1989
Jul-Water.1989         8             12          4.5          6
Aug-Water.1989         8             12          4.5          9
Sep-Water.1989         8             12          4.5          9
Oct-Water.1989         8             12          6            9
Nov-Water.1989
Dec-Water.1989

Yield.1952             191           199         193          202
Jan-Water.1952
Feb-Water.1952
Mar-Water.1952
Apr-Water.1952
May-Water.1952
Jun-Water.1952
Jul-Water.1952         8             12          4.5          6
Aug-Water.1952         8             12          4.5          9
Sep-Water.1952         8             12          4.5          9
Oct-Water.1952         8             12          6            9
Nov-Water.1952
Dec-Water.1952

Yield.1996             184           193         186          195
Jan-Water.1996
Feb-Water.1996
Mar-Water.1996
Apr-Water.1996
May-Water.1996
Jun-Water.1996
Jul-Water.1996         8             12          4.5          6
Aug-Water.1996         8             12          4.5          9
Sep-Water.1996         8             12          4.5          9
Oct-Water.1996         8             12          6            9
Nov-Water.1996
Dec-Water.1996

Yield.1980             256           267         259          271
Jan-Water.1980
Feb-Water.1980
Mar-Water.1980
Apr-Water.1980
May-Water.1980
Jun-Water.1980
Jul-Water.1980         8             12          4.5          6
Aug-Water.1980         8             12          4.5          9
Sep-Water.1980         4             8           3            4.5
Oct-Water.1980         4             8           3            4.5
Nov-Water.1980
Dec-Water.1980

Yield.1982             181           192         186          195
Jan-Water.1982
Feb-Water.1982
Mar-Water.1982
Apr-Water.1982
May-Water.1982
Jun-Water.1982
Jul-Water.1982         8             12          4.5          6
Aug-Water.1982         8             12          4.5          9
Sep-Water.1982         8             12          4.5          9
Oct-Water.1982         8             12          6            9
Nov-Water.1982
Dec-Water.1982

Yield.1969             276           287         281          293
Jan-Water.1969
Feb-Water.1969
Mar-Water.1969
Apr-Water.1969
May-Water.1969
Jun-Water.1969
Jul-Water.1969         4             8           3            4.5
Aug-Water.1969         4             8           3            4.5
Sep-Water.1969         4             8           3            4.5
Oct-Water.1969         4             8           3            4.5
Nov-Water.1969
Dec-Water.1969

Yield.1974             278           288         282          294
Jan-Water.1974
Feb-Water.1974
Mar-Water.1974
Apr-Water.1974
May-Water.1974
Jun-Water.1974
Jul-Water.1974         4             8           3            4.5
Aug-Water.1974         4             8           3            4.5
Sep-Water.1974         4             8           3            4.5
Oct-Water.1974         4             8           3            4.5
Nov-Water.1974
Dec-Water.1974

Yield.1972             250           262         254          266
Jan-Water.1972
Feb-Water.1972
Mar-Water.1972
Apr-Water.1972
May-Water.1972
Jun-Water.1972
Jul-Water.1972         8             12          4.5          6
Aug-Water.1972         8             12          4.5          9
Sep-Water.1972         4             8           3            4.5
Oct-Water.1972         4             8           3            4.5
Nov-Water.1972
Dec-Water.1972

Yield.1976             275           286         280          291
Jan-Water.1976
Feb-Water.1976
Mar-Water.1976
Apr-Water.1976
May-Water.1976
Jun-Water.1976
Jul-Water.1976         4             8           3            4.5
Aug-Water.1976         4             8           3            4.5
Sep-Water.1976         4             8           3            4.5
Oct-Water.1976         4             8           3            4.5
Nov-Water.1976
Dec-Water.1976

Yield.1977             223           234         226          240
Jan-Water.1977
Feb-Water.1977
Mar-Water.1977
Apr-Water.1977
May-Water.1977
Jun-Water.1977
Jul-Water.1977         8             12          4.5          6
Aug-Water.1977         8             12          4.5          9
Sep-Water.1977         8             12          4.5          9
Oct-Water.1977         4             8           3            4.5
Nov-Water.1977
Dec-Water.1977

Yield.1979             180           191         185          194
Jan-Water.1979
Feb-Water.1979
Mar-Water.1979
Apr-Water.1979
May-Water.1979
Jun-Water.1979
Jul-Water.1979         8             12          4.5          6
Aug-Water.1979         8             12          4.5          9
Sep-Water.1979         8             12          4.5          9
Oct-Water.1979         8             12          6            9
Nov-Water.1979
Dec-Water.1979

Yield.1981             253           264         256          268
Jan-Water.1981
Feb-Water.1981
Mar-Water.1981
Apr-Water.1981
May-Water.1981
Jun-Water.1981
Jul-Water.1981         8             12          4.5          6
Aug-Water.1981         8             12          4.5          9
Sep-Water.1981         4             8           3            4.5
Oct-Water.1981         4             8           3            4.5
Nov-Water.1981
Dec-Water.1981

Yield.1958             270           281         274          286
Jan-Water.1958
Feb-Water.1958
Mar-Water.1958
Apr-Water.1958
May-Water.1958
Jun-Water.1958
Jul-Water.1958         8             12          4.5          6
Aug-Water.1958         4             8           3            6
Sep-Water.1958         4             8           3            4.5
Oct-Water.1958         4             8           3            4.5
Nov-Water.1958
Dec-Water.1958

Yield.1987             220           231         224          236
Jan-Water.1987
Feb-Water.1987
Mar-Water.1987
Apr-Water.1987
May-Water.1987
Jun-Water.1987
Jul-Water.1987         8             12          4.5          6
Aug-Water.1987         8             12          4.5          9
Sep-Water.1987         8             12          4.5          9
Oct-Water.1987         4             8           3            4.5
Nov-Water.1987
Dec-Water.1987
;

table Spinach(alli,years,allstrat)
                    Spin50-F      Spin75-F    Spin50-S     Spin75-S
Yield.1956             436           441         438          446
Jan-Water.1956
Feb-Water.1956
Mar-Water.1956
Apr-Water.1956
May-Water.1956
Jun-Water.1956
Jul-Water.1956
Aug-Water.1956
Sep-Water.1956         8             12          4.5          7.5
Oct-Water.1956         8             12          4.5          7.5
Nov-Water.1956         8             12          4.5          7.5
Dec-Water.1956         8             12          4.5          7.5

Yield.1951             435           441         439          446
Jan-Water.1951
Feb-Water.1951
Mar-Water.1951
Apr-Water.1951
May-Water.1951
Jun-Water.1951
Jul-Water.1951
Aug-Water.1951
Sep-Water.1951         8             12          4.5          7.5
Oct-Water.1951         8             12          4.5          7.5
Nov-Water.1951         8             12          4.5          7.5
Dec-Water.1951         8             12          4.5          7.5

Yield.1963             436           443         438          447
Jan-Water.1963
Feb-Water.1963
Mar-Water.1963
Apr-Water.1963
May-Water.1963
Jun-Water.1963
Jul-Water.1963
Aug-Water.1963
Sep-Water.1963         8             12          4.5          7.5
Oct-Water.1963         8             12          4.5          7.5
Nov-Water.1963         8             12          4.5          7.5
Dec-Water.1963         8             12          4.5          7.5

Yield.1989             440           446         442          450
Jan-Water.1989
Feb-Water.1989
Mar-Water.1989
Apr-Water.1989
May-Water.1989
Jun-Water.1989
Jul-Water.1989
Aug-Water.1989
Sep-Water.1989         8             12          4.5          7.5
Oct-Water.1989         8             12          4.5          7.5
Nov-Water.1989         8             12          4.5          7.5
Dec-Water.1989         8             12          4.5          7.5

Yield.1952             437           442         437          446
Jan-Water.1952
Feb-Water.1952
Mar-Water.1952
Apr-Water.1952
May-Water.1952
Jun-Water.1952
Jul-Water.1952
Aug-Water.1952
Sep-Water.1952         8             12          4.5          7.5
Oct-Water.1952         8             12          4.5          7.5
Nov-Water.1952         8             12          4.5          7.5
Dec-Water.1952         8             12          4.5          7.5

Yield.1996             429           440         434          447
Jan-Water.1996
Feb-Water.1996
Mar-Water.1996
Apr-Water.1996
May-Water.1996
Jun-Water.1996
Jul-Water.1996
Aug-Water.1996
Sep-Water.1996         8             12          4.5          7.5
Oct-Water.1996         8             12          4.5          7.5
Nov-Water.1996         8             12          4.5          7.5
Dec-Water.1996         8             12          4.5          7.5

Yield.1980             451           460         455          464
Jan-Water.1980
Feb-Water.1980
Mar-Water.1980
Apr-Water.1980
May-Water.1980
Jun-Water.1980
Jul-Water.1980
Aug-Water.1980
Sep-Water.1980         8             12          4.5          7.5
Oct-Water.1980         8             12          4.5          7.5
Nov-Water.1980         4             8           3            4.5
Dec-Water.1980         8             12          4.5          7.5

Yield.1982             443           451         447          455
Jan-Water.1982
Feb-Water.1982
Mar-Water.1982
Apr-Water.1982
May-Water.1982
Jun-Water.1982
Jul-Water.1982
Aug-Water.1982
Sep-Water.1982         8             12          4.5          7.5
Oct-Water.1982         8             12          4.5          7.5
Nov-Water.1982         4             8           3            4.5
Dec-Water.1982         8             12          4.5          7.5

Yield.1969             482           491         486          497
Jan-Water.1969
Feb-Water.1969
Mar-Water.1969
Apr-Water.1969
May-Water.1969
Jun-Water.1969
Jul-Water.1969
Aug-Water.1969
Sep-Water.1969         4             8           3            4.5
Oct-Water.1969         4             8           3            4.5
Nov-Water.1969         4             8           3            4.5
Dec-Water.1969         4             8           3            4.5

Yield.1974             450           459         454          463
Jan-Water.1974
Feb-Water.1974
Mar-Water.1974
Apr-Water.1974
May-Water.1974
Jun-Water.1974
Jul-Water.1974
Aug-Water.1974
Sep-Water.1974         8             12          4.5          7.5
Oct-Water.1974         8             12          4.5          7.5
Nov-Water.1974         4             8           3            4.5
Dec-Water.1974         8             12          4.5          7.5

Yield.1972             442           450         446          454
Jan-Water.1972
Feb-Water.1972
Mar-Water.1972
Apr-Water.1972
May-Water.1972
Jun-Water.1972
Jul-Water.1972
Aug-Water.1972
Sep-Water.1972         8             12          4.5          7.5
Oct-Water.1972         8             12          4.5          7.5
Nov-Water.1972         4             8           3            4.5
Dec-Water.1972         8             12          4.5          7.5

Yield.1976             483           492         487          498
Jan-Water.1976
Feb-Water.1976
Mar-Water.1976
Apr-Water.1976
May-Water.1976
Jun-Water.1976
Jul-Water.1976
Aug-Water.1976
Sep-Water.1976         4             8           3            4.5
Oct-Water.1976         4             8           3            4.5
Nov-Water.1976         4             8           3            4.5
Dec-Water.1976         4             8           3            4.5

Yield.1977             458           467         462          471
Jan-Water.1977
Feb-Water.1977
Mar-Water.1977
Apr-Water.1977
May-Water.1977
Jun-Water.1977
Jul-Water.1977
Aug-Water.1977
Sep-Water.1977         8             12          4.5          7.5
Oct-Water.1977         8             12          4.5          7.5
Nov-Water.1977         4             8           3            4.5
Dec-Water.1977         8             12          4.5          7.5

Yield.1979             430           442         435          449
Jan-Water.1979
Feb-Water.1979
Mar-Water.1979
Apr-Water.1979
May-Water.1979
Jun-Water.1979
Jul-Water.1979
Aug-Water.1979
Sep-Water.1979         8             12          4.5          7.5
Oct-Water.1979         8             12          4.5          7.5
Nov-Water.1979         8             12          4.5          7.5
Dec-Water.1979         8             12          4.5          7.5

Yield.1981             459           468         463          472
Jan-Water.1981
Feb-Water.1981
Mar-Water.1981
Apr-Water.1981
May-Water.1981
Jun-Water.1981
Jul-Water.1981
Aug-Water.1981
Sep-Water.1981         8             12          4.5          7.5
Oct-Water.1981         8             12          4.5          7.5
Nov-Water.1981         4             8           3            4.5
Dec-Water.1981         8             12          4.5          7.5

Yield.1958             472           480         476          485
Jan-Water.1958
Feb-Water.1958
Mar-Water.1958
Apr-Water.1958
May-Water.1958
Jun-Water.1958
Jul-Water.1958
Aug-Water.1958
Sep-Water.1958         4             8           3            4.5
Oct-Water.1958         4             8           3            4.5
Nov-Water.1958         4             8           3            4.5
Dec-Water.1958         8             12          4.5          7.5

Yield.1987             438           445         440          449
Jan-Water.1987
Feb-Water.1987
Mar-Water.1987
Apr-Water.1987
May-Water.1987
Jun-Water.1987
Jul-Water.1987
Aug-Water.1987
Sep-Water.1987         8             12          4.5          7.5
Oct-Water.1987         8             12          4.5          7.5
Nov-Water.1987         8             12          4.5          7.5
Dec-Water.1987         8             12          4.5          7.5
;

table sorgHay(alli,years,allstrat)
                     Hay50-F      Hay75-F     Hay50-S      Hay75-S
Yield.1956             8.1           8.4         8.2          8.5
Jan-Water.1956
Feb-Water.1956         4             8           3            6
Mar-Water.1956         4             8           3            6
Apr-Water.1956         4             4           3            3
May-Water.1956         4             4           3            3
Jun-Water.1956         4             4           3            3
Jul-Water.1956         4             4           3            3
Aug-Water.1956         4             4           3            3
Sep-Water.1956
Oct-Water.1956
Nov-Water.1956
Dec-Water.1956

Yield.1951             8.2           8.4         8.3          8.5
Jan-Water.1951
Feb-Water.1951         4             8           3            6
Mar-Water.1951         4             8           3            6
Apr-Water.1951         4             4           3            3
May-Water.1951         4             4           3            3
Jun-Water.1951         4             4           3            3
Jul-Water.1951         4             4           3            3
Aug-Water.1951         4             4           3            3
Sep-Water.1951
Oct-Water.1951
Nov-Water.1951
Dec-Water.1951

Yield.1963             8.7           8.9         8.8          9
Jan-Water.1963
Feb-Water.1963         4             8           3            6
Mar-Water.1963         4             8           3            6
Apr-Water.1963         4             4           3            3
May-Water.1963         4             4           3            3
Jun-Water.1963         4             4           3            3
Jul-Water.1963         4             4           3            3
Aug-Water.1963         4             4           3            3
Sep-Water.1963
Oct-Water.1963
Nov-Water.1963
Dec-Water.1963

Yield.1989             8.1           8.4         8.2          8.5
Jan-Water.1989
Feb-Water.1989         4             8           3            6
Mar-Water.1989         4             8           3            6
Apr-Water.1989         4             4           3            3
May-Water.1989         4             4           3            3
Jun-Water.1989         4             4           3            3
Jul-Water.1989         4             4           3            3
Aug-Water.1989         4             4           3            3
Sep-Water.1989
Oct-Water.1989
Nov-Water.1989
Dec-Water.1989

Yield.1952             8.5           8.6         8.7          8.8
Jan-Water.1952
Feb-Water.1952         4             8           3            6
Mar-Water.1952         4             8           3            6
Apr-Water.1952         4             4           3            3
May-Water.1952         4             4           3            3
Jun-Water.1952         4             4           3            3
Jul-Water.1952         4             4           3            3
Aug-Water.1952         4             4           3            3
Sep-Water.1952
Oct-Water.1952
Nov-Water.1952
Dec-Water.1952

Yield.1996             8.8           8.9         9            9.1
Jan-Water.1996
Feb-Water.1996         4             8           3            6
Mar-Water.1996         4             8           3            6
Apr-Water.1996         4             4           3            3
May-Water.1996         4             4           3            3
Jun-Water.1996         4             4           3            3
Jul-Water.1996         4             4           3            3
Aug-Water.1996         4             4           3            3
Sep-Water.1996
Oct-Water.1996
Nov-Water.1996
Dec-Water.1996

Yield.1980             8.9           9.1         9.2          9.4
Jan-Water.1980
Feb-Water.1980         4             8           3            6
Mar-Water.1980         4             8           3            6
Apr-Water.1980         4             4           3            3
May-Water.1980         4             4           1.5          1.5
Jun-Water.1980         4             4           3            3
Jul-Water.1980         4             4           3            3
Aug-Water.1980         4             4           3            3
Sep-Water.1980
Oct-Water.1980
Nov-Water.1980
Dec-Water.1980

Yield.1982             9.3           9.5         9.6          9.8
Jan-Water.1982
Feb-Water.1982         4             4           1.5          3
Mar-Water.1982         4             4           3            3
Apr-Water.1982         4             4           3            3
May-Water.1982         0             4           1.5          1.5
Jun-Water.1982         4             4           1.5          1.5
Jul-Water.1982         4             4           1.5          1.5
Aug-Water.1982         4             4           3            3
Sep-Water.1982
Oct-Water.1982
Nov-Water.1982
Dec-Water.1982

Yield.1969             8.3           8.4         8.5          8.6
Jan-Water.1969
Feb-Water.1969         4             8           3            6
Mar-Water.1969         4             8           3            6
Apr-Water.1969         4             4           3            3
May-Water.1969         4             4           3            3
Jun-Water.1969         4             4           3            3
Jul-Water.1969         4             4           3            3
Aug-Water.1969         4             4           3            3
Sep-Water.1969
Oct-Water.1969
Nov-Water.1969
Dec-Water.1969

Yield.1974             10.2          10.4        10.5         10.8
Jan-Water.1974
Feb-Water.1974         4             4           3            3
Mar-Water.1974         4             4           3            3
Apr-Water.1974         4             4           1.5          1.5
May-Water.1974         4             4           1.5          1.5
Jun-Water.1974         4             4           3            3
Jul-Water.1974         4             4           3            3
Aug-Water.1974         0             0           0            0
Sep-Water.1974
Oct-Water.1974
Nov-Water.1974
Dec-Water.1974

Yield.1972             8.6           8.8         8.9          9
Jan-Water.1972
Feb-Water.1972         4             8           3            6
Mar-Water.1972         4             8           3            6
Apr-Water.1972         4             4           3            3
May-Water.1972         4             4           3            3
Jun-Water.1972         4             4           3            3
Jul-Water.1972         4             4           3            3
Aug-Water.1972         4             4           3            3
Sep-Water.1972
Oct-Water.1972
Nov-Water.1972
Dec-Water.1972

Yield.1976             10.4          10.7        11           11.5
Jan-Water.1976
Feb-Water.1976         4             4           3            3
Mar-Water.1976         4             4           3            3
Apr-Water.1976         0             0           0            1.5
May-Water.1976         0             4           1.5          1.5
Jun-Water.1976         4             4           1.5          3
Jul-Water.1976         0             0           0            0
Aug-Water.1976         4             4           1.5          1.5
Sep-Water.1976
Oct-Water.1976
Nov-Water.1976
Dec-Water.1976

Yield.1977             8.8           9           8.9          9.1
Jan-Water.1977
Feb-Water.1977         4             8           3            6
Mar-Water.1977         4             8           3            6
Apr-Water.1977         4             4           3            3
May-Water.1977         4             4           3            3
Jun-Water.1977         4             4           3            3
Jul-Water.1977         4             4           3            3
Aug-Water.1977         4             4           3            3
Sep-Water.1977
Oct-Water.1977
Nov-Water.1977
Dec-Water.1977

Yield.1979             10.5          10.8        11.1         11.6
Jan-Water.1979
Feb-Water.1979         4             4           3            3
Mar-Water.1979         4             4           1.5          1.5
Apr-Water.1979         0             0           0            1.5
May-Water.1979         4             4           1.5          1.5
Jun-Water.1979         0             0           0            0
Jul-Water.1979         0             4           0            1.5
Aug-Water.1979         4             4           1.5          1.5
Sep-Water.1979
Oct-Water.1979
Nov-Water.1979
Dec-Water.1979

Yield.1981             10.4          10.6        11           11.2
Jan-Water.1981
Feb-Water.1981         4             4           3            3
Mar-Water.1981         4             4           1.5          1.5
Apr-Water.1981         0             0           0            1.5
May-Water.1981         0             4           1.5          1.5
Jun-Water.1981         0             4           1.5          1.5
Jul-Water.1981         4             4           1.5          3
Aug-Water.1981         4             4           3            3
Sep-Water.1981
Oct-Water.1981
Nov-Water.1981
Dec-Water.1981

Yield.1958             11            11.2        11.3         11.6
Jan-Water.1958
Feb-Water.1958         0             4           1.5          1.5
Mar-Water.1958         0             4           1.5          1.5
Apr-Water.1958         4             4           1.5          3
May-Water.1958         0             4           1.5          1.5
Jun-Water.1958         0             0           0            0
Jul-Water.1958         0             4           1.5          1.5
Aug-Water.1958         0             4           1.5          1.5
Sep-Water.1958
Oct-Water.1958
Nov-Water.1958
Dec-Water.1958

Yield.1987             11.4          11.6        11.8         12.2
Jan-Water.1987
Feb-Water.1987         0             4           1.5          1.5
Mar-Water.1987         4             4           1.5          1.5
Apr-Water.1987         4             4           1.5          1.5
May-Water.1987         0             0           0            0
Jun-Water.1987         0             0           0            0
Jul-Water.1987         4             4           1.5          1.5
Aug-Water.1987         4             4           1.5          1.5
Sep-Water.1987
Oct-Water.1987
Nov-Water.1987
Dec-Water.1987
;
TABLE rice(alli,years,allstrat)
* Unit: inch
                            rice75-S       rice50-S        rice75-F      rice50-F
Yield.1956                    61.71          24.77           61.71         24.77
Jan-Water.1956
Feb-Water.1956
Mar-Water.1956
Apr-Water.1956
May-Water.1956                 0.98                           0.98
Jun-Water.1956                 4.92          0.98             4.92         0.98
Jul-Water.1956                10.83          7.87            10.83         7.87
Aug-Water.1956                 3.94          3.94             3.94         3.94
Sep-Water.1956
Oct-Water.1956
Nov-Water.1956
Dec-Water.1956

Yield.1951                    61.71          21.74           61.71         21.74
Jan-Water.1951
Feb-Water.1951
Mar-Water.1951                1.94                           1.94
Apr-Water.1951
May-Water.1951                0.98                           0.98
Jun-Water.1951                2.95                           2.95
Jul-Water.1951                8.86           5.91            8.86          5.91
Aug-Water.1951                6.89           5.91            6.89          5.91
Sep-Water.1951
Oct-Water.1951
Nov-Water.1951
Dec-Water.1951

Yield.1963                    62.93          37.14           62.93         37.14
Jan-Water.1963
Feb-Water.1963
Mar-Water.1963
Apr-Water.1963                0.98                           0.98
May-Water.1963                0.98                           0.98
Jun-Water.1963                3.94                           3.94
Jul-Water.1963                8.86           4.92            8.86          4.92
Aug-Water.1963                6.89           2.95            6.89          2.95
Sep-Water.1963
Oct-Water.1963
Nov-Water.1963
Dec-Water.1963

Yield.1989                    63.58          34.99           63.58         34.99
Jan-Water.1989
Feb-Water.1989
Mar-Water.1989
Apr-Water.1989
May-Water.1989                0.98                           0.98
Jun-Water.1989                3.94                           3.94
Jul-Water.1989                5.91           1.97            5.91          1.97
Aug-Water.1989                6.89           5.91            6.89          5.91
Sep-Water.1989
Oct-Water.1989
Nov-Water.1989
Dec-Water.1989

Yield.1952                    58.09          26.85           58.09         26.85
Jan-Water.1952
Feb-Water.1952
Mar-Water.1952
Apr-Water.1952
May-Water.1952                0.98                           0.98
Jun-Water.1952                3.94           0.98            3.94          0.98
Jul-Water.1952                5.91           4.92            5.91          4.92
Aug-Water.1952                6.89           2.95            6.89          2.95
Sep-Water.1952
Oct-Water.1952
Nov-Water.1952
Dec-Water.1952

Yield.1996                    65.87          31.74           65.87         31.74
Jan-Water.1996
Feb-Water.1996
Mar-Water.1996
Apr-Water.1996
May-Water.1996                0.98                           0.98
Jun-Water.1996                4.92                           4.92
Jul-Water.1996                8.86           6.89            8.86          6.89
Aug-Water.1996                4.92           2.95            4.92          2.95
Sep-Water.1996
Oct-Water.1996
Nov-Water.1996
Dec-Water.1996

Yield.1980                    61.55          30.76           61.55         30.76
Jan-Water.1980
Feb-Water.1980
Mar-Water.1980
Apr-Water.1980
May-Water.1980                0.98                           0.98
Jun-Water.1980                4.92                           4.92
Jul-Water.1980                8.86           1.97            8.86          1.97
Aug-Water.1980                4.92           2.95            4.92          2.95
Sep-Water.1980
Oct-Water.1980
Nov-Water.1980
Dec-Water.1980

Yield.1982                    60.07          22.45           60.07         22.45
Jan-Water.1982
Feb-Water.1982
Mar-Water.1982
Apr-Water.1982
May-Water.1982
Jun-Water.1982                3.94                           3.94
Jul-Water.1982                10.83          7.87            10.83         7.87
Aug-Water.1982                4.92           3.94            4.92          3.94
Sep-Water.1982
Oct-Water.1982
Nov-Water.1982
Dec-Water.1982

Yield.1969                    66.47          35.89           66.47         35.89
Jan-Water.1969
Feb-Water.1969
Mar-Water.1969
Apr-Water.1969
May-Water.1969                1.97                           1.97
Jun-Water.1969                2.95                           2.95
Jul-Water.1969                7.87           4.92            7.87          4.92
Aug-Water.1969                6.89           4.92            6.89          4.92
Sep-Water.1969
Oct-Water.1969
Nov-Water.1969
Dec-Water.1969

Yield.1974                    59.29          33.21           59.29         33.21
Jan-Water.1974
Feb-Water.1974
Mar-Water.1974
Apr-Water.1974
May-Water.1974                0.98                           0.98
Jun-Water.1974                3.94                           3.94
Jul-Water.1974                10.83          7.87            10.83         7.87
Aug-Water.1974                1.97           0.98            1.97          0.98
Sep-Water.1974
Oct-Water.1974
Nov-Water.1974
Dec-Water.1974

Yield.1972                    63.35          50.08           63.35         50.08
Jan-Water.1972
Feb-Water.1972
Mar-Water.1972
Apr-Water.1972                0.98                           0.98
May-Water.1972                0.98                           0.98
Jun-Water.1972                4.92                           4.92
Jul-Water.1972                5.91           0.98            5.91          0.98
Aug-Water.1972                0.98           1.97            0.98          1.97
Sep-Water.1972
Oct-Water.1972
Nov-Water.1972
Dec-Water.1972

Yield.1976                    62.86          36.66           62.86         36.66
Jan-Water.1976
Feb-Water.1976
Mar-Water.1976
Apr-Water.1976
May-Water.1976
Jun-Water.1976                3.94                           3.94
Jul-Water.1976                5.91           1.97            5.91          1.97
Aug-Water.1976                4.92           2.95            4.92          2.95
Sep-Water.1976
Oct-Water.1976
Nov-Water.1976
Dec-Water.1976

Yield.1977                    60.33          30.07           60.33         30.07
Jan-Water.1977
Feb-Water.1977
Mar-Water.1977
Apr-Water.1977
May-Water.1977                0.98                           0.98
Jun-Water.1977                3.94                           3.94
Jul-Water.1977                9.84           6.89            9.84          6.89
Aug-Water.1977                3.94           1.97            3.94          1.97
Sep-Water.1977
Oct-Water.1977
Nov-Water.1977
Dec-Water.1977

Yield.1979                    60.32          46.42           60.32         46.42
Jan-Water.1979
Feb-Water.1979
Mar-Water.1979
Apr-Water.1979
May-Water.1979
Jun-Water.1979                1.97                           1.97
Jul-Water.1979                4.92                           4.92
Aug-Water.1979                4.92           2.95            4.92          2.95
Sep-Water.1979
Oct-Water.1979
Nov-Water.1979
Dec-Water.1979

Yield.1981                    61.10          42.07           61.10         42.07
Jan-Water.1981
Feb-Water.1981
Mar-Water.1981
Apr-Water.1981
May-Water.1981
Jun-Water.1981                0.98                           0.98
Jul-Water.1981                6.89           1.97            6.89          1.97
Aug-Water.1981                3.94           2.95            3.94          2.95
Sep-Water.1981
Oct-Water.1981
Nov-Water.1981
Dec-Water.1981

Yield.1958                    66.64          24.51           66.64         24.51
Jan-Water.1958
Feb-Water.1958
Mar-Water.1958
Apr-Water.1958
May-Water.1958                1.97                           1.97
Jun-Water.1958                4.92           0.98            4.92          0.98
Jul-Water.1958                9.84           8.86            9.84          8.86
Aug-Water.1958                3.94           3.94            3.94          3.94
Sep-Water.1958
Oct-Water.1958
Nov-Water.1958
Dec-Water.1958

Yield.1987                    60.23          38.53           60.23         38.53
Jan-Water.1987
Feb-Water.1987
Mar-Water.1987
Apr-Water.1987                0.98                           0.98
May-Water.1987                0.98                           0.98
Jun-Water.1987                0.98                           0.98
Jul-Water.1987                8.86           2.95            8.86          2.95
Aug-Water.1987                4.92           2.95            4.92          2.95
Sep-Water.1987
Oct-Water.1987
Nov-Water.1987
Dec-Water.1987
 ;



TABLE oats(alli,years,allstrat)
                      O-Dryland
Yield.1956                 27


Yield.1951                 32


Yield.1963                 36


Yield.1989                 37


Yield.1952                 39

Yield.1996                 34


Yield.1980                 36

Yield.1982                 44


Yield.1969                 39


Yield.1974                 39

Yield.1972                 30

Yield.1976                 44


Yield.1977                 41


Yield.1979                 49


Yield.1981                 47

Yield.1958                 47

Yield.1987                 47

;

* CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
* End of Data
* CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC

