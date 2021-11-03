Scalar       CostSprink   Cost of developing from furrolw to Sprinkler Irrigation
                       / 35.43/
             yesfixed     prop of fixed costs if developing from furrow to springkle
                       /0.2/;

alias(landirrtype, landirrtype2);
set table maplandtrans(landirrtype, landirrtype2)  allowable land transformations
                     Furrow         Sprinkler       Dryland       Pasture
Furrow                                yes              yes           yes
Sprinkler                                              yes           yes
Dryland                                                              yes  ;

table landtransfercost(landirrtype,landirrtype)     land transfer cost
         sprinkler    dryland     pasture
furrow     20           10          5
dryland                             5

;

set zones  the zones in each county/zone1*zone20, none/;
alias (zones, zones2);


*Data are updated on 12/15/2017
*Data source: USDA CropScape (Availland) and UDSA census and quickstats (landrent)


table AvailLand(county, zones, landirrtype)  Available land under each county and zones  in acres
                                  pasture        sprinkler      furrow         dryland
ARANSAS        .none             30665.85                                      3558.76
ARANSAS        .zone1                               0.23           0.15
ARANSAS        .zone2                              11.52           7.85
ATASCOSA       .none            647290.09                                     15277.43
ATASCOSA       .zone1                           15316.34
ATASCOSA       .zone2                               4.04
ATASCOSA       .zone3                             756.35
ATASCOSA       .zone4                              93.15
BANDERA        .none            261590.52                                      1169.19
BANDERA        .zone1                              26.89          18.32
BANDERA        .zone2                               0.53           0.36
BANDERA        .zone3                               3.98           2.71
BANDERA        .zone4                              49.32          33.60
BASTROP        .none             11673.14                                        17.21
BASTROP        .zone1                               0.92           0.63
BEE            .none            445939.32                                     42290.89
BEE            .zone1                             135.47          92.29
BEE            .zone2                            7622.15        5192.44
BEE            .zone3                             242.91         165.48
BEE            .zone4                               4.86           3.31
BEXAR          .none            268272.30                                     36117.13
BEXAR          .zone1                            1869.40        5057.38
BEXAR          .zone2                              11.75          31.78
BEXAR          .zone3                               6.89          18.64
BEXAR          .zone4                              45.48         123.03
BEXAR          .zone5                               0.03           0.07
BEXAR          .zone6                              46.25         125.13
BEXAR          .zone7                             978.80        2647.99
BEXAR          .zone8                               1.75           4.73
BLANCO         .none             71032.98                                       304.03
BLANCO         .zone1                              10.39           7.08
CALDWELL       .none            185343.65                                     22728.93
CALDWELL       .zone1                             773.30         298.50
CALDWELL       .zone2                             163.23          63.01
CALHOUN        .none                31.23                                         0.29
CALHOUN        .zone1                               0.08
CALHOUN        .zone2                               0.00
COMAL          .none            132244.23                                      4807.22
COMAL          .zone1                               0.02           0.01
COMAL          .zone2                               0.00           0.00
COMAL          .zone3                             174.93         119.17
COMAL          .zone4                              28.96          19.73
COMAL          .zone5                               0.04           0.03
COMAL          .zone6                              11.50           7.83
COMAL          .zone7                              18.29          12.46
COMAL          .zone8                               0.02           0.01
COMAL          .zone9                               0.00           0.00
COMAL          .zone10                              0.32           0.22
COMAL          .zone11                              0.21           0.14
DEWITT         .none            357695.38                                      9297.99
DEWITT         .zone1                              12.73
DEWITT         .zone2                               5.15
DEWITT         .zone3                             238.75
DEWITT         .zone4                              21.76
DIMMIT         .none            672749.88                                      1138.17
DIMMIT         .zone1                               0.12           0.45
DIMMIT         .zone2                            1493.73        5514.51
Duval          .none            248795.56                                        39.63
Duval          .zone1                               0.02           0.01
Duval          .zone2                               4.05           2.76
EDWARDS        .none            475879.52                                        54.02
EDWARDS        .zone1                              65.54          44.65
Fayette        .none             30110.71                                        69.53
Fayette        .zone1                               1.89           1.28
FRIO           .none            536773.18                                      6307.22
FRIO           .zone1                           28395.50        2218.40
FRIO           .zone2                            7098.62         554.58
GILLESPIE      .none             10647.80
GOLIAD         .none            439572.87                                     11596.07
GOLIAD         .zone1                               4.87           1.80
GOLIAD         .zone2                              88.02          32.58
GOLIAD         .zone3                              16.85           6.24
GONZALES       .none            515132.44                                      5892.66
GONZALES       .zone1                            1486.09         114.89
GONZALES       .zone2                              80.67           6.24
GUADALUPE      .none            249791.91                                     62987.41
GUADALUPE      .zone1                             975.48
GUADALUPE      .zone2                            2221.41
GUADALUPE      .zone3                             917.22
GUADALUPE      .zone4                             253.52
GUADALUPE      .zone5                              34.28
GUADALUPE      .zone6                              45.57
GUADALUPE      .zone7                             153.36
HAYS           .none             95814.56                                     11557.06
HAYS           .zone1                              86.66          59.03
HAYS           .zone2                              45.25          30.83
HAYS           .zone3                               0.00           0.00
HAYS           .zone4                               0.30           0.21
HAYS           .zone5                               0.01           0.01
JIMWELLS       .none             57002.99                                      5195.61
JIMWELLS       .zone1                             386.09         263.01
KARNES         .none            406004.80                                     26215.45
KARNES         .zone1                              64.24
KARNES         .zone2                               0.45
KARNES         .zone3                              29.22
KARNES         .zone4                              16.55
KARNES         .zone5                             149.78
KARNES         .zone6                               6.12
KARNES         .zone7                              97.46
KARNES         .zone8                             587.18
KARNES         .zone9                              28.43
KENDALL        .none            266214.60                                      1941.88
KENDALL        .zone1                             148.61          33.05
KENDALL        .zone2                              10.29           2.29
KERR           .none            340291.15                                      1087.86
KERR           .zone1                             210.88         143.66
KERR           .zone2                               3.38           2.30
KINNEY         .none            355332.18                                       354.33
KINNEY         .zone1                               6.98           4.75
KINNEY         .zone2                             402.56         274.24
KINNEY         .zone3                              21.44          14.61
KINNEY         .zone4                               0.83           0.56
LASALLE        .none            893881.93                                       815.35
LASALLE        .zone1                            5196.93
Lavaca         .none              4512.00                                        40.78
Lavaca         .zone1                               0.52           0.36
Lavaca         .zone2                               1.99           1.35
LIVEOAK        .none            598742.92                                     17477.21
LIVEOAK        .zone1                             609.98         415.53
LIVEOAK        .zone2                             107.29          73.09
LIVEOAK        .zone3                              39.10          26.64
LIVEOAK        .zone4                             191.71         130.60
MAVERICK       .none            312662.90                                        28.27
MAVERICK       .zone1                              41.20          28.07
MAVERICK       .zone2                              30.70          20.91
MCMULLEN       .none            696903.53                                      1296.79
MCMULLEN       .zone1                               0.34           0.23
MCMULLEN       .zone2                             110.61          75.35
MCMULLEN       .zone3                             324.21         220.86
MCMULLEN       .zone4                               5.60           3.82
MEDINA         .none            482974.59                                     29748.99
MEDINA         .zone1                               2.46           5.57
MEDINA         .zone2                               0.58           1.32
MEDINA         .zone3                               5.34          12.12
MEDINA         .zone4                               0.15           0.35
MEDINA         .zone5                           13184.75       29896.22
MEDINA         .zone6                            4278.12        9700.57
MEDINA         .zone7                               0.11           0.24
MEDINA         .zone8                               0.22           0.51
MEDINA         .zone9                              21.96          49.80
MEDINA         .zone10                             17.09          38.75
MEDINA         .zone11                              0.07           0.17
MEDINA         .zone12                              0.52           1.17
MEDINA         .zone13                           2585.12        5861.73
MEDINA         .zone14                             95.65         216.90
MEDINA         .zone15                              0.71           1.62
Nueces         .none             18612.59                                     22930.17
Nueces         .zone1                              15.72          10.71
Nueces         .zone2                               0.05           0.03
REAL           .none            209601.04                                       146.99
REAL           .zone1                              25.51          17.38
REFUGIO        .none            325032.63                                     81357.60
REFUGIO        .zone1                              67.86
REFUGIO        .zone2                            2998.95
SANPATRICIO    .none            114089.28                                    215818.69
SANPATRICIO    .zone1                            2304.50        1569.90
SANPATRICIO    .zone2                           14252.14        9708.98
*Travis         .none              3072.15                                        34.94
*Travis         .zone1                               0.88           0.60
*Travis         .zone2                               0.09           0.06
UVALDE         .none            693526.69                                     18973.32
UVALDE         .zone1                               3.28           6.04
UVALDE         .zone2                           24718.52       45485.54
UVALDE         .zone3                             120.58         221.89
UVALDE         .zone4                             530.89         976.91
UVALDE         .zone5                               0.06           0.12
UVALDE         .zone6                               3.33           6.13
UVALDE         .zone7                               5.57          10.26
UVALDE         .zone8                            3970.50        7306.28
UVALDE         .zone9                               2.79           5.13
VICTORIA       .none            178794.95                                      7885.72
VICTORIA       .zone1                              42.35        1088.35
VICTORIA       .zone2                               6.72         172.69
WEBB           .none            925045.51                                        52.21
WEBB           .zone1                               0.96           0.65
WEBB           .zone2                              11.14           7.59
WILSON         .none            390759.91                                     27626.94
WILSON         .zone1                             248.23
WILSON         .zone2                            2196.39
WILSON         .zone3                            6587.40
WILSON         .zone4                             241.92
ZAVALA         .none            703000.90                                      4610.28
ZAVALA         .zone1                               0.21           0.76
ZAVALA         .zone2                           12134.52       44374.42
ZAVALA         .zone3                             597.55        2185.17
;
set table   zonewatersource(county, zones, RiverAndAquifer)    mapping county zones to river and aquifer water source
                        EDWARDS          Nueces           GulfCoast                  EdwardsTrinity  Carrizo          GuadSA           Minor
