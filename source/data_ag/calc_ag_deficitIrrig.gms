$ifthen not declared crop_strat
parameter crop_temp(crops,alli,year,allstrat)                                      temp array for epic data;
parameter EPIC_Effect(states, irrigstatus, allstrat, crops, alli)                  the deficit irrigtion yield and water usage changes from EPIC;
parameter crop_strat(county, crops, landirrtype, states, allstrat, alli) the water use and crop yield responding to different state of nature and all strategies ;
parameter buddata2(states,irrigstatus,allstrat,crops,alli)                         temperory buddata for EPIC;
set link_irrig_strat(irrigstatus,allstrat)                                         link the irrigstatus with all strategies;
link_irrig_strat("irrigated",wetstrat)=yes;
link_irrig_strat("dryland",drystrat)=yes;
alias(allstrat, allstrat1);
set EPICproxy(allstrat, crops, allstrat1, crops)      proxy non-EPIC crops strategies
/
   full-s        .soybeans    . S75-Jun-S  . sorghum
   full-f        .soybeans    . S75-Jun-F  . sorghum
   oth-dryland   .soybeans    . S-dryland  . sorghum

   full-s        .sesame      . S75-Jun-S  . sorghum
   full-f        .sesame      . S75-Jun-F  . sorghum
   oth-dryland   .sesame      . S-dryland  . sorghum

   oth-dryland   .canola      . S-dryland  . sorghum

   full-s        .honeydew    . Cant75-S   . cantaloupe
   full-f        .honeydew    . Cant75-f   . cantaloupe

   full-s        .watermelon   . Cant75-S   . cantaloupe
   full-f        .watermelon   . Cant75-f   . cantaloupe
   oth-dryland   .watermelon   . C-dryland  . corn

   full-s        .barley      . W75-Apr-S   . wheat
   full-f        .barley      . W75-Apr-S   . wheat

/   ;


* monthly water usage share for epic
parameter cropwateruse_share(county, crops, allstrat, alli )             crop water use in each month and total
          cropwateruse(county, crops, allstrat, alli)                    crop water use in budget;

*BC part
PARAMETER
    ET0(county, month, states)                                                    Blaney criddle reference evaporation rate
    ROOTWATER(county,MONTH,states)                                               CROP ROOTZONE WATER AVAILABILITY
    WaterNeeds(crops, county, month,  stage, states)                              total water needed during growing period
    IrrigNeeds(Crops, county, month, stage, states)                               extra irrigation needs during growing season (total-precip);
parameter crop_strat_bc(county, crops, landirrtype, states, allstrat, alli)       the crop strategy water usage and yield under BC
          cropwateruse_bc(county, crops, BCstrategy , timing, states)             the water usage under BC  ;

$endif

display wetstrat, drystrat, link_irrig_strat;

* fei 2021, turn off the EPIC, it is too messy

$ontext

* CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
*  FILL IN LARGE TABLE WITH CROP TABLES From EPIC
* CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC

* it contains EPIC YIELD and WATER USE output by IRRIATION STRATEGY
* use year 1996  75% and Sprinkler strategy as baseline for all crops

* Create Dryland info. for EPIC Sorghay
  sorghay("yield",years,"Hay-Dryland") =
     sorghay("yield",years,"Hay50-F") * .441 ;

* merge all EPIC data set
crop_temp('corn',epicitem,year,allstrat)         = corn(epicitem,year,allstrat);
crop_temp('sorghum',epicitem,year,allstrat)      = sorghum(epicitem,year,allstrat);
crop_temp('wheat',epicitem,year,allstrat)        = wheat(epicitem,year,allstrat);
crop_temp('peanut',epicitem,year,allstrat)       = peanuts(epicitem,year,allstrat);
crop_temp('cabbage',epicitem,year,allstrat)      = cabbage(epicitem,year,allstrat);
crop_temp('spinach',epicitem,year,allstrat)      = spinach(epicitem,year,allstrat);
crop_temp('cucumber',epicitem,year,allstrat)     = cucumber(epicitem,year,allstrat);
crop_temp('cantaloupe',epicitem,year,allstrat)   = Cantalop(epicitem,year,allstrat);
crop_temp('onion',epicitem,year,allstrat)        = onion(epicitem,year,allstrat);
crop_temp('cotton',epicitem,year,allstrat)       = cotton(epicitem,year,allstrat);
crop_temp('ricefirst',epicitem,year,allstrat)    = rice(epicitem,year,allstrat);
crop_temp('ricesecond',epicitem,year,allstrat)    = rice(epicitem,year,allstrat);
crop_temp('oats',epicitem,year,allstrat)         = oats(epicitem,year,allstrat);
crop_temp('sorghumhay',epicitem,year,allstrat)   = sorghay(epicitem,year,allstrat);
crop_temp("hay",epicitem,year,allstrat)          = sorghay(epicitem,year,allstrat);
crop_temp('pasture',epicitem,year,allstrat)      = sorghay(epicitem,year,allstrat);


