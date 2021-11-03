$ifthen not declared primaryscales
parameter
primaryscales(primary)/
AngoraKid                      4.030
CullDoe-Angora                 1.830
AdultMohair                   45.500
YearlingMohair                23.660
KidMohair                     25.620
Steer                          2.274
Heifer                         1.519
CullCow                        1.457
CullBull                       0.503
MeatGoatKid                    3.590
CullDoe-Meat                   1.320
Lambs                          5.070
CullEwes                       1.210
Wool                          65.000
Stocker                        5.700
cabbage                      500
hay                            5
cucumber                     100
onion                        600
sesame                        10
wheat                         40
oats                         100
honeydew                     550
sorghumhay                    10
barley                         1
canola                        40
corn                          90
spinach                       300
peanut                        30
sorghum                       40
cantaloupe                    300
waterMelon                    300
soybeans                      40
rice                          40
CottonLint                    800
Cottonseed                    0.5
Grazing                       10
/

;

parameter scale_drawdown(aquifer,layer,county)           the drawdown scales
          scale_projects(projects)                              water proejct scales;
$endif

scale_drawdown(aquifer,layer,county)
         $pumpbase(Aquifer, layer, county)
         =abs(endliftsteps(county,aquifer, layer, 'normal', 'w12')
           /pumpbase(Aquifer, layer, county))
              ;

scale_projects(projects)=investmentcost(projects,'ProjectYield')/12      ;

* agricultural variables
  AV_LANDTRANS.scale(county, landirrtype,zones, landirrtype2,zones2)
         $domain_for_AV_LANDTRANS(county, landirrtype,zones, landirrtype2,zones2)
                 =1;

  AV_LANDTRANS.scale(county, landirrtype,zones, landirrtype2,zones2)
         $domain_for_AV_LANDTRANS(county, landirrtype,zones, landirrtype2,zones2)
                 =1;

  AV_CROPACRES.scale(county,zones,crops,landirrtype)
         $domain_for_AV_CROPACRES(county,zones,crops,landirrtype)
                 =1;

  AV_CROPSTRATEGY.scale(county,zones, crops, landirrtype, stateofnature, allstrat)
         $domain_for_AV_CROPSTRATEGY(county,zones, crops, landirrtype, stateofnature, allstrat)
                  =1/probability(stateofnature);

  AV_LIVEPROD.scale(county, livestock)
         $domain_for_AV_LIVEPROD(county, livestock)
                 =1;

  AV_LIVEGRAZING.scale(county,livestock,stateofnature)
         $domain_for_AV_LIVEGRAZING(county,livestock,stateofnature)
                 =10/probability(stateofnature);

  AV_HAYFEED.scale(county,livestock,primary,stateofnature)
         $domain_for_AV_HAYFEED(county,livestock,primary,stateofnature)
                 =1/probability(stateofnature);

  AV_HAYPURCHASE.scale(county,primary,stateofnature)
         $domain_for_AV_HAYPURCHASE(county,primary,stateofnature)
                 =1/probability(stateofnature);

  AV_HAYTRANS.scale(county1,county,primary,stateofnature)
         $domain_for_AV_HAYTRANS(county1,county,primary,stateofnature)
                 =1/probability(stateofnature);

  AV_AGSALE.scale(county, primary, stateofnature)
         $domain_for_AV_AGSALE(county, primary, stateofnature)
         =primaryscales(primary)/probability(stateofnature);

  AV_CROPMIX.scale(county,irrigstatus,mixesa)
         $domain_for_AV_CROPMIX(county,irrigstatus,mixesa)
                 =1;

  AV_VEGMIX.scale(county,irrigstatus,mixesa)
         $domain_for_AV_VEGMIX(county,irrigstatus,mixesa)
                  =1;
  AV_LIVEMIX.scale(county,mixesa)
         $domain_for_AV_LIVEMIX(county,mixesa)
                   =1;

* water variables
  WV_AGZONEWATERUSE.scale(county,zones,month,RiverAndAquifer,stateofnature)
         $domain_for_WV_AGZONEWATERUSE(county,zones,month,RiverAndAquifer,stateofnature)
                  =1/probability(stateofnature);

  WV_SURFACEDIVERSION.scale(river,riverplace,citycounty,sector,month,stateofnature)
         $domain_for_WV_SURFACEDIVERSION(river,riverplace,citycounty,sector,month,stateofnature)
                  =1/probability(stateofnature);

  WV_PUMP_GROUNDWATER.scale(aquifer,layer,citycounty,sector,month,stateofnature)
         $domain_for_WV_PUMP_GROUNDWATER(aquifer,layer,citycounty,sector,month,stateofnature)
                  =1/probability(stateofnature);

  WV_OTHERWATERSOURCE.scale(citycounty,sector,month,stateofnature)
         $domain_for_WV_OTHERWATERSOURCE(citycounty,sector,month,stateofnature)
                  =1/probability(stateofnature);

  WV_ADDUPUSERALLWATER.scale(customer,sector,month,stateofnature)
         $domain_for_WV_ADDUPUSERALLWATER(customer,sector,month,stateofnature)
                  =1/probability(stateofnature);

  WV_WATERDEMAND_STEPS.scale(customer,sector,allsteps)
         $domain_for_WV_WATERDEMAND_STEPS(customer,sector,allsteps)
                 =12/ Demanddata(customer,sector,'annual',"quantity");

  WV_WATERDEMAND.scale(customer,sector)
         $domain_for_WV_WATERDEMAND(customer,sector)
                  =12;


