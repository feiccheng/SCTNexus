$ifthen not declared  TotalCountyPumpCost
parameter
   TotalCountyPumpCost(county,aquifer,layer,states, allstepsw)                           the pumping cost by steps
   endliftsteps(county,aquifer, layer, states, allstepsw)                                the end lift by pumping steps
   testunitcost(county,aquifer,layer,states, allstepsw)                                   test the cost ;

set nopumpcoef( county,aquifer,layer);
parameter pumpbase_nopump( county,aquifer,layer)  ;


set  steps_dd      the drawdown steps
     /sdd1*sdd31/                        ;
parameter drawdown_dist(steps_dd)   the drawdown distance by steps
    /sdd1   1, sdd2  3, sdd3 5, sdd4 10, sdd5 15, sdd6 20, sdd7 30, sdd8 40, sdd9 50, sdd10 70
     sdd11  100, sdd12 150, sdd13 200, sdd14 250, sdd15 300, sdd16 350, sdd17 400, sdd18 450, sdd19 500, sdd20 600
     sdd21  700, sdd22 800, sdd23 900, sdd24 1000, sdd25 1200, sdd26 1400, sdd27 1600, sdd28 1800, sdd29 2000, sdd30 3500, sdd31 4000
    /;

parameter drawdown_PumpVol(county,aquifer,layer)    how much water can cause the drawdown by 1 feet
          drawdown_cost(county,aquifer,layer,steps_dd)       the drawdown cost unit price by 1 feet
          drawdown_stepdiff(county,aquifer,layer,steps_dd)    the differences between two drawdown steps;
$endif


$include '%whereiswater%calc_water_endlift.gms'

display aquiferhistdatanew, aquifercountyreg, pumpbase, endliftsteps;

$include '%whereiswater%calc_water_countypumpingcost.gms'


* the following for testing purpuse
testunitcost(county,aquifer,layer,states, allstepsw)$( QINCW(allSTEPSw)* pumpbase(Aquifer, layer, county) and not sameas(allSTEPSw, 'w1') and aquiferLayerCountyReg(Aquifer, layer, County))
    =  TotalCountyPumpCost(county,aquifer,layer,states, allstepsw)/ ( QINCW(allSTEPSw)* pumpbase(Aquifer, layer, county))  ;




nopumpcoef( county,aquifer,layer)$sum((states, allstepsw), testunitcost(county,aquifer,layer,states, allstepsw)) =yes;

nopumpcoef( county,aquifer,layer)$AquiferLayerCountyReg(aquifer, layer, county)= no;



pumpbase_nopump( county,aquifer,layer)$nopumpcoef( county,aquifer,layer) =pumpbase(Aquifer, layer, county);

* just inverse the regression to calculate the volumn of pumping
$ontext
 drawdown_PumpVol(county,aquifer,layer)$(not sameas(Aquifer, "Edwards")  and aquiferLayerCountyReg(Aquifer, layer, County))
        = -[ 1
           +IniLift(Aquifer,layer, county)
           -  sum((Regitems, states),
                AquiferHistdatanew(Aquifer, layer, county, states, Regitems)
                *AquiferCountyReg(Aquifer, layer, county, Regitems)
                *probability(states))
           - IniLift(Aquifer,layer, county)*AquiferCountyReg(Aquifer, layer, county, "LagLift")]
          /AquiferCountyReg(Aquifer, layer,county, "Wells")
          *(inregion_pop_per(county)  +1$(inregion_pop_per(county)=0));

