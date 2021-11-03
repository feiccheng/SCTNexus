
*   Formula used to calculate BCResult
*http://www.fao.org/docrep/S2022E/s2022e07.htm#TopOfPage
*    ETo = p (0.46 T mean + 8)

parameter climate_climate1(county, scenarios, decades, month, climate)  climate variables
          climate_hist(county, month, climate) historical average level of climate ;

PARAMETER
*BCresult(Lando,CROPS,YEAR,month,GROUPS)  BLANEY CRIDDLE
    c_ET0(county, month, scenarios, decades)                  Blaney criddle reference evaporation rate
    c_ROOTWATER(county,MONTH, scenarios, decades)                  CROP ROOTZONE WATER AVAILABILITY
*    BCCONSTANT(YEAR,MONTH,GROUPS) BC MONTHLY CONS ALA HEIMES-LUCKEY
*    BCav(LANDo,CROPS,GROUPS,month) AVERAGE BLANEY CRIDDLE COEFICIENTS
    c_WaterNeeds(crops, county, month, Irrigstatus, stage, scenarios, decades)
    c_IrrigNeeds(Crops, county, month, allstrat, scenarios, decades)
    IrrigNeeds1(Crops, county, month, allstrat)
    ROOTWATER1(county,MONTH)
    ET01(county, month)
    WaterNeeds1(crops, county, month, Irrigstatus, stage);


climate_climate1(county, scenarios, decades, month, climate)
       = sum(climate_scenarios(gcms, rcps,  scenarios),
                   climate_proj(county, gcms, rcps, decades, Month,climate) )  ;
 climate_hist(county, month, climate)
       = sum(years, Climate_month(county, years,  month,  climate) ) /36 ;

climate_climate1(county, 'base', decades, month, climate)
        =climate_hist(county, month, climate) ;

    c_ET0(county, month, scenarios, decades)
          = DAYLIGHT(MONTH)*(0.46*  climate_climate1(county, scenarios, decades, month, 'tmean')+8);
* water needs = kc (factor) * et0 * days    (converted to feet)
    c_WaterNeeds(crops, county, month, Irrigstatus, stage,  scenarios, decades)
          = (c_ET0(county, month, scenarios, decades)
             *BCDATA(Irrigstatus,CROPs,STAGE,MONTH)
             *BCDATA(Irrigstatus,CROPs,STAGE,"COEF"))/304.8;

* efficienty rainfall (0.8*P-25 if P>75 | 0.6*P-10 if P<75)
    c_ROOTWATER(COUNTY,MONTH, scenarios, decades)
         = max( 0, climate_climate1(county, scenarios, decades, month, 'ppt')*0.8 -25,
                   climate_climate1(county, scenarios, decades, month, 'ppt')*0.6 -10)/304.8   ;

    ET01(county, month)
         = DAYLIGHT(MONTH)*(0.46*  climate_hist(county, month, 'tmean')+8);


    ROOTWATER1(county,MONTH)
           = max( 0, climate_hist(county,  month, 'ppt')*0.8 -25,
                   climate_hist(county,  month, 'ppt')*0.6 -10)/304.8   ;

    WaterNeeds1(crops, county, month, Irrigstatus, stage)
             = (ET01(county, month)
             *BCDATA(Irrigstatus,CROPs,STAGE,MONTH)
             *BCDATA(Irrigstatus,CROPs,STAGE,"COEF"))/304.8;


set irrgpercentage /25,  50, 75, 100/
    mapstrat_irrgpercent_FS(crops, irrgpercentage, landirrtype, allstrat)

