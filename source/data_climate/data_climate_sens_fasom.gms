set Fregion
/TxCntBlack
 TxEdplat
 TxCoastBe
 TxSouth
 /;

set regioncountymap (Fregion, county) map regions defined by FASOM to counties
/TxEdplat. (Blanco, Comal, Edwards, Gillespie,Hays, Kendall,
                  Kerr, Real,  Bandera),
*Travis,
 TxCoastBe. (Aransas, Bee, Jimwells, Nueces, Refugio, SanPatricio,Calhoun,Victoria),

 TxCntBlack.(Bexar,Guadalupe, Caldwell,Dewitt, Lavaca, Gonzales,Fayette, Bastrop, Wilson),

 TxSouth.(Kinney, Uvalde, Medina, Maverick, Zavala, Frio, Atascosa, Dimmit,
        LaSalle, McMullen,Liveoak, Webb,Duval, Goliad, Karnes)
/


table  climatewaterF(Fregion, decades)   Canadian gcm

                           2015                 2020                 2030                 2040                 2060                 2070

TxCntBlack                6.481                8.646               12.962                6.481              -10.996              -21.993
TxEdplat                  4.441                5.924                8.882                4.441               -2.527               -5.053
TxCoastBe               -16.920              -22.571              -33.840              -16.920              -16.591              -33.182
TxSouth                   7.551               10.074               15.103                7.551               -0.915               -1.830
 ;

climatewaterF(Fregion, "2050")
      = (climatewaterF(Fregion, "2040") + climatewaterF(Fregion, "2060") )/2  ;


set animal      animals in FASOM
/Sheep                ,    CowCalf              ,    FeedlotBeefYearlings ,    FeedlotBeefCalves    ,    Dairy                ,    HogFarrowtofinish
FeederPigProduction  ,    PigFinishing         ,    HorsesandMule        ,    SteerCalfStocker     ,    HeiferCalfStocker    ,    SteerYearlingStocker
HeiferYearlingStocker,    ProduceTurkey        ,    Broiler              ,    Egg
/;
table climatelivestockF(decades, animal, Fregion)

                                        TxCntBlack             TxEdplat            TxCoastBe              TxSouth

2015.Sheep                               -2.500               -2.500               -2.500               -2.500
2015.CowCalf                             -2.500               -2.500               -2.500               -2.500
2015.FeedlotBeefYearlings                -0.750               -0.750               -0.750               -0.750
2015.FeedlotBeefCalves                   -0.750               -0.750               -0.750               -0.750
2015.Dairy                               -2.500               -2.500               -2.500               -2.500
2015.HogFarrowtofinish                   -2.500               -2.500               -2.500               -2.500
2015.FeederPigProduction                 -2.500               -2.500               -2.500               -2.500
2015.PigFinishing                        -2.500               -2.500               -2.500               -2.500
2015.SteerCalfStocker                    -0.750               -0.750               -0.750               -0.750
2015.HeiferCalfStocker                   -0.750               -0.750               -0.750               -0.750
2015.SteerYearlingStocker                -0.750               -0.750               -0.750               -0.750
2015.HeiferYearlingStocker               -0.750               -0.750               -0.750               -0.750
2020.Sheep                               -3.335               -3.335               -3.335               -3.335
2020.CowCalf                             -3.335               -3.335               -3.335               -3.335
2020.FeedlotBeefYearlings                -1.001               -1.001               -1.001               -1.001
2020.FeedlotBeefCalves                   -1.001               -1.001               -1.001               -1.001
2020.Dairy                               -3.335               -3.335               -3.335               -3.335
2020.HogFarrowtofinish                   -3.335               -3.335               -3.335               -3.335
2020.FeederPigProduction                 -3.335               -3.335               -3.335               -3.335
2020.PigFinishing                        -3.335               -3.335               -3.335               -3.335
2020.SteerCalfStocker                    -1.001               -1.001               -1.001               -1.001
2020.HeiferCalfStocker                   -1.001               -1.001               -1.001               -1.001
2020.SteerYearlingStocker                -1.001               -1.001               -1.001               -1.001
2020.HeiferYearlingStocker               -1.001               -1.001               -1.001               -1.001
2030.Sheep                               -5.000               -5.000               -5.000               -5.000
2030.CowCalf                             -5.000               -5.000               -5.000               -5.000
2030.FeedlotBeefYearlings                -1.500               -1.500               -1.500               -1.500
2030.FeedlotBeefCalves                   -1.500               -1.500               -1.500               -1.500
2030.Dairy                               -5.000               -5.000               -5.000               -5.000
2030.HogFarrowtofinish                   -5.000               -5.000               -5.000               -5.000
2030.FeederPigProduction                 -5.000               -5.000               -5.000               -5.000
2030.PigFinishing                        -5.000               -5.000               -5.000               -5.000
2030.SteerCalfStocker                    -1.500               -1.500               -1.500               -1.500
2030.HeiferCalfStocker                   -1.500               -1.500               -1.500               -1.500
2030.SteerYearlingStocker                -1.500               -1.500               -1.500               -1.500
2030.HeiferYearlingStocker               -1.500               -1.500               -1.500               -1.500
2040.Sheep                               -2.500               -2.500               -2.500               -2.500
2040.CowCalf                             -2.500               -2.500               -2.500               -2.500
2040.FeedlotBeefYearlings                -0.750               -0.750               -0.750               -0.750
2040.FeedlotBeefCalves                   -0.750               -0.750               -0.750               -0.750
2040.Dairy                               -2.500               -2.500               -2.500               -2.500
2040.HogFarrowtofinish                   -2.500               -2.500               -2.500               -2.500
2040.FeederPigProduction                 -2.500               -2.500               -2.500               -2.500
2040.PigFinishing                        -2.500               -2.500               -2.500               -2.500
2040.SteerCalfStocker                    -0.750               -0.750               -0.750               -0.750
2040.HeiferCalfStocker                   -0.750               -0.750               -0.750               -0.750
2040.SteerYearlingStocker                -0.750               -0.750               -0.750               -0.750
2040.HeiferYearlingStocker               -0.750               -0.750               -0.750               -0.750
2060.Sheep                               -2.500               -2.500               -2.500               -2.500
2060.CowCalf                             -2.500               -2.500               -2.500               -2.500
2060.FeedlotBeefYearlings                -0.750               -0.750               -0.750               -0.750
2060.FeedlotBeefCalves                   -0.750               -0.750               -0.750               -0.750
2060.Dairy                               -2.500               -2.500               -2.500               -2.500
2060.HogFarrowtofinish                   -2.500               -2.500               -2.500               -2.500
2060.FeederPigProduction                 -2.500               -2.500               -2.500               -2.500
2060.PigFinishing                        -2.500               -2.500               -2.500               -2.500
2060.SteerCalfStocker                    -0.750               -0.750               -0.750               -0.750
2060.HeiferCalfStocker                   -0.750               -0.750               -0.750               -0.750
2060.SteerYearlingStocker                -0.750               -0.750               -0.750               -0.750
2060.HeiferYearlingStocker               -0.750               -0.750               -0.750               -0.750
2070.Sheep                               -5.000               -5.000               -5.000               -5.000
2070.CowCalf                             -5.000               -5.000               -5.000               -5.000
2070.FeedlotBeefYearlings                -1.500               -1.500               -1.500               -1.500
2070.FeedlotBeefCalves                   -1.500               -1.500               -1.500               -1.500
2070.Dairy                               -5.000               -5.000               -5.000               -5.000
2070.HogFarrowtofinish                   -5.000               -5.000               -5.000               -5.000
2070.FeederPigProduction                 -5.000               -5.000               -5.000               -5.000
2070.PigFinishing                        -5.000               -5.000               -5.000               -5.000
2070.SteerCalfStocker                    -1.500               -1.500               -1.500               -1.500
2070.HeiferCalfStocker                   -1.500               -1.500               -1.500               -1.500
2070.SteerYearlingStocker                -1.500               -1.500               -1.500               -1.500
2070.HeiferYearlingStocker               -1.500               -1.500               -1.500               -1.500
;
climatelivestockF("2050", animal, Fregion)
          = (climatelivestockF("2040", animal, Fregion) +climatelivestockF("2060", animal, Fregion) )/2;