*surface water variables
  WV_FLOW.scale(river,riverplace,downriver,month,stateofnature)
         $domain_for_WV_FLOW(river,riverplace,downriver,month,stateofnature)
                  =10/probability(stateofnature);

  WV_RETURNFLOW.scale(customer,sector,month,stateofnature)
         $domain_for_WV_RETURNFLOW(customer,sector,month,stateofnature)
                  =1/probability(stateofnature);

  WV_OUTTOBAY.scale(river,riverplace,month,stateofnature)
         $domain_for_WV_OUTTOBAY(river,riverplace,month,stateofnature)
                  =1/probability(stateofnature);
  WV_RESERVOIR_WITHDRAW.scale(reservoir,month,stateofnature)
         $domain_for_WV_RESERVOIR_WITHDRAW(reservoir,month,stateofnature)
                  =1/probability(stateofnature);

  WV_RESERVOIR_RELEASE.scale(reservoir,month,stateofnature)
         $domain_for_WV_RESERVOIR_RELEASE(reservoir,month,stateofnature)
                  =1/probability(stateofnature);

  WV_SPRNFLOW.scale(springs,stateofnature)
         $domain_for_WV_SPRNFLOW(springs,stateofnature)
                  =1/probability(stateofnature);

  WV_RESERVIOR_INVENTORY.scale(reservoir, month, stateofnature)
         $domain_for_WV_RESERVIOR_INVENTORY(reservoir, month, stateofnature)
                  =1/probability(stateofnature);

  WV_RESERVIOR_INVENTORY_INI.scale(reservoir)
         $domain_for_WV_RESERVIOR_INVENTORY_INI(reservoir)
                 =1;

*ground water variables
  WV_PUMP_STEP.scale(county,Aquifer,layer,stateofnature,stepw)
         $domain_for_WV_PUMP_STEP(county,Aquifer,layer,stateofnature,stepw)
                  =1/probability(stateofnature)/pumpbase(Aquifer, layer, county);

  WV_TOTALCOUNTYPUMP.scale(county, Aquifer, layer, month, stateofnature)
         $domain_for_WV_TOTALCOUNTYPUMP(county, Aquifer, layer, month, stateofnature)
                  =1/probability(stateofnature);

  WV_DRAWDOWN.scale(aquifer, layer, county, steps_dd)
         $domain_for_WV_DRAWDOWN(aquifer, layer, county, steps_dd)
                 =scale_drawdown(aquifer,layer,county);
* water mix
  WV_MIX_GRDPUMP.scale(county,years,stateofnature)
         $domain_for_WV_MIX_GRDPUMP(county,years,stateofnature)
                  =1/probability(stateofnature);

  WV_MIX_SURGRD.scale(county,gsector,mixesa,stateofnature)
         $domain_for_WV_MIX_SURGRD(county,gsector,mixesa,stateofnature)
                  =1/probability(stateofnature);