/
corn        .        50        .        Furrow        .        C50-May-F
corn        .        50        .        Furrow        .        C50-Jun-F
corn        .        75        .        Furrow        .        C75-May-F
corn        .        75        .        Furrow        .        C75-Jun-F
corn        .        100       .        Furrow        .        full-f
corn        .        50        .        Sprinkler     .        C50-May-S
corn        .        50        .        Sprinkler     .        C50-Jun-S
corn        .        75        .        Sprinkler     .        C75-May-S
corn        .        75        .        Sprinkler     .        C75-Jun-S
corn        .        100       .        Sprinkler     .        full-s
sorghum     .        50        .        Furrow        .        S50-May-F
sorghum     .        50        .        Furrow        .        S50-Jun-F
sorghum     .        75        .        Furrow        .        S75-May-F
sorghum     .        75        .        Furrow        .        S75-Jun-F
sorghum     .        50        .        Sprinkler     .        S50-May-S
sorghum     .        50        .        Sprinkler     .        S50-Jun-S
sorghum     .        75        .        Sprinkler     .        S75-May-S
sorghum     .        75        .        Sprinkler     .        S75-Jun-S
sorghum     .        100       .        Furrow        .        full-f
sorghum     .        100       .        Sprinkler     .        full-s
wheat       .        50        .        Furrow        .        W50-Mar-F
wheat       .        50        .        Furrow        .        W50-Apr-F
wheat       .        75        .        Furrow        .        W75-Mar-F
wheat       .        75        .        Furrow        .        W75-Apr-F
wheat       .        50        .        Sprinkler     .        W50-Mar-S
wheat       .        50        .        Sprinkler     .        W50-Apr-S
wheat       .        75        .        Sprinkler     .        W75-Mar-S
wheat       .        75        .        Sprinkler     .        W75-Apr-S
wheat       .        100       .        Furrow        .        full-f
wheat       .        100       .        Sprinkler     .        full-s
Peanut      .        50        .        Furrow        .        Pnut50-F
Peanut      .        75        .        Furrow        .        Pnut75-F
Peanut      .        50        .        Sprinkler     .        Pnut50-S
Peanut      .        75        .        Sprinkler     .        Pnut75-S
peanut      .        100       .        Furrow        .        full-f
peanut      .        100       .        Sprinkler     .        full-s
ricefirst   .        50        .        Sprinkler     .        rice50-S
ricefirst   .        50        .        Furrow        .        rice50-F
ricefirst   .        75        .        Sprinkler     .        rice75-S
ricefirst   .        75        .        Furrow        .        rice75-F
ricefirst   .        100       .        Furrow        .        full-f
ricefirst   .        100       .        Sprinkler     .        full-s
ricesecond   .        50        .        Sprinkler    .        rice50-S
ricesecond   .        50        .        Furrow        .        rice50-F
ricesecond   .        75        .        Sprinkler    .        rice75-S
ricesecond   .        75        .        Furrow        .        rice75-F
ricesecond   .        100       .        Furrow        .        full-f
ricesecond   .        100       .       Sprinkler     .        full-s
Onion        .        50        .        Furrow        .        Oni50-F
Onion        .        75        .        Furrow        .        Oni75-F
Onion        .        50        .        Sprinkler    .        Oni50-S
Onion        .        75        .        Sprinkler    .        Oni75-S
Onion       .        100       .        Furrow        .        full-f
Onion       .        100       .       Sprinkler     .        full-s
Cabbage     .        50        .        Furrow        .        Cabb50-F
Cabbage     .        75        .        Furrow        .        Cabb75-F
Cabbage     .        50        .        Sprinkler     .        Cabb50-S
Cabbage     .        75        .        Sprinkler     .        Cabb75-S
Cabbage   .        100       .        Furrow        .        full-f
Cabbage   .        100       .       Sprinkler     .        full-s
cantaloupe     .        50        .        Furrow     .        Cant50-F
cantaloupe     .        75        .        Furrow     .        Cant75-F
cantaloupe     .        50        .        Sprinkler  .        Cant50-S
cantaloupe     .        75        .        Sprinkler  .        Cant75-S
cantaloupe   .        100       .        Furrow        .        full-f
cantaloupe   .        100       .       Sprinkler     .        full-s
cucumber     .        50        .        Furrow       .        Cuc50-F
cucumber     .        75        .        Furrow       .        Cuc75-F
cucumber     .        50        .        Sprinkler    .        Cuc50-S
cucumber     .        75        .        Sprinkler    .        Cuc75-S
cucumber  .        100       .        Furrow        .        full-f
cucumber  .        100       .       Sprinkler     .        full-s
SPINACH     .        50        .        Furrow        .        Spin50-F
SPINACH     .        75        .        Furrow        .        Spin75-F
SPINACH     .        50        .        Sprinkler     .        Spin50-S
SPINACH     .        75        .        Sprinkler     .        Spin75-S
SPINACH   .        100       .        Furrow        .        full-f
SPINACH   .        100       .       Sprinkler     .        full-s
sorghumhay  .        50        .        Furrow        .        Hay50-F
sorghumhay  .        75        .        Furrow        .        Hay75-F
sorghumhay  .        50        .        Sprinkler     .        Hay50-S
sorghumhay  .        75        .        Sprinkler     .        Hay75-S
sorghumhay  .        100       .        Furrow        .        full-f
sorghumhay  .        100       .       Sprinkler     .        full-s
hay        .        50        .        Furrow        .        Hay50-F
hay        .        75        .        Furrow        .        Hay75-F
hay        .        50        .        Sprinkler      .        Hay50-S
hay        .        75        .        Sprinkler      .        Hay75-S
pasture        .        50        .        Furrow      .        Hay50-F
pasture        .        75        .        Furrow      .        Hay75-F
pasture        .        50        .        Sprinkler  .        Hay50-S
pasture        .        75        .        Sprinkler  .        Hay75-S
cotton        .        50        .        Furrow      .        Cot50-EB-F
cotton        .        50        .        Furrow      .        Cot50-FB-F
cotton        .        50        .        Furrow      .        Cot50-FO-F
cotton        .        75        .        Furrow      .        Cot75-EB-F
cotton        .        75        .        Furrow      .        Cot75-FB-F
cotton        .        75        .        Furrow      .        Cot75-FO-F
cotton        .        50        .        Sprinkler   .        Cot50-EB-S
cotton        .        50        .        Sprinkler   .        Cot50-FB-S
cotton        .        50        .        Sprinkler   .        Cot50-FO-S
cotton        .        75        .        Sprinkler   .        Cot75-EB-S
cotton        .        75        .        Sprinkler   .        Cot75-FB-S
cotton        .        75        .        Sprinkler   .        Cot75-FO-S
cotton        .        100       .        Furrow        .        full-f
cotton        .        100       .       Sprinkler     .        full-s
sesame     .       100        .Furrow                     .full-f
sesame     .       100        .Sprinkler                   .full-s
honeydew   .       100        .Furrow                     .full-f
honeydew   .       100        .Sprinkler                   .full-s
barley     .       100        .Furrow                     .full-f
barley     .       100        .Sprinkler                   .full-s
canola     .       100        .Furrow                      .full-f
canola     .       100        .Sprinkler                   .full-s
waterMelon .       100        .Furrow                     .full-f
waterMelon .       100        .Sprinkler                  .full-s
sesame     .       75        .  Sprinkler                 .  75-S
sesame     .       50        .  Sprinkler                 .  50-S
honeydew   .       75        .  Sprinkler                 .  75-S
honeydew   .       50        .  Sprinkler                 .  50-S
barley     .       75        .  Sprinkler                 .  75-S
barley     .       50        .  Sprinkler                 .  50-S
canola     .       75        .  Sprinkler                 .  75-S
canola     .       50        .  Sprinkler                 .  50-S
waterMelon .       75        .  Sprinkler                 .  75-S
waterMelon .       50        .  Sprinkler                 .  50-S
sesame    .       25        .Sprinkler                    .  25-S
honeydew  .       25        .Sprinkler                    .  25-S
barley    .       25        .Sprinkler                    .  25-S
canola    .       25        .Sprinkler                    .  25-S
waterMelon.       25        .Sprinkler                    .  25-S