set Fcrops      crops in fasom
/
Cotton                  ,    Corn                    ,    Soybeans                ,    SoybeansDc              ,    SoftWhiteWheat
HardRedWinterWheat      ,    SoftRedWinterWheat      ,    DurumWheat              ,    HardRedSpringWheat      ,    Sorghum
Rice                    ,    Oats                    ,    WinterBarley            ,    SpringBarley            ,    Rye
Canola                  ,    Silage                  ,    Hay                     ,    Sugarcane               ,    Sugarbeet
Potatoes                ,    TomatoFrsh              ,    TomatoProc              ,    SwitchGrass             ,    Miscanthus
HybrdPoplar             ,    Willow                  ,    EnergySorghum           ,    SweetSorghum            ,    winterBarleyDC
OrangeFrsh              ,    OrangeProc              ,    GrpFrtFrsh              ,    GrpFrtProc              ,    OatsGrazing
WheatGrazing            ,    RyeGrazing              ,    OatsGrazeOut            ,    WheatGrazeOut           ,    RyeGrazeOut
improvepasture          ,    SwitchGrass_MarginalLand,    rcorn                   ,    rSoftWhiteWheat         ,    rDurumWheat
rHardRedSpringWheat     ,    rHardRedWinterWheat     ,    rSoftRedWinterWheat     ,    rsorghum                ,    rrice
roats                   ,    rWinterBarley           ,    rSpringBarley           /;

set citems /yld, wuse/;

table climatecropF(decades, Fregion, Fcrops, irrigstatus, citems)


                                                 DryLand.yld        Irrigated.yld       Irrigated.wuse


