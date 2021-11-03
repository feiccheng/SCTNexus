Table MAG_climate(county,aquifer,decades)           the aquifer MAG by TWDB
                                                             2020              2030             2040              2050              2060              2070
Bastrop                .        Carrizo                     4692              5308              6042              7928              8204              8204
Fayette                .        Carrizo                     5474              5474              5474              5474              5474              5474
McMullen               .        Carrizo                     7056              7056              4405              4405              4405              4405
Atascosa               .        Carrizo                     67668             70286             71066             72718             74298             75874
Bexar                  .        Carrizo                     81474             80817             80348             79470             78977             78807
Caldwell               .        Carrizo                     61245             61245             57801             57801             54189             54189
Dimmit                 .        Carrizo                     4129              4129              4129              4129              4129              4129
Frio                   .        Carrizo                     111920            85036             82999             81083             79197             77353
Gonzales               .        Carrizo                     81653             81653             85431             85794             86047             86055
Guadalupe              .        Carrizo                     52527             47843             45775             47995             47965             47833
Karnes                 .        Carrizo                     1043              1085              1146              1213              1264              1295
LaSalle                .        Carrizo                     6863              6863              6863              6863              6863              6863
Maverick               .        Carrizo                     2042              2042              2001              1914              1569              1531
Medina                 .        Carrizo                     2657              2648              2648              2647              2646              2646
Uvalde                 .        Carrizo                     2975              1231              828               828               828               828
Webb                   .        Carrizo                     916               916               916               916               916               916
Wilson                 .        Carrizo                     108465            104917            106195            107653            109357            111093
Zavala                 .        Carrizo                     35653             35305             35171             35071             34750             34695
*Hays                   .        Edwards                     2599              2599              2599              2599              2599              2599
*Kinney                 .        Edwards                     6321              6321              6321              6321              6321              6321
*Travis                 .        Edwards                     1166              1166              1166              1166              1166              1166

Bandera                .        EdwardsTrinity              9293              9293              9293              9293              9293              9293
Bexar                  .        EdwardsTrinity              24856             24856             24856             24856             24856             24856
Blanco                 .        EdwardsTrinity              2573              2573              2573              2573              2573              2573
Caldwell               .        EdwardsTrinity              10                10                10                10                10                10
Comal                  .        EdwardsTrinity              43768             43768             43768             43768             43768             43768
Edwards                .        EdwardsTrinity              5676              5676              5676              5676              5676              5676
Gillespie              .        EdwardsTrinity              4979              4979              4979              4979              4979              4979
Guadalupe              .        EdwardsTrinity              660               660               660               660               660               660
Hays                   .        EdwardsTrinity              13250             13247             13246             13246             13246             13246
Kendall                .        EdwardsTrinity              11338             11338             11338             11338             11338             11338
Kerr                   .        EdwardsTrinity              14918             14845             14556             14239             14223             14223
Kinney                 .        EdwardsTrinity              70341             70341             70341             70341             70341             70341
Medina                 .        EdwardsTrinity              9161              9161              9161              9161              9161              9161
Real                   .        EdwardsTrinity              7523              7523              7523              7523              7523              7523
*Travis                 .        EdwardsTrinity              9343              9326              9314              9298              9269              9269
Uvalde                 .        EdwardsTrinity              2788              2788              2788              2788              2788              2788


Aransas                .        GulfCoast                   1542              1542              1542              1542              1542              1542
Bee                    .        GulfCoast                   18437             19837             20502             20781             20973             20973
Duval                  .        GulfCoast                   20571             22169             23764             25363             26963             26963
JimWells               .        GulfCoast                   9144              9683              10186             10725             11017             11017
LiveOak                .        GulfCoast                   8338              9343              8564              8441              8441              8441
Nueces                 .        GulfCoast                   6589              6947              7309              7667              7924              7924
SanPatricio            .        GulfCoast                   43611             45016             46422             47828             49234             49234
Calhoun                .        GulfCoast                   7565              7565              7565              7565              7565              7565
Dewitt                 .        GulfCoast                   15476             15476             14546             14485             14485             14485
Fayette                .        GulfCoast                   1853              1853              1853              1853              1853              1853
Goliad                 .        GulfCoast                   11539             11539             11539             11539             11552             11552
Karnes                 .        GulfCoast                   10196             10196             3015              2917              2751              2751
Lavaca                 .        GulfCoast                   20253             20253             20253             20253             20253             20253
McMullen               .        GulfCoast                   510               510               510               510               510               510
Refugio                .        GulfCoast                   321               321               321               321               321               321
Victoria               .        GulfCoast                   44974             49970             54966             54966             59963             59963
Webb                   .        GulfCoast                   620               789               959               1129              1299              1299

;

MAG_climate(county,aquifer,'2080') =MAG_climate(county,aquifer,'2070')            ;
MAG_climate(county,aquifer,'2090') =MAG_climate(county,aquifer,'2070')            ;

parameter MAG(county,aquifer)          the mag of auqifer by county;

MAG(county,aquifer) =MAG_climate(county,aquifer,'2020');

Table othersource(county,decades)       the MAG of other aquifer

                        2020              2030             2040              2050              2060              2070

