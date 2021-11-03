*CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
*CCCC              Groundwater Return Flows                   CCCC
*CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC

* this need to be modified for 4 aquifers
* need the hydro-elec data
*source: Gillig, McCarl, and Boadu (2001)

Parameter
          RFpercent(sector)         Return flow percentage by type
*** In the following data  set, return flow rate for ag, ind and mun is the average return flow rate from Tasana's model
         /  ag     0.0637
            ind    0.3358
            mun    0.5452
            min    0.00
            rec    0.95
            oth    0.0637
*  hyd data need to modify, just put a fake number here
            hyd    0.9
         /



          RFpercent_reuse(sector)         Return flow percentage by type
*** In the following data  set, return flow rate for ag, ind and mun is the average return flow rate from Tasana's model
         /  ag     0.0637
            ind    0.3358
            mun    0.5452
            min    0.9
            oth    0.0637
         / ;



*RFplace(city, riverplace)
*      = sum( mapcitycountytocounty(city,county), RFplace(county, riverplace) );




$ontext
Parameter RFplaceG(Aquifer,county, riverlocation)  Edwards and Carizo aquifer return flow location and pecentages
* source: Arcmap riverplace and aquifer

/
Edwards       .BEXAR      .CP17_GuadSA  0.14
Edwards       .BEXAR      .CP18_GuadSA  0.14
Edwards       .BEXAR      .CP19_GuadSA  0.14
*Edwards       .BEXAR      .CP261_GuadSA 0.17
*Edwards       .BEXAR      .CP262_GuadSA 0.17
*Edwards       .BEXAR      .CP263_GuadSA 0.17
Edwards       .BEXAR      .CP20_GuadSA  0.14
Edwards       .BEXAR      .CP27_GuadSA  0.14
Edwards       .BEXAR      .CP28_GuadSA  0.14
Edwards       .BEXAR      .CP31_GuadSA  0.14
Edwards       .GUADALUPE  .CP34_GuadSA  1.00
Edwards       .COMAL      .CP02_GuadSA  0.20
Edwards       .COMAL      .CP03_GuadSA  0.20
Edwards       .COMAL      .CP04_GuadSA  0.20
Edwards       .COMAL      .CP05_GuadSA  0.20
*Edwards       .COMAL      .CP73_GuadSA  0.50
Edwards       .COMAL      .CP74_GuadSA  0.20
Edwards       .MEDINA     .CP21_GuadSA  0.08
*Edwards       .MEDINA     .CP22_GuadSA  0.07
Edwards       .MEDINA     .CP23_GuadSA  0.08
Edwards       .MEDINA     .CP241_GuadSA 0.08
Edwards       .MEDINA     .CP242_GuadSA 0.08
Edwards       .MEDINA     .CP25_GuadSA  0.08
Edwards       .MEDINA     .CP16_NUECES  0.08
Edwards       .MEDINA     .CP17_NUECES  0.08
Edwards       .MEDINA     .CP18_NUECES  0.08
Edwards       .MEDINA     .CP19_NUECES  0.08
*Edwards       .MEDINA     .CP201_NUECES 0.07
*Edwards       .MEDINA     .CP202_NUECES 0.07
Edwards       .MEDINA     .CP21_NUECES  0.08
Edwards       .MEDINA     .CP22_NUECES  0.08
*Edwards       .MEDINA     .CP231_NUECES 0.07
Edwards       .MEDINA     .CP232_NUECES 0.08
Edwards       .HAYS       .CP08_GuadSA  0.20
Edwards       .HAYS       .CP09_GuadSA  0.20
Edwards       .HAYS       .CP71_GuadSA  0.20
Edwards       .HAYS       .CP72_GuadSA  0.20
Edwards       .HAYS       .CP75_GuadSA  0.20
Edwards       .UVALDE     .CP01_NUECES  0.08
Edwards       .UVALDE     .CP07_NUECES  0.08
Edwards       .UVALDE     .CP03_NUECES  0.08
Edwards       .UVALDE     .CP08_NUECES  0.08
Edwards       .UVALDE     .CP09_NUECES  0.08
Edwards       .UVALDE     .CP10_NUECES  0.08
Edwards       .UVALDE     .CP24_NUECES  0.08
*Edwards       .UVALDE     .CP111_NUECES 0.08
*Edwards       .UVALDE     .CP112_NUECES 0.08
Edwards       .UVALDE     .CP12_NUECES  0.08
Edwards       .UVALDE     .CP13_NUECES  0.08
Edwards       .UVALDE     .CP141_NUECES 0.08
Edwards       .UVALDE     .CP142_NUECES 0.08
Edwards       .UVALDE     .CP15_NUECES  0.08
Edwards       .KINNEY     .CP02_NUECES  1.00
Edwards       .ATASCOSA   .CP28_NUECES  1.00
Carrizo      .UVALDE     .CP01_NUECES  0.08
Carrizo     .UVALDE     .CP07_NUECES  0.08
Carrizo     .UVALDE     .CP03_NUECES  0.08
Carrizo     .UVALDE     .CP08_NUECES  0.08
Carrizo     .UVALDE     .CP09_NUECES  0.08
Carrizo     .UVALDE     .CP10_NUECES  0.08
Carrizo     .UVALDE     .CP24_NUECES  0.08
Carrizo     .UVALDE     .CP12_NUECES  0.08
Carrizo     .UVALDE     .CP13_NUECES  0.08
Carrizo     .UVALDE     .CP141_NUECES 0.08
Carrizo     .UVALDE     .CP142_NUECES 0.08
Carrizo     .UVALDE     .CP15_NUECES  0.08
Carrizo      .BEXAR      .CP17_GuadSA  0.14
Carrizo      .BEXAR      .CP18_GuadSA  0.14
Carrizo      .BEXAR      .CP19_GuadSA  0.14
Carrizo      .BEXAR      .CP20_GuadSA  0.14
Carrizo      .BEXAR      .CP27_GuadSA  0.14
Carrizo      .BEXAR      .CP28_GuadSA  0.14
Carrizo      .BEXAR      .CP31_GuadSA  0.14
Carrizo       .WILSON     .CP32_GuadSA  1.00
Carrizo       .KARNES     .CP32_GuadSA  0.50
Carrizo       .KARNES     .CP35_GuadSA  0.50
Carrizo       .GUADALUPE  .CP34_GuadSA  1.00
Carrizo       .GONZALES   .CP06_GuadSA  1.00
Carrizo       .CALDWELL   .CP10_GuadSA  0.50
Carrizo       .CALDWELL   .CP11_GuadSA  0.50
Carrizo       .ZAVALA     .CP04_NUECES  1.00
Carrizo       .DIMMIT     .CP04_NUECES  1.00
Carrizo       .LASALLE    .CP05_NUECES  1.00
Carrizo       .MCMULLEN   .CP06_NUECES  0.50
Carrizo       .MCMULLEN   .CP26_NUECES  0.50
Carrizo       .FRIO       .CP25_NUECES  1.00
Carrizo       .ATASCOSA   .CP28_NUECES  1.00
Carrizo       .WEBB       .CP06_NUECES  1.00
Carrizo       .MAVERICK   .CP04_NUECES  1.00
Carrizo       .MEDINA     .CP21_GuadSA  0.08
*Edwards       .MEDINA     .CP22_GuadSA  0.07
Carrizo       .MEDINA     .CP23_GuadSA  0.08
Carrizo       .MEDINA     .CP241_GuadSA 0.08
Carrizo        .MEDINA     .CP242_GuadSA 0.08
Carrizo        .MEDINA     .CP25_GuadSA  0.08
Carrizo        .MEDINA     .CP16_NUECES  0.08
Carrizo        .MEDINA     .CP17_NUECES  0.08
Carrizo        .MEDINA     .CP18_NUECES  0.08
Carrizo        .MEDINA     .CP19_NUECES  0.08
*Edwards       .MEDINA     .CP201_NUECES 0.07
*Edwards       .MEDINA     .CP202_NUECES 0.07
Carrizo        .MEDINA     .CP21_NUECES  0.08
Carrizo        .MEDINA     .CP22_NUECES  0.08
*Edwards       .MEDINA     .CP231_NUECES 0.07
Carrizo       .MEDINA     .CP232_NUECES 0.08

