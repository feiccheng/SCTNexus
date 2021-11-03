Table population_decades(decades, citycounty)   population by decades
*source: http://txsdc.utsa.edu/Data/TPEPP/Projections/
                     Nueces               KENDALL               BEXAR            WILSON                   KARNES

2020                 363776               47700                 2006193            52839                    15778
2030                 429517                67443                2502617            62283                    16415
2040                 470619                97357                2914615            72020                    17459
2050                 511454               137844                3353060            80620                    18742

        +            Duval             GUADALUPE                  KERR                COMAL             GILLESPIE

2020                 10860              169139                   53024              161328                27617
2030                 11363              221353                   54606              204873                27718
2040                 10700              280644                   55349              282548                28147
2050                  9974              351776                   56144              389584                28752


        +            BANDERA              Fayette                MEDINA                GOLIAD                HAYS


2020                23360                 26522                  54612                 8127                 232080
2030                21653                 27749                  55703                 8290                 347120
2040                20887                 28841                  59420                 8598                 509975
2050                20106                 30173                  61766                 8886                 746149



        +            GONZALES              BASTROP                Lavaca               DEWITT              CALDWELL

2020                 20819                   90262                20511                  20459                  43501
2030                 22724                   99211                23367                  23246                  50777
2040                 23661                  112145                26417                  24169                  56565
2050                 24377                  125002                30647                  24926                  62066


        +            VICTORIA               CALHOUN                BLANCO                             REFUGIO

2020                 90940                   22058                   12365                                6844
2030                 109048                  23741                   12407                                7631
2040                 118098                  23960                   12618                                7563
2050                 125663                  23939                   12599                                7570

$ontext
Travis

 1285526
 1540812
 1775204
 1980918

$offtext
        +           SANPATRICIO              REAL                 EDWARDS                UVALDE                KINNEY
2020                  67033                 3464                1979                     26260               3594
2030                  78235                 3373                1909                     30342               3377
2040                  82919                 3239                1761                     31588               3245
2050                  86360                 3194                1641                     32356               3129



        +            ZAVALA                DIMMIT               LASALLE              MCMULLEN                  FRIO

2020                12077                  9426                 7391                  748                    18937
2030                13549                  14065                9956                  773                    23163
2040                14037                  16413                11414                 768                    26098
2050                14264                  19069                12902                 736                    28849



        +          ATASCOSA               LIVEOAK                WEBB                JIMWELLS              MAVERICK

2020                51233                 12208                 280547                 39759                   58116
2030                60113                 12480                 298373                 43910                   64612
2040                67017                 12670                 308783                 43720                   66674
2050                73224                 13112                 308632                 43108                   67076



        +           ARANSAS                BEE

2020                23649                 33571
2030                33123                 36636
2040                38847                 38157
2050                46239                 39610

$ontext

        +     CorpusChristi            SanAntonio               VictoriaCity

2020               430809                2566404                  99067
2030               507752                3196038                  117338
2040               553538                3794508                  126696
2050               597814                4467980                  134549
$offtext

;






parameter population(citycounty) population in current scenario   ;

population(citycounty)=  population_decades('2020', citycounty) ;

population(county) =  population(county)*inregion_Pop_per(County) ;
parameter totalpop  total population in the region ;

totalpop= sum(county, population(county));


display population, totalpop;

parameter  mun_inc(citycounty) municipal water demand increase rate (same as population increase rate);

  mun_inc(citycounty)
         $population_decades( "2040", citycounty)
       = population_decades( "2050", citycounty)
        /population_decades( "2040", citycounty) ;

  mun_inc(citycounty)
         $(  mun_inc(citycounty) >1.3) =1.3;

 population_decades( "2060", citycounty)
        =  population_decades( "2050", citycounty) *   mun_inc(citycounty);
 population_decades( "2070", citycounty)
        =  population_decades( "2060", citycounty) *   mun_inc(citycounty);
 population_decades( "2080", citycounty)
        =  population_decades( "2070", citycounty) *   mun_inc(citycounty);
 population_decades( "2090", citycounty)
        =  population_decades( "2080", citycounty) *   mun_inc(citycounty);


parameter   populationpercentagechange(decades, citycounty);
 populationpercentagechange(decades, citycounty)
         $population_decades('2020', citycounty)
         = population_decades(decades, citycounty)
           /population_decades('2020', citycounty) ;

populationpercentagechange(decades, city)
        = sum(mapcitycountytocounty(city,county),
                 populationpercentagechange(decades, county));


parameter regionalPopulation(decades)  regional population  ;

regionalPopulation(decades)
  = sum(county,population_decades(decades, county));












































