** this is python imported county-level water rates
** generated by importwaterrates.gms
* col 1: fips
* col 2: demand type: (1) residential up to 5k gallon, (2) residuetial up to 10k gallon
*                     (3) commercial up to 50k gallon, (4) commercial up to 200k gallon

* unit: $/ACFT
Version('data_water_demand_pq.gms', 'June 7, 20221')=yes;
set demandtype demand type of waterrates /
resi_5kgal
resi_10kgal
comm_50kgal
comm_200kgal
/;
Parameter waterrates(county, demandtype) water rates of counties /


Blanco              .resi_5kgal               2102.38
Blanco              .resi_10kgal              1882.11
Blanco              .comm_50kgal              1793.48
Blanco              .comm_200kgal             1763.17
Atascosa            .resi_5kgal               1485.88
Atascosa            .resi_10kgal              1028.06
Atascosa            .comm_50kgal              1631.86
Atascosa            .comm_200kgal             1836.82
Karnes              .resi_5kgal               1889.93
Karnes              .resi_10kgal              1498.91
Karnes              .comm_50kgal              2520.19
Karnes              .comm_200kgal             1792.38
Goliad              .resi_5kgal               2210.67
Goliad              .resi_10kgal              1698.84
Goliad              .comm_50kgal              1431.11
Goliad              .comm_200kgal             1262.35
Bandera             .resi_5kgal               2186.06
Bandera             .resi_10kgal              1749.01
Bandera             .comm_50kgal              1716.45
Bandera             .comm_200kgal             2025.86
Comal               .resi_5kgal               1735.48
Comal               .resi_10kgal              1258.76
Comal               .comm_50kgal              1418.64
Comal               .comm_200kgal             1439.13
Kendall             .resi_5kgal               4207.38
Kendall             .resi_10kgal              2595.72
Kendall             .comm_50kgal              2174.59
Kendall             .comm_200kgal             1665.39
LiveOak             .resi_5kgal               1599.92
LiveOak             .resi_10kgal              1023.17
LiveOak             .comm_50kgal               733.88
LiveOak             .comm_200kgal              633.14
Bexar               .resi_5kgal               2503.96
Bexar               .resi_10kgal              1787.74
Bexar               .comm_50kgal              1638.36
Bexar               .comm_200kgal             1945.85
Nueces              .resi_5kgal               2153.22
Nueces              .resi_10kgal              1676.17
Nueces              .comm_50kgal              1450.94
Nueces              .comm_200kgal             1530.91
Webb                .resi_5kgal                983.42
Webb                .resi_10kgal               812.67
Webb                .comm_50kgal              1312.72
Webb                .comm_200kgal             1136.29
Refugio             .resi_5kgal               2052.86
Refugio             .resi_10kgal              1678.13
Refugio             .comm_50kgal              1541.27
Refugio             .comm_200kgal             1485.06
DeWitt              .resi_5kgal               1818.24
DeWitt              .resi_10kgal              1454.92
DeWitt              .comm_50kgal              1545.51
DeWitt              .comm_200kgal             1395.05
Victoria            .resi_5kgal               1562.12
Victoria            .resi_10kgal              1109.52
Victoria            .comm_50kgal              1661.84
Victoria            .comm_200kgal             1118.07
Kinney              .resi_5kgal               4427.65
Kinney              .resi_10kgal              3843.07
Kinney              .comm_50kgal              3516.18
Kinney              .comm_200kgal             3287.73
SanPatricio         .resi_5kgal               2795.79
SanPatricio         .resi_10kgal              2197.37
SanPatricio         .comm_50kgal              1651.59
SanPatricio         .comm_200kgal             1521.20
Maverick            .resi_5kgal               3154.60
Maverick            .resi_10kgal              2569.89
Maverick            .comm_50kgal              2351.94
Maverick            .comm_200kgal             2051.17
Bee                 .resi_5kgal               2207.24
Bee                 .resi_10kgal              1633.76
Bee                 .comm_50kgal              1591.16
Bee                 .comm_200kgal             1489.25
Duval               .resi_5kgal               2237.55
Duval               .resi_10kgal              1885.69
Duval               .comm_50kgal              2043.05
Duval               .comm_200kgal             1810.73
Uvalde              .resi_5kgal               2370.89
Uvalde              .resi_10kgal              1782.58
Uvalde              .comm_50kgal              2370.65
Uvalde              .comm_200kgal             1895.23
Frio                .resi_5kgal               2280.98
Frio                .resi_10kgal              1735.34
Frio                .comm_50kgal              1744.87
Frio                .comm_200kgal             1626.19
Real                .resi_5kgal               1655.90
Real                .resi_10kgal              1273.17
Real                .comm_50kgal              1104.15
Real                .comm_200kgal             1121.41
Bastrop             .resi_5kgal               2035.58
Bastrop             .resi_10kgal              1527.26
Bastrop             .comm_50kgal              1601.23
Bastrop             .comm_200kgal             1194.59
*Travis              .resi_5kgal               2169.51
*Travis              .resi_10kgal              2013.36
*Travis              .comm_50kgal              2368.43
*Travis              .comm_200kgal             1851.19
Zavala              .resi_5kgal               2109.73
Zavala              .resi_10kgal              1690.50
Zavala              .comm_50kgal              1628.78
Zavala              .comm_200kgal             1622.01
Caldwell            .resi_5kgal               2202.75
Caldwell            .resi_10kgal              1785.66
Caldwell            .comm_50kgal              1776.21
Caldwell            .comm_200kgal             1702.62
Hays                .resi_5kgal               3236.99
Hays                .resi_10kgal              2504.16
Hays                .comm_50kgal              3373.79
Hays                .comm_200kgal             2757.00
Aransas             .resi_5kgal               2505.46
Aransas             .resi_10kgal              2131.71
Aransas             .comm_50kgal              1236.67
Aransas             .comm_200kgal             1142.53
Wilson              .resi_5kgal               2091.74
Wilson              .resi_10kgal              1583.52
Wilson              .comm_50kgal              1649.37
Wilson              .comm_200kgal             1578.07
Kerr                .resi_5kgal               1779.14
Kerr                .resi_10kgal              1440.26
Kerr                .comm_50kgal              1269.19
Kerr                .comm_200kgal             1395.05
Gillespie           .resi_5kgal               2428.07
Gillespie           .resi_10kgal              1909.05
Gillespie           .comm_50kgal              1612.63
Gillespie           .comm_200kgal             2148.71
Calhoun             .resi_5kgal               2150.61
Calhoun             .resi_10kgal              2134.32
Calhoun             .comm_50kgal              2134.32
Calhoun             .comm_200kgal             2134.32
Edwards             .resi_5kgal               2296.74
Edwards             .resi_10kgal              1705.01
Edwards             .comm_50kgal              1526.70
Edwards             .comm_200kgal             1883.95
Fayette             .resi_5kgal               1756.77
Fayette             .resi_10kgal              1304.16
Fayette             .comm_50kgal              1191.98
Fayette             .comm_200kgal             1154.98
Guadalupe           .resi_5kgal               2884.26
Guadalupe           .resi_10kgal              2189.06
Guadalupe           .comm_50kgal              2498.47
Guadalupe           .comm_200kgal             3127.35
Medina              .resi_5kgal               2293.59
Medina              .resi_10kgal              1642.22
Medina              .comm_50kgal              1248.06
Medina              .comm_200kgal             1337.35
Gonzales            .resi_5kgal               1740.69
Gonzales            .resi_10kgal              1359.12
Gonzales            .comm_50kgal              1312.59
Gonzales            .comm_200kgal             1036.06
McMullen            .resi_5kgal               2205.78
McMullen            .resi_10kgal              1789.33
McMullen            .comm_50kgal              1687.11
McMullen            .comm_200kgal             1610.86
Dimmit              .resi_5kgal               2786.02
Dimmit              .resi_10kgal              2028.42
Dimmit              .comm_50kgal              3299.23
Dimmit              .comm_200kgal             3329.78
Lavaca              .resi_5kgal               1068.79
Lavaca              .resi_10kgal               816.25
Lavaca              .comm_50kgal               805.05
Lavaca              .comm_200kgal              904.28
JimWells            .resi_5kgal               2224.90
JimWells            .resi_10kgal              1832.58
JimWells            .comm_50kgal              1613.35
JimWells            .comm_200kgal             1598.39
LaSalle             .resi_5kgal               2452.98
LaSalle             .resi_10kgal              1933.12
LaSalle             .comm_50kgal              1934.13
LaSalle             .comm_200kgal             1937.14
/;
Parameter waterusage(county, sector, source) 2018 water usage data by county and sector /
* data source :http://www2.twdb.texas.gov/ReportServerExt/Pages/ReportViewer.aspx?fWUfSumFinal_CountyReportWithReuse&rs:Command=Render
* unit:ACFT
Blanco              .mun                 .ground                    858.00
Blanco              .mun                 .surface                   376.00
Atascosa            .mun                 .ground                   6518.00
Atascosa            .ind                 .ground                     19.00
Atascosa            .min                 .ground                   3013.00
Atascosa            .min                 .surface                   297.00
Atascosa            .min                 .reuse                     742.00
Atascosa            .cool                .ground                   5607.00
Karnes              .mun                 .ground                   3680.00
Karnes              .ind                 .ground                     63.00
Karnes              .min                 .ground                  12556.00
Karnes              .min                 .surface                  1394.00
Karnes              .min                 .reuse                    3488.00
Goliad              .mun                 .ground                    773.00
Goliad              .min                 .ground                      2.00
Goliad              .min                 .reuse                       1.00
Goliad              .cool                .ground                    178.00
Goliad              .cool                .surface                  1383.00
Bandera             .mun                 .ground                   2150.00
Bandera             .mun                 .reuse                      23.00
Comal               .mun                 .ground                  13735.00
Comal               .mun                 .surface                  9200.00
Comal               .mun                 .reuse                     545.00
Comal               .ind                 .ground                    542.00
Comal               .ind                 .surface                     3.00
Comal               .ind                 .reuse                     265.00
Comal               .min                 .ground                   5258.00
Kendall             .mun                 .ground                   3626.00
Kendall             .mun                 .surface                  2739.00
Kendall             .mun                 .reuse                     514.00
Kendall             .ind                 .ground                      3.00
LiveOak             .mun                 .ground                    971.00
LiveOak             .mun                 .surface                   625.00
LiveOak             .mun                 .reuse                      66.00
LiveOak             .ind                 .ground                   1895.00
LiveOak             .ind                 .surface                   644.00
LiveOak             .min                 .ground                   1070.00
LiveOak             .min                 .surface                   119.00
LiveOak             .min                 .reuse                     297.00
Bexar               .mun                 .ground                 263575.00
Bexar               .mun                 .surface                  8290.00
Bexar               .mun                 .reuse                   47603.00
Bexar               .ind                 .ground                   5704.00
Bexar               .ind                 .surface                   742.00
Bexar               .ind                 .reuse                     684.00
Bexar               .min                 .ground                   6882.00
Bexar               .min                 .surface                    74.00
Bexar               .cool                .ground                    940.00
Bexar               .cool                .surface                 37799.00
Bexar               .cool                .reuse                   37799.00
Nueces              .mun                 .ground                   1056.00
Nueces              .mun                 .surface                 36422.00
Nueces              .mun                 .reuse                     132.00
Nueces              .ind                 .ground                   2115.00
Nueces              .ind                 .surface                 35499.00
Nueces              .ind                 .reuse                     672.00
Nueces              .min                 .ground                    671.00
Nueces              .min                 .surface                     1.00
Nueces              .cool                .surface                  3492.00
Webb                .mun                 .ground                    206.00
Webb                .mun                 .surface                 40890.00
Webb                .mun                 .reuse                    2922.00
Webb                .ind                 .ground                     18.00
Webb                .ind                 .surface                    27.00
Webb                .min                 .ground                   5995.00
Webb                .min                 .surface                   680.00
Webb                .min                 .reuse                    1666.00
Webb                .cool                .surface                   131.00
Refugio             .mun                 .ground                    926.00
DeWitt              .mun                 .ground                   3128.00
DeWitt              .mun                 .surface                     1.00
DeWitt              .ind                 .ground                    132.00
DeWitt              .min                 .ground                   4911.00
DeWitt              .min                 .surface                   546.00
DeWitt              .min                 .reuse                    1364.00
Victoria            .mun                 .ground                   2612.00
Victoria            .mun                 .surface                 10547.00
Victoria            .ind                 .ground                    510.00
Victoria            .ind                 .surface                  8493.00
Victoria            .min                 .ground                      5.00
Victoria            .cool                .ground                   1307.00
Kinney              .mun                 .ground                   1289.00
SanPatricio         .mun                 .ground                   1240.00
SanPatricio         .mun                 .surface                  7211.00
SanPatricio         .mun                 .reuse                     682.00
SanPatricio         .ind                 .surface                 10329.00
Maverick            .mun                 .ground                    909.00
Maverick            .mun                 .surface                  9125.00
Maverick            .mun                 .reuse                     466.00
Maverick            .ind                 .ground                     10.00
Maverick            .ind                 .surface                    11.00
Maverick            .min                 .ground                     93.00
Maverick            .min                 .surface                    10.00
Maverick            .min                 .reuse                      25.00
Bee                 .mun                 .ground                   2624.00
Bee                 .mun                 .surface                  2350.00
Duval               .mun                 .ground                   1250.00
Duval               .min                 .ground                     90.00
Uvalde              .mun                 .ground                   4118.00
Uvalde              .mun                 .reuse                    1653.00
Uvalde              .min                 .ground                     61.00
Frio                .mun                 .ground                   2547.00
Frio                .min                 .ground                   1003.00
Frio                .min                 .surface                   111.00
Frio                .min                 .reuse                     279.00
Frio                .cool                .ground                     43.00
Real                .mun                 .ground                    472.00
Real                .mun                 .surface                   103.00
Bastrop             .mun                 .ground                  11733.00
Bastrop             .ind                 .ground                    245.00
Bastrop             .min                 .ground                     47.00
Bastrop             .cool                .ground                   5309.00
Bastrop             .cool                .surface                  1809.00
*Travis              .mun                 .ground                  17500.00
*Travis              .mun                 .surface                159992.00
*Travis              .mun                 .reuse                    3525.00
*Travis              .ind                 .ground                    718.00
*Travis              .ind                 .surface                 10491.00
*Travis              .ind                 .reuse                    2708.00
*Travis              .cool                .ground                     82.00
*Travis              .cool                .surface                  2181.00
*Travis              .cool                .reuse                    1543.00
Zavala              .mun                 .ground                   2232.00
Zavala              .ind                 .ground                     92.00
Zavala              .min                 .ground                    554.00
Zavala              .min                 .surface                    62.00
Zavala              .min                 .reuse                     154.00
Caldwell            .mun                 .ground                   1721.00
Caldwell            .mun                 .surface                  3225.00
Caldwell            .mun                 .reuse                      15.00
Caldwell            .ind                 .surface                    13.00
Hays                .mun                 .ground                   9950.00
Hays                .mun                 .surface                 16766.00
Hays                .mun                 .reuse                    1061.00
Hays                .ind                 .ground                    156.00
Hays                .min                 .ground                    303.00
Aransas             .mun                 .ground                    308.00
Aransas             .mun                 .surface                  3057.00
Aransas             .mun                 .reuse                     134.00
Wilson              .mun                 .ground                   6403.00
Wilson              .ind                 .ground                      9.00
Wilson              .min                 .ground                    104.00
Wilson              .min                 .surface                    12.00
Wilson              .min                 .reuse                      29.00
Kerr                .mun                 .ground                   4000.00
Kerr                .mun                 .surface                  3953.00
Kerr                .mun                 .reuse                     471.00
Kerr                .ind                 .ground                      3.00
Kerr                .ind                 .surface                    20.00
Kerr                .min                 .ground                     14.00
Kerr                .min                 .surface                   111.00
Gillespie           .mun                 .ground                   4043.00
Gillespie           .ind                 .ground                    314.00
Gillespie           .min                 .ground                      8.00
Calhoun             .mun                 .ground                    297.00
Calhoun             .mun                 .surface                  2210.00
Calhoun             .ind                 .ground                    332.00
Calhoun             .ind                 .surface                 44641.00
Calhoun             .ind                 .reuse                    1605.00
Calhoun             .cool                .ground                     37.00
Edwards             .mun                 .ground                    284.00
Fayette             .mun                 .ground                   2615.00
Fayette             .ind                 .ground                    259.00
Fayette             .min                 .ground                    349.00
Fayette             .min                 .surface                    38.00
Fayette             .min                 .reuse                      97.00
Fayette             .cool                .ground                     14.00
Fayette             .cool                .surface                 19059.00
Fayette             .cool                .reuse                     979.00
Guadalupe           .mun                 .ground                  12568.00
Guadalupe           .mun                 .surface                  9188.00
Guadalupe           .mun                 .reuse                      16.00
Guadalupe           .ind                 .ground                    226.00
Guadalupe           .ind                 .surface                  1970.00
Guadalupe           .ind                 .reuse                     567.00
Guadalupe           .cool                .ground                      2.00
Guadalupe           .cool                .surface                  3017.00
Guadalupe           .cool                .reuse                    1038.00
Medina              .mun                 .ground                   9316.00
Medina              .mun                 .surface                    76.00
Medina              .mun                 .reuse                     670.00
Medina              .ind                 .ground                      9.00
Medina              .min                 .ground                   2217.00
Gonzales            .mun                 .ground                   2349.00
Gonzales            .mun                 .surface                  1169.00
Gonzales            .ind                 .ground                   1646.00
Gonzales            .ind                 .surface                    37.00
Gonzales            .ind                 .reuse                     363.00
Gonzales            .min                 .ground                   4781.00
Gonzales            .min                 .surface                   917.00
Gonzales            .min                 .reuse                    1328.00
McMullen            .mun                 .ground                    134.00
McMullen            .ind                 .ground                     34.00
McMullen            .min                 .ground                   3971.00
McMullen            .min                 .surface                   441.00
McMullen            .min                 .reuse                    1103.00
Dimmit              .mun                 .ground                   1850.00
Dimmit              .min                 .ground                  10361.00
Dimmit              .min                 .surface                  1151.00
Dimmit              .min                 .reuse                    2878.00
Lavaca              .mun                 .ground                   2430.00
Lavaca              .ind                 .ground                    480.00
Lavaca              .min                 .ground                   1427.00
Lavaca              .min                 .surface                   159.00
Lavaca              .min                 .reuse                     396.00
JimWells            .mun                 .ground                   1169.00
JimWells            .mun                 .surface                  3953.00
JimWells            .mun                 .reuse                     171.00
JimWells            .ind                 .ground                      1.00
LaSalle             .mun                 .ground                   1759.00
LaSalle             .min                 .ground                  11630.00
LaSalle             .min                 .surface                  1292.00
LaSalle             .min                 .reuse                    3230.00
/;
Table munshares(county, month) 2015 monthly share of water usage data by county
* data source :http://www2.twdb.texas.gov/ReportServerExt/Pages/ReportViewer.aspx?fWUfHistoricalMunicipal&rs:Command=Render
* unit:%
                          Jan       Feb       Mar       Apr       May       Jun       Jul       Aug       Sep       Oct       Nov       Dec