* water projects
  WV_WP_USEGROUND.scale(Projects,sector,customer,county,aquifer,layer,month,stateofnature)
         $domain_for_WV_WP_USEGROUND(Projects,sector,customer,county,aquifer,layer,month,stateofnature)
                  =10/probability(stateofnature);

  WV_WP_USEASR.scale(projects,sector,customer,month,stateofnature)
         $domain_for_WV_WP_USEASR(projects,sector,customer,month,stateofnature)
                  =10/probability(stateofnature);

  WV_WP_USESURFACE.scale(projects,sector,customer,sourceriver,riverplace,month,stateofnature)
         $domain_for_WV_WP_USESURFACE(projects,sector,customer,sourceriver,riverplace,month,stateofnature)
                  =10/probability(stateofnature);

  WV_WP_USEOCR.scale(projects,sector,customer,OCR,month,stateofnature)
         $domain_for_WV_WP_USEOCR(projects,sector,customer,OCR,month,stateofnature)
                  =10/probability(stateofnature);

  WV_WP_USEOUTSIDE.scale(projects,sector,customer,month,stateofnature)
         $domain_for_WV_WP_USEOUTSIDE(projects,sector,customer,month,stateofnature)
                  =10/probability(stateofnature);

  WV_WP_USESEAWATER.scale(projects,sector,customer,month,stateofnature)
         $domain_for_WV_WP_USESEAWATER(projects,sector,customer,month,stateofnature)
                  =10/probability(stateofnature);

  WV_WP_USEREUSE.scale(projects,sector,customer,sector1,citycounty,month,stateofnature)
         $domain_for_WV_WP_USEREUSE(projects,sector,customer,sector1,citycounty,month,stateofnature)
                  =10/probability(stateofnature);

  WV_WP_PROJECTWATER.scale(projects,sector,customer,month,stateofnature)
         $domain_for_WV_WP_PROJECTWATER(projects,sector,customer,month,stateofnature)
                  =1/probability(stateofnature);

  WV_WP_SURFACE_ACQUWR.scale(projects,sourceriver,riverplace,county,sector,month,stateofnature)
         $domain_for_WV_WP_SURFACE_ACQUWR(projects,sourceriver,riverplace,county,sector,month,stateofnature)
                  =10/probability(stateofnature);

  WV_WP_SURFACE_NEWWR.scale(projects,sourceriver,riverplace,month,stateofnature)
         $domain_for_WV_WP_SURFACE_NEWWR(projects,sourceriver,riverplace,month,stateofnature)
                  =10/probability(stateofnature);

  WV_WP_ASROCR_INVENTORY_INI.scale(projects)
         $domain_for_WV_WP_ASROCR_INVENTORY_INI(projects)
                  =10;

  WV_WP_ASROCR_INVENTORY.scale(projects, month, stateofnature)
         $domain_for_WV_WP_ASROCR_INVENTORY(projects, month, stateofnature)
                  =10/probability(stateofnature);

  WV_WP_ASR_FROMGROUND.scale(projects,sourcecounty,sourceaquifer,layer,month,stateofnature)
         $domain_for_WV_WP_ASR_FROMGROUND(projects,sourcecounty,sourceaquifer,layer,month,stateofnature)
                  =10/probability(stateofnature);

  WV_WP_ASR_FROMSURFACE.scale(projects,sourceriver,riverplace,county,sector,month,stateofnature)
         $domain_for_WV_WP_ASR_FROMSURFACE(projects,sourceriver,riverplace,county,sector,month,stateofnature)
                  =10/probability(stateofnature);

  WV_WP_ASR_FROMSURFACE_NEWWR.scale(projects,sourceriver,riverplace,month,stateofnature)
         $domain_for_WV_WP_ASR_FROMSURFACE_NEWWR(projects,sourceriver,riverplace,month,stateofnature)
                  =10/probability(stateofnature);

  WV_WP_RECHARGE_AQUIFER.scale(projects,sector,citycounty,aquifer,layer, month,stateofnature)
         $domain_for_WV_WP_RECHARGE_AQUIFER(projects,sector,citycounty,aquifer,layer, month,stateofnature)
                  =1/probability(stateofnature);


  WV_WP_ASR_FROMREUSE.scale(projects,sector,citycounty,month,stateofnature)
         $domain_for_WV_WP_ASR_FROMREUSE(projects,sector,citycounty,month,stateofnature)
                  =10/probability(stateofnature);

  WV_WP_ASR_FROMEXTRA.scale(projects,sector,citycounty,month,stateofnature)
         $domain_for_WV_WP_ASR_FROMEXTRA(projects,sector,citycounty,month,stateofnature)
                  =1/probability(stateofnature);

  WV_WP_OCR_FROMSURFACE.scale(projects,sourceriver,riverplace,county,sector,month,stateofnature)
         $domain_for_WV_WP_OCR_FROMSURFACE(projects,sourceriver,riverplace,county,sector,month,stateofnature)
                  =10/probability(stateofnature);

  WV_WP_OCR_FROMSURFACE_NEWWR.scale(projects,sourceriver,riverplace,month,stateofnature)
         $domain_for_WV_WP_OCR_FROMSURFACE_NEWWR(projects,sourceriver,riverplace,month,stateofnature)
                  =10/probability(stateofnature);

  WV_WP_REUSE_EFFLUENT.scale(customer,sector,month,stateofnature)
         $domain_for_WV_WP_REUSE_EFFLUENT(customer,sector,month,stateofnature)
                  =1/probability(stateofnature);



  WV_WP_Conservation.scale(customer)
         $domain_for_WV_WP_Conservation(customer)
                  =100;

* water markets                                                                                                 $domain_for_water markets
  WV_WM_DYO_ENROLL.scale(county, permittype)
         $domain_for_WV_WM_DYO_ENROLL(county, permittype)
                 =1;

  WV_WM_DYO_SUSPEND.scale(county,stateofnature)
         $domain_for_WV_WM_DYO_SUSPEND(county,stateofnature)
                  =1/probability(stateofnature);

  WV_WM_LEASE_RIVER.scale(river,riverplace,county,sector,riverlocation,county,sector,stateofnature)
         $domain_for_WV_WM_LEASE_RIVER(river,riverplace,county,sector,riverlocation,county,sector,stateofnature)
                  =1/probability(stateofnature);

  WV_WM_TRADE_RIVER.scale(river,riverplace,county,sector,riverlocation,county,sector)
         $domain_for_WV_WM_TRADE_RIVER(river,riverplace,county,sector,riverlocation,county,sector)
                 =10;

  WV_WM_LEASE_AQUIFER.scale(aquifer,county,sector,county1, sector1,stateofnature)
         $domain_for_WV_WM_LEASE_AQUIFER(aquifer,county,sector,county1, sector1,stateofnature)
                  =1/probability(stateofnature);

  WV_WM_TRADE_AQUIFER.scale(aquifer,county,sector,county1, sector1)
         $domain_for_WV_WM_TRADE_AQUIFER(aquifer,county,sector,county1, sector1)
                 =10;