/;




parameter c_cropresponse (crops) crop yield response factor to water some of them are proxied
/  sesame          0.9
   honeydew        1.05
   oats            1.05
   barley          1.05
   canola          0.9
   waterMelon      1.1
   soybeans        0.85
   cabbage         0.95
   hay             0.9
   pasture         0.9
   cucumber        1.1
   onion           1.1
   wheat           1.05
   sorghumhay      0.9
   corn            1.25
   spinach         1.1
   peanut          0.9
   sorghum         0.9
   cantaloupe      1.1
   ricefirst       1.2
   ricesecond      1.2
   Cotton          0.85


/;


parameter FSpercent(irrgpercentage) / 25 0.25, 50 0.50, 75 0.75, 100 1/;

*calculate the irrigation water needs
c_IrrigNeeds(Crops, county, month, allstrat, scenarios, decades)
 =   sum(mapstrat_irrgpercent_FS(crops, irrgpercentage, landirrtype, allstrat) ,
             max(0, sum(stage, c_WaterNeeds(crops, county, month, 'irrigated', stage, scenarios, decades)*FSpercent(irrgpercentage)
                                - c_ROOTWATER(COUNTY,MONTH, scenarios, decades)
                                      *  BCDATA("irrigated",CROPs,STAGE,MONTH) /Days(month)  )));