Blanco                  0.0638    0.0595    0.0684    0.0766    0.0818    0.0937    0.1152    0.1256    0.0947    0.0854    0.0663    0.0690
Atascosa                0.0618    0.0593    0.0707    0.0796    0.0875    0.0980    0.1136    0.1159    0.0928    0.0824    0.0670    0.0712
Karnes                  0.0715    0.0656    0.0761    0.0784    0.0857    0.0914    0.1006    0.1063    0.0876    0.0848    0.0734    0.0786
Goliad                  0.0709    0.0636    0.0769    0.0830    0.0901    0.0949    0.1074    0.1046    0.0838    0.0825    0.0708    0.0715
Bandera                 0.0652    0.0625    0.0662    0.0741    0.0777    0.0894    0.1053    0.1086    0.0893    0.0781    0.0670    0.1168
Comal                   0.0660    0.0609    0.0705    0.0773    0.0842    0.0952    0.1081    0.1129    0.0902    0.0835    0.0717    0.0794
Kendall                 0.0634    0.0587    0.0672    0.0755    0.0814    0.0923    0.1103    0.1126    0.0921    0.0813    0.0705    0.0947
LiveOak                 0.0758    0.0675    0.0782    0.0825    0.0868    0.0934    0.1002    0.1003    0.0847    0.0806    0.0740    0.0760
Bexar                   0.0683    0.0632    0.0738    0.0787    0.0847    0.0926    0.1070    0.1105    0.0884    0.0833    0.0722    0.0774
Nueces                  0.0740    0.0677    0.0788    0.0808    0.0864    0.0887    0.0972    0.0994    0.0852    0.0831    0.0763    0.0825
Webb                    0.0671    0.0643    0.0761    0.0837    0.0897    0.0964    0.1056    0.1039    0.0882    0.0818    0.0716    0.0716
Refugio                 0.0703    0.0639    0.0740    0.0786    0.0885    0.0951    0.1054    0.1042    0.0841    0.0791    0.0713    0.0855
DeWitt                  0.0698    0.0646    0.0723    0.0777    0.0874    0.0914    0.1056    0.1096    0.0893    0.0829    0.0708    0.0787
Victoria                0.0704    0.0650    0.0749    0.0794    0.0873    0.0919    0.1058    0.1097    0.0889    0.0806    0.0714    0.0747
Kinney                  0.0692    0.0654    0.0764    0.0824    0.0885    0.0967    0.1061    0.1092    0.0877    0.0799    0.0695    0.0691
SanPatricio             0.0722    0.0670    0.0757    0.0791    0.0840    0.0954    0.0988    0.1013    0.0833    0.0819    0.0736    0.0877
Maverick                0.0638    0.0616    0.0759    0.0833    0.0884    0.0961    0.1069    0.1113    0.0897    0.0819    0.0682    0.0729
Bee                     0.0713    0.0665    0.0766    0.0817    0.0896    0.0921    0.0986    0.1017    0.0866    0.0849    0.0737    0.0765
Duval                   0.0705    0.0654    0.0749    0.0932    0.0877    0.0916    0.0988    0.1023    0.0878    0.0813    0.0732    0.0732
Uvalde                  0.0599    0.0588    0.0727    0.0818    0.0859    0.1008    0.1188    0.1205    0.0899    0.0766    0.0649    0.0694
Frio                    0.0623    0.0604    0.0738    0.0823    0.0882    0.1039    0.1144    0.1167    0.0901    0.0785    0.0647    0.0645
Real                    0.0623    0.0571    0.0681    0.0803    0.0873    0.1020    0.1272    0.1219    0.0940    0.0755    0.0619    0.0623
Bastrop                 0.0685    0.0615    0.0689    0.0743    0.0817    0.0943    0.1093    0.1118    0.0914    0.0830    0.0704    0.0849
*Travis                  0.0632    0.0578    0.0698    0.0767    0.0847    0.0926    0.1073    0.1129    0.0939    0.0840    0.0697    0.0873
Zavala                  0.0770    0.0563    0.0677    0.0775    0.0888    0.0962    0.1069    0.1161    0.0913    0.0757    0.0612    0.0855
Caldwell                0.0699    0.0636    0.0693    0.0748    0.0826    0.0935    0.1088    0.1120    0.0913    0.0822    0.0727    0.0792
Hays                    0.0694    0.0641    0.0718    0.0763    0.0794    0.0872    0.1001    0.1058    0.0904    0.0840    0.0745    0.0972
Aransas                 0.0685    0.0636    0.0737    0.0792    0.0848    0.0965    0.1058    0.1075    0.0904    0.0809    0.0722    0.0769
Wilson                  0.0605    0.0572    0.0662    0.0757    0.0861    0.0997    0.1120    0.1216    0.0938    0.0811    0.0665    0.0795
Kerr                    0.0676    0.0616    0.0756    0.0807    0.0850    0.0966    0.1125    0.1140    0.0857    0.0769    0.0677    0.0761
Gillespie               0.0578    0.0558    0.0627    0.0789    0.0846    0.0964    0.1197    0.1244    0.1002    0.0827    0.0671    0.0698
Calhoun                 0.0747    0.0656    0.0740    0.0785    0.0877    0.0936    0.1008    0.1031    0.0882    0.0838    0.0740    0.0760
Edwards                 0.0597    0.0602    0.0683    0.0836    0.0867    0.1026    0.1207    0.1224    0.0932    0.0728    0.0602    0.0699
Fayette                 0.0680    0.0616    0.0690    0.0762    0.0840    0.0922    0.1087    0.1143    0.0931    0.0838    0.0709    0.0783
Guadalupe               0.0658    0.0597    0.0689    0.0764    0.0849    0.0943    0.1069    0.1124    0.0928    0.0892    0.0707    0.0781
Medina                  0.0620    0.0592    0.0682    0.0772    0.0846    0.0980    0.1106    0.1139    0.0906    0.0784    0.0665    0.0907
Gonzales                0.0707    0.0646    0.0718    0.0763    0.0843    0.0939    0.1053    0.1074    0.0887    0.0826    0.0719    0.0826
McMullen                0.0667    0.0609    0.0715    0.0772    0.0865    0.0966    0.0996    0.1038    0.0850    0.0918    0.0799    0.0803
Dimmit                  0.0541    0.0559    0.0709    0.0801    0.0881    0.1006    0.1124    0.1167    0.0863    0.0762    0.0608    0.0978
Lavaca                  0.0685    0.0634    0.0719    0.0780    0.0863    0.0956    0.1076    0.1133    0.0913    0.0837    0.0710    0.0694
JimWells                0.0671    0.0655    0.0780    0.0831    0.0925    0.0943    0.0989    0.1050    0.0848    0.0833    0.0746    0.0729
LaSalle                 0.0599    0.0590    0.0708    0.0822    0.0829    0.0938    0.1108    0.1114    0.0831    0.0757    0.0646    0.1058
;
Table indshares(county, month) 2015 monthly share of water usage data by county
* data source :http://www2.twdb.texas.gov/ReportServerExt/Pages/ReportViewer.aspx?fWUfHistoricalIndustrial&rs:Command=Render
* unit:%
                          Jan       Feb       Mar       Apr       May       Jun       Jul       Aug       Sep       Oct       Nov       Dec
