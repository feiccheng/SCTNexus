$ontext
Chengcheng Fei
11/23/2017
Rewrite the data_groudpart.gms file to data_groudpart_new.gms to match the new regression result
Note1: Used the original regression result of Edwards. and Removed the zones in Edwards temporaryly
Note3: Recharge location
Note4: Groundwater pumping limit (upper bound)   (didn't consider it for now)
$offtext

*CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
*CCCC                 Aquifer Part                            CCCC
*CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC

$ifthen not declared EdwardsRech
$include %whereiswater%data_water_aquifer_GroundReg.gms
$include %whereiswater%data_water_aquifer_EdwardsRecharge.gms
$include %whereiswater%data_water_aquifer_histpump.gms
$include %whereiswater%data_water_aquifer_ReturnFlow.gms
$include %whereiswater%data_water_aquifer_EdwardsPermit.gms
$include %whereiswater%data_water_aquifer_EdwardsReg.gms
$include %whereiswater%data_water_aquifer_SAWSPolicy.gms
$include %whereiswater%data_water_aquifer_EdwardCriticalPeriod.gms


alias(layer, mixlayer) ;
set AquiferLayerCounty(aquifer, layer, county)                           mapping of aquifer layer and county
    aquiferLayerCountyReg(aquifer, layer, county)                        mapping aquifer layer county (used in regression);
parameter pumpbase(Aquifer, layer, county)                               the base amount of county level pumping;

parameter adj(states)                                                    adjust the recharge for each state of nature if the value is missing
           /HDry 0.5, MDry 0.7, Dry 0.85, Dnormal 0.95, Normal 1, Wnormal 1.05, Wet 1.15, Mwet 1.3, Hwet 1.5 /;
parameter AquiferHistdatanew(Aquifer, layer, county, states, Regitems)   array used to fill in missing elements in AquiferHistdata;
parameter inilift(Aquifer, layer, county)                                initial lift of aquifer by county and layer
          inilift0(Aquifer, layer, county)                               initial lift of aquifer by county and layer  ;
parameter MIReturnRatio(county, riverlocation)                           the return place proportion of mun and ind water;

parameter lift0(citycounty,aquifer,layer,states)                         Initial Lift Level for each aquifer and layer   Unit: Foot
          pumpcost(citycounty,aquifer,layer,states)                      Pumping cost for each aquifer and layer   Unit: $ per AcreFoot;
scalar    PumpCostPerFoot                                                Pumping Cost Per Foot ($0.1325 per AcreFoot per Foot) Source: Ag Extension Crop Budget     ;


set salinelayer(aquifer, layer)
/
   carrizo . (layer6, layer7, layer8)
 GulfCoast.  (layer2, layer4)
/;


$endif


*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* Aquifer Regression Calculation (ModFlow)    ~
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

AquiferLayerCounty(aquifer, layer, county)      =no;
aquiferLayerCountyReg(aquifer, layer, county)   =no;
* here J17 and sab are the name of wells, j17 is on the east of Edwards and sab is on the west of Edwards
* Edwards Aquifer only has 1 layer. Here we split it to east and west part.

pumpbase(Aquifer, layer, county)
        $sum(years, 1$AquiferHistdata(aquifer, layer, county, years, 'Wells'))
        = -sum(years, AquiferHistdata(aquifer, layer, county, years, 'Wells'))
                                   /sum(years, 1$AquiferHistdata(aquifer, layer, county, years, 'Wells'))   ;


AquiferLayerCounty(aquifer, layer, county)
         $AquiferCountyReg(Aquifer, layer,county, "Wells")=yes;
AquiferLayerCounty(aquifer, layer, county)
         $(pumpbase(Aquifer, layer, county)<5) =no;

AquiferLayerCountyReg(aquifer, layer, county)
         $AquiferLayerCounty(aquifer, layer, county)=yes;

AquiferLayerCounty("Edwards", layer, County)= mapEdwardCounty(layer, county);

AquiferLayerCountyReg("Edwards", 'j17head', 'none')=yes;
AquiferLayerCountyReg("Edwards", 'j27head', 'none')=yes;

* merge Edwards data with other aquifers
AquiferCountyReg('Edwards', layer, 'none', Regitems)=    EdwardsRegPar(layer, Regitems)  ;
AquiferHistdata(AquiferLayerCountyReg("Edwards", layer, 'none'), years, "Recharge")=  EdwardsRech(years, layer)/RechAdj(layer)*1000 ;
AquiferHistdata("Edwards", layer, county, years, 'Wells')
                     =-sum((mapEdwardCounty(layer, county),sector), histpump (county,  'Edwards', 'none', sector, years) ) ;

display aquiferlayercounty, aquiferlayercountyreg;

* average pumping rate
pumpbase(Aquifer, layer, county) =0;
pumpbase(Aquifer, layer, county)
        $sum(years, 1$AquiferHistdata(aquifer, layer, county, years, 'Wells'))
        = -sum(years, AquiferHistdata(aquifer, layer, county, years, 'Wells'))
                                   /sum(years, 1$AquiferHistdata(aquifer, layer, county, years, 'Wells'))   ;

pumpbase('Edwards', layer, 'none')
       = sum(  mapEdwardCounty(layer, county1), pumpbase('Edwards', layer, county1) )  ;
pumpbase('Edwards', layer, county1)$(mapEdwardCounty(layer, county1))=0;



*temporary use the average filling in the blank
*here is not exact right. Groundwater pumpage should have time trend, not only affected by state of nature
* fei adj is my assumaption, we have to replace it based on SWAT

AquiferHistdatanew(Aquifer, layer,county, states, Regitems)
                   $sum(Dates(states,years) , AquiferHistdata(Aquifer, layer,county, years, Regitems))
             =
                 sum(Dates(states,years) , AquiferHistdata(Aquifer, layer, county,years, Regitems))
                  /sum(Dates(states,years) ,1$AquiferHistdata(Aquifer, layer,county, years, Regitems));


AquiferHistdatanew(Aquifer, layer,county, state, Regitems)
             $(AquiferHistdatanew(Aquifer, layer,county, state, Regitems) =0
              and sum(states, AquiferHistdatanew(Aquifer, layer,county, states, Regitems)) )
                       = sum(states, AquiferHistdatanew(Aquifer, layer,county, states, Regitems) )
                         / sum(states, 1$AquiferHistdatanew(Aquifer, layer,county, states, Regitems) )*adj(state);
* add intercept and remove well
AquiferHistdatanew(AquiferLayerCountyReg(aquifer, layer, county), state, "Intercept")=1;
AquiferHistdatanew(Aquifer, layer, county, state, "wells")=0;
AquiferHistdatanew(Aquifer, layer, county, state, "Lift")=0;
AquiferHistdatanew(Aquifer, layer, county, state, "LagLift")=0;


*initial lift
inilift(Aquifer, layer, county)
        $sum(years, 1$AquiferHistdata(Aquifer, layer, county, years, "Lift"))
       = sum(years, AquiferHistdata(Aquifer, layer, county, years, "Lift"))
                                /sum(years, 1$AquiferHistdata(Aquifer, layer, county, years, "Lift"));
* edwards use dem-current level
inilift('Edwards', layer, 'none')  = EdIniLife(layer);
inilift0(Aquifer, layer, county)=inilift(Aquifer, layer, county);

* historical pumping rates
histpump (county,  aquifer, layer, sector1, years) =sum(sectormap(sector1, sector),histpump (county,  aquifer, layer, sector, years));
hist_sur_groud(county, sector1, source, mixesa) =  sum(sectormap(sector1, sector), hist_sur_groud (county, sector, source, mixesa));

display pumpbase , AquiferLayerCountyReg, AquiferLayerCounty, inilift;
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*          Aquifer Drawdown Limits            ~
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
parameter  drawdownlimit(aquifer, layer, county);

drawdownlimit('Edwards', 'J17head', 'none')= 5;
drawdownlimit('Edwards', 'J27head', 'none')= 5;
drawdownlimit(aquifer, layer, county)
      $ (not sameas(aquifer, 'edwards')
          and AquiferLayerCountyReg(Aquifer, layer, county))= 10;