buddata2(states,irrigstatus,allstrat,crops,epicitem)
         $sum((link_irrig_strat(irrigstatus,allstrat), Dates(states,year)),1$crop_temp(crops,epicitem,year,allstrat))
  =       sum((link_irrig_strat(irrigstatus,allstrat), Dates(states,year)),crop_temp(crops,epicitem,year,allstrat))
        / sum((link_irrig_strat(irrigstatus,allstrat), Dates(states,year)),1$crop_temp(crops,epicitem,year,allstrat))  ;

*Total (Annual) irrigation water required
buddata2(states,"irrigated",wetstrat,crops, "WaterUse_AF")
     = sum(watr, buddata2(states,"irrigated",wetstrat,crops,watr));

*checkDI(crops,irrigstatus, "cropbud")=no;
checkDI(crops,irrigstatus, "buddata2")$sum((alli,states,allstrat), buddata2(states,irrigstatus,allstrat,crops,alli))=yes;
checkDI(crops,irrigstatus, "cropbud")$sum((county,alli,landirrmapping(Irrigstatus, landirrtype) ), cropbudgetnew(county, crops, landirrtype, alli) )=yes;


*  CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
*    Using Percentage from Epic to adjust Budget Yield and Water
*    As Dr.McCarl suggested to not use the absolute values but pct of Epic
*  CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
* calculate total water use percentage compared to the baseline
* use 75% moisture sprinkler in the normal state as baseline


EPIC_Effect(states, "irrigated", wetstrat, crops, "WaterUse_AF")
                 $smax(allstrat, buddata2("normal","irrigated",allstrat,crops,"WaterUse_AF"))
                 =buddata2(states,"irrigated",wetstrat,crops,"WaterUse_AF")
                  /smax(allstrat, buddata2("normal","irrigated",allstrat,crops,"WaterUse_AF") );

EPIC_Effect(states, "irrigated", wetstrat, crops, "yield")
                 $smax(allstrat, buddata2("normal","irrigated",allstrat,crops,"yield"))
                 =buddata2(states,"irrigated",wetstrat,crops,"yield")
                  /smax(allstrat, buddata2("normal","irrigated",allstrat,crops,"yield") );

EPIC_Effect(states, "dryland", allstrat, crops, "yield")
                 $ buddata2("normal","dryland",allstrat,crops,"yield")
                 =buddata2(states,"dryland",allstrat,crops,"yield")
                  / buddata2("normal","dryland",allstrat,crops,"yield") ;

display Epic_effect, baseline, buddata2;


* proxy non-EPIC crops full-s and full-f strategies

loop(EPICproxy(allstrat, crops, allstrat1, crop2),
         EPIC_Effect(states, irrigstatus, allstrat, crops, alli)
               = EPIC_Effect(states, irrigstatus, allstrat1, crop2, alli););


EPIC_Effect(states, irrigstatus, allstrat, 'pasture', alli)
     = EPIC_Effect(states, irrigstatus, allstrat, 'hay', alli)    ;

* transfer to crop_strat
crop_strat(county, crops, landirrtype, states, allstrat, alli) =0;
crop_strat(county, crops, "irrigated", states, allstrat, "WaterUse_AF")
                = cropbud(county, crops, "irrigated", "WaterUse_AF")
                  *EPIC_Effect(states, "irrigated", allstrat, crops, "WaterUse_AF")  ;

crop_strat(county, crops, irrigstatus,  states, allstrat, primary)
                = cropbud(county, crops, irrigstatus, primary )
                  *EPIC_Effect(states, irrigstatus, allstrat, crops, "yield")         ;


display Epic_effect, crop_Strat;

*  CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
*  Create Monthly irrigation water required conforming to Month
*  CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC

* recalculate the water monthly share which ends irrigation earlier.
* we do this because the irrigation timing in EPIC is diff as budgets


*absolute water use
cropwateruse(county, crops, "full-s", watr)
              $cropbud(county, crops, "irrigated", watr)
            =  cropbud(county, crops, "irrigated", watr)    ;


cropwateruse(county, crops,wetstrat , watr)
            = sum(mapcropstrat(crops, wetstrat ) , cropwateruse(county, crops, "full-s", watr));

* remove some water use for specific strategies.
* wheat regular irrigation ends in Apr
cropwateruse(county, "wheat", Marstrat, "apr-water")=0;
*corn and sorghum regular irrigation ends in jun
cropwateruse(county, "corn", Maystrat, "Jun-water")=0;
cropwateruse(county, "sorghum", Maystrat, "Jun-water")=0;
*cotton regular irrigation ends in Jul
cropwateruse(county, "cotton", Maystrat, "Jun-water")=0;
cropwateruse(county, "cotton", Maystrat, "Jul-water")=0;
cropwateruse(county, "cotton", Junstrat, "Jul-water")=0;

cropwateruse(county, crops, "full-s", "WaterUse_AF")
              =sum(watr, cropwateruse(county, crops,"full-s", watr) );

cropwateruse(county, crops, wetstrat, "WaterUse_AF")
              =sum(watr, cropwateruse(county, crops, wetstrat, watr) );
*monthly water use share
cropwateruse_share(county, crops, allstrat, watr)
              $cropwateruse(county, crops, allstrat, "WaterUse_AF")
            = cropwateruse(county, crops, allstrat,watr)
             /cropwateruse(county, crops,allstrat, "WaterUse_AF") ;

cropwateruse_share(county, crops, allstrat, watr)
           $ (cropbud(county, crops, "irrigated", "cropland")=0 )=0;

crop_strat(county, crops, "irrigated",  states, allstrat, watr)
         =   crop_strat(county, crops, "irrigated", states, allstrat, "WaterUse_AF")
          * cropwateruse_share(county, crops, allstrat, watr)  ;

* fei remove irrigated hay
crop_strat(county, crops, "irrigated", states, allstrat, alli)
           $mapfieldmix(crops,'hay') =0;

crop_strat(county, crops, "furrow", states, fstrat, alli)
                   $crop_strat(county, crops, "irrigated", states, fstrat, alli)
                   =  crop_strat(county, crops, "irrigated", states, fstrat, alli);

crop_strat(county, crops, "sprinkler", states, allstrat, alli)
                   $crop_strat(county, crops, "irrigated", states, allstrat, alli)
                   =  crop_strat(county, crops, "irrigated", states, allstrat, alli)
                     -crop_strat(county, crops, "furrow", states, allstrat, alli)     ;


display 'fei1', crop_strat;

$offtext

*   CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
*     CROP WATER USE AND dryland   YIELD CALCULATIONS VIA BLANEY CRIDDLE
*   CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC



*   Formula used to calculate BCResult
*http://www.fao.org/docrep/S2022E/s2022e07.htm#TopOfPage

 ET0(county, month, state)
         =m_ET0( ClimateS_month(county, state, month,'tmean'));

 WaterNeeds(crops, county, month,stage, state)
         =m_WaterNeeds(ET0(county, month, state));

 ROOTWATER(county,MONTH,state)
         = m_RootWater(ClimateS_month(county, state, month,  'ppt'))   ;

 IrrigNeeds(Crops, county, month, stage, state)
          = m_IrrigNeeds(WaterNeeds(crops, county, month,stage, state), RootWater(county,MONTH,state)) ;

$ifthen not declared save_dryland_waterlevel

parameter save_dryland_waterlevel(county,crops)                                    save dryland equivilent water level;
save_dryland_waterlevel(county,crops)
         $sum((stage,month),WaterNeeds(crops,county,month,stage,'normal'))
     =    sum((stage,month),ROOTWATER(county,MONTH,'normal')*BCDATA("dryland",CROPs,STAGE,MONTH))
         /sum((stage,month),WaterNeeds(crops,county,month,stage,'normal')) ;

$endif


* water usage after adjusting efficiency and deficit irrigation strategies
cropwateruse_bc(county, crops, BCstrategy, month, state)
       $(cropresponse (crops)  and waterEfficiency(BCstrategy))
       = m_WaterUse(WaterNeeds(crops, county, month,stage, state),ROOTWATER(county,MONTH,state) ,BCstrategy );