* power plants                                                                                                  $domain_for_power plants
  EV_PP_GENERATION.scale(power_plant_all,power_plant_type, power_plant_cooling, month%addhour%, stateofnature)
         $domain_for_EV_PP_GENERATION(power_plant_all,power_plant_type, power_plant_cooling, month%addhour%, stateofnature)
                  =10/probability(stateofnature);

  EV_DEMAND_PERCAP.scale(month%addhour%, stateofnature)
         $domain_for_EV_DEMAND_PERCAP(month%addhour%, stateofnature)
                  =1/probability(stateofnature)/totalpop;

  EV_PP_FUEL.scale(fuel,month,stateofnature)
         $domain_for_EV_PP_FUEL(fuel,month,stateofnature)
                  =10/probability(stateofnature);

  EV_PP_WATER_POND.scale(power_plant_all,power_plant_type, power_plant_cooling, month, stateofnature)
         $domain_for_EV_PP_WATER_POND(power_plant_all,power_plant_type, power_plant_cooling, month, stateofnature)
                  =1/probability(stateofnature);

  EV_PP_WATER_POND_Ini.scale(power_plant_all,power_plant_type, power_plant_cooling)
         $domain_for_EV_PP_WATER_POND_Ini(power_plant_all,power_plant_type, power_plant_cooling)
                 =1;

  EV_PP_WATER_DIVERSION.scale(power_plant_all,power_plant_type, power_plant_cooling, month, stateofnature)
         $domain_for_EV_PP_WATER_DIVERSION(power_plant_all,power_plant_type, power_plant_cooling, month, stateofnature)
                  =1/probability(stateofnature);

  EV_WS_OPERATION.scale(power_plant_all,ws_type)
         $domain_for_EV_WS_OPERATION(power_plant_all,ws_type)
                 =1;

  EV_WS_NEWBUILD.scale(power_plant_all,ws_type)
         $domain_for_EV_WS_NEWBUILD(power_plant_all,ws_type)
                 =1;

  EV_WS_LAND.scale(power_plant_all,ws_type,county, zones, landirrtype)
         $domain_for_EV_WS_LAND(power_plant_all,ws_type,county, zones, landirrtype)
                 =1;

  EV_DEMAND_STEPS.scale(allsteps)
         $domain_for_EV_DEMAND_STEPS(allsteps)
                 =12/demanddata_pp('quantity');

  EV_DEMAND_TRANS.scale(county,county,month%addhour%, stateofnature)
         $domain_for_EV_DEMAND_TRANS(county,county,month%addhour%, stateofnature)
                  =1/probability(stateofnature);

  EV_DEMAND_WP.scale(county, month, stateofnature)
         $domain_for_EV_DEMAND_WP(county, month, stateofnature)
                  =1/probability(stateofnature);

  EV_PP_WATER_SURFACE.scale(river,riverplace,county,power_plant_all,power_plant_cooling,sector,month,stateofnature)
         $domain_for_EV_PP_WATER_SURFACE(river,riverplace,county,power_plant_all,power_plant_cooling,sector,month,stateofnature)
                  =1/probability(stateofnature);

  EV_SURFACEDIVERSION_COOL.scale(river,riverplace,county,sector,month,stateofnature)
         $domain_for_EV_SURFACEDIVERSION_COOL(river,riverplace,county,sector,month,stateofnature)
                  =1/probability(stateofnature);

* aritificial variables
  ART_AE_AGLANDBal.scale(county, zones, landirrtype)
         $domain_for_ART_AE_AGLANDBal(county, zones, landirrtype)
                 =1;
  ART_WE_ADDALLWATERSUPPLY.scale(customer,sector,month,stateofnature)
         $domain_for_ART_WE_ADDALLWATERSUPPLY(customer,sector,month,stateofnature)
                 =1/probability(stateofnature);
  ART_WE_DEMANDQUANTITY.scale(customer,sector,month,stateofnature)
         $domain_for_ART_WE_DEMANDQUANTITY(customer,sector,month,stateofnature)
                 =1/probability(stateofnature);
  ART_WE_FLOWBALANCE_DEMAND.scale(river,riverplace,month,stateofnature)
         $domain_for_ART_WE_FLOWBALANCE_DEMAND(river,riverplace,month,stateofnature)
                 =1/probability(stateofnature);
  ART_WE_FLOWBALANCE_SUPPLY.scale(river,riverplace,month,stateofnature)
         $domain_for_ART_WE_FLOWBALANCE_SUPPLY(river,riverplace,month,stateofnature)
                 =1/probability(stateofnature);
  ART_WE_OUTOBAYBAL.scale(river, stateofnature)
         $domain_for_ART_WE_OUTOBAYBAL(river, stateofnature)
                 =1/probability(stateofnature);
  ART_WE_DRAWDOWN_BAL.scale(aquifer, layer, county)
         $domain_for_ART_WE_DRAWDOWN_BAL(aquifer, layer, county)
                 =scale_drawdown(aquifer,layer,county);
  ART_EE_PP_CAPACITYBAL.scale(POWER_PLANT_ALL,POWER_PLANT_TYPE, POWER_PLANT_COOLING, MONTH%ADDHOUR%, stateofnature)
         $domain_for_ART_EE_PP_CAPACITYBAL(POWER_PLANT_ALL,POWER_PLANT_TYPE, POWER_PLANT_COOLING, MONTH%ADDHOUR%, stateofnature)
                 =1000/probability(stateofnature);
  ART_EE_PP_NEWNGCC_LIMIT.scale(county,power_plant_cooling)
         $domain_for_ART_EE_PP_NEWNGCC_LIMIT(county,power_plant_cooling)
                 =1;
  ART_EE_PP_PEAKCAPCITY_REQ.scale(stateofnature)
         $domain_for_ART_EE_PP_PEAKCAPCITY_REQ(stateofnature)
                 =10/probability(stateofnature);
  ART_EE_PP_CAPACITYLIMIT.scale(uplow)
                 =100;
  ART_EE_PP_WATER_SURFACE_DIVBAL2.scale(river,riverplace,county,sector,month,stateofnature)
         $domain_for_ART_EE_PP_WATER_SURFACE_DIVBAL2(river,riverplace,county,sector,month,stateofnature)
                 =1/probability(stateofnature);
  ART_EE_WS_CAPACITY_LIMIT.scale
                 =10;
  ART_EE_DEMAND_COUNTYBAL.scale(county, month%addhour%, stateofnature)
         $domain_for_ART_EE_DEMAND_COUNTYBAL(county, month%addhour%, stateofnature)
                 =1/probability(stateofnature)/100;
  ART_EE_DEMAND_TRANSBAL.scale(county,month%addhour%, stateofnature)
         $domain_for_ART_EE_DEMAND_TRANSBAL(county,month%addhour%, stateofnature)
                 =1/probability(stateofnature);