$offtext

 drawdown_PumpVol(county,aquifer,layer)$(not sameas(Aquifer, "Edwards")  and aquiferLayerCountyReg(Aquifer, layer, County))
        = -sum(states, [ 1
           +IniLift(Aquifer,layer, county)
           -  sum((Regitems),
                AquiferHistdatanew(Aquifer, layer, county, states, Regitems)
                *AquiferCountyReg(Aquifer, layer, county, Regitems)
               )
           - IniLift(Aquifer,layer, county)*AquiferCountyReg(Aquifer, layer, county, "LagLift")]
          /AquiferCountyReg(Aquifer, layer,county, "Wells")
          *(inregion_pop_per(county)  +1$(inregion_pop_per(county)=0)) *probability(states));


  drawdown_PumpVol('none',"Edwards",layer)$ ( aquiferLayerCountyReg("Edwards", layer, 'none'))
         =-[ 1
            +IniLift("Edwards",layer, 'none')
            -DEM("Edwards",layer)
            + sum((Regitems,states),
                  AquiferHistdatanew("Edwards", layer, 'none', states, Regitems)
                 *AquiferCountyReg("Edwards", layer, 'none', Regitems)
                 *probability(States))
            +((DEM("Edwards","J17Head") - IniLift("Edwards", "J17Head", 'none'))*AquiferCountyReg("Edwards", layer,'none', "J17Head_lag")
                 +(DEM("Edwards","J27Head") - IniLift("Edwards", "J27Head", 'none'))*AquiferCountyReg("Edwards", layer,'none', "J27Head_lag")    )
            ]/(AquiferCountyReg("Edwards", layer,'none', "J17HeadUse")
                +AquiferCountyReg("Edwards", layer,'none', "J27HeadUse"));

* if result<0, then redo assuming drawdown 10;
 drawdown_PumpVol(county,aquifer,layer)$(not sameas(Aquifer, "Edwards")  and aquiferLayerCountyReg(Aquifer, layer, County) and (drawdown_PumpVol(county,aquifer,layer)<0))
        = -[ 10
           +IniLift(Aquifer,layer, county)
           -  sum((Regitems, states),
                AquiferHistdatanew(Aquifer, layer, county, states, Regitems)
                *AquiferCountyReg(Aquifer, layer, county, Regitems)
                *probability(states))
           - IniLift(Aquifer,layer, county)*AquiferCountyReg(Aquifer, layer, county, "LagLift")]
          /AquiferCountyReg(Aquifer, layer,county, "Wells")
          *(inregion_pop_per(county)  +1$(inregion_pop_per(county)=0))
            /10;
* redo with 100
 drawdown_PumpVol(county,aquifer,layer)$(not sameas(Aquifer, "Edwards")  and aquiferLayerCountyReg(Aquifer, layer, County) and (drawdown_PumpVol(county,aquifer,layer)<0))
        = -[ 100
           +IniLift(Aquifer,layer, county)
           -  sum((Regitems, states),
                AquiferHistdatanew(Aquifer, layer, county, states, Regitems)
                *AquiferCountyReg(Aquifer, layer, county, Regitems)
                *probability(states))
           - IniLift(Aquifer,layer, county)*AquiferCountyReg(Aquifer, layer, county, "LagLift")]
          /AquiferCountyReg(Aquifer, layer,county, "Wells")
          *(inregion_pop_per(county)  +1$(inregion_pop_per(county)=0))
            /100;


* makeup the drawdown cost
   drawdown_cost(county,aquifer,layer,steps_dd)$drawdown_PumpVol(county,aquifer,layer)
          = [drawdown_PumpVol(county,aquifer,layer)
            *Demanddata(county,'mun','annual',"price")
            + 500]
            *(1+ drawdown_dist(steps_dd)/100);

   drawdown_cost('none',"Edwards",layer,steps_dd)$drawdown_PumpVol('none',"Edwards",layer)
          = [drawdown_PumpVol('none',"Edwards",layer)
            *Demanddata('bexar','mun','annual',"price")
            + 500]
            *(1+ drawdown_dist(steps_dd)/100);


   drawdown_stepdiff(county,aquifer,layer,steps_dd)$drawdown_PumpVol(county,aquifer,layer)
        =  drawdown_dist(steps_dd)- drawdown_dist(steps_dd-1)
display drawdown_PumpVol, IniLift,  drawdown_cost, drawdown_stepdiff;



