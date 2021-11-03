Table waterdemand_climate_new(county,sector,decades)
                                          2020              2030              2040              2050              2060              2070

ARANSAS                     .min          10                7                 5                 5                 5                 5
ARANSAS                     .mun          4085              4080              3999              3987              3979              3979
ATASCOSA                    .ind          58                97                97                97                97                97
ATASCOSA                    .min          4081              4043              3935              3212              2478              2043
ATASCOSA                    .mun          8204              9223              10174             11158             12148             13077
BEE                         .min          472               458               428               372               338               318
BEE                         .mun          6439              6553              6547              6506              6496              6497
BEXAR                       .ind          5925              6776              6776              6776              6776              6776
BEXAR                       .min          7820              8740              9533              10404             11399             12502
BEXAR                       .mun          265338            289932            313393            338279            363282            386599
CALDWELL                    .ind          5                 5                 5                 5                 5                 5
CALDWELL                    .min          123               98                72                46                20                9
CALDWELL                    .mun          6001              7072              8195              9357              10590             11811
CALHOUN                     .ind          46130             52479             52479             52479             52479             52479
CALHOUN                     .min          52                55                41                30                19                12
CALHOUN                     .mun          3040              3271              3520              3791              4090              4384
COMAL                       .ind          4806              5788              5788              5788              5788              5788
COMAL                       .min          8600              9996              11340             12513             13982             15628
COMAL                       .mun          27981             34742             41665             48629             55769             62682
DEWITT                      .ind          272               344               344               344               344               344
DEWITT                      .min          3165              2973              2195              1422              650               301
DEWITT                      .mun          3962              3995              3979              3997              4027              4052
DIMMIT                      .min          4919              5001              4337              2824              1315              612
DIMMIT                      .mun          2411              2542              2623              2727              2812              2883
DUVAL                       .min          1388              1444              1352              1241              1165              1104
DUVAL                       .mun          2171              2236              2291              2353              2420              2477
FRIO                        .min          1217              1250              1178              986               620               390
FRIO                        .mun          3702              3991              4259              4535              4801              5047
GOLIAD                      .min          450               450               450               450               450               450
GOLIAD                      .mun          1211              1324              1395              1423              1449              1466
GONZALES                    .ind          2181              2427              2427              2427              2427              2427
GONZALES                    .min          1600              1207              813               418               24                1
GONZALES                    .mun          4908              5292              5674              6153              6665              7209
GUADALUPE                   .ind          4136              4523              4523              4523              4523              4523
GUADALUPE                   .min          456               550               639               755               884               1043
GUADALUPE                   .mun          24556             30784             35549             40356             45411             50420
HAYS                        .ind          48                56                56                56                56                56
HAYS                        .mun          23433             29294             36334             42233             52837             65003
JIMWELLS                    .ind          79                95                95                95                95                95
JIMWELLS                    .min          71                74                55                40                26                17
JIMWELLS                    .mun          8079              8524              8943              9459              9960              10434
KARNES                      .ind          131               155               155               155               155               155
KARNES                      .min          2528              1919              1288              662               35                2
KARNES                      .mun          3595              3636              3589              3568              3563              3563
KENDALL                     .mun          6782              8369              10060             11741             13538             15308
LASALLE                     .min          4617              4772              4263              2819              1380              676
LASALLE                     .mun          1807              1942              2072              2232              2379              2518
LIVEOAK                     .ind          2274              2493              2493              2493              2493              2493
LIVEOAK                     .min          814               917               907               729               492               332
LIVEOAK                     .mun          1816              1770              1733              1716              1703              1703
MCMULLEN                    .ind          219               249               249               249               249               249
MCMULLEN                    .min          4268              4804              4754              2622              1850              1305
MCMULLEN                    .mun          97                94                91                89                89                89
MEDINA                      .ind          63                67                67                67                67                67
MEDINA                      .min          1851              2057              2231              2407              2629              2872
MEDINA                      .mun          7799              8508              9116              9689              10260             10770
NUECES                      .ind          45411             50363             50363             50363             50363             50363
NUECES                      .min          724               853               947               1021              1130              1260
NUECES                      .mun          74908             79586             82244             83865             85444             86589
REFUGIO                     .min          66                69                51                38                24                15
REFUGIO                     .mun          1201              1200              1177              1189              1194              1200
SANPATRICIO                 .ind          38841             43223             43223             43223             43223             43223
SANPATRICIO                 .min          372               421               440               460               492               533
SANPATRICIO                 .mun          10255             10437             10495             10587             10696             10783
UVALDE                      .min          2661              2916              3037              3279              3564              3874
UVALDE                      .mun          6196              6626              7000              7434              7888              8334
VICTORIA                    .ind          8113              9234              9234              9234              9234              9234
VICTORIA                    .min          72                75                56                41                27                18
VICTORIA                    .mun          20139             21065             21782             22528             23253             23877
WILSON                      .ind          40                43                43                43                43                43
WILSON                      .min          1929              1548              1165              782               399               204
WILSON                      .mun          8344              10037             11710             13249             14759             16123
ZAVALA                      .ind          603               766               766               766               766               766
ZAVALA                      .min          2531              2257              1977              1559              932               557
ZAVALA                      .mun          2871              3133              3379              3651              3909              4151


;

waterdemand_climate_new(county,sector,'2080')
         $waterdemand_climate_new(county,sector,'2060')
         =waterdemand_climate_new(county,sector,'2070')
          *waterdemand_climate_new(county,sector,'2070')
          /waterdemand_climate_new(county,sector,'2060') ;
waterdemand_climate_new(county,sector,'2090')
         $waterdemand_climate_new(county,sector,'2060')
         =waterdemand_climate_new(county,sector,'2080')
         *waterdemand_climate_new(county,sector,'2070')
          /waterdemand_climate_new(county,sector,'2060') ;

parameter waterdemand_change_new(county,sector,decades)  ;

waterdemand_change_new(county,sector,decades)
         $waterdemand_climate_new(county,sector,'2020')
         = waterdemand_climate_new(county,sector,decades)
         /waterdemand_climate_new(county,sector,'2020');