*^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
* BLANEY CRIDDLE COEFICIENT FOR EVAPOTRANSPIRATION  *^
*^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

 PARAMETER DAYLIGHT(MONTH)  DAYLIGHT HOUR PERCENTAGES FOR USE IN BLANEY CRIDDLE (lattitude= 30N)
         /                JAN          0.2400
                          FEB          0.2500
                          MAR          0.2700
                          APR          0.2900
                          MAY          0.3100
                          JUN          0.3200
                          JUL          0.3100
                          AUG          0.3000
                          SEP          0.2800
                          OCT          0.2600
                          NOV          0.2400
                          DEC          0.2300 /
            Days(month) Days in the month
              /           JAN     31
                          FEB     28
                          MAR     31
                          APR     30
                          MAY     31
                          JUN     30
                          JUL     30
                          AUG     31
                          SEP     30
                          OCT     31
                          NOV     30
                          DEC     31
              /
;
set Stage crop growing stage /STAGE1*STAGE4/ ;

parameter cropresponse (crops) crop yield response factor to water some of them are proxied
*http://www.fao.org/3/X0490E/x0490e0b.htm#crop%20coefficients
/  sesame          1.10
   honeydew        1.05
   oats            1.05
   barley          1.05
   canola          0.95
   waterMelon      1.1
   soybeans        0.85
   cucumber        1.0

cabbage          1.05
hay              1.00
onion            1.05
wheat            1.15
sorghumhay       1.05
corn              1.2
spinach           1.00
peanut           1.15
sorghum          1.05
cantaloupe       0.85
ricefirst        1.2
ricesecond       1.2
rice             1.2
cotton           1.18
pasture          0.85



/;

set BCstrategy(allstrat)   Blaney Criddle strategies/ full-f, full-s, 75-S, 50-S, 25-S, 75-f, 50-f, 25-f, noirrig/
    strat_irr(allstrat, landirrtype) link blandy Criddle strategies with land type
/(full-f, 75-f, 50-f, 25-f). furrow, (full-s, 75-S, 50-S, 25-S).sprinkler, noirrig.dryland/
    baseline_strat(allstrat, landirrtype)  the baseline BC strategies for each land type /full-f.furrow, full-s.sprinkler, noirrig.dryland/

 ;
parameter
          waterEfficiency(allstrat)     the water efficiency of all strategies
/
               full-f 0.5, 75-f 0.5, 50-f 0.5, 25-f 0.5
               full-s 0.9, 75-S 0.9, 50-S 0.9, 25-S 0.9
    /
          irrigrate(allstrat)           the irrigation rate of bc strategies
/
               full-f 1, 75-f 0.75, 50-f 0.5, 25-f 0.25
               full-s 1, 75-S 0.75, 50-S 0.5, 25-S 0.25

/
;


TABLE BCDATA(Irrigstatus,CROPS,STAGE,timing)  BC COEF & DAYS LAND USE BY STAGE MONTH AND BLANEY

* FIRST COLUMN IS BLANEY CRIDDLE COEFICIENT FOR EVAPOTRANSPIRATION AS IN DILLON
* LATER COLUMNS ARE CROP LAND OCCUPATION BY MONTH AND STAGE
* THESE DATA ARE BASED ON BLANEY CRIDDLE DATA AND EXTENSION SERV BUDGETS

                                      COEF  JAN  FEB  MAR  APR  MAY  JUN  JUL  AUG  SEP  OCT  NOV  DEC