IrrigNeeds1(Crops, county, month, allstrat)
 =   sum(mapstrat_irrgpercent_FS(crops, irrgpercentage, landirrtype, allstrat) ,
             max(0, sum(stage, WaterNeeds1(crops, county, month, 'irrigated', stage)*FSpercent(irrgpercentage)
                                - ROOTWATER1(COUNTY,MONTH)
                                      *  BCDATA("irrigated",CROPs,STAGE,MONTH) /Days(month)  )));


parameter c_irrig_change(crops, county, timing, allstrat, scenarios, decades)
          c_yield_change(crops, county,  landirrtype,states, allstrat, scenarios, decades);

* irrigation changes
* add upper bound to elemate the extreme changes
 c_irrig_change(crops, county, month, allstrat, scenarios, decades)
        $IrrigNeeds1(Crops, county, month, allstrat)
        = min(1.5,  c_IrrigNeeds(Crops, county, month, allstrat, scenarios, decades)
                 / IrrigNeeds1(Crops, county, month, allstrat) )      ;

parameter irrig_overall_change(crops, county,landirrtype,crop_mix,states, allstrat, scenarios, decades);

irrig_overall_change(crops, county,landirrtype, crop_mix,state,allstrat, scenarios, decades)
         $sum(mapwater(month,watr),    crop_strat(county, crops, landirrtype, crop_mix, state, allstrat, watr))
        = sum(mapwater(month,watr),    crop_strat(county, crops, landirrtype, crop_mix, state, allstrat, watr)
                                         *c_irrig_change(crops, county, month, allstrat, scenarios, decades) )
          / sum(mapwater(month,watr),    crop_strat(county, crops, landirrtype, crop_mix, state, allstrat, watr));


set strat_exist( crops,  landirrtype, allstrat);


option strat_exist< crop_strat;



parameter c_crop_strat(county, crops, landirrtype, crop_mix, states, allstrat, alli, scenarios, decades)  ;

c_crop_strat(county, crops, landirrtype, crop_mix, state, allstrat, watr, scenarios, decades)
     =sum(mapwater(month,watr),    crop_strat(county, crops, landirrtype, crop_mix, state, allstrat, watr)
                                  *  c_irrig_change(crops, county, month, allstrat, scenarios, decades) );

c_crop_strat(county, crops, landirrtype, crop_mix, state, allstrat, "WaterUse_AF", scenarios, decades)
       = sum(mapwater(month,watr),   c_crop_strat(county, crops, landirrtype, crop_mix, state, allstrat, watr, scenarios, decades) );

*irrigated yield changes

*http://www.fao.org/docrep/016/i2800e/i2800e.pdf
*  (1-Ya/Yx)=k*(1-ETa/ETx)
*   Ya=(1- k*(1-ETa/ETx))*Yx

c_yield_change(crops, county, landirrtype,state,  allstrat, scenarios, decades)
            $( landirrmapping('Irrigated', landirrtype)
               and sum((crop_mix), crop_strat(county, crops, landirrtype, crop_mix, state, allstrat, "WaterUse_AF"))
               and sum(irrgpercentage, mapstrat_irrgpercent_FS(crops, irrgpercentage, landirrtype, allstrat))
               and sum(crop_mix, c_crop_strat(county, crops, landirrtype, crop_mix, state, allstrat, "WaterUse_AF", scenarios, decades))
               )
           =      1
                         - c_cropresponse (crops)
                            *  max(0, 1- [sum((month,stage),(c_ROOTWATER(COUNTY,MONTH, scenarios, decades)* BCDATA('Irrigated',CROPs,STAGE,MONTH)/Days(month)  )  )
                                            +sum(crop_mix, c_crop_strat(county, crops, landirrtype, crop_mix, state, allstrat, "WaterUse_AF", scenarios, decades))
                                             / sum(crop_mix, 1$c_crop_strat(county, crops, landirrtype, crop_mix, state, allstrat, "WaterUse_AF", scenarios, decades))    ]
                                         /[ sum((month,stage),(ROOTWATER1(COUNTY,MONTH)* BCDATA('Irrigated',CROPs,STAGE,MONTH)/Days(month)  )  )
                                            +sum(crop_mix, crop_strat(county, crops, landirrtype, crop_mix, state, allstrat, "WaterUse_AF"))
                                             / sum(crop_mix, 1$crop_strat(county, crops, landirrtype, crop_mix, state, allstrat, "WaterUse_AF"))]

                                   )
              ;