* agricultural equations
  AE_AGLANDBAL.scale(county, zones, landirrtype)
         $domain_for_AE_AGLANDBAL(county, zones, landirrtype)
                 =1;

  AE_LandTransferLimit.scale(county,irrigstatus)
         $domain_for_AE_LandTransferLimit(county,irrigstatus)
                 =1;

  AE_AGSALEBAL.scale(county, primary, stateofnature)
         $domain_for_AE_AGSALEBAL(county, primary, stateofnature)
                 =primaryscales(primary)/probability(stateofnature);

  AE_LIVEFEED_BAL.scale(county,livestock,stateofnature)
         $domain_for_AE_LIVEFEED_BAL(county,livestock,stateofnature)
                 =1/probability(stateofnature)/100;

  AE_HAY_BAL.scale(county,primary,stateofnature)
         $domain_for_AE_HAY_BAL(county,primary,stateofnature)
                 =1/probability(stateofnature);

  AE_CROPSTRATBALANCE.scale(county,zones,crops,landirrtype, stateofnature)
         $domain_for_AE_CROPSTRATBALANCE(county,zones,crops,landirrtype, stateofnature)
                 =1/probability(stateofnature);

* ag mix EQUATIONS
  AE_CROPMIXBAL.scale(county,crop_mix,irrigstatus,uplow)
         $domain_for_AE_CROPMIXBAL(county,crop_mix,irrigstatus,uplow)
                 =1/10;

  AE_VEGE_SUMBAL.scale(county,zones,landirrtype)
         $domain_for_AE_VEGE_SUMBAL(county,zones,landirrtype)
                 =1;

  AE_VEGEMIXBAL.scale(county,vege_mix,irrigstatus,uplow)
         $domain_for_AE_VEGEMIXBAL(county,vege_mix,irrigstatus,uplow)
                 =1/10;

  AE_CROPMIX_PROP2.scale(county,zones,crop_mix,landirrtype)
         $domain_for_AE_CROPMIX_PROP2(county,zones,crop_mix,landirrtype)
                 =1/10;

  AE_VEGEMIX_PROP2.scale(county,zones,vege_mix,landirrtype)
         $domain_for_AE_VEGEMIX_PROP2(county,zones,vege_mix,landirrtype)
                 =1/10;

  AE_Rice_Bal.scale(county, zones,landirrtype)
         $domain_for_AE_Rice_Bal(county, zones,landirrtype)
                 =1;

  AE_LIVEMIXBAL.scale(county, livestock_mix, uplow)
         $domain_for_AE_LIVEMIXBAL(county, livestock_mix, uplow)
                 =1/10;

  AE_LIVEMIX_PROP2.scale(county,livestock_mix)
         $domain_for_AE_LIVEMIX_PROP2(county,livestock_mix)
                 =1/10;

* water equations --demand                                                                                      $domain_for_water equations --demand
  WE_AGWATERUSE_ZONEBAL.scale(county,zones,month,stateofnature)
         $domain_for_WE_AGWATERUSE_ZONEBAL(county,zones,month,stateofnature)
                 =1/probability(stateofnature);

  WE_AGWATERUSE_SOURCEBAL.scale(county,RiverAndAquifer,month,stateofnature)
         $domain_for_WE_AGWATERUSE_SOURCEBAL(county,RiverAndAquifer,month,stateofnature)
                 =1/probability(stateofnature);

  WE_ADDALLWATERSUPPLY.scale(citycounty,sector,month,stateofnature)
         $domain_for_WE_ADDALLWATERSUPPLY(citycounty,sector,month,stateofnature)
                  =1/probability(stateofnature);

  WE_DEMANDQUANTITY.scale(customer,sector,month,stateofnature)
         $domain_for_WE_DEMANDQUANTITY(customer,sector,month,stateofnature)
                  =1/probability(stateofnature);

  WE_DEMANDCONVEX.scale(customer,sector)
         $domain_for_WE_DEMANDCONVEX(customer,sector)
                 =WV_WATERDEMAND_STEPS.scale(customer,sector,'s31')   ;

  WE_OTHERWATERSOURCEBAL.scale(county, stateofnature)
         $domain_for_WE_OTHERWATERSOURCEBAL(county, stateofnature)
                  =1/probability(stateofnature);