ARANSAS        .zone1                                                                                                                     YES
ARANSAS        .zone2                                       YES                                                                           YES
ATASCOSA       .zone1                      YES                                                          YES
ATASCOSA       .zone2                      YES              YES                                         YES
ATASCOSA       .zone3     YES              YES                                                          YES
ATASCOSA       .zone4     YES                                                                           YES              YES
BANDERA        .zone1                      YES                                         YES
BANDERA        .zone2                                                                  YES                               YES
BANDERA        .zone3                      YES                                         YES
BANDERA        .zone4                                                                  YES                               YES
BASTROP        .zone1                                                                                   YES              YES
BEE            .zone1                      YES              YES
BEE            .zone2                                       YES                                                                           YES
BEE            .zone3                      YES              YES                                         YES
BEE            .zone4                                       YES                                         YES                               YES
BEXAR          .zone1     YES                                                                                            YES
BEXAR          .zone2                      YES                                                          YES
BEXAR          .zone3                                                                                   YES              YES
BEXAR          .zone4                                                                  YES                               YES
BEXAR          .zone5     YES                                                          YES                               YES
BEXAR          .zone6     YES              YES                                                          YES
BEXAR          .zone7     YES                                                                           YES              YES
BEXAR          .zone8     YES                                                          YES                               YES
BLANCO         .zone1                                                                  YES                               YES
CALDWELL       .zone1                                                                                                    YES
CALDWELL       .zone2                                                                                   YES              YES
CALHOUN        .zone1                                       YES                                                          YES
CALHOUN        .zone2                                       YES                                                                           YES
COMAL          .zone1                                                                                                    YES
COMAL          .zone2                                                                                                    YES
COMAL          .zone3     YES                                                                                            YES
COMAL          .zone4     YES                                                                                            YES
COMAL          .zone5                                                                  YES                               YES
COMAL          .zone6                                                                  YES                               YES
COMAL          .zone7                                                                  YES                               YES
COMAL          .zone8     YES                                                          YES                               YES
COMAL          .zone9     YES                                                          YES                               YES
COMAL          .zone10    YES                                                          YES                               YES
COMAL          .zone11    YES                                                          YES                               YES
DEWITT         .zone1                                       YES                                                          YES
DEWITT         .zone2                                       YES                                                          YES
DEWITT         .zone3                                       YES                                         YES              YES
DEWITT         .zone4                                       YES                                         YES              YES
DIMMIT         .zone1                      YES
DIMMIT         .zone2                      YES                                                          YES
Duval          .zone1                      YES
Duval          .zone2                      YES              YES
EDWARDS        .zone1                      YES                                         YES
Fayette        .zone1                                                                                   YES              YES
FRIO           .zone1                      YES                                                          YES
FRIO           .zone2     YES              YES                                                          YES
GOLIAD         .zone1                                       YES                                                          YES
GOLIAD         .zone2                                       YES                                                          YES
GOLIAD         .zone3                                       YES                                                                           YES
GONZALES       .zone1                                                                                   YES              YES
GONZALES       .zone2                                       YES                                         YES              YES
GUADALUPE      .zone1                                                                                                    YES
GUADALUPE      .zone2     YES                                                                                            YES
GUADALUPE      .zone3     YES                                                                                            YES
GUADALUPE      .zone4                                                                                   YES              YES
GUADALUPE      .zone5                                                                                   YES              YES
GUADALUPE      .zone6     YES                                                                           YES              YES
GUADALUPE      .zone7     YES                                                                           YES              YES
HAYS           .zone1                                                                                                    YES
HAYS           .zone2     YES                                                                                            YES
HAYS           .zone3     YES                                                                                            YES
HAYS           .zone4                                                                  YES                               YES
HAYS           .zone5     YES                                                          YES                               YES
JIMWELLS       .zone1                      YES              YES
KARNES         .zone1                                       YES                                                          YES
KARNES         .zone2                                       YES                                                                           YES
KARNES         .zone3                                                                                   YES              YES
KARNES         .zone4                      YES                                                          YES
KARNES         .zone5                                                                                   YES              YES
KARNES         .zone6                                       YES                                         YES              YES
KARNES         .zone7                      YES              YES                                         YES
KARNES         .zone8                                       YES                                         YES              YES
KARNES         .zone9                                       YES                                         YES                               YES
KENDALL        .zone1                                                                  YES                               YES
KENDALL        .zone2                                                                  YES                               YES
KERR           .zone1                                                                  YES                               YES
KERR           .zone2                                                                  YES                               YES
KINNEY         .zone1                      YES
KINNEY         .zone2     YES              YES
KINNEY         .zone3                      YES                                         YES
KINNEY         .zone4     YES              YES                                         YES
LASALLE        .zone1                      YES                                                          YES
Lavaca         .zone1                                                                                   YES              YES
Lavaca         .zone2                                       YES                                         YES              YES
LIVEOAK        .zone1                      YES              YES
LIVEOAK        .zone2                                       YES                                                                           YES
LIVEOAK        .zone3                      YES                                                          YES
LIVEOAK        .zone4                      YES              YES                                         YES
MAVERICK       .zone1                      YES
MAVERICK       .zone2                      YES                                                          YES
MCMULLEN       .zone1                      YES
MCMULLEN       .zone2                      YES              YES
MCMULLEN       .zone3                      YES                                                          YES
MCMULLEN       .zone4                      YES              YES                                         YES
MEDINA         .zone1                      YES
MEDINA         .zone2                                                                                                    YES
MEDINA         .zone3                      YES
MEDINA         .zone4                                                                                                    YES
MEDINA         .zone5     YES              YES
MEDINA         .zone6     YES                                                                                            YES
MEDINA         .zone7                      YES                                         YES
MEDINA         .zone8                                                                  YES                               YES
MEDINA         .zone9                      YES                                         YES
MEDINA         .zone10                                                                 YES                               YES
MEDINA         .zone11    YES              YES                                         YES
MEDINA         .zone12    YES                                                          YES                               YES
MEDINA         .zone13    YES              YES                                                          YES
MEDINA         .zone14    YES                                                                           YES              YES
MEDINA         .zone15    YES                                                          YES                               YES
Nueces         .zone1                      YES              YES
Nueces         .zone2                                       YES                                                                           YES
REAL           .zone1                      YES                                         YES
REFUGIO        .zone1                                       YES                                                          YES
REFUGIO        .zone2                                       YES                                                                           YES
SANPATRICIO    .zone1                      YES              YES
SANPATRICIO    .zone2                                       YES                                                                           YES
*Travis         .zone1                                                                                                    YES
*Travis         .zone2     YES                                                                                            YES
UVALDE         .zone1                      YES
UVALDE         .zone2     YES              YES
UVALDE         .zone3                      YES                                         YES
UVALDE         .zone4                      YES                                                          YES
UVALDE         .zone5     YES              YES
UVALDE         .zone6                      YES                                         YES
UVALDE         .zone7     YES              YES                                         YES
UVALDE         .zone8     YES              YES                                                          YES
UVALDE         .zone9     YES              YES                                         YES
VICTORIA       .zone1                                       YES                                                          YES
VICTORIA       .zone2                                       YES                                                          YES
WEBB           .zone1                      YES
WEBB           .zone2                      YES                                                          YES
WILSON         .zone1                                                                                   YES              YES
WILSON         .zone2                      YES                                                          YES
WILSON         .zone3                                                                                   YES              YES
WILSON         .zone4     YES                                                                           YES              YES
ZAVALA         .zone1                      YES
ZAVALA         .zone2                      YES                                                          YES
ZAVALA         .zone3     YES              YES                                                          YES
;