* dryland yield changes
parameter c_yield_change1(crops, county, allstrat, scenarios, decades)  ;
alias (allstrat, allstrats);

c_yield_change1(crops, county,   allstrat, scenarios, decades)
            $[sum((primary, crop_mix, state), crop_strat(county, crops, 'dryland', crop_mix, state, allstrat, primary))
              and sum((month,stage),(ROOTWATER1(COUNTY,MONTH)* BCDATA('Irrigated',CROPs,STAGE,MONTH)/Days(month))) ]
           = [ 1 - c_cropresponse (crops)
                            *  (1- [sum((month,stage),(c_ROOTWATER(COUNTY,MONTH, scenarios, decades)* BCDATA('Irrigated',CROPs,STAGE,MONTH)/Days(month)  )  )    ]
                                         /[ sum((month,stage),(ROOTWATER1(COUNTY,MONTH)* BCDATA('Irrigated',CROPs,STAGE,MONTH)/Days(month)  )  )     ]
                                   )  ] ;

display c_yield_change1;

c_crop_strat(county, crops, landirrtype, crop_mix, state, allstrat, primary, scenarios, decades)
         = sum ( cropbudexist(county,crops,LandirrType,crop_mix),
                          c_yield_change(crops, county, landirrtype,state,  allstrat, scenarios, decades)
                          *crop_strat(county, crops, landirrtype, crop_mix, state, allstrat, primary)   );

c_crop_strat(county, crops, 'dryland', crop_mix, state, allstrat, alli, scenarios, decades)  =0;
c_crop_strat(county, crops, 'Irrigated', crop_mix, state, allstrat, alli, scenarios, decades)  =0;

alias (allstrat, allstrat1);

c_crop_strat(county, crops, 'dryland', crop_mix, state, allstrat, primary, scenarios, decades)
        $crop_strat(county, crops, 'dryland', crop_mix, state, allstrat, primary)
         =             c_yield_change1(crops, county,   allstrat, scenarios, decades)
                          *crop_strat(county, crops, 'dryland', crop_mix, state, allstrat, primary)   ;

c_crop_strat(county, crops, 'dryland', crop_mix, state, allstrat, primary, scenarios, decades)
        $(crop_strat(county, crops, 'dryland', crop_mix, state, allstrat, primary)
           and sum((allstrat1), crop_strat(county, crops, 'Irrigated', crop_mix, state, allstrat1, primary))     )
         =    min ( smax((allstrat1), crop_strat(county, crops, 'Irrigated', crop_mix, state, allstrat1, primary)) ,

                          c_yield_change1(crops, county,   allstrat, scenarios, decades)
                          *crop_strat(county, crops, 'dryland', crop_mix, state, allstrat, primary)   );

*c_crop_strat(county, crops, landirrtype, crop_mix, state, allstrat, alli, 'base', decades)=0;
c_crop_strat(county, crops, landirrtype, crop_mix, state, allstrat, alli, scenarios, '2010')=0;
c_crop_strat(county, crops, landirrtype, crop_mix, state, allstrat, alli, scenarios, '2015')=0;
c_crop_strat(county, crops, landirrtype, crop_mix, state, allstrat, alli, scenarios, '1980')=0;
c_crop_strat(county, crops, landirrtype, crop_mix, state, allstrat, alli, scenarios, '1990')=0;

irrig_overall_change(crops, county, landirrtype, crop_mix,state,allstrat, scenarios, '2010')=0;
irrig_overall_change(crops, county, landirrtype, crop_mix,state,allstrat, scenarios, '2015')=0;
irrig_overall_change(crops, county, landirrtype, crop_mix,state,allstrat, scenarios, '1980')=0;
irrig_overall_change(crops, county, landirrtype, crop_mix,state,allstrat, scenarios, '1990')=0;