*water equations-- surface
  WE_FLOWBALANCE.scale(river,riverplace,month,stateofnature)
         $domain_for_WE_FLOWBALANCE(river,riverplace,month,stateofnature)
                  =1/probability(stateofnature);

  WE_RETURNFLOWBAL.scale(customer,sector,month,stateofnature)
         $domain_for_WE_RETURNFLOWBAL(customer,sector,month,stateofnature)
                  =1/probability(stateofnature);

  WE_OUTOBAYBAL.scale(river, stateofnature)
         $domain_for_WE_OUTOBAYBAL(river, stateofnature)
                  =1/probability(stateofnature);

  WE_DIVERSIONQMAX.scale(county,sector,river,riverplace,stateofnature)
         $domain_for_WE_DIVERSIONQMAX(county,sector,river,riverplace,stateofnature)
                  =1/probability(stateofnature);

  WE_RESERVOIR_CAPACITY_BAL.scale(reservoir, month, stateofnature)
         $domain_for_WE_RESERVOIR_CAPACITY_BAL(reservoir, month, stateofnature)
                  =1/probability(stateofnature);

  WE_RESERVOIR_CAPACITY_INIBAL.scale(reservoir)
         $domain_for_WE_RESERVOIR_CAPACITY_INIBAL(reservoir)
                 =1;

  WE_RESERVOIR_BALANCE.scale(reservoir, month,stateofnature)
         $domain_for_WE_RESERVOIR_BALANCE(reservoir, month,stateofnature)
                  =1/probability(stateofnature);

  WE_RESERVOIR_INIBAL.scale(reservoir)
         $domain_for_WE_RESERVOIR_INIBAL(reservoir)
                 =1;

  WE_RESERVOIR_MAXWTIHDRAW.scale(reservoir, month, stateofnature)
         $domain_for_WE_RESERVOIR_MAXWTIHDRAW(reservoir, month, stateofnature)
                  =1/probability(stateofnature);


*water equations-- groundwater
  WE_COUNTYPUMPBAL.scale(county, Aquifer, layer, month,stateofnature)
         $domain_for_WE_COUNTYPUMPBAL(county, Aquifer, layer, month,stateofnature)
                  =1/probability(stateofnature);

  WE_TOTALCOUNTY_PUMPSTEPBAL.scale(county,Aquifer, layer, stateofnature)
         $domain_for_WE_TOTALCOUNTY_PUMPSTEPBAL(county,Aquifer, layer, stateofnature)
                  =1/probability(stateofnature);

  WE_TOTALCOUNTY_PUMP_CONVEXBAL.scale(county,Aquifer, layer, stateofnature)
         $domain_for_WE_TOTALCOUNTY_PUMP_CONVEXBAL(county,Aquifer, layer, stateofnature)
                  =WV_PUMP_STEP.scale(county,Aquifer,layer,stateofnature,'w12') ;

  WE_DRAWDOWN_BAL.scale(aquifer,layer,county)
         $domain_for_WE_DRAWDOWN_BAL(aquifer,layer,county)
                 =scale_drawdown(aquifer,layer,county);

  WE_SPRINGFLOW_BAL.scale(Springs,stateofnature)
         $domain_for_WE_SPRINGFLOW_BAL(Springs,stateofnature)
                  =1/probability(stateofnature);

  WE_EDWARDS_PUMPLIMIT.scale(county,gsector,stateofnature)
         $domain_for_WE_EDWARDS_PUMPLIMIT(county,gsector,stateofnature)
                  =1/probability(stateofnature);

  WE_SAWSEDWARDS_PUMPLIMIT.scale(stateofnature)
         $domain_for_WE_SAWSEDWARDS_PUMPLIMIT(stateofnature)
                  =1/probability(stateofnature);

*water sources mix
  WE_MIX_GRDPUMPBal.scale(county,aquifer,layer,stateofnature,uplow)
         $domain_for_WE_MIX_GRDPUMPBal(county,aquifer,layer,stateofnature,uplow)
                  =1/probability(stateofnature);

  WE_MIX_SURGRDBal.scale(county, gsector,source,stateofnature,uplow)
         $domain_for_WE_MIX_SURGRDBal(county, gsector,source,stateofnature,uplow)
                  =1/probability(stateofnature);

  WE_MIX_SALINEBLENDBAL.scale(citycounty,gsector,month,stateofnature)
         $domain_for_WE_MIX_SALINEBLENDBAL(citycounty,gsector,month,stateofnature)
                  =1/probability(stateofnature);