table landrent(county, landirrtype)  Land rent by county and land type

*source:  https://www.nass.usda.gov/Statistics_by_State/Texas/Publications/Current_News_Release/2017_Rls/tx_ce_cash_rent_2017.pdf
* http://quickstats.nass.usda.gov/results/E0F5EB36-3313-3D7B-9E7F-E56A3365CF2B#9A9F55D7-E267-38C6-ACB9-DF106291B5A7
                        pasture        irrigated      dryland
ARANSAS                   8.00          72.00          57.50
ATASCOSA                  8.30          50.00          15.50
BANDERA                   4.00          88.50          11.00
BASTROP                  12.50          89.00          13.50
BEE                      10.00          89.00          40.00
BEXAR                    12.00          94.00          17.50
BLANCO                    7.10          88.50          13.50
CALDWELL                 11.00          89.00          21.00
CALHOUN                   8.30          59.00          36.00
COMAL                     5.70          89.00          11.00
DEWITT                   11.50          89.00          21.00
DIMMIT                    4.10          78.50          11.00
Duval                     5.80          78.50          23.00
EDWARDS                   2.80          88.50           5.00
Fayette                  11.50          89.00          21.00
FRIO                      7.90          91.00          21.00
GILLESPIE                 7.30          60.00          14.50
GOLIAD                    8.50          89.00          17.00
GONZALES                 11.50          89.00          13.00
GUADALUPE                13.00          89.00          22.50
HAYS                      5.00          89.00          30.00
JIMWELLS                  8.80          78.50          44.00
KARNES                    9.00          89.00          21.00
KENDALL                   5.10          88.50          15.50
KERR                      5.90          88.50          17.50
KINNEY                    2.50          88.50          21.00
LASALLE                   4.60          78.50          23.00
Lavaca                   11.50          89.00          21.00
LIVEOAK                   8.20          78.50          15.00
MAVERICK                  5.80          78.50          15.00
MCMULLEN                  3.70          78.50          23.00
MEDINA                    8.00         100.00          23.50
Nueces                   13.00          72.00          61.00
REAL                      3.90          88.50          21.00
REFUGIO                   6.40          72.00          40.50
SANPATRICIO               8.00          72.00          67.00
*Travis                   11.50          89.00          21.00
UVALDE                    6.10          94.00          25.00
VICTORIA                 13.00          59.00          36.00
WEBB                      4.60          78.50           7.50
WILSON                   11.50          89.00          21.50
ZAVALA                    8.00          63.50          17.50
;