Atascosa               5290              5731              5672              5596              5451              5315
Caldwell               307               307               307               307               307               307
Frio                   7804              5473              5275              5103              4908              4737
Gonzales               13334             13334             13334             13334             13334             13334
Karnes                 2059              2059              2059              2059              2059              2059
McMullen               446               446               446               446               446               446
Refugio                5526              5526              5526              5526              5526              5526
Wilson                 3243              1759              1563              1390              1235              1101
LaSalle                985               985               985               985               985               985
Bastrop                18433             20362             21658             23527             22281             22281
Fayette                14801             14795             14773             14764             14771             14771
Gillespie              8045              8045              8045              8045              8045              8045
Kendall                214               214               214               214               214               214
Uvalde                 13078             13078             13078             13078             13078             13078

;

othersource(county,'2080')= othersource(county,'2070');
othersource(county,'2090')= othersource(county,'2070');

Table exist_supply_climate(aquifer,county,decades)   exising water supply by aquifer
                                                        2020               2030             2040               2050              2060              2070

Carrizo                     .ATASCOSA                   56617             56618             56510             55787             55053             54618
Carrizo                     .BASTROP                    40                40                40                40                40                40
Carrizo                     .BEXAR                      33110             33172             33166             33165             33864             34489
Carrizo                     .CALDWELL                   9702              9673              9640              9602              9560              9528
Carrizo                     .DIMMIT                     3494              3604              3674              3762              3833              3892
Carrizo                     .FRIO                       83074             83107             81247             79331             77445             75601
Carrizo                     .GONZALES                   63257             62715             62716             62321             61927             61904
Carrizo                     .Guadalupe                  4466              3677              3800              3953              4116              4312
Carrizo                     .KARNES                     1027              1041              1054              1066              1067              1089
Carrizo                     .LASALLE                    6804              6804              6804              6804              6804              6804
Carrizo                     .MEDINA                     2614              2648              2648              2647              2646              2646
Carrizo                     .UVALDE                     799               828               828               828               828               828
Carrizo                     .WILSON                     29312             28934             28551             28168             27640             27145
Carrizo                     .ZAVALA                     33117             32932             32798             32698             32377             32322
$ontext
Edwards                     .ATASCOSA                   435               435               435               435               435               435
Edwards                     .BEXAR                      189491            189670            189851            190035            190216            190392
Edwards                     .COMAL                      10748             10748             10748             10748             10748             10748
Edwards                     .Guadalupe                  202               202               202               202               202               202
Edwards                     .HAYS                       7111              7110              7109              7108              7108              7108
Edwards                     .MEDINA                     25175             25175             25175             25175             25175             25175
Edwards                     .UVALDE                     15237             15237             15237             15237             15237             15237
$offtext
EdwardsTrinity              .BEXAR                      11639             10559             10352             11223             12218             13321
EdwardsTrinity              .BLANCO                     141               141               141               141               140               140
EdwardsTrinity              .COMAL                      17290             17284             17319             17332             17527             19127
EdwardsTrinity              .HAYS                       5842              5853              5856              5861              5864              5863
EdwardsTrinity              .KENDALL                    5519              5436              5595              5740              5765              5951
EdwardsTrinity              .MEDINA                     7027              6827              7027              6827              6777              5827
EdwardsTrinity              .UVALDE                     2770              2764              2788              2788              2788              2788
GulfCoast                   .Calhoun                    3161              3191              3206              3227              3254              3280
GulfCoast                   .DEWITT                     7089              7071              7723              7429              7318              7040
GulfCoast                   .GOLIAD                     7815              7847              7867              7874              7883              7888
GulfCoast                   .GONZALES                   1                 1                 1                 1                 1                 1
GulfCoast                   .KARNES                     3931              3962              3004              2912              2743              2741
*GulfCoast                   .LIVEOAK                    1                 1                 1                 1                 2                 1
GulfCoast                   .REFUGIO                    2539              2541              2500              2499              2490              2487
GulfCoast                   .VICTORIA                   24207             24210             24191             24176             24162             24153

Carrizo                     .MCMULLEN                   3907              4470              4401              2267              1495              950
GulfCoast                   .ARANSAS                    404               392               377               373               371               371
GulfCoast                   .BEE                        7768              7768              7764              7756              7751              7748
GulfCoast                   .DUVAL                      6936              6973              7005              7039              7074              7104
GulfCoast                   .JIMWELLS                   3721              3804              3881              3973              4057              4133
*GulfCoast                   .KENEDY                     1039              1055              1057              1058              1041              1025
*GulfCoast                   .KLEBERG                    8156              8385              8665              8978              9050              9247
GulfCoast                   .LIVEOAK                    4653              4726              4691              4502              4252              4093
GulfCoast                   .MCMULLEN                   510               510               510               510               510               510
GulfCoast                   .NUECES                     2914              2949              2956              2961              2969              2978
GulfCoast                   .SANPATRICIO                16383             16423             16441             16460             16478             16490
;




exist_supply_climate(aquifer,county,'2080')=exist_supply_climate(aquifer,county,'2070') ;
exist_supply_climate(aquifer,county,'2090')=exist_supply_climate(aquifer,county,'2070') ;


parameter    exist_supply(aquifer,county)      the existing supply from aquifer  ;

exist_supply(aquifer,county)
         =exist_supply_climate(aquifer,county,'2020')   ;