* water projects
  WE_WP_CAPACITYBAL.scale(projects,month, stateofnature)
         $domain_for_WE_WP_CAPACITYBAL(projects,month, stateofnature)
                  =1/probability(stateofnature)*sqrt(investmentcost(projects,'ProjectYield')/12) ;

  WE_WP_OPERATINGBAL.scale(projects)
         $domain_for_WE_WP_OPERATINGBAL(projects)
                 =1;

  WE_WP_SUPPLYBAL.scale(projects,sector,customer,month,stateofnature)
         $domain_for_WE_WP_SUPPLYBAL(projects,sector,customer,month,stateofnature)
                  =1/probability(stateofnature);

  WE_WP_GROUND_PUMPLIMIT.scale(projects,county,aquifer,groundwatertype,month,stateofnature)
         $domain_for_WE_WP_GROUND_PUMPLIMIT(projects,county,aquifer,groundwatertype,month,stateofnature)
                  =10/probability(stateofnature);

  WE_WP_SURFACE_DIVBAL.scale(projects,sourceriver,riverplace,month,stateofnature)
         $domain_for_WE_WP_SURFACE_DIVBAL(projects,sourceriver,riverplace,month,stateofnature)
                  =10/probability(stateofnature);

  WE_WP_ASROCR_BALANCE.scale(projects, month,stateofnature)
         $domain_for_WE_WP_ASROCR_BALANCE(projects, month,stateofnature)
                  =1/probability(stateofnature);

  WE_WP_ASROCR_CAPACITY_BAL.scale(projects, month, stateofnature)
         $domain_for_WE_WP_ASROCR_CAPACITY_BAL(projects, month, stateofnature)
                  =1/probability(stateofnature)*sqrt((reservoirproject_storage(projects) +ASRPara(projects,'Maxstorage')));

  WE_WP_ASROCR_INIBAL.scale(projects)
         $domain_for_WE_WP_ASROCR_INIBAL(projects)
                 =10;

  WE_WP_ASR_INJECT_LIMIT.scale(projects,month,stateofnature)
         $domain_for_WE_WP_ASR_INJECT_LIMIT(projects,month,stateofnature)
                  =1/probability(stateofnature)*sqrt(ASRPara(projects,'MaxDiversionToASR')/12);

  WE_WP_ASR_RECOVERY_LIMIT.scale(projects,month,stateofnature)
         $domain_for_WE_WP_ASR_RECOVERY_LIMIT(projects,month,stateofnature)
                  =1/probability(stateofnature)*sqrt(ASRPara(projects,'maxrecovery')/12);

  WE_WP_CURRENTWR_LIMIT.scale(projects,sourceriver,riverplace,county,sector,stateofnature)
         $domain_for_WE_WP_CURRENTWR_LIMIT(projects,sourceriver,riverplace,county,sector,stateofnature)
                  =1/probability(stateofnature)*sqrt(WaterRightTakeout(projects,sourceriver,riverplace,county,sector));

  WE_WP_NEWWR_LIMIT.scale(projects,sourceriver,riverplace,stateofnature)
         $domain_for_WE_WP_NEWWR_LIMIT(projects,sourceriver,riverplace,stateofnature)
                  =1/probability(stateofnature)*sqrt(NewWaterRights(projects,sourceriver,riverplace));

  WE_WP_Mutual_Exclusive_Bal.scale(mutual)
         $domain_for_WE_WP_Mutual_Exclusive_Bal(mutual)
                  =1;

*  WE_WP_PHASE_CONTROL_BAL(projects)
  WE_WP_JOINT_CONTROL_BAL.scale(jointpair,projects)
         $domain_for_WE_WP_JOINT_CONTROL_BAL(jointpair,projects)
                 =1;
* reuse
  WE_WP_REUSE_SUPPLYBAL.scale(customer,sector,month,stateofnature)
         $domain_for_WE_WP_REUSE_SUPPLYBAL(customer,sector,month,stateofnature)
                  =1/probability(stateofnature);

  WE_WP_REUSE_BAL.scale(citycounty,sector,month,stateofnature)
         $domain_for_WE_WP_REUSE_BAL(citycounty,sector,month,stateofnature)
                  =1/probability(stateofnature);

*water markets
  WE_WM_DYO_TOTALLIMIT.scale
                 =1;

  WE_WM_DYO_SUSPENDLIMIT.scale(county, stateofnature)
         $domain_for_WE_WM_DYO_SUSPENDLIMIT(county, stateofnature)
                  =1/probability(stateofnature);

  WE_WM_DYO_COUNTYLIMIT.scale(county,permittype)
         $domain_for_WE_WM_DYO_COUNTYLIMIT(county,permittype)
                 =1;

  WE_WM_TRADE_RIVERLIMIT.scale(river,riverplace,county,conssector,stateofnature)
         $domain_for_WE_WM_TRADE_RIVERLIMIT(river,riverplace,county,conssector,stateofnature)
                  =1/probability(stateofnature);

  WE_WM_TRADE_EDWARDSLIMIT.scale(county,sector, stateofnature)
         $domain_for_WE_WM_TRADE_EDWARDSLIMIT(county,sector, stateofnature)
                  =1/probability(stateofnature);

  WE_WM_TRADE_EDWARDS_AGLIMIT.scale(county,stateofnature)
         $domain_for_WE_WM_TRADE_EDWARDS_AGLIMIT(county,stateofnature)
                  =1/probability(stateofnature);

* power plants
  EE_PP_OPERATE.scale(POWER_PLANT_ALL,POWER_PLANT_TYPE, POWER_PLANT_COOLING)
         $domain_for_EE_PP_OPERATE(POWER_PLANT_ALL,POWER_PLANT_TYPE, POWER_PLANT_COOLING)
                 =1;

  EE_PP_RETROFIT_LIMIT.scale(POWER_PLANT_ALL)
         $domain_for_EE_PP_RETROFIT_LIMIT(POWER_PLANT_ALL)
                 =1;

  EE_PP_CAPACITYBAL.scale(POWER_PLANT_ALL,POWER_PLANT_TYPE, POWER_PLANT_COOLING, MONTH%ADDHOUR%, stateofnature)
         $domain_for_EE_PP_CAPACITYBAL(POWER_PLANT_ALL,POWER_PLANT_TYPE, POWER_PLANT_COOLING, MONTH%ADDHOUR%, stateofnature)
                  =1/probability(stateofnature)
                   *sqrt(pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling, 'capacity')