2015.TxCntBlack.Cotton                            11.095                2.620                3.392
2015.TxCntBlack.Corn                               1.800               -7.250              -11.600
2015.TxCntBlack.Soybeans                          -1.171               11.706               34.091
2015.TxCntBlack.SoybeansDc                        -1.171               11.706               34.091
2015.TxCntBlack.HardRedWinterWheat                -9.000               -2.750              -22.800
2015.TxCntBlack.Sorghum                           27.679                9.714               -1.115
2015.TxCntBlack.Rice                                                    2.876               -7.327
2015.TxCntBlack.Silage                             1.800               -7.250              -11.600
2015.TxCntBlack.Hay                              -18.295              -10.923               -2.859
2015.TxCntBlack.Sugarcane                         27.679                9.714               -1.115
2015.TxCntBlack.Sugarbeet                        -18.295              -10.923               -2.859
2015.TxCntBlack.Potatoes                          -8.500               -1.950                8.500
2015.TxCntBlack.TomatoFrsh                        27.679                9.714               -1.115
2015.TxCntBlack.TomatoProc                        27.679                9.714               -1.115
2015.TxCntBlack.SwitchGrass                      -18.295              -10.923               -2.859
2015.TxCntBlack.Miscanthus                       -18.295              -10.923               -2.859
2015.TxCntBlack.HybrdPoplar                      -18.295              -10.923               -2.859
2015.TxCntBlack.Willow                           -18.295              -10.923               -2.859
2015.TxCntBlack.EnergySorghum                     27.679                9.714               -1.115
2015.TxCntBlack.SweetSorghum                      27.679                9.714               -1.115
2015.TxCntBlack.OrangeFrsh                        27.679                9.714               -1.115
2015.TxCntBlack.OrangeProc                        27.679                9.714               -1.115
2015.TxCntBlack.GrpFrtFrsh                        27.679                9.714               -1.115
2015.TxCntBlack.GrpFrtProc                        27.679                9.714               -1.115
2015.TxCntBlack.WheatGrazing                      -9.000               -2.750              -22.800
2015.TxCntBlack.WheatGrazeOut                     -9.000               -2.750              -22.800
2015.TxCntBlack.rcorn                              1.800               -7.250              -11.600
2015.TxCntBlack.rHardRedWinterWheat               -9.000               -2.750              -22.800
2015.TxCntBlack.rsorghum                          27.679                9.714               -1.115
2015.TxCntBlack.rrice                                                   2.876               -7.327
2015.TxEdplat  .Cotton                            12.692                2.940                5.033
2015.TxEdplat  .Corn                               1.800               -7.250              -11.600
2015.TxEdplat  .Soybeans                          -1.171               11.706               34.091
2015.TxEdplat  .SoybeansDc                        -1.171               11.706               34.091
2015.TxEdplat  .HardRedWinterWheat                -9.000               -2.750              -22.800
2015.TxEdplat  .Sorghum                           27.679                9.714               -1.115
2015.TxEdplat  .Silage                             1.800               -7.250              -11.600
2015.TxEdplat  .Hay                              -12.633              -10.121               -2.614
2015.TxEdplat  .Sugarcane                         27.679                9.714               -1.115
2015.TxEdplat  .Sugarbeet                        -12.633              -10.121               -2.614
2015.TxEdplat  .Potatoes                          -8.500               -1.950                8.500
2015.TxEdplat  .TomatoFrsh                        27.679                9.714               -1.115
2015.TxEdplat  .TomatoProc                        27.679                9.714               -1.115
2015.TxEdplat  .SwitchGrass                      -12.633              -10.121               -2.614
2015.TxEdplat  .Miscanthus                       -12.633              -10.121               -2.614
2015.TxEdplat  .HybrdPoplar                      -12.633              -10.121               -2.614
2015.TxEdplat  .Willow                           -12.633              -10.121               -2.614
2015.TxEdplat  .EnergySorghum                     27.679                9.714               -1.115
2015.TxEdplat  .SweetSorghum                      27.679                9.714               -1.115
2015.TxEdplat  .OrangeFrsh                        27.679                9.714               -1.115
2015.TxEdplat  .OrangeProc                        27.679                9.714               -1.115
2015.TxEdplat  .GrpFrtFrsh                        27.679                9.714               -1.115
2015.TxEdplat  .GrpFrtProc                        27.679                9.714               -1.115
2015.TxEdplat  .WheatGrazing                      -9.000               -2.750              -22.800
2015.TxEdplat  .WheatGrazeOut                     -9.000               -2.750              -22.800
2015.TxEdplat  .rcorn                              1.800               -7.250              -11.600
2015.TxEdplat  .rHardRedWinterWheat               -9.000               -2.750              -22.800
2015.TxEdplat  .rsorghum                          27.679                9.714               -1.115
2015.TxCoastBe .Cotton                             3.249                3.203                7.842
2015.TxCoastBe .Corn                               1.800               -7.250              -11.600
2015.TxCoastBe .Soybeans                          -1.171               11.706               34.091
2015.TxCoastBe .SoybeansDc                        -1.171               11.706               34.091
2015.TxCoastBe .HardRedWinterWheat                -9.000               -2.750              -22.800
2015.TxCoastBe .Sorghum                           27.679                9.714               -1.115
2015.TxCoastBe .Rice                                                    2.876               -7.327
2015.TxCoastBe .Silage                             1.800               -7.250              -11.600
2015.TxCoastBe .Hay                              -12.633              -10.121                3.528
2015.TxCoastBe .Sugarcane                         27.679                9.714               -1.115
2015.TxCoastBe .Sugarbeet                        -12.633              -10.121                3.528
2015.TxCoastBe .Potatoes                          -8.500               -1.950                8.500
2015.TxCoastBe .TomatoFrsh                        27.679                9.714               -1.115
2015.TxCoastBe .TomatoProc                        27.679                9.714               -1.115
2015.TxCoastBe .SwitchGrass                      -12.633              -10.121                3.528
2015.TxCoastBe .Miscanthus                       -12.633              -10.121                3.528
2015.TxCoastBe .HybrdPoplar                      -12.633              -10.121                3.528
2015.TxCoastBe .Willow                           -12.633              -10.121                3.528
2015.TxCoastBe .EnergySorghum                     27.679                9.714               -1.115
2015.TxCoastBe .SweetSorghum                      27.679                9.714               -1.115
2015.TxCoastBe .OrangeFrsh                        27.679                9.714               -1.115
2015.TxCoastBe .OrangeProc                        27.679                9.714               -1.115
2015.TxCoastBe .GrpFrtFrsh                        27.679                9.714               -1.115
2015.TxCoastBe .GrpFrtProc                        27.679                9.714               -1.115
2015.TxCoastBe .WheatGrazing                      -9.000               -2.750              -22.800
2015.TxCoastBe .WheatGrazeOut                     -9.000               -2.750              -22.800
2015.TxCoastBe .rcorn                              1.800               -7.250              -11.600
2015.TxCoastBe .rHardRedWinterWheat               -9.000               -2.750              -22.800
2015.TxCoastBe .rsorghum                          27.679                9.714               -1.115
2015.TxCoastBe .rrice                                                   2.876               -7.327
2015.TxSouth   .Cotton                             8.776                4.966                7.899
2015.TxSouth   .Corn                               1.800               -7.250              -11.600
2015.TxSouth   .Soybeans                          -1.171               11.706               34.091
2015.TxSouth   .SoybeansDc                        -1.171               11.706               34.091
2015.TxSouth   .HardRedWinterWheat                -9.000               -2.750              -22.800
2015.TxSouth   .SoftRedWinterWheat                                                           9.750
2015.TxSouth   .Sorghum                           27.679                9.714                3.031
2015.TxSouth   .Rice                                                    3.170               -1.607
2015.TxSouth   .Silage                             1.800               -7.250              -11.600
2015.TxSouth   .Hay                              -12.633              -10.121               13.927
2015.TxSouth   .Sugarcane                         27.679                9.714                3.031
2015.TxSouth   .Sugarbeet                        -12.633              -10.121               13.927
2015.TxSouth   .Potatoes                          -8.500               -1.950                8.500
2015.TxSouth   .TomatoFrsh                        27.679                9.714                3.031
2015.TxSouth   .TomatoProc                        27.679                9.714                3.031
2015.TxSouth   .SwitchGrass                      -12.633              -10.121               13.927
2015.TxSouth   .Miscanthus                       -12.633              -10.121               13.927
2015.TxSouth   .HybrdPoplar                      -12.633              -10.121               13.927
2015.TxSouth   .Willow                           -12.633              -10.121               13.927
2015.TxSouth   .EnergySorghum                     27.679                9.714                3.031
2015.TxSouth   .SweetSorghum                      27.679                9.714                3.031
2015.TxSouth   .OrangeFrsh                        27.679                9.714                3.031
2015.TxSouth   .OrangeProc                        27.679                9.714                3.031
2015.TxSouth   .GrpFrtFrsh                        27.679                9.714                3.031
2015.TxSouth   .GrpFrtProc                        27.679                9.714                3.031
2015.TxSouth   .WheatGrazing                      -9.000               -2.750                9.750
2015.TxSouth   .WheatGrazeOut                     -9.000               -2.750                9.750
2015.TxSouth   .rcorn                              1.800               -7.250              -11.600
2015.TxSouth   .rHardRedWinterWheat               -9.000               -2.750              -22.800
2015.TxSouth   .rSoftRedWinterWheat                                                          9.750
2015.TxSouth   .rsorghum                          27.679                9.714                3.031
2015.TxSouth   .rrice                                                   3.170               -1.607
2020.TxCntBlack.Cotton                            14.800                3.496                4.525
2020.TxCntBlack.Corn                               2.401               -9.672              -15.474
2020.TxCntBlack.Soybeans                          -1.563               15.616               45.477
2020.TxCntBlack.SoybeansDc                        -1.563               15.616               45.477
2020.TxCntBlack.HardRedWinterWheat               -12.006               -3.669              -30.415
2020.TxCntBlack.Sorghum                           36.924               12.958               -1.488
2020.TxCntBlack.Rice                                                    3.836               -9.775
2020.TxCntBlack.Silage                             2.401               -9.672              -15.474
2020.TxCntBlack.Hay                              -24.406              -14.571               -3.814
2020.TxCntBlack.Sugarcane                         36.924               12.958               -1.488
2020.TxCntBlack.Sugarbeet                        -24.406              -14.571               -3.814
2020.TxCntBlack.Potatoes                         -11.339               -2.601               11.339
2020.TxCntBlack.TomatoFrsh                        36.924               12.958               -1.488
2020.TxCntBlack.TomatoProc                        36.924               12.958               -1.488
2020.TxCntBlack.SwitchGrass                      -24.406              -14.571               -3.814
2020.TxCntBlack.Miscanthus                       -24.406              -14.571               -3.814
2020.TxCntBlack.HybrdPoplar                      -24.406              -14.571               -3.814
2020.TxCntBlack.Willow                           -24.406              -14.571               -3.814
2020.TxCntBlack.EnergySorghum                     36.924               12.958               -1.488
2020.TxCntBlack.SweetSorghum                      36.924               12.958               -1.488
2020.TxCntBlack.OrangeFrsh                        36.924               12.958               -1.488
2020.TxCntBlack.OrangeProc                        36.924               12.958               -1.488
2020.TxCntBlack.GrpFrtFrsh                        36.924               12.958               -1.488
2020.TxCntBlack.GrpFrtProc                        36.924               12.958               -1.488
2020.TxCntBlack.WheatGrazing                     -12.006               -3.669              -30.415
2020.TxCntBlack.WheatGrazeOut                    -12.006               -3.669              -30.415
2020.TxCntBlack.rcorn                              2.401               -9.672              -15.474
2020.TxCntBlack.rHardRedWinterWheat              -12.006               -3.669              -30.415
2020.TxCntBlack.rsorghum                          36.924               12.958               -1.488
2020.TxCntBlack.rrice                                                   3.836               -9.775
2020.TxEdplat  .Cotton                            16.931                3.922                6.715
2020.TxEdplat  .Corn                               2.401               -9.672              -15.474
2020.TxEdplat  .Soybeans                          -1.563               15.616               45.477
2020.TxEdplat  .SoybeansDc                        -1.563               15.616               45.477
2020.TxEdplat  .HardRedWinterWheat               -12.006               -3.669              -30.415
2020.TxEdplat  .Sorghum                           36.924               12.958               -1.488
2020.TxEdplat  .Silage                             2.401               -9.672              -15.474
2020.TxEdplat  .Hay                              -16.852              -13.501               -3.486
2020.TxEdplat  .Sugarcane                         36.924               12.958               -1.488
2020.TxEdplat  .Sugarbeet                        -16.852              -13.501               -3.486
2020.TxEdplat  .Potatoes                         -11.339               -2.601               11.339
2020.TxEdplat  .TomatoFrsh                        36.924               12.958               -1.488
2020.TxEdplat  .TomatoProc                        36.924               12.958               -1.488
2020.TxEdplat  .SwitchGrass                      -16.852              -13.501               -3.486
2020.TxEdplat  .Miscanthus                       -16.852              -13.501               -3.486
2020.TxEdplat  .HybrdPoplar                      -16.852              -13.501               -3.486
2020.TxEdplat  .Willow                           -16.852              -13.501               -3.486
2020.TxEdplat  .EnergySorghum                     36.924               12.958               -1.488
2020.TxEdplat  .SweetSorghum                      36.924               12.958               -1.488
2020.TxEdplat  .OrangeFrsh                        36.924               12.958               -1.488
2020.TxEdplat  .OrangeProc                        36.924               12.958               -1.488
2020.TxEdplat  .GrpFrtFrsh                        36.924               12.958               -1.488
2020.TxEdplat  .GrpFrtProc                        36.924               12.958               -1.488
2020.TxEdplat  .WheatGrazing                     -12.006               -3.669              -30.415
2020.TxEdplat  .WheatGrazeOut                    -12.006               -3.669              -30.415
2020.TxEdplat  .rcorn                              2.401               -9.672              -15.474
2020.TxEdplat  .rHardRedWinterWheat              -12.006               -3.669              -30.415
2020.TxEdplat  .rsorghum                          36.924               12.958               -1.488
2020.TxCoastBe .Cotton                             4.333                4.272               10.461
2020.TxCoastBe .Corn                               2.401               -9.672              -15.474
2020.TxCoastBe .Soybeans                          -1.563               15.616               45.477
2020.TxCoastBe .SoybeansDc                        -1.563               15.616               45.477
2020.TxCoastBe .HardRedWinterWheat               -12.006               -3.669              -30.415
2020.TxCoastBe .Sorghum                           36.924               12.958               -1.488
2020.TxCoastBe .Rice                                                    3.836               -9.775
2020.TxCoastBe .Silage                             2.401               -9.672              -15.474
2020.TxCoastBe .Hay                              -16.852              -13.501                4.706
2020.TxCoastBe .Sugarcane                         36.924               12.958               -1.488
2020.TxCoastBe .Sugarbeet                        -16.852              -13.501                4.706
2020.TxCoastBe .Potatoes                         -11.339               -2.601               11.339
2020.TxCoastBe .TomatoFrsh                        36.924               12.958               -1.488
2020.TxCoastBe .TomatoProc                        36.924               12.958               -1.488
2020.TxCoastBe .SwitchGrass                      -16.852              -13.501                4.706
2020.TxCoastBe .Miscanthus                       -16.852              -13.501                4.706
2020.TxCoastBe .HybrdPoplar                      -16.852              -13.501                4.706
2020.TxCoastBe .Willow                           -16.852              -13.501                4.706
2020.TxCoastBe .EnergySorghum                     36.924               12.958               -1.488
2020.TxCoastBe .SweetSorghum                      36.924               12.958               -1.488
2020.TxCoastBe .OrangeFrsh                        36.924               12.958               -1.488
2020.TxCoastBe .OrangeProc                        36.924               12.958               -1.488
2020.TxCoastBe .GrpFrtFrsh                        36.924               12.958               -1.488
2020.TxCoastBe .GrpFrtProc                        36.924               12.958               -1.488
2020.TxCoastBe .WheatGrazing                     -12.006               -3.669              -30.415
2020.TxCoastBe .WheatGrazeOut                    -12.006               -3.669              -30.415
2020.TxCoastBe .rcorn                              2.401               -9.672              -15.474
2020.TxCoastBe .rHardRedWinterWheat              -12.006               -3.669              -30.415
2020.TxCoastBe .rsorghum                          36.924               12.958               -1.488
2020.TxCoastBe .rrice                                                   3.836               -9.775
2020.TxSouth   .Cotton                            11.707                6.625               10.537
2020.TxSouth   .Corn                               2.401               -9.672              -15.474
2020.TxSouth   .Soybeans                          -1.563               15.616               45.477
2020.TxSouth   .SoybeansDc                        -1.563               15.616               45.477
2020.TxSouth   .HardRedWinterWheat               -12.006               -3.669              -30.415
2020.TxSouth   .SoftRedWinterWheat                                                          13.007
2020.TxSouth   .Sorghum                           36.924               12.958                4.043
2020.TxSouth   .Rice                                                    4.229               -2.144
2020.TxSouth   .Silage                             2.401               -9.672              -15.474
2020.TxSouth   .Hay                              -16.852              -13.501               18.579
2020.TxSouth   .Sugarcane                         36.924               12.958                4.043
2020.TxSouth   .Sugarbeet                        -16.852              -13.501               18.579
2020.TxSouth   .Potatoes                         -11.339               -2.601               11.339
2020.TxSouth   .TomatoFrsh                        36.924               12.958                4.043
2020.TxSouth   .TomatoProc                        36.924               12.958                4.043
2020.TxSouth   .SwitchGrass                      -16.852              -13.501               18.579
2020.TxSouth   .Miscanthus                       -16.852              -13.501               18.579
2020.TxSouth   .HybrdPoplar                      -16.852              -13.501               18.579
2020.TxSouth   .Willow                           -16.852              -13.501               18.579
2020.TxSouth   .EnergySorghum                     36.924               12.958                4.043
2020.TxSouth   .SweetSorghum                      36.924               12.958                4.043
2020.TxSouth   .OrangeFrsh                        36.924               12.958                4.043
2020.TxSouth   .OrangeProc                        36.924               12.958                4.043
2020.TxSouth   .GrpFrtFrsh                        36.924               12.958                4.043
2020.TxSouth   .GrpFrtProc                        36.924               12.958                4.043
2020.TxSouth   .WheatGrazing                     -12.006               -3.669               13.007
2020.TxSouth   .WheatGrazeOut                    -12.006               -3.669               13.007
2020.TxSouth   .rcorn                              2.401               -9.672              -15.474
2020.TxSouth   .rHardRedWinterWheat              -12.006               -3.669              -30.415
2020.TxSouth   .rSoftRedWinterWheat                                                         13.007
2020.TxSouth   .rsorghum                          36.924               12.958                4.043
2020.TxSouth   .rrice                                                   4.229               -2.144
2030.TxCntBlack.Cotton                            22.189                5.241                6.784
2030.TxCntBlack.Corn                               3.600              -14.500              -23.200
2030.TxCntBlack.Soybeans                          -2.343               23.412               68.182
2030.TxCntBlack.SoybeansDc                        -2.343               23.412               68.182
2030.TxCntBlack.HardRedWinterWheat               -18.000               -5.500              -45.600
2030.TxCntBlack.Sorghum                           55.358               19.427               -2.231
2030.TxCntBlack.Rice                                                    5.751              -14.655
2030.TxCntBlack.Silage                             3.600              -14.500              -23.200
2030.TxCntBlack.Hay                              -36.591              -21.846               -5.718
2030.TxCntBlack.Sugarcane                         55.358               19.427               -2.231
2030.TxCntBlack.Sugarbeet                        -36.591              -21.846               -5.718
2030.TxCntBlack.Potatoes                         -17.000               -3.900               17.000
2030.TxCntBlack.TomatoFrsh                        55.358               19.427               -2.231
2030.TxCntBlack.TomatoProc                        55.358               19.427               -2.231
2030.TxCntBlack.SwitchGrass                      -36.591              -21.846               -5.718
2030.TxCntBlack.Miscanthus                       -36.591              -21.846               -5.718
2030.TxCntBlack.HybrdPoplar                      -36.591              -21.846               -5.718
2030.TxCntBlack.Willow                           -36.591              -21.846               -5.718
2030.TxCntBlack.EnergySorghum                     55.358               19.427               -2.231
2030.TxCntBlack.SweetSorghum                      55.358               19.427               -2.231
2030.TxCntBlack.OrangeFrsh                        55.358               19.427               -2.231
2030.TxCntBlack.OrangeProc                        55.358               19.427               -2.231
2030.TxCntBlack.GrpFrtFrsh                        55.358               19.427               -2.231
2030.TxCntBlack.GrpFrtProc                        55.358               19.427               -2.231
2030.TxCntBlack.WheatGrazing                     -18.000               -5.500              -45.600
2030.TxCntBlack.WheatGrazeOut                    -18.000               -5.500              -45.600
2030.TxCntBlack.rcorn                              3.600              -14.500              -23.200
2030.TxCntBlack.rHardRedWinterWheat              -18.000               -5.500              -45.600
2030.TxCntBlack.rsorghum                          55.358               19.427               -2.231
2030.TxCntBlack.rrice                                                   5.751              -14.655
2030.TxEdplat  .Cotton                            25.384                5.880               10.067
2030.TxEdplat  .Corn                               3.600              -14.500              -23.200
2030.TxEdplat  .Soybeans                          -2.343               23.412               68.182
2030.TxEdplat  .SoybeansDc                        -2.343               23.412               68.182
2030.TxEdplat  .HardRedWinterWheat               -18.000               -5.500              -45.600
2030.TxEdplat  .Sorghum                           55.358               19.427               -2.231
2030.TxEdplat  .Silage                             3.600              -14.500              -23.200
2030.TxEdplat  .Hay                              -25.265              -20.242               -5.227
2030.TxEdplat  .Sugarcane                         55.358               19.427               -2.231
2030.TxEdplat  .Sugarbeet                        -25.265              -20.242               -5.227
2030.TxEdplat  .Potatoes                         -17.000               -3.900               17.000
2030.TxEdplat  .TomatoFrsh                        55.358               19.427               -2.231
2030.TxEdplat  .TomatoProc                        55.358               19.427               -2.231
2030.TxEdplat  .SwitchGrass                      -25.265              -20.242               -5.227
2030.TxEdplat  .Miscanthus                       -25.265              -20.242               -5.227
2030.TxEdplat  .HybrdPoplar                      -25.265              -20.242               -5.227
2030.TxEdplat  .Willow                           -25.265              -20.242               -5.227
2030.TxEdplat  .EnergySorghum                     55.358               19.427               -2.231
2030.TxEdplat  .SweetSorghum                      55.358               19.427               -2.231
2030.TxEdplat  .OrangeFrsh                        55.358               19.427               -2.231
2030.TxEdplat  .OrangeProc                        55.358               19.427               -2.231
2030.TxEdplat  .GrpFrtFrsh                        55.358               19.427               -2.231
2030.TxEdplat  .GrpFrtProc                        55.358               19.427               -2.231
2030.TxEdplat  .WheatGrazing                     -18.000               -5.500              -45.600
2030.TxEdplat  .WheatGrazeOut                    -18.000               -5.500              -45.600
2030.TxEdplat  .rcorn                              3.600              -14.500              -23.200
2030.TxEdplat  .rHardRedWinterWheat              -18.000               -5.500              -45.600
2030.TxEdplat  .rsorghum                          55.358               19.427               -2.231
2030.TxCoastBe .Cotton                             6.497                6.405               15.684
2030.TxCoastBe .Corn                               3.600              -14.500              -23.200
2030.TxCoastBe .Soybeans                          -2.343               23.412               68.182
2030.TxCoastBe .SoybeansDc                        -2.343               23.412               68.182
2030.TxCoastBe .HardRedWinterWheat               -18.000               -5.500              -45.600
2030.TxCoastBe .Sorghum                           55.358               19.427               -2.231
2030.TxCoastBe .Rice                                                    5.751              -14.655
2030.TxCoastBe .Silage                             3.600              -14.500              -23.200
2030.TxCoastBe .Hay                              -25.265              -20.242                7.056
2030.TxCoastBe .Sugarcane                         55.358               19.427               -2.231
2030.TxCoastBe .Sugarbeet                        -25.265              -20.242                7.056
2030.TxCoastBe .Potatoes                         -17.000               -3.900               17.000
2030.TxCoastBe .TomatoFrsh                        55.358               19.427               -2.231
2030.TxCoastBe .TomatoProc                        55.358               19.427               -2.231
2030.TxCoastBe .SwitchGrass                      -25.265              -20.242                7.056
2030.TxCoastBe .Miscanthus                       -25.265              -20.242                7.056
2030.TxCoastBe .HybrdPoplar                      -25.265              -20.242                7.056
2030.TxCoastBe .Willow                           -25.265              -20.242                7.056
2030.TxCoastBe .EnergySorghum                     55.358               19.427               -2.231
2030.TxCoastBe .SweetSorghum                      55.358               19.427               -2.231
2030.TxCoastBe .OrangeFrsh                        55.358               19.427               -2.231
2030.TxCoastBe .OrangeProc                        55.358               19.427               -2.231
2030.TxCoastBe .GrpFrtFrsh                        55.358               19.427               -2.231
2030.TxCoastBe .GrpFrtProc                        55.358               19.427               -2.231
2030.TxCoastBe .WheatGrazing                     -18.000               -5.500              -45.600
2030.TxCoastBe .WheatGrazeOut                    -18.000               -5.500              -45.600
2030.TxCoastBe .rcorn                              3.600              -14.500              -23.200
2030.TxCoastBe .rHardRedWinterWheat              -18.000               -5.500              -45.600
2030.TxCoastBe .rsorghum                          55.358               19.427               -2.231
2030.TxCoastBe .rrice                                                   5.751              -14.655
2030.TxSouth   .Cotton                            17.552                9.932               15.798
2030.TxSouth   .Corn                               3.600              -14.500              -23.200
2030.TxSouth   .Soybeans                          -2.343               23.412               68.182
2030.TxSouth   .SoybeansDc                        -2.343               23.412               68.182
2030.TxSouth   .HardRedWinterWheat               -18.000               -5.500              -45.600
2030.TxSouth   .SoftRedWinterWheat                                                          19.500
2030.TxSouth   .Sorghum                           55.358               19.427                6.061
2030.TxSouth   .Rice                                                    6.340               -3.215
2030.TxSouth   .Silage                             3.600              -14.500              -23.200
2030.TxSouth   .Hay                              -25.265              -20.242               27.854
2030.TxSouth   .Sugarcane                         55.358               19.427                6.061
2030.TxSouth   .Sugarbeet                        -25.265              -20.242               27.854
2030.TxSouth   .Potatoes                         -17.000               -3.900               17.000
2030.TxSouth   .TomatoFrsh                        55.358               19.427                6.061
2030.TxSouth   .TomatoProc                        55.358               19.427                6.061
2030.TxSouth   .SwitchGrass                      -25.265              -20.242               27.854
2030.TxSouth   .Miscanthus                       -25.265              -20.242               27.854
2030.TxSouth   .HybrdPoplar                      -25.265              -20.242               27.854
2030.TxSouth   .Willow                           -25.265              -20.242               27.854
2030.TxSouth   .EnergySorghum                     55.358               19.427                6.061
2030.TxSouth   .SweetSorghum                      55.358               19.427                6.061
2030.TxSouth   .OrangeFrsh                        55.358               19.427                6.061
2030.TxSouth   .OrangeProc                        55.358               19.427                6.061
2030.TxSouth   .GrpFrtFrsh                        55.358               19.427                6.061
2030.TxSouth   .GrpFrtProc                        55.358               19.427                6.061
2030.TxSouth   .WheatGrazing                     -18.000               -5.500               19.500
2030.TxSouth   .WheatGrazeOut                    -18.000               -5.500               19.500
2030.TxSouth   .rcorn                              3.600              -14.500              -23.200
2030.TxSouth   .rHardRedWinterWheat              -18.000               -5.500              -45.600
2030.TxSouth   .rSoftRedWinterWheat                                                         19.500
2030.TxSouth   .rsorghum                          55.358               19.427                6.061
2030.TxSouth   .rrice                                                   6.340               -3.215
2040.TxCntBlack.Cotton                            11.095                2.620                3.392
2040.TxCntBlack.Corn                               1.800               -7.250              -11.600
2040.TxCntBlack.Soybeans                          -1.171               11.706               34.091
2040.TxCntBlack.SoybeansDc                        -1.171               11.706               34.091
2040.TxCntBlack.HardRedWinterWheat                -9.000               -2.750              -22.800
2040.TxCntBlack.Sorghum                           27.679                9.714               -1.115
2040.TxCntBlack.Rice                                                    2.876               -7.327
2040.TxCntBlack.Silage                             1.800               -7.250              -11.600
2040.TxCntBlack.Hay                              -18.295              -10.923               -2.859
2040.TxCntBlack.Sugarcane                         27.679                9.714               -1.115
2040.TxCntBlack.Sugarbeet                        -18.295              -10.923               -2.859
2040.TxCntBlack.Potatoes                          -8.500               -1.950                8.500
2040.TxCntBlack.TomatoFrsh                        27.679                9.714               -1.115
2040.TxCntBlack.TomatoProc                        27.679                9.714               -1.115
2040.TxCntBlack.SwitchGrass                      -18.295              -10.923               -2.859
2040.TxCntBlack.Miscanthus                       -18.295              -10.923               -2.859
2040.TxCntBlack.HybrdPoplar                      -18.295              -10.923               -2.859
2040.TxCntBlack.Willow                           -18.295              -10.923               -2.859
2040.TxCntBlack.EnergySorghum                     27.679                9.714               -1.115
2040.TxCntBlack.SweetSorghum                      27.679                9.714               -1.115
2040.TxCntBlack.OrangeFrsh                        27.679                9.714               -1.115
2040.TxCntBlack.OrangeProc                        27.679                9.714               -1.115
2040.TxCntBlack.GrpFrtFrsh                        27.679                9.714               -1.115
2040.TxCntBlack.GrpFrtProc                        27.679                9.714               -1.115
2040.TxCntBlack.WheatGrazing                      -9.000               -2.750              -22.800
2040.TxCntBlack.WheatGrazeOut                     -9.000               -2.750              -22.800
2040.TxCntBlack.rcorn                              1.800               -7.250              -11.600
2040.TxCntBlack.rHardRedWinterWheat               -9.000               -2.750              -22.800
2040.TxCntBlack.rsorghum                          27.679                9.714               -1.115
2040.TxCntBlack.rrice                                                   2.876               -7.327
2040.TxEdplat  .Cotton                            12.692                2.940                5.033
2040.TxEdplat  .Corn                               1.800               -7.250              -11.600
2040.TxEdplat  .Soybeans                          -1.171               11.706               34.091
2040.TxEdplat  .SoybeansDc                        -1.171               11.706               34.091
2040.TxEdplat  .HardRedWinterWheat                -9.000               -2.750              -22.800
2040.TxEdplat  .Sorghum                           27.679                9.714               -1.115
2040.TxEdplat  .Silage                             1.800               -7.250              -11.600
2040.TxEdplat  .Hay                              -12.633              -10.121               -2.614
2040.TxEdplat  .Sugarcane                         27.679                9.714               -1.115
2040.TxEdplat  .Sugarbeet                        -12.633              -10.121               -2.614
2040.TxEdplat  .Potatoes                          -8.500               -1.950                8.500
2040.TxEdplat  .TomatoFrsh                        27.679                9.714               -1.115
2040.TxEdplat  .TomatoProc                        27.679                9.714               -1.115
2040.TxEdplat  .SwitchGrass                      -12.633              -10.121               -2.614
2040.TxEdplat  .Miscanthus                       -12.633              -10.121               -2.614
2040.TxEdplat  .HybrdPoplar                      -12.633              -10.121               -2.614
2040.TxEdplat  .Willow                           -12.633              -10.121               -2.614
2040.TxEdplat  .EnergySorghum                     27.679                9.714               -1.115
2040.TxEdplat  .SweetSorghum                      27.679                9.714               -1.115
2040.TxEdplat  .OrangeFrsh                        27.679                9.714               -1.115
2040.TxEdplat  .OrangeProc                        27.679                9.714               -1.115
2040.TxEdplat  .GrpFrtFrsh                        27.679                9.714               -1.115
2040.TxEdplat  .GrpFrtProc                        27.679                9.714               -1.115
2040.TxEdplat  .WheatGrazing                      -9.000               -2.750              -22.800
2040.TxEdplat  .WheatGrazeOut                     -9.000               -2.750              -22.800
2040.TxEdplat  .rcorn                              1.800               -7.250              -11.600
2040.TxEdplat  .rHardRedWinterWheat               -9.000               -2.750              -22.800
2040.TxEdplat  .rsorghum                          27.679                9.714               -1.115
2040.TxCoastBe .Cotton                             3.249                3.203                7.842
2040.TxCoastBe .Corn                               1.800               -7.250              -11.600
2040.TxCoastBe .Soybeans                          -1.171               11.706               34.091
2040.TxCoastBe .SoybeansDc                        -1.171               11.706               34.091
2040.TxCoastBe .HardRedWinterWheat                -9.000               -2.750              -22.800
2040.TxCoastBe .Sorghum                           27.679                9.714               -1.115
2040.TxCoastBe .Rice                                                    2.876               -7.327
2040.TxCoastBe .Silage                             1.800               -7.250              -11.600
2040.TxCoastBe .Hay                              -12.633              -10.121                3.528
2040.TxCoastBe .Sugarcane                         27.679                9.714               -1.115
2040.TxCoastBe .Sugarbeet                        -12.633              -10.121                3.528
2040.TxCoastBe .Potatoes                          -8.500               -1.950                8.500
2040.TxCoastBe .TomatoFrsh                        27.679                9.714               -1.115
2040.TxCoastBe .TomatoProc                        27.679                9.714               -1.115
2040.TxCoastBe .SwitchGrass                      -12.633              -10.121                3.528
2040.TxCoastBe .Miscanthus                       -12.633              -10.121                3.528
2040.TxCoastBe .HybrdPoplar                      -12.633              -10.121                3.528
2040.TxCoastBe .Willow                           -12.633              -10.121                3.528
2040.TxCoastBe .EnergySorghum                     27.679                9.714               -1.115
2040.TxCoastBe .SweetSorghum                      27.679                9.714               -1.115
2040.TxCoastBe .OrangeFrsh                        27.679                9.714               -1.115
2040.TxCoastBe .OrangeProc                        27.679                9.714               -1.115
2040.TxCoastBe .GrpFrtFrsh                        27.679                9.714               -1.115
2040.TxCoastBe .GrpFrtProc                        27.679                9.714               -1.115
2040.TxCoastBe .WheatGrazing                      -9.000               -2.750              -22.800
2040.TxCoastBe .WheatGrazeOut                     -9.000               -2.750              -22.800
2040.TxCoastBe .rcorn                              1.800               -7.250              -11.600
2040.TxCoastBe .rHardRedWinterWheat               -9.000               -2.750              -22.800
2040.TxCoastBe .rsorghum                          27.679                9.714               -1.115
2040.TxCoastBe .rrice                                                   2.876               -7.327
2040.TxSouth   .Cotton                             8.776                4.966                7.899
2040.TxSouth   .Corn                               1.800               -7.250              -11.600
2040.TxSouth   .Soybeans                          -1.171               11.706               34.091
2040.TxSouth   .SoybeansDc                        -1.171               11.706               34.091
2040.TxSouth   .HardRedWinterWheat                -9.000               -2.750              -22.800
2040.TxSouth   .SoftRedWinterWheat                                                           9.750
2040.TxSouth   .Sorghum                           27.679                9.714                3.031
2040.TxSouth   .Rice                                                    3.170               -1.607
2040.TxSouth   .Silage                             1.800               -7.250              -11.600
2040.TxSouth   .Hay                              -12.633              -10.121               13.927
2040.TxSouth   .Sugarcane                         27.679                9.714                3.031
2040.TxSouth   .Sugarbeet                        -12.633              -10.121               13.927
2040.TxSouth   .Potatoes                          -8.500               -1.950                8.500
2040.TxSouth   .TomatoFrsh                        27.679                9.714                3.031
2040.TxSouth   .TomatoProc                        27.679                9.714                3.031
2040.TxSouth   .SwitchGrass                      -12.633              -10.121               13.927
2040.TxSouth   .Miscanthus                       -12.633              -10.121               13.927
2040.TxSouth   .HybrdPoplar                      -12.633              -10.121               13.927
2040.TxSouth   .Willow                           -12.633              -10.121               13.927
2040.TxSouth   .EnergySorghum                     27.679                9.714                3.031
2040.TxSouth   .SweetSorghum                      27.679                9.714                3.031
2040.TxSouth   .OrangeFrsh                        27.679                9.714                3.031
2040.TxSouth   .OrangeProc                        27.679                9.714                3.031
2040.TxSouth   .GrpFrtFrsh                        27.679                9.714                3.031
2040.TxSouth   .GrpFrtProc                        27.679                9.714                3.031
2040.TxSouth   .WheatGrazing                      -9.000               -2.750                9.750
2040.TxSouth   .WheatGrazeOut                     -9.000               -2.750                9.750
2040.TxSouth   .rcorn                              1.800               -7.250              -11.600
2040.TxSouth   .rHardRedWinterWheat               -9.000               -2.750              -22.800
2040.TxSouth   .rSoftRedWinterWheat                                                          9.750
2040.TxSouth   .rsorghum                          27.679                9.714                3.031
2040.TxSouth   .rrice                                                   3.170               -1.607
2060.TxCntBlack.Cotton                            26.215                2.832               17.504
2060.TxCntBlack.Corn                               1.200               -3.625               -5.800
2060.TxCntBlack.Soybeans                          -0.586                5.853               17.045
2060.TxCntBlack.SoybeansDc                        -0.586                5.853               17.045
2060.TxCntBlack.HardRedWinterWheat                -7.000                3.375               -4.875
2060.TxCntBlack.Sorghum                           29.060                4.857               -0.558
2060.TxCntBlack.Rice                                                    1.020                2.802
2060.TxCntBlack.Silage                             1.200               -3.625               -5.800
2060.TxCntBlack.Hay                               -5.697               -4.661               14.644
2060.TxCntBlack.Sugarcane                         29.060                4.857               -0.558
2060.TxCntBlack.Sugarbeet                         -5.697               -4.661               14.644
2060.TxCntBlack.Potatoes                           1.650               -0.975                4.250
2060.TxCntBlack.TomatoFrsh                        29.060                4.857               -0.558
2060.TxCntBlack.TomatoProc                        29.060                4.857               -0.558
2060.TxCntBlack.SwitchGrass                       -5.697               -4.661               14.644
2060.TxCntBlack.Miscanthus                        -5.697               -4.661               14.644
2060.TxCntBlack.HybrdPoplar                       -5.697               -4.661               14.644
2060.TxCntBlack.Willow                            -5.697               -4.661               14.644
2060.TxCntBlack.EnergySorghum                     29.060                4.857               -0.558
2060.TxCntBlack.SweetSorghum                      29.060                4.857               -0.558
2060.TxCntBlack.OrangeFrsh                        29.060                4.857               -0.558
2060.TxCntBlack.OrangeProc                        29.060                4.857               -0.558
2060.TxCntBlack.GrpFrtFrsh                        29.060                4.857               -0.558
2060.TxCntBlack.GrpFrtProc                        29.060                4.857               -0.558
2060.TxCntBlack.WheatGrazing                      -7.000                3.375               -4.875
2060.TxCntBlack.WheatGrazeOut                     -7.000                3.375               -4.875
2060.TxCntBlack.rcorn                              1.200               -3.625               -5.800
2060.TxCntBlack.rHardRedWinterWheat               -7.000                3.375               -4.875
2060.TxCntBlack.rsorghum                          29.060                4.857               -0.558
2060.TxCntBlack.rrice                                                   1.020                2.802
2060.TxEdplat  .Cotton                            29.991                3.178               22.449
2060.TxEdplat  .Corn                               1.200               -3.625               -5.800
2060.TxEdplat  .Soybeans                          -0.586                5.853               17.045
2060.TxEdplat  .SoybeansDc                        -0.586                5.853               17.045
2060.TxEdplat  .HardRedWinterWheat                -7.000                3.375               -4.875
2060.TxEdplat  .Sorghum                           29.060                4.857               -3.093
2060.TxEdplat  .Silage                             1.200               -3.625               -5.800
2060.TxEdplat  .Hay                               -6.568               -5.655                3.776
2060.TxEdplat  .Sugarcane                         29.060                4.857               -3.093
2060.TxEdplat  .Sugarbeet                         -6.568               -5.655                3.776
2060.TxEdplat  .Potatoes                           1.650               -0.975                4.250
2060.TxEdplat  .TomatoFrsh                        29.060                4.857               -3.093
2060.TxEdplat  .TomatoProc                        29.060                4.857               -3.093
2060.TxEdplat  .SwitchGrass                       -6.568               -5.655                3.776
2060.TxEdplat  .Miscanthus                        -6.568               -5.655                3.776
2060.TxEdplat  .HybrdPoplar                       -6.568               -5.655                3.776
2060.TxEdplat  .Willow                            -6.568               -5.655                3.776
2060.TxEdplat  .EnergySorghum                     29.060                4.857               -3.093
2060.TxEdplat  .SweetSorghum                      29.060                4.857               -3.093
2060.TxEdplat  .OrangeFrsh                        29.060                4.857               -3.093
2060.TxEdplat  .OrangeProc                        29.060                4.857               -3.093
2060.TxEdplat  .GrpFrtFrsh                        29.060                4.857               -3.093
2060.TxEdplat  .GrpFrtProc                        29.060                4.857               -3.093
2060.TxEdplat  .WheatGrazing                      -7.000                3.375               -4.875
2060.TxEdplat  .WheatGrazeOut                     -7.000                3.375               -4.875
2060.TxEdplat  .rcorn                              1.200               -3.625               -5.800
2060.TxEdplat  .rHardRedWinterWheat               -7.000                3.375               -4.875
2060.TxEdplat  .rsorghum                          29.060                4.857               -3.093
2060.TxCoastBe .Cotton                             7.676                3.461               40.464
2060.TxCoastBe .Corn                               1.200               -3.625               -5.800
2060.TxCoastBe .Soybeans                          -0.586                5.853               17.045
2060.TxCoastBe .SoybeansDc                        -0.586                5.853               17.045
2060.TxCoastBe .HardRedWinterWheat                -7.000                3.375               -4.875
2060.TxCoastBe .Sorghum                           29.060                4.857               -0.558
2060.TxCoastBe .Rice                                                    1.438               -3.664
2060.TxCoastBe .Silage                             1.200               -3.625               -5.800
2060.TxCoastBe .Hay                               -6.568               -5.655                3.869
2060.TxCoastBe .Sugarcane                         29.060                4.857               -0.558
2060.TxCoastBe .Sugarbeet                         -6.568               -5.655                3.869
2060.TxCoastBe .Potatoes                           1.650               -0.975                4.250
2060.TxCoastBe .TomatoFrsh                        29.060                4.857               -0.558
2060.TxCoastBe .TomatoProc                        29.060                4.857               -0.558
2060.TxCoastBe .SwitchGrass                       -6.568               -5.655                3.869
2060.TxCoastBe .Miscanthus                        -6.568               -5.655                3.869
2060.TxCoastBe .HybrdPoplar                       -6.568               -5.655                3.869
2060.TxCoastBe .Willow                            -6.568               -5.655                3.869
2060.TxCoastBe .EnergySorghum                     29.060                4.857               -0.558
2060.TxCoastBe .SweetSorghum                      29.060                4.857               -0.558
2060.TxCoastBe .OrangeFrsh                        29.060                4.857               -0.558
2060.TxCoastBe .OrangeProc                        29.060                4.857               -0.558
2060.TxCoastBe .GrpFrtFrsh                        29.060                4.857               -0.558
2060.TxCoastBe .GrpFrtProc                        29.060                4.857               -0.558
2060.TxCoastBe .WheatGrazing                      -7.000                3.375               -4.875
2060.TxCoastBe .WheatGrazeOut                     -7.000                3.375               -4.875
2060.TxCoastBe .rcorn                              1.200               -3.625               -5.800
2060.TxCoastBe .rHardRedWinterWheat               -7.000                3.375               -4.875
2060.TxCoastBe .rsorghum                          29.060                4.857               -0.558
2060.TxCoastBe .rrice                                                   1.438               -3.664
2060.TxSouth   .Cotton                            20.737                5.367               40.758
2060.TxSouth   .Corn                               1.200               -3.625               -5.800
2060.TxSouth   .Soybeans                          -3.483                5.853               17.045
2060.TxSouth   .SoybeansDc                        -3.483                5.853               17.045
2060.TxSouth   .HardRedWinterWheat                -7.000                3.375               -4.875
2060.TxSouth   .SoftRedWinterWheat                                                          -3.150
2060.TxSouth   .Sorghum                           29.060                4.857                1.515
2060.TxSouth   .Rice                                                    0.312               12.540
2060.TxSouth   .Silage                             1.200               -3.625               -5.800
2060.TxSouth   .Hay                               -6.568               -5.655                8.379
2060.TxSouth   .Sugarcane                         29.060                4.857                1.515
2060.TxSouth   .Sugarbeet                         -6.568               -5.655                8.379
2060.TxSouth   .Potatoes                           1.650               -0.975                4.250
2060.TxSouth   .TomatoFrsh                        29.060                4.857                1.515
2060.TxSouth   .TomatoProc                        29.060                4.857                1.515
2060.TxSouth   .SwitchGrass                       -6.568               -5.655                8.379
2060.TxSouth   .Miscanthus                        -6.568               -5.655                8.379
2060.TxSouth   .HybrdPoplar                       -6.568               -5.655                8.379
2060.TxSouth   .Willow                            -6.568               -5.655                8.379
2060.TxSouth   .EnergySorghum                     29.060                4.857                1.515
2060.TxSouth   .SweetSorghum                      29.060                4.857                1.515
2060.TxSouth   .OrangeFrsh                        29.060                4.857                1.515
2060.TxSouth   .OrangeProc                        29.060                4.857                1.515
2060.TxSouth   .GrpFrtFrsh                        29.060                4.857                1.515
2060.TxSouth   .GrpFrtProc                        29.060                4.857                1.515
2060.TxSouth   .WheatGrazing                      -7.000                3.375               -3.150
2060.TxSouth   .WheatGrazeOut                     -7.000                3.375               -3.150
2060.TxSouth   .rcorn                              1.200               -3.625               -5.800
2060.TxSouth   .rHardRedWinterWheat               -7.000                3.375               -4.875
2060.TxSouth   .rSoftRedWinterWheat                                                         -3.150
2060.TxSouth   .rsorghum                          29.060                4.857                1.515
2060.TxSouth   .rrice                                                   0.312               12.540
2070.TxCntBlack.Cotton                            52.431                5.665               35.008
2070.TxCntBlack.Corn                               2.400               -7.250              -11.600
2070.TxCntBlack.Soybeans                          -1.171               11.706               34.091
2070.TxCntBlack.SoybeansDc                        -1.171               11.706               34.091
2070.TxCntBlack.HardRedWinterWheat               -14.000                6.750               -9.750
2070.TxCntBlack.Sorghum                           58.120                9.714               -1.115
2070.TxCntBlack.Rice                                                    2.040                5.604
2070.TxCntBlack.Silage                             2.400               -7.250              -11.600
2070.TxCntBlack.Hay                              -11.394               -9.322               29.288
2070.TxCntBlack.Sugarcane                         58.120                9.714               -1.115
2070.TxCntBlack.Sugarbeet                        -11.394               -9.322               29.288
2070.TxCntBlack.Potatoes                           3.300               -1.950                8.500
2070.TxCntBlack.TomatoFrsh                        58.120                9.714               -1.115
2070.TxCntBlack.TomatoProc                        58.120                9.714               -1.115
2070.TxCntBlack.SwitchGrass                      -11.394               -9.322               29.288
2070.TxCntBlack.Miscanthus                       -11.394               -9.322               29.288
2070.TxCntBlack.HybrdPoplar                      -11.394               -9.322               29.288
2070.TxCntBlack.Willow                           -11.394               -9.322               29.288
2070.TxCntBlack.EnergySorghum                     58.120                9.714               -1.115
2070.TxCntBlack.SweetSorghum                      58.120                9.714               -1.115
2070.TxCntBlack.OrangeFrsh                        58.120                9.714               -1.115
2070.TxCntBlack.OrangeProc                        58.120                9.714               -1.115
2070.TxCntBlack.GrpFrtFrsh                        58.120                9.714               -1.115
2070.TxCntBlack.GrpFrtProc                        58.120                9.714               -1.115
2070.TxCntBlack.WheatGrazing                     -14.000                6.750               -9.750
2070.TxCntBlack.WheatGrazeOut                    -14.000                6.750               -9.750
2070.TxCntBlack.rcorn                              2.400               -7.250              -11.600
2070.TxCntBlack.rHardRedWinterWheat              -14.000                6.750               -9.750
2070.TxCntBlack.rsorghum                          58.120                9.714               -1.115
2070.TxCntBlack.rrice                                                   2.040                5.604
2070.TxEdplat  .Cotton                            59.983                6.355               44.898
2070.TxEdplat  .Corn                               2.400               -7.250              -11.600
2070.TxEdplat  .Soybeans                          -1.171               11.706               34.091
2070.TxEdplat  .SoybeansDc                        -1.171               11.706               34.091
2070.TxEdplat  .HardRedWinterWheat               -14.000                6.750               -9.750
2070.TxEdplat  .Sorghum                           58.120                9.714               -6.186
2070.TxEdplat  .Silage                             2.400               -7.250              -11.600
2070.TxEdplat  .Hay                              -13.137              -11.310                7.551
2070.TxEdplat  .Sugarcane                         58.120                9.714               -6.186
2070.TxEdplat  .Sugarbeet                        -13.137              -11.310                7.551
2070.TxEdplat  .Potatoes                           3.300               -1.950                8.500
2070.TxEdplat  .TomatoFrsh                        58.120                9.714               -6.186
2070.TxEdplat  .TomatoProc                        58.120                9.714               -6.186
2070.TxEdplat  .SwitchGrass                      -13.137              -11.310                7.551
2070.TxEdplat  .Miscanthus                       -13.137              -11.310                7.551
2070.TxEdplat  .HybrdPoplar                      -13.137              -11.310                7.551
2070.TxEdplat  .Willow                           -13.137              -11.310                7.551
2070.TxEdplat  .EnergySorghum                     58.120                9.714               -6.186
2070.TxEdplat  .SweetSorghum                      58.120                9.714               -6.186
2070.TxEdplat  .OrangeFrsh                        58.120                9.714               -6.186
2070.TxEdplat  .OrangeProc                        58.120                9.714               -6.186
2070.TxEdplat  .GrpFrtFrsh                        58.120                9.714               -6.186
2070.TxEdplat  .GrpFrtProc                        58.120                9.714               -6.186
2070.TxEdplat  .WheatGrazing                     -14.000                6.750               -9.750
2070.TxEdplat  .WheatGrazeOut                    -14.000                6.750               -9.750
2070.TxEdplat  .rcorn                              2.400               -7.250              -11.600
2070.TxEdplat  .rHardRedWinterWheat              -14.000                6.750               -9.750
2070.TxEdplat  .rsorghum                          58.120                9.714               -6.186
2070.TxCoastBe .Cotton                            15.352                6.923               80.928
2070.TxCoastBe .Corn                               2.400               -7.250              -11.600
2070.TxCoastBe .Soybeans                          -1.171               11.706               34.091
2070.TxCoastBe .SoybeansDc                        -1.171               11.706               34.091
2070.TxCoastBe .HardRedWinterWheat               -14.000                6.750               -9.750
2070.TxCoastBe .Sorghum                           58.120                9.714               -1.115
2070.TxCoastBe .Rice                                                    2.876               -7.327
2070.TxCoastBe .Silage                             2.400               -7.250              -11.600
2070.TxCoastBe .Hay                              -13.137              -11.310                7.738
2070.TxCoastBe .Sugarcane                         58.120                9.714               -1.115
2070.TxCoastBe .Sugarbeet                        -13.137              -11.310                7.738
2070.TxCoastBe .Potatoes                           3.300               -1.950                8.500
2070.TxCoastBe .TomatoFrsh                        58.120                9.714               -1.115
2070.TxCoastBe .TomatoProc                        58.120                9.714               -1.115
2070.TxCoastBe .SwitchGrass                      -13.137              -11.310                7.738
2070.TxCoastBe .Miscanthus                       -13.137              -11.310                7.738
2070.TxCoastBe .HybrdPoplar                      -13.137              -11.310                7.738
2070.TxCoastBe .Willow                           -13.137              -11.310                7.738
2070.TxCoastBe .EnergySorghum                     58.120                9.714               -1.115
2070.TxCoastBe .SweetSorghum                      58.120                9.714               -1.115
2070.TxCoastBe .OrangeFrsh                        58.120                9.714               -1.115
2070.TxCoastBe .OrangeProc                        58.120                9.714               -1.115
2070.TxCoastBe .GrpFrtFrsh                        58.120                9.714               -1.115
2070.TxCoastBe .GrpFrtProc                        58.120                9.714               -1.115
2070.TxCoastBe .WheatGrazing                     -14.000                6.750               -9.750
2070.TxCoastBe .WheatGrazeOut                    -14.000                6.750               -9.750
2070.TxCoastBe .rcorn                              2.400               -7.250              -11.600
2070.TxCoastBe .rHardRedWinterWheat              -14.000                6.750               -9.750
2070.TxCoastBe .rsorghum                          58.120                9.714               -1.115
2070.TxCoastBe .rrice                                                   2.876               -7.327
2070.TxSouth   .Cotton                            41.474               10.734               81.516
2070.TxSouth   .Corn                               2.400               -7.250              -11.600
2070.TxSouth   .Soybeans                          -6.966               11.706               34.091
2070.TxSouth   .SoybeansDc                        -6.966               11.706               34.091
2070.TxSouth   .HardRedWinterWheat               -14.000                6.750               -9.750
2070.TxSouth   .SoftRedWinterWheat                                                          -6.300
2070.TxSouth   .Sorghum                           58.120                9.714                3.031
2070.TxSouth   .Rice                                                    0.624               25.080
2070.TxSouth   .Silage                             2.400               -7.250              -11.600
2070.TxSouth   .Hay                              -13.137              -11.310               16.758
2070.TxSouth   .Sugarcane                         58.120                9.714                3.031
2070.TxSouth   .Sugarbeet                        -13.137              -11.310               16.758
2070.TxSouth   .Potatoes                           3.300               -1.950                8.500
2070.TxSouth   .TomatoFrsh                        58.120                9.714                3.031
2070.TxSouth   .TomatoProc                        58.120                9.714                3.031
2070.TxSouth   .SwitchGrass                      -13.137              -11.310               16.758
2070.TxSouth   .Miscanthus                       -13.137              -11.310               16.758
2070.TxSouth   .HybrdPoplar                      -13.137              -11.310               16.758
2070.TxSouth   .Willow                           -13.137              -11.310               16.758
2070.TxSouth   .EnergySorghum                     58.120                9.714                3.031
2070.TxSouth   .SweetSorghum                      58.120                9.714                3.031
2070.TxSouth   .OrangeFrsh                        58.120                9.714                3.031
2070.TxSouth   .OrangeProc                        58.120                9.714                3.031
2070.TxSouth   .GrpFrtFrsh                        58.120                9.714                3.031
2070.TxSouth   .GrpFrtProc                        58.120                9.714                3.031
2070.TxSouth   .WheatGrazing                     -14.000                6.750               -6.300
2070.TxSouth   .WheatGrazeOut                    -14.000                6.750               -6.300
2070.TxSouth   .rcorn                              2.400               -7.250              -11.600
2070.TxSouth   .rHardRedWinterWheat              -14.000                6.750               -9.750
2070.TxSouth   .rSoftRedWinterWheat                                                         -6.300
2070.TxSouth   .rsorghum                          58.120                9.714                3.031
2070.TxSouth   .rrice                                                   0.624               25.080

;

climatecropF("2050", Fregion, Fcrops, irrigstatus, citems)
  = (climatecropF("2040", Fregion, Fcrops, irrigstatus, citems)
     + climatecropF("2060", Fregion, Fcrops, irrigstatus,citems)  )/2