irrigated.COTTON      .STAGE1         .450   0.   0.  21.   3.   0.   0.   0.   0.   0.   0.   0.   0.
irrigated.COTTON      .STAGE2         .750   0.   0.   0.  27.  13.   0.   0.   0.   0.   0.   0.   0.
irrigated.COTTON      .STAGE3        1.150   0.   0.   0.   0.  18.  27.   0.   0.   0.   0.   0.   0.
irrigated.COTTON      .STAGE4         .850   0.   0.   0.   0.   0.   3.  31.   2.   0.   0.   0.   0.
dryland  .COTTON      .STAGE1         .200   0.   0.  21.  30.   0.   0.   0.   0.   0.   0.   0.   0.
dryland  .COTTON      .STAGE2         .500   0.   0.   0.   0.  31.  30.   5.   0.   0.   0.   0.   0.
dryland  .COTTON      .STAGE3         .000   0.   0.   0.   0.   0.   0.  26.  10.   0.   0.   0.   0.
dryland  .COTTON      .STAGE4         .250   0.   0.   0.   0.   0.   0.   0.  17.   0.   0.   0.   0.
irrigated.CORN        .STAGE1         .400   0.   0.   0.  15.   6.   0.   0.   0.   0.   0.   0.   0.
irrigated.CORN        .STAGE2         .775   0.   0.   0.   0.  25.  10.   0.   0.   0.   0.   0.   0.
irrigated.CORN        .STAGE3        1.125   0.   0.   0.   0.   0.  20.  21.   0.   0.   0.   0.   0.
irrigated.CORN        .STAGE4         .875   0.   0.   0.   0.   0.   0.  10.  18.   0.   0.   0.   0.
dryland  .CORN        .STAGE1         .400   0.   0.   0.  10.  31.  24.   0.   0.   0.   0.   0.   0.
dryland  .CORN        .STAGE2        1.500   0.   0.   0.   0.   0.   6.  14.   0.   0.   0.   0.   0.
dryland  .CORN        .STAGE3         .500   0.   0.   0.   0.   0.   0.  17.  30.   2.   0.   0.   0.
dryland  .CORN        .STAGE4         .200   0.   0.   0.   0.   0.   0.   0.   0.  16.   0.   0.   0.
irrigated.SORGHUM     .STAGE1         .350   0.   0.  21.   0.   0.   0.   0.   0.   0.   0.   0.   0.
irrigated.SORGHUM     .STAGE2         .725   0.   0.   0.  30.   6.   0.   0.   0.   0.   0.   0.   0.
irrigated.SORGHUM     .STAGE3        1.075   0.   0.   0.   0.  25.  17.   0.   0.   0.   0.   0.   0.
irrigated.SORGHUM     .STAGE4         .775   0.   0.   0.   0.   0.  13.  18.   0.   0.   0.   0.   0.
dryland  .SORGHUM     .STAGE1         .200   0.  10.  31.  17.   0.   0.   0.   0.   0.   0.   0.   0.
dryland  .SORGHUM     .STAGE2         .550   0.   0.   0.  13.  10.   0.   0.   0.   0.   0.   0.   0.
dryland  .SORGHUM     .STAGE3         .450   0.   0.   0.   0.  21.  30.   0.   0.   0.   0.   0.   0.
dryland  .SORGHUM     .STAGE4         .200   0.   0.   0.   0.   0.   0.  18.   0.   0.   0.   0.   0.
irrigated.SORGHUMhay  .STAGE1         .200   0.  10.  31.  17.   0.   0.   0.   0.   0.   0.   0.   0.
irrigated.SORGHUMhay  .STAGE2         .550   0.   0.   0.  13.  10.   0.   0.   0.   0.   0.   0.   0.
irrigated.SORGHUMhay  .STAGE3         .450   0.   0.   0.   0.  21.  30.   0.   0.   0.   0.   0.   0.
irrigated.SORGHUMhay  .STAGE4         .200   0.   0.   0.   0.   0.   0.  18.   0.   0.   0.   0.   0.
dryland  .SORGHUMhay  .STAGE1         .200   0.  10.  31.  17.   0.   0.   0.   0.   0.   0.   0.   0.
dryland  .SORGHUMhay  .STAGE2         .550   0.   0.   0.  13.  10.   0.   0.   0.   0.   0.   0.   0.
dryland  .SORGHUMhay  .STAGE3         .450   0.   0.   0.   0.  21.  30.   0.   0.   0.   0.   0.   0.
dryland  .SORGHUMhay  .STAGE4         .200   0.   0.   0.   0.   0.   0.  18.   0.   0.   0.   0.   0.
irrigated.wheat       .STAGE1         .400   0.   0.   0.   0.   0.   0.   0.   0.   0.   0.  20.  10.
irrigated.wheat       .STAGE2         .800  31.   0.   0.   0.   0.   0.   0.   0.   0.   0.   0.  20.
irrigated.wheat       .STAGE3        1.200   0.   28. 31.   5.   0.   0.   0.   0.   0.   0.   0.   0.
irrigated.wheat       .STAGE4         .750   0.   0.   0.  25.  15.   0.   0.   0.   0.   0.   0.   0.
dryland  .wheat       .STAGE1         .200   0.   0.   0.   0.   0.   0.   0.   0.   0.  26.  30.  31.
dryland  .wheat       .STAGE2         .600   1.  28.   8.   0.   0.   0.   0.   0.   0.   0.   0.   0.
dryland  .wheat       .STAGE3         .500   0.   0.  23.  30.  19.   0.   0.   0.   0.   0.   0.   0.
dryland  .wheat       .STAGE4         .000   0.   0.   0.   0.  12.  17.   0.   0.   0.   0.   0.   0.
irrigated.OATS        .STAGE1         .400   0.   0.   0.   0.   0.   0.   0.   0.   0.   0.  20.  10.
irrigated.OATS        .STAGE2         .800  31.   0.   0.   0.   0.   0.   0.   0.   0.   0.   0.  20.
irrigated.OATS        .STAGE3        1.200   0.   28. 31.   5.   0.   0.   0.   0.   0.   0.   0.   0.
irrigated.OATS        .STAGE4         .750   0.   0.   0.  25.  15.   0.   0.   0.   0.   0.   0.   0.
dryland  .OATS        .STAGE1         .200   0.   0.   0.   0.   0.   0.   0.   0.  19.  31.  30.  32.
dryland  .OATS        .STAGE2         .600  30.   6.   0.   0.   0.   0.   0.   0.   0.   0.   0.   0.
dryland  .OATS        .STAGE3         .600   0.  22.  31.  17.   0.   0.   0.   0.   0.   0.   0.   0.
dryland  .OATS        .STAGE4         .600   0.   0.   0.  13.  14.   0.   0.   0.   0.   0.   0.   0.
irrigated.HAY         .STAGE1         .350   0.  20.  12.   0.   0.   0.   0.   0.   0.   0.   0.   0.
irrigated.HAY         .STAGE2         .725   0.   0.  19.  30.   7.   0.   0.   0.   0.   0.   0.   0.
irrigated.HAY         .STAGE3         .725   0.   0.   0.   0.  24.  30.  10.   0.   0.   0.   0.   0.
irrigated.HAY         .STAGE4         .725   0.   0.   0.   0.   0.   0.  21.  27.   0.   0.   0.   0.
dryland  .HAY         .STAGE1         .200   0.  20.  31.  26.   0.   0.   0.   0.   0.   0.   0.   0.
dryland  .HAY         .STAGE2         .550   0.   0.   0.   4.  27.   0.   0.   0.   0.   0.   0.   0.
dryland  .HAY         .STAGE3         .550   0.   0.   0.   0.   4.  30.  31.   3.   0.   0.   0.   0.
dryland  .HAY         .STAGE4         .550   0.   0.   0.   0.   0.   0.   0.  24.   0.   0.   0.   0.
irrigated.pasture     .STAGE1         .350   0.  20.  12.   0.   0.   0.   0.   0.   0.   0.   0.   0.
irrigated.pasture     .STAGE2         .725   0.   0.  19.  30.   7.   0.   0.   0.   0.   0.   0.   0.
irrigated.pasture     .STAGE3         .725   0.   0.   0.   0.  24.  30.  10.   0.   0.   0.   0.   0.
irrigated.pasture     .STAGE4         .725   0.   0.   0.   0.   0.   0.  21.  27.   0.   0.   0.   0.
dryland  .pasture     .STAGE1         .200   0.  20.  31.  26.   0.   0.   0.   0.   0.   0.   0.   0.
dryland  .pasture     .STAGE2         .550   0.   0.   0.   4.  27.   0.   0.   0.   0.   0.   0.   0.
dryland  .pasture     .STAGE3         .550   0.   0.   0.   0.   4.  30.  31.   3.   0.   0.   0.   0.
dryland  .pasture     .STAGE4         .550   0.   0.   0.   0.   0.   0.   0.  24.   0.   0.   0.   0.
irrigated.SOYBEANS    .STAGE1         .350   0.   0.   0.   0.  12.   5.   0.   0.   0.   0.   0.   0.
irrigated.SOYBEANS    .STAGE2         .750   0.   0.   0.   0.   0.  25.   5.   0.   0.   0.   0.   0.
irrigated.SOYBEANS    .STAGE3        1.075   0.   0.   0.   0.   0.   0.  26.  26.   0.   0.   0.   0.
irrigated.SOYBEANS    .STAGE4         .750   0.   0.   0.   0.   0.   0.   0.   5.  16.   0.   0.   0.
dryland  .SOYBEANS    .STAGE1         .200   0.   0.   0.   0.  17.  25.   0.   0.   0.   0.   0.   0.
dryland  .SOYBEANS    .STAGE2         .800   0.   0.   0.   0.   0.   5.  23.   0.   0.   0.   0.   0.
dryland  .SOYBEANS    .STAGE3         .100   0.   0.   0.   0.   0.   0.   8.  25.   0.   0.   0.   0.
dryland  .SOYBEANS    .STAGE4         .000   0.   0.   0.   0.   0.   0.   0.   6.   6.   0.   0.   0.
irrigated.PEANUT      .STAGE1         .450   0.   0.   0.  11.  19.   0.   0.   0.   0.   0.   0.   0.
irrigated.PEANUT      .STAGE2         .750   0.   0.   0.   0.  12.  27.   0.   0.   0.   0.   0.   0.
irrigated.PEANUT      .STAGE3        1.025   0.   0.   0.   0.   0.   3.  27.   0.   0.   0.   0.   0.
irrigated.PEANUT      .STAGE4         .800   0.   0.   0.   0.   0.   0.   4.  17.   0.   0.   0.   0.
dryland  .PEANUT      .STAGE1         .200   0.   0.  21.  30.   5.   0.   0.   0.   0.   0.   0.   0.
dryland  .PEANUT      .STAGE2         .800   0.   0.   0.   0.  26.  18.   0.   0.   0.   0.   0.   0.
dryland  .PEANUT      .STAGE3         .600   0.   0.   0.   0.   0.  12.  29.   0.   0.   0.   0.   0.
dryland  .PEANUT      .STAGE4         .200   0.   0.   0.   0.   0.   0.   2.  17.   0.   0.   0.   0.
irrigated.CABBAGE     .STAGE1         .500   0.   0.   0.   0.   0.   0.  13.   7.   0.   0.   0.   0.
irrigated.CABBAGE     .STAGE2         .800   0.   0.   0.   0.   0.   0.   0.  24.   6.   0.   0.   0.
irrigated.CABBAGE     .STAGE3        1.100   0.   0.   0.   0.   0.   0.   0.   0.  20.   0.   0.   0.
irrigated.CABBAGE     .STAGE4        1.000   0.   0.   0.   0.   0.   0.   0.   0.   4.   6.   0.   0.
irrigated.cantaloupe  .STAGE1         .500   0.   0.  16.  10.   0.   0.   0.   0.   0.   0.   0.   0.
irrigated.cantaloupe  .STAGE2         .800   0.   0.   0.  20.  17.   0.   0.   0.   0.   0.   0.   0.
irrigated.cantaloupe  .STAGE3        1.050   0.   0.   0.   0.  14.  27.   0.   0.   0.   0.   0.   0.
irrigated.cantaloupe  .STAGE4         .900   0.   0.   0.   0.   0.   3.  18.   0.   0.   0.   0.   0.
irrigated.CUCUMBER    .STAGE1         .500   0.   0.   0.   0.   0.   7.  16.   0.   0.   0.   0.   0.
irrigated.CUCUMBER    .STAGE2         .800   0.   0.   0.   0.   0.   0.  15.  17.   0.   0.   0.   0.
irrigated.CUCUMBER    .STAGE3        1.050   0.   0.   0.   0.   0.   0.   0.  14.  30.   3.   0.   0.
irrigated.CUCUMBER    .STAGE4         .900   0.   0.   0.   0.   0.   0.   0.   0.   0.  18.   0.   0.
irrigated.HONEYDEW    .STAGE1         .500   0.  25.   1.   0.   0.   0.   0.   0.   0.   0.   0.   0.
irrigated.HONEYDEW    .STAGE2         .800   0.   0.  30.   7.   0.   0.   0.   0.   0.   0.   0.   0.
irrigated.HONEYDEW    .STAGE3        1.050   0.   0.   0.  23.  18.   0.   0.   0.   0.   0.   0.   0.
irrigated.HONEYDEW    .STAGE4         .900   0.   0.   0.   0.  13.   8.   0.   0.   0.   0.   0.   0.
irrigated.ONION       .STAGE1         .600   0.   0.   0.   0.   0.   0.   0.   0.   0.   0.  23.   0.
irrigated.ONION       .STAGE2         .800   0.   0.   0.   0.   0.   0.   0.   0.   0.   0.   2.  35.
irrigated.ONION       .STAGE3        1.100  27.  28.  31.  19.   0.   0.   0.   0.   0.   0.   0.   0.
irrigated.ONION       .STAGE4         .900   0.   0.   0.  11.  31.  18.   0.   0.   0.   0.   0.   0.
irrigated.SPINACH     .STAGE1        1.100   0.   0.   0.   0.   0.   0.   0.   0.  24.  24.   0.   0.
irrigated.SPINACH     .STAGE2        1.100   0.   0.   0.   0.   0.   0.   0.   0.   0.   7.  30.  12.
irrigated.SPINACH     .STAGE3        1.100   0.   0.   0.   0.   0.   0.   0.   0.   0.   0.   0.  36.
irrigated.SPINACH     .STAGE4        1.100  12.   0.   0.   0.   0.   0.   0.   0.   0.   0.   0.   0.
irrigated.waterMelon  .STAGE1         .500   0.  10.  15.   0.   0.   0.   0.   0.   0.   0.   0.   0.
irrigated.waterMelon  .STAGE2         .800   0.   0.  16.  19.   0.   0.   0.   0.   0.   0.   0.   0.
irrigated.waterMelon  .STAGE3        1.050   0.   0.   0.  11.  29.   0.   0.   0.   0.   0.   0.   0.
irrigated.waterMelon  .STAGE4         .900   0.   0.   0.   0.   2.  18.   0.   0.   0.   0.   0.   0.
*proxy sesame
irrigated.sesame      .STAGE1         .350   0.   0.   0.   0.  10.  15.   0.   0.   0.   0.   0.   0.
irrigated.sesame      .STAGE2         .750   0.   0.   0.   0.   0.  15.  20.   0.   0.   0.   0.   0.
irrigated.sesame      .STAGE3        1.150   0.   0.   0.   0.   0.   0.  11.  31.   4.   0.   0.   0.
irrigated.sesame      .STAGE4         .550   0.   0.   0.   0.   0.   0.   0.   0.  21.   0.   0.   0.
*use the date in extension budget and the fao website
irrigated.barley      .STAGE1         .450   0.   0.  15.   0.   0.   0.   0.   0.   0.   0.   0.   0.
irrigated.barley      .STAGE2         .750   0.   0.   6.  19.   0.   0.   0.   0.   0.   0.   0.   0.
irrigated.barley      .STAGE3        1.150   0.   0.   0.  11.  31.   8.   0.   0.   0.   0.   0.   0.
irrigated.barley      .STAGE4         .850   0.   0.   0.   0.   0.  22.  10.   0.   0.   0.   0.    0.
irrigated.canola      .STAGE1         .400   0.   0.   0.   0.   0.   0.   0.   0.   0.   0.  20.  10.
irrigated.canola      .STAGE2         .800  31.   0.   0.   0.   0.   0.   0.   0.   0.   0.   0.  20.
irrigated.canola      .STAGE3        1.200   0.   28. 31.   5.   0.   0.   0.   0.   0.   0.   0.   0.
irrigated.canola      .STAGE4         .750   0.   0.   0.  25.  15.   0.   0.   0.   0.   0.   0.   0.
*rice: date from extension, coef from foa
irrigated.ricefirst   .STAGE1        1.1     0.   0.  15.   30.  15.  0.   0.   0.   0.   0.   0.   0.
irrigated.ricefirst   .STAGE2        1.2     0.   0.   0.    0.  16. 14.   0.   0.   0.   0.   0.   0.
irrigated.ricefirst   .STAGE3        1.0     0.   0.   0.    0.   0. 16.   15.   0.   0.   0.   0.   0.


irrigated.ricesecond  .STAGE2        1.2     0.   0.   0.    0.  0.   0.   15.  15.   0.   0.   0.   0.
irrigated.ricesecond  .STAGE3        1.0     0.   0.   0.    0.  0.   0.    0.  16.   15.   0.   0.   0.

;