* crop yields varying by strategies
crop_strat_bc(county, crops, landirrtype, state, BCstrategy, primary)
      $(cropbud(county, crops, 'irrigated',  primary) and cropbud(county, crops, 'dryland',  primary) and cropresponse (crops))
     =  m_BC_cropyield_irrigbud(county,crops,landirrtype, state, BCstrategy,primary )   ;

crop_strat_bc(county, crops, landirrtype, state, BCstrategy, primary)
      $(cropbud(county, crops, 'irrigated',  primary) and (cropbud(county, crops, 'dryland',  primary)=0) and cropresponse (crops))
         = m_BC_cropyield_irrigbud_only(county,crops,landirrtype, state, BCstrategy,primary )    ;

crop_strat_bc(county, crops, landirrtype,  state, BCstrategy, watr)
           $( sum( primary, cropbud(county, crops, 'irrigated', primary))
          and cropresponse (crops) )
        =sum((mapwater(timing,watr),strat_irr(BCstrategy, landirrtype) ),
               cropwateruse_bc(county, crops, BCstrategy , timing, state));

crop_strat_bc(county, crops, landirrtype,  state, BCstrategy, "WaterUse_AF")
           $ sum( primary, cropbud(county, crops, 'irrigated',  primary))
       =  sum( watr, crop_strat_bc(county, crops, landirrtype,  state, BCstrategy, watr) );

crop_strat_bc(county, crops, 'dryland', state, 'noirrig', primary)
      $(cropbud(county, crops, 'irrigated',  primary) and cropbud(county, crops, 'dryland',  primary) and cropresponse (crops))
     =  m_BC_cropyield_drybud1(county,crops, state, primary )    ;


crop_strat_bc(county, crops, landirrtype,  state, BCstrategy, alli)
        $( cropbudgetnew(county, crops, landirrtype, 'cropland')=0)=0;


* make the crops only have dryland options

crop_strat_bc(county, crops, 'dryland', state, 'noirrig', primary)
      $(cropbud(county, crops, 'dryland',  primary) and cropresponse (crops)
        and ( cropbud(county, crops, 'irrigated',  primary)=0)   )
     =m_BC_cropyield_drybud(ROOTWATER, WaterNeeds,'normal')    ;


crop_strat(county, crops, landirrtype, state, BCstrategy, alli)
       $crop_strat_bc(county, crops, landirrtype,state, BCstrategy, alli)
    = crop_strat_bc(county, crops, landirrtype,  state, BCstrategy, alli);

crop_strat(county, crops, 'Irrigated', state, allstrat, alli)     =0     ;
crop_strat(county, crops, landirrtype, state, allstrat, alli)
         $((crop_strat(county, crops, landirrtype, state, allstrat, alli) >0)
           and (crop_strat(county, crops, landirrtype, state, allstrat, alli) <0.01))=0.01;


*crop_strat(county, crops, "irrigated", crop_mix, states, allstrat, alli)=0;
* fei mark here: we will double check this after get all cropmix
$ifthen not declared checkDI
set checkDI(crops, landirrtype,*)                                                  check if all crops have the deficit irrig startegies ;

checkDI(crops,irrigstatus, "cropbud")$sum((county,alli,landirrmapping(Irrigstatus, landirrtype) ), cropbudgetnew(county, crops, landirrtype, alli) )=yes;

checkDI(crops,irrigstatus, "crop_Strat")  =no;
checkDI(crops,irrigstatus, "crop_Strat")
          $sum((county, alli,states,allstrat, landirrmapping(Irrigstatus, landirrtype)  ),crop_strat(county, crops, landirrtype, states, allstrat, alli))
                 =yes;
checkDI(crops,irrigstatus, "cropmix")
          $sum(( mapfieldmix(crops,crop_mix),county,mixesa)$(not sameas(crop_mix, 'vegetables')),cropmixdata(county,crop_mix,irrigstatus, mixesa ) )
                 =yes;
checkDI(crops,irrigstatus, "cropmix")  $ vege_mix(crops)=no;
checkDI(vege_mix,irrigstatus, "cropmix")
          $sum((county,mixesa), veg_all(county, vege_mix, irrigstatus, mixesa ) )
                 =yes;

checkDI(crops,irrigstatus, "buddata2")=no;

$endif