parameter c_stocking_change(county, scenarios, decades)  ;
 c_stocking_change(county, scenarios, decades)  $crop_strat(county, 'Pasture', 'dryland', 'hay', 'normal', 'Hay-dryland', 'grazing')
          = c_crop_strat(county, 'Pasture', 'dryland', 'hay', 'normal', 'Hay-dryland', 'grazing', scenarios, decades)
                /crop_strat(county, 'Pasture', 'dryland', 'hay', 'normal', 'Hay-dryland', 'grazing')     ;


c_crop_strat(county, crops, landirrtype, crop_mix, state, allstrat, primary, scenarios, decades)
         $ (crop_strat(county, crops, landirrtype, crop_mix, state, allstrat, primary)=0)= 0;


parameter c_yieldchange_final(county, crops, landirrtype, crop_mix,  allstrat, scenarios, decades) ;

c_yieldchange_final(county, crops, landirrtype, crop_mix, allstrat,  scenarios, decades)
         $sum((state, primary), commodprice(county, primary ) *crop_strat(county, crops, landirrtype, crop_mix, state, allstrat, primary))
     = sum((primary,state), Probability(state)*commodprice(county, primary ) *c_crop_strat(county, crops, landirrtype, crop_mix, state, allstrat, primary, scenarios, decades))
       /sum((primary,state), Probability(state)*commodprice(county, primary ) *crop_strat(county, crops, landirrtype, crop_mix, state, allstrat, primary));


parameter  c_cropbudgetnew_totalcost(county, crops, landirrtype, crop_mix,  scenarios, decades)   ;
c_cropbudgetnew_totalcost(county, crops, landirrtype, crop_mix,  scenarios, decades)
         $sum( (state, allstrat, primary),c_crop_strat(county, crops, landirrtype, crop_mix, state, allstrat, primary, scenarios, decades))
               =cropbudgetnew(county,crops,landirrtype,crop_mix, "totalcost")       ;

c_cropbudgetnew_totalcost(county, crops, 'furrow', crop_mix,  scenarios, decades)
         $sum( (state, allstrat, primary),c_crop_strat(county, crops, 'furrow', crop_mix, state, allstrat, primary, scenarios, decades))
               =cropbudgetnew(county,crops,'furrow',crop_mix, "totalcost")
                *(1+  (c_yieldchange_final(county, crops, 'furrow', crop_mix, 'full-f', scenarios, decades)-1)*1)     ;

c_cropbudgetnew_totalcost(county, crops, 'sprinkler', crop_mix,  scenarios, decades)
          $sum( (state, allstrat, primary),c_crop_strat(county, crops, 'sprinkler', crop_mix, state, allstrat, primary, scenarios, decades))
               =cropbudgetnew(county,crops,'sprinkler',crop_mix, "totalcost")
                *(1+  ( c_yieldchange_final(county, crops, 'sprinkler', crop_mix, 'full-s', scenarios, decades) -1)*1)    ;

c_cropbudgetnew_totalcost(county, crops, 'dryland', crop_mix,  scenarios, decades)
         $(sum(allstrat, 1$c_yieldchange_final(county, crops, 'dryland', crop_mix, allstrat, scenarios, decades) )
         and sum( (state, allstrat, primary),c_crop_strat(county, crops, 'dryland', crop_mix, state, allstrat, primary, scenarios, decades)))
               =cropbudgetnew(county,crops,'dryland',crop_mix, "totalcost")
                *(1+  ( sum(allstrat, c_yieldchange_final(county, crops, 'dryland', crop_mix, allstrat, scenarios, decades) )
                           /sum(allstrat, 1$c_yieldchange_final(county, crops, 'dryland', crop_mix, allstrat, scenarios, decades) )-1)*1)     ;


parameter bexartest( crops, landirrtype, crop_mix, states, allstrat, *, scenarios, decades);
 bexartest( crops, landirrtype, crop_mix, states, allstrat, alli, scenarios, decades)
         = c_crop_strat('bexar', crops, landirrtype, crop_mix, states, allstrat, alli, scenarios, decades);

 bexartest( crops, landirrtype, crop_mix, state, allstrat, 'irrig_change', scenarios, decades)
        = irrig_overall_change(crops, 'bexar', landirrtype, crop_mix,state,allstrat, scenarios, decades)  ;


display  IrrigNeeds1, strat_exist, c_irrig_change, bexartest, c_IrrigNeeds, IrrigNeeds1;