Carrizo       .Bastrop    .CP11_GuadSA  1.00
Carrizo       .Dewitt     .CP13_GuadSA  0.50
Carrizo       .Dewitt     .CP14_GuadSA  0.50
Carrizo       .LiveOak    .CP27_NUECES  0.50
Carrizo       .LIVEOAK    .CP29_NUECES  0.50
Carrizo       .Bee        .B10000_Minor 0.50
Carrizo       .Bee        .D10000_Minor 0.50
Carrizo       .Fayette    .CP12_GuadSA  1.00
Carrizo       .Lavaca     .CP14_GuadSA  1.00

GulfCoast     .Nueces     .CP31_NUECES  1.00
GulfCoast     .KARNES     .CP36_GuadSA  1.00
GulfCoast     .GOLIAD     .CP37_GuadSA  1.00
GulfCoast     .DEWITT     .CP13_GuadSA  0.50
GulfCoast     .DEWITT     .CP14_GuadSA  0.50
GulfCoast     .VICTORIA   .CP15_GuadSA  0.50
GulfCoast     .VICTORIA   .CP16_GuadSA  0.50
GulfCoast     .CALHOUN    .CPEST_GuadSA 1.00
GulfCoast     .REFUGIO    .CP38_GuadSA  0.33
GulfCoast     .REFUGIO    .A10000_Minor 0.33
GulfCoast     .REFUGIO    .C10000_Minor 0.33
GulfCoast     .SANPATRICIO.CP30_NUECES  0.50
GulfCoast     .SANPATRICIO.E10000_Minor 0.50
GulfCoast     .MCMULLEN   .CP30_NUECES  1.00
GulfCoast     .LIVEOAK    .CP27_NUECES  0.50
GulfCoast     .LIVEOAK    .CP29_NUECES  0.50
GulfCoast     .ARANSAS    .10000_Minor  1.00
GulfCoast     .BEE        .B10000_Minor 0.50
GulfCoast     .BEE        .D10000_Minor 0.50
GulfCoast     .Gonzales   .CP06_GuadSA  1.00
GulfCoast     .Webb       .CP30_NUECES  1.00
GulfCoast     .Jimwells   .CP30_NUECES  1.00
GulfCoast     .Duval      .CP30_NUECES  1.00
GulfCoast     .Fayette    .CP12_GuadSA  1.00
GulfCoast     .Lavaca     .CP14_GuadSA  1.00
EdwardsTrinity.Edwards    .CP02_NUECES  1.00
EdwardsTrinity.KENDALL    .CP01_GuadSA  0.50
EdwardsTrinity.KENDALL    .CP33_GuadSA  0.50
EdwardsTrinity       .BEXAR      .CP17_GuadSA  0.14
EdwardsTrinity       .BEXAR      .CP18_GuadSA  0.14
EdwardsTrinity       .BEXAR      .CP19_GuadSA  0.14
*Edwards       .BEXAR      .CP261_GuadSA 0.17
*Edwards       .BEXAR      .CP262_GuadSA 0.17
*Edwards       .BEXAR      .CP263_GuadSA 0.17
EdwardsTrinity    .BEXAR      .CP20_GuadSA  0.14
EdwardsTrinity    .BEXAR      .CP27_GuadSA  0.14
EdwardsTrinity    .BEXAR      .CP28_GuadSA  0.14
EdwardsTrinity      .BEXAR      .CP31_GuadSA  0.14
EdwardsTrinity.KERR       .CP01_GuadSA  1.00
EdwardsTrinity.GILLESPIE  .CP01_GuadSA  1.00
EdwardsTrinity.BANDERA    .CP21_GuadSA  1.00
EdwardsTrinity       .COMAL      .CP02_GuadSA  0.20
EdwardsTrinity       .COMAL      .CP03_GuadSA  0.20
EdwardsTrinity       .COMAL      .CP04_GuadSA  0.20
EdwardsTrinity        .COMAL      .CP05_GuadSA  0.20
EdwardsTrinity        .COMAL      .CP74_GuadSA  0.20
EdwardsTrinity        .MEDINA     .CP21_GuadSA  0.08
EdwardsTrinity       .MEDINA     .CP23_GuadSA  0.08
EdwardsTrinity       .MEDINA     .CP241_GuadSA 0.08
EdwardsTrinity       .MEDINA     .CP242_GuadSA 0.08
EdwardsTrinity        .MEDINA     .CP25_GuadSA  0.08
EdwardsTrinity        .MEDINA     .CP16_NUECES  0.08
EdwardsTrinity        .MEDINA     .CP17_NUECES  0.08
EdwardsTrinity        .MEDINA     .CP18_NUECES  0.08
EdwardsTrinity        .MEDINA     .CP19_NUECES  0.08
EdwardsTrinity        .MEDINA     .CP21_NUECES  0.08
EdwardsTrinity        .MEDINA     .CP22_NUECES  0.08
EdwardsTrinity        .MEDINA     .CP232_NUECES 0.08
EdwardsTrinity.BLANCO     .CP08_GuadSA  1.00
EdwardsTrinity.REAL       .CP16_NUECES  1.00
EdwardsTrinity.KINNEY     .CP02_NUECES  1.00
EdwardsTrinity.Travis     .CP09_GuadSA  1.00
EdwardsTrinity      .HAYS       .CP08_GuadSA  0.20
EdwardsTrinity      .HAYS       .CP09_GuadSA  0.20
EdwardsTrinity      .HAYS       .CP71_GuadSA  0.20
EdwardsTrinity      .HAYS       .CP72_GuadSA  0.20
EdwardsTrinity      .HAYS       .CP75_GuadSA  0.20
EdwardsTrinity      .UVALDE     .CP01_NUECES  0.08
EdwardsTrinity      .UVALDE     .CP07_NUECES  0.08
EdwardsTrinity      .UVALDE     .CP03_NUECES  0.08
EdwardsTrinity      .UVALDE     .CP08_NUECES  0.08
EdwardsTrinity      .UVALDE     .CP09_NUECES  0.08
EdwardsTrinity      .UVALDE     .CP10_NUECES  0.08
EdwardsTrinity      .UVALDE     .CP24_NUECES  0.08
EdwardsTrinity     .UVALDE     .CP12_NUECES  0.08
EdwardsTrinity     .UVALDE     .CP13_NUECES  0.08
EdwardsTrinity     .UVALDE     .CP141_NUECES 0.08
EdwardsTrinity       .UVALDE     .CP142_NUECES 0.08
EdwardsTrinity       .UVALDE     .CP15_NUECES  0.08

/;
$offtext