*                    *min(1, pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling, 'capacity_factor')+0.2)
                    *Days(month)
                    *gen_adj(power_plant_type%addhour%)
                    *sum(hour, 1$map_agg_hour(hour%addhour%)));

  EE_PP_TOTALGEN_LIMIT.scale(POWER_PLANT_ALL,POWER_PLANT_TYPE,POWER_PLANT_COOLING, stateofnature)
         $domain_for_EE_PP_TOTALGEN_LIMIT(POWER_PLANT_ALL,POWER_PLANT_TYPE,POWER_PLANT_COOLING, stateofnature)
                  =1/probability(stateofnature)
                  *sqrt(pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling, 'capacity_factor')
                    *pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling, 'capacity')
                    *365*24 );

  EE_PP_HYDRO_GENEBAL.scale(power_plant_all,month%addhour%, stateofnature)
         $domain_for_EE_PP_HYDRO_GENEBAL(power_plant_all,month%addhour%, stateofnature)
                  =1/probability(stateofnature)
;

  EE_PP_NEWNGCC_LIMIT.scale(county,power_plant_cooling)
         $domain_for_EE_PP_NEWNGCC_LIMIT(county,power_plant_cooling)
                 =1;

  EE_PP_PEAKCAPCITY_REQ.scale(stateofnature)
         $domain_for_EE_PP_PEAKCAPCITY_REQ(stateofnature)
                  =10/probability(stateofnature);

  EE_PP_CAPACITYLIMIT.scale(uplow)
                  =100;

  EE_PP_FUEL_BAL.scale(fuel, month,stateofnature)
         $domain_for_EE_PP_FUEL_BAL(fuel, month,stateofnature)
                  =10/probability(stateofnature);

  EE_PP_WATER_DIVISIONBAL.scale(power_plant_all,power_plant_type, power_plant_cooling,month,stateofnature)
         $domain_for_EE_PP_WATER_DIVISIONBAL(power_plant_all,power_plant_type, power_plant_cooling,month,stateofnature)
                  =1/probability(stateofnature)/10;

  EE_PP_WATER_POND_INITBal.scale(power_plant_all,power_plant_type, power_plant_cooling)
         $domain_for_EE_PP_WATER_POND_INITBal(power_plant_all,power_plant_type, power_plant_cooling)
                 =1;

  EE_PP_Water_GROUND_DIVBAL.scale(Aquifer,layer,county,month, stateofnature)
         $domain_for_EE_PP_Water_GROUND_DIVBAL(Aquifer,layer,county,month, stateofnature)
                  =1/probability(stateofnature);

  EE_PP_WATER_SURFACE_DIVBAL1.scale(river,riverplace,county,power_plant_all,power_plant_cooling,month, stateofnature)
         $domain_for_EE_PP_WATER_SURFACE_DIVBAL1(river,riverplace,county,power_plant_all,power_plant_cooling,month, stateofnature)
                  =1/probability(stateofnature);

  EE_PP_WATER_SURFACE_DIVBAL2.scale(river,riverplace,county,sector,month, stateofnature)
         $domain_for_EE_PP_WATER_SURFACE_DIVBAL2(river,riverplace,county,sector,month, stateofnature)
                  =1/probability(stateofnature);


  EE_WS_NEWBUILD_BAL.scale(power_plant_all, ws_type)
         $domain_for_EE_WS_NEWBUILD_BAL(power_plant_all, ws_type)
                 =1;

  EE_WS_CAPACITY_LIMIT.scale
                   =10;
  EE_WS_LANDBAL.scale(power_plant_all,county,ws_type)
         $domain_for_EE_WS_LANDBAL(power_plant_all,county,ws_type)
                 =1;

  EE_WS_LAND_LIMIT.scale(county,zones,landirrtype)
         $domain_for_EE_WS_LAND_LIMIT(county,zones,landirrtype)
                 =1;

  EE_DEMAND_QUANTITYBAL.scale(month%addhour%,stateofnature)
         $domain_for_EE_DEMAND_QUANTITYBAL(month%addhour%,stateofnature)
                  =0.1/probability(stateofnature);

  EE_DEMAND_CONVEXITY.scale
         $do_I_want_pp
                  =1/demanddata_pp('quantity');

  EE_DEMAND_COUNTYBAL.scale(county, month%addhour%, stateofnature)
         $domain_for_EE_DEMAND_COUNTYBAL(county, month%addhour%, stateofnature)
                  =1/probability(stateofnature)/100;

  EE_DEMAND_TRANSBAL.scale(county,month%addhour%,stateofnature)
         $domain_for_EE_DEMAND_TRANSBAL(county,month%addhour%,stateofnature)
                  =1/probability(stateofnature);

  EE_DEMAND_WPBAL.scale(county, month, stateofnature)
         $domain_for_EE_DEMAND_WPBAL(county, month, stateofnature)
                  =1/probability(stateofnature);