Blanco                  0.0687    0.0818    0.0832    0.0905    0.0795    0.0831    0.0993    0.1065    0.0849    0.0903    0.0752    0.0570
Atascosa                0.0794    0.0698    0.0328    0.0642    0.0878    0.1004    0.1058    0.1053    0.0903    0.0828    0.0822    0.0995
Karnes                  0.0817    0.0777    0.0831    0.0812    0.0841    0.0836    0.0846    0.0859    0.0825    0.0827    0.0801    0.0927
Goliad                  0.0810    0.0711    0.0557    0.0680    0.0926    0.0955    0.0992    0.0999    0.0946    0.0823    0.0787    0.0815
Bandera                 0.0833    0.0755    0.0846    0.0807    0.0895    0.0812    0.0874    0.0849    0.0824    0.0895    0.0790    0.0819
Comal                   0.0831    0.0822    0.0841    0.0876    0.0854    0.0853    0.0830    0.0879    0.0825    0.0854    0.0781    0.0754
Kendall                 0.0869    0.0617    0.0569    0.0609    0.0807    0.0770    0.0835    0.0969    0.0928    0.0992    0.1049    0.0986
LiveOak                 0.0795    0.0746    0.0841    0.0820    0.0850    0.0838    0.0872    0.0886    0.0811    0.0825    0.0817    0.0899
Bexar                   0.0531    0.0505    0.0619    0.0717    0.0783    0.0926    0.1371    0.1364    0.0958    0.0891    0.0640    0.0696
Nueces                  0.0737    0.0585    0.0703    0.0770    0.0838    0.0914    0.1013    0.1008    0.0962    0.0909    0.0763    0.0798
Webb                    0.0593    0.0597    0.0671    0.0768    0.0902    0.1030    0.1146    0.1157    0.0986    0.0807    0.0663    0.0679
Refugio                 0.0727    0.0687    0.0558    0.0771    0.0837    0.0967    0.1049    0.1043    0.0989    0.0813    0.0783    0.0778
DeWitt                  0.0718    0.0706    0.0758    0.0824    0.0856    0.0862    0.0914    0.0928    0.0861    0.0829    0.0769    0.0973
Victoria                0.0844    0.0745    0.0897    0.0879    0.0820    0.0902    0.0991    0.1018    0.0856    0.0776    0.0590    0.0681
SanPatricio             0.0742    0.0710    0.0747    0.0854    0.0891    0.0914    0.0932    0.0963    0.0830    0.0816    0.0763    0.0840
Maverick                0.0847    0.0848    0.0839    0.0707    0.0887    0.0847    0.0866    0.0948    0.0917    0.0827    0.0699    0.0768
Bee                     0.0756    0.0722    0.0836    0.0811    0.0862    0.0834    0.0872    0.0871    0.0812    0.0822    0.0748    0.1056
Duval                   0.0808    0.0771    0.0793    0.0816    0.0838    0.0797    0.0851    0.0848    0.0820    0.0830    0.0833    0.0994
Uvalde                  0.0614    0.0629    0.0953    0.1054    0.0929    0.0930    0.0836    0.0891    0.0890    0.0865    0.0712    0.0698
Frio                    0.0620    0.0543    0.0780    0.0773    0.0852    0.0990    0.1261    0.1273    0.0918    0.0752    0.0612    0.0626
Bastrop                 0.0390    0.0386    0.0364    0.0764    0.0871    0.1303    0.1757    0.1589    0.0975    0.0822    0.0427    0.0353
*Travis                  0.0639    0.0539    0.0507    0.0681    0.0848    0.1073    0.1290    0.1379    0.1011    0.0761    0.0577    0.0694
Zavala                  0.1181    0.1323    0.1100    0.0667    0.1047    0.0643    0.0411    0.0599    0.0721    0.0759    0.0607    0.0941
Caldwell                0.0852    0.0817    0.0871    0.0812    0.0830    0.0851    0.0884    0.0838    0.0795    0.0804    0.0874    0.0771
Hays                    0.0733    0.0744    0.0844    0.0963    0.1062    0.0965    0.0865    0.0869    0.0828    0.0718    0.0630    0.0778
Aransas                 0.0810    0.0760    0.0861    0.0838    0.0870    0.0814    0.0816    0.0908    0.0866    0.0867    0.0819    0.0770
Wilson                  0.0833    0.0757    0.0834    0.0785    0.0805    0.0874    0.0866    0.0926    0.0855    0.0826    0.0797    0.0842
Kerr                    0.0640    0.0847    0.1038    0.0904    0.0887    0.0992    0.0978    0.0925    0.0851    0.0759    0.0613    0.0565
Gillespie               0.0549    0.0705    0.0734    0.0744    0.0776    0.0926    0.0937    0.0966    0.0960    0.0961    0.0922    0.0819
Calhoun                 0.0591    0.0424    0.0828    0.0753    0.0888    0.1039    0.1109    0.1164    0.1076    0.0931    0.0524    0.0674
Edwards                 0.0833    0.0833    0.0833    0.0833    0.0833    0.0833    0.0833    0.0833    0.0833    0.0833    0.0833    0.0833
Fayette                 0.0451    0.0406    0.0622    0.0903    0.0911    0.1068    0.1560    0.1729    0.1122    0.0469    0.0294    0.0466
Guadalupe               0.0721    0.0709    0.0800    0.0830    0.0847    0.0882    0.0945    0.0973    0.0917    0.0874    0.0744    0.0759
Medina                  0.0847    0.0860    0.0852    0.0812    0.0840    0.0785    0.0778    0.0867    0.0886    0.0824    0.0848    0.0801
Gonzales                0.0753    0.0743    0.0787    0.0808    0.0834    0.0855    0.0879    0.1013    0.0869    0.0834    0.0790    0.0836
McMullen                0.0740    0.0681    0.0762    0.0815    0.0832    0.0889    0.1001    0.0969    0.0907    0.0800    0.0794    0.0809
Dimmit                  0.0821    0.0770    0.0822    0.0823    0.0847    0.0845    0.0886    0.0909    0.0856    0.0833    0.0795    0.0794
Lavaca                  0.0694    0.0713    0.0728    0.0790    0.0852    0.0882    0.0947    0.0912    0.0907    0.0810    0.0765    0.0999
JimWells                0.0777    0.0753    0.0814    0.0809    0.0852    0.0870    0.0911    0.0891    0.0869    0.0847    0.0790    0.0817
LaSalle                 0.0474    0.0517    0.0905    0.0905    0.1121    0.1164    0.1207    0.1250    0.0905    0.0517    0.0517    0.0517
;
