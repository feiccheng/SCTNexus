
$ifthen not declared domain_for_WV_FLOW
alias (ws_type, ws_type2)  ;
set
*^^^^^^^^^^^^^^^^^^^^^^^^^^^^
* Agricultural part domain  ^
*^^^^^^^^^^^^^^^^^^^^^^^^^^^^
domain_for_AE_AGLANDBal(county, zones, landirrtype)
domain_for_AE_LandTransferLimit(county,irrigstatus)
domain_for_AE_AGSALEBAL(county,primary, states)
domain_for_AE_LIVEFEED_BAL(county,livestock,states)
domain_for_AE_HAY_BAL(county,primary,states)
domain_for_AE_CROPSTRATBALANCE(county,zones,crops,landirrtype,states)

domain_for_AE_CROPMIXBAL(county,crop_mix,irrigstatus,uplow)
domain_for_AE_VEGE_SUMBAL(county,zones,landirrtype)
domain_for_AE_VEGEMIXBAL(county,vege_mix,irrigstatus,uplow)
domain_for_AE_CROPMIX_PROP2(county,zones,crop_mix,landirrtype)
domain_for_AE_VEGEMIX_PROP2(county,zones,vege_mix,landirrtype)
domain_for_AE_Rice_Bal(county, zones,landirrtype)
domain_for_AE_LIVEMIXBAL(county, livestock_mix, uplow)
domain_for_AE_LIVEMIX_PROP2(county,livestock_mix)

domain_for_AV_CROPACRES(county, zones, crops,landirrtype)
domain_for_AV_LANDTRANS(county, landirrtype, zones, landirrtype2,zones2)
domain_for_AV_LIVEPROD(county, livestock)
domain_for_AV_CROPSTRATEGY(county,zones, crops, landirrtype, states, allstrat)
domain_for_AV_AGSALE(county,primary, states)
domain_for_AV_LIVEGRAZING(county,livestock,states)
domain_for_AV_CROPMIX(county,irrigstatus,mixesa)
domain_for_AV_VEGMIX(county,irrigstatus,mixesa)
domain_for_AV_LIVEMIX(county,mixesa)
domain_for_AV_HAYFEED(county,livestock,primary,states)
domain_for_AV_HAYPURCHASE(county,primary,states)
domain_for_AV_HAYTRANS(county,county,primary,states)
domain_for_ART_AE_AGLANDBal(county, zones, landirrtype)
*~~~~~~~~~~~~~~~~~~~~~~~~~~
*  water usage part domain
*~~~~~~~~~~~~~~~~~~~~~~~~~
domain_for_WE_AGWATERUSE_ZONEBAL(county,zones,month,states)
domain_for_WE_AGWATERUSE_SOURCEBAL(county,RiverAndAquifer,month,states)
domain_for_WE_ADDALLWATERSUPPLY(citycounty,sector,month,states)
domain_for_WE_DEMANDQUANTITY(customer,sector,month,states)
domain_for_WE_DEMANDCONVEX(customer,sector)
domain_for_WE_OTHERWATERSOURCEBAL(county, states)

domain_for_WV_AGZONEWATERUSE(county,zones,month,RiverAndAquifer,states)
domain_for_WV_OTHERWATERSOURCE(citycounty,sector,month,states)
domain_for_WV_ADDUPUSERALLWATER(customer,sector,month,states)
domain_for_WV_WATERDEMAND_STEPS(customer,sector,allsteps)
domain_for_WV_WATERDEMAND(customer,sector)

domain_for_ART_WE_ADDALLWATERSUPPLY(customer,sector,month,states)
domain_for_ART_WE_DEMANDQUANTITY(customer,sector,month,states)
*^^^^^^^^^^^^^^^^^^^^^^^^^^^^
* surface water part domain   ^
*^^^^^^^^^^^^^^^^^^^^^^^^^^^^
domain_for_WV_SURFACEDIVERSION(river,riverplace,citycounty,sector,month,states)
domain_for_WV_FLOW(river,riverplace,downriver,month,states)
domain_for_WV_OUTTOBAY(river,riverplace,month,states)
domain_for_WV_RESERVOIR_WITHDRAW(reservoir,month,states)
domain_for_WV_RESERVOIR_RELEASE(reservoir,month,states)
domain_for_WV_SPRNFLOW(riverplace,states)
domain_for_WV_RESERVIOR_INVENTORY(reservoir, month, states)
domain_for_WV_RESERVIOR_INVENTORY_INI(reservoir)

domain_for_WE_FLOWBALANCE(river,riverplace,month,states)
domain_for_WE_OUTOBAYBAL(river, states)
domain_for_WE_DIVERSIONQMAX(county,sector,river,riverplace,states)
domain_for_WE_RESERVOIR_CAPACITY_BAL(reservoir, month, states)
domain_for_WE_RESERVOIR_CAPACITY_INIBAL(reservoir)
domain_for_WE_RESERVOIR_BALANCE(reservoir, month,states)
domain_for_WE_RESERVOIR_INIBAL(reservoir)
domain_for_WE_RESERVOIR_MAXWTIHDRAW(reservoir, month, states)

domain_for_ART_WE_FLOWBALANCE_DEMAND(river,riverplace,month,states)
domain_for_ART_WE_FLOWBALANCE_SUPPLY(river,riverplace,month,states)
domain_for_ART_WE_OUTOBAYBAL(river, states)
*^^^^^^^^^^^^^^^^^^^^^^^^^^^^
* groundwater part domain   ^
*^^^^^^^^^^^^^^^^^^^^^^^^^^^^

domain_for_WV_PUMP_GROUNDWATER(aquifer,layer,citycounty,sector,month,states)
domain_for_WV_PUMP_STEP(county,Aquifer,layer,states,allstepsw)
domain_for_WV_TOTALCOUNTYPUMP(county, Aquifer, layer, month, states)

domain_for_WE_COUNTYPUMPBAL(county, Aquifer, layer, month,states)
domain_for_WE_TOTALCOUNTY_PUMPSTEPBAL(county,Aquifer, layer, states)
domain_for_WE_TOTALCOUNTY_PUMP_CONVEXBAL(county,Aquifer, layer, states)
domain_for_WE_DRAWDOWN_BAL(aquifer,layer,county)
domain_for_WV_DrawDown(aquifer, layer, county,steps_dd)
domain_for_WE_SPRINGFLOW_BAL(Springs,states)
domain_for_WE_EDWARDS_PUMPLIMIT(county,gsector,states)
domain_for_WE_SAWSEDWARDS_PUMPLIMIT(states)
domain_for_WE_AQUIFER_PUMPLIMIT_EXIST(aquifer,county,states)
domain_for_WE_AQUIFER_PUMPLIMIT_MAG(aquifer,county)
domain_for_ART_WE_DRAWDOWN_BAL(aquifer, layer, county)

* water mix part
domain_for_WE_MIX_GRDPUMPBal(county,aquifer,layer,states,uplow)
domain_for_WV_MIX_GRDPUMP(county,years,states)
domain_for_WE_MIX_SURGRDBal(county, gsector,source,states,uplow)
domain_for_WV_MIX_SURGRD(county,gsector,mixesa,states)
domain_for_WE_MIX_SALINEBLENDBAL(citycounty,gsector,month,states)

*^^^^^^^^^^^^^^^^^^^^^^^^^^^^
* water projects part domain ^
*^^^^^^^^^^^^^^^^^^^^^^^^^^^^
*variables
domain_for_WV_WP_USEGROUND(Projects,sector,customer,county,aquifer,layer,month,states)
domain_for_WV_WP_USEASR(projects,sector,customer,month,states)
domain_for_WV_WP_USESURFACE(projects,sector,customer,sourceriver,riverplace,month,states)
domain_for_WV_WP_USEOCR(projects,sector,customer,OCR,month,states)
domain_for_WV_WP_USEOUTSIDE(projects,sector,customer,month,states)
domain_for_WV_WP_USESEAWATER(projects,sector,customer,month,states)
domain_for_WV_WP_USEREUSE(projects,sector,customer,sector,citycounty,month,states)
domain_for_WV_WP_DO_I_OPRT_WATER(Projects)
domain_for_WV_WP_DO_I_BUILD_WATER(Projects)
domain_for_WV_WP_PROJECTWATER(projects,sector,customer,month,states)
domain_for_WV_WP_RECHARGE_AQUIFER(projects,sector,customer,aquifer,layer, month,states)
domain_for_WV_WP_SURFACE_ACQUWR(projects,sourceriver,riverplace,county,sector,month,states)
domain_for_WV_WP_SURFACE_NEWWR(projects,sourceriver,riverplace,month,states)
domain_for_WV_WP_ASROCR_INVENTORY_INI(projects)
domain_for_WV_WP_ASROCR_INVENTORY(projects, month, states)
domain_for_WV_WP_ASR_FROMGROUND(projects,sourcecounty,sourceaquifer,layer,month,states)
domain_for_WV_WP_ASR_FROMSURFACE(projects,sourceriver,riverplace,county,sector,month,states)
domain_for_WV_WP_ASR_FROMSURFACE_NEWWR(projects,sourceriver,riverplace,month,states)
domain_for_WV_WP_ASR_FROMREUSE(projects,sector,citycounty,month,states)
domain_for_WV_WP_ASR_FROMEXTRA(projects,sector,citycounty,month,states)
domain_for_WV_WP_OCR_FROMSURFACE(projects,sourceriver,riverplace,county,sector,month,states)
domain_for_WV_WP_OCR_FROMSURFACE_NEWWR(projects,sourceriver,riverplace,month,states)
domain_for_WV_WP_DO_I_JOINTBULTDWP(jointpair)
domain_for_WV_WP_REUSE_EFFLUENT(customer,sector,month,states)
domain_for_WV_RETURNFLOW(citycounty,sector,month,states)
domain_for_WV_WP_Conservation(customer)


*equations
domain_for_WE_WP_CAPACITYBAL(projects,month, states)
domain_for_WE_WP_OPERATINGBAL(projects)
domain_for_WE_WP_SUPPLYBAL(projects,sector,customer,month,states)
domain_for_WE_WP_GROUND_PUMPLIMIT(projects,county,aquifer,groundwatertype,month,states)
domain_for_WE_WP_SURFACE_DIVBAL(projects,sourceriver,riverplace,month,states)
domain_for_WE_WP_ASROCR_BALANCE(projects, month,states)
domain_for_WE_WP_ASROCR_CAPACITY_BAL(projects, month, states)
domain_for_WE_WP_ASROCR_INIBAL(projects)
domain_for_WE_WP_ASR_INJECT_LIMIT(projects,month,states)
domain_for_WE_WP_ASR_RECOVERY_LIMIT(projects,month,states)
domain_for_WE_WP_CURRENTWR_LIMIT(projects,sourceriver,riverplace,county,sector,states)
domain_for_WE_WP_NEWWR_LIMIT(projects,sourceriver,riverplace,states)
domain_for_WE_WP_Mutual_Exclusive_Bal(mutual)
*domain_for_WE_WP_PHASE_CONTROL_BAL(projects)
domain_for_WE_WP_JOINT_CONTROL_BAL(jointpair,projects)
domain_for_WE_WP_REUSE_SUPPLYBAL(customer,sector,month,states)
domain_for_WE_RETURNFLOWBAL(customer,sector,month,states)
domain_for_WE_WP_REUSE_BAL(citycounty,sector,month,states)
*^^^^^^^^^^^^^^^^^^^^^^^^^^^^
* water market part domain ^
*^^^^^^^^^^^^^^^^^^^^^^^^^^^^
*variables
domain_for_WV_WM_DYO_ENROLL(county, permittype)
domain_for_WV_WM_DYO_SUSPEND(county,states)
domain_for_WV_WM_LEASE_RIVER(river,riverplace,county,sector,riverlocation,county, sector,states)
domain_for_WV_WM_TRADE_RIVER(river,riverplace,county,sector,riverlocation,county, sector)
domain_for_WV_WM_LEASE_AQUIFER(aquifer,county,sector, county, sector,states)
domain_for_WV_WM_TRADE_AQUIFER(aquifer,county,sector, county, sector)

*equations
domain_for_WE_WM_DYO_SUSPENDLIMIT(county, states)
domain_for_WE_WM_DYO_COUNTYLIMIT(county,permittype)
domain_for_WE_WM_TRADE_RIVERLIMIT(river,riverplace,county,sector, states)
domain_for_WE_WM_TRADE_EDWARDSLIMIT(county, sector, states)
domain_for_WE_WM_TRADE_EDWARDS_AGLIMIT(county, states)



*^^^^^^^^^^^^^^^^^^^^^^^^^^^^
* energy part domain        ^
*^^^^^^^^^^^^^^^^^^^^^^^^^^^^

* equations
domain_for_EE_PP_OPERATE(POWER_PLANT_ALL,POWER_PLANT_TYPE, POWER_PLANT_COOLING)
domain_for_EE_PP_RETROFIT_LIMIT(POWER_PLANT_ALL)
domain_for_EE_PP_CAPACITYBAL(POWER_PLANT_ALL,POWER_PLANT_TYPE, POWER_PLANT_COOLING, MONTH%ADDHOUR%, STATES)
domain_for_EE_PP_TOTALGEN_LIMIT(POWER_PLANT_ALL,POWER_PLANT_TYPE,POWER_PLANT_COOLING, STATEs)
domain_for_EE_PP_HYDRO_GENEBAL(power_plant_all,month%addhour%, states)
domain_for_EE_PP_NEWNGCC_LIMIT(county,power_plant_cooling)
domain_for_EE_PP_PEAKCAPCITY_REQ(states)
domain_for_EE_PP_FUEL_BAL(fuel, month,states)

domain_for_EE_PP_WATER_DIVISIONBAL(power_plant_all,power_plant_type, power_plant_cooling,month,states)
domain_for_EE_PP_WATER_POND_INITBal(power_plant_all,power_plant_type, power_plant_cooling)
domain_for_EE_PP_Water_GROUND_DIVBAL(Aquifer,layer,county,month, states)
domain_for_EE_PP_WATER_SURFACE_DIVBAL1(river,riverplace,county,power_plant_all,power_plant_cooling,month, states)
domain_for_EE_PP_WATER_SURFACE_DIVBAL2(river,riverplace,county,sector,month,states)
domain_for_EE_PP_WP_WATER_BAL(projects,county,month,states)

domain_for_EE_WS_NEWBUILD_BAL(power_plant_all, ws_type)
domain_for_EE_WS_LANDBAL(power_plant_all,county,ws_type)
domain_for_EE_WS_LAND_LIMIT(county,zones,landirrtype)
domain_for_EE_DEMAND_QUANTITYBAL(month%addhour%,states)

domain_for_EE_DEMAND_COUNTYBAL(county, month%addhour%, states)
domain_for_EE_DEMAND_TRANSBAL(county,month%addhour%,states)
domain_for_EE_DEMAND_WPBAL(county, month, states)


*variables
domain_for_EV_PP_DO_I_BUILD_NEW_NGPP(POWER_PLANT_ALL, POWER_PLANT_TYPE, POWER_PLANT_COOLING)
domain_for_EV_PP_DO_I_RETROFIT_COOLING(POWER_PLANT_ALL, POWER_PLANT_TYPE, POWER_PLANT_COOLING, POWER_PLANT_COOLING)
domain_for_EV_PP_DO_I_RETROFIT_BOILER(POWER_PLANT_ALL, POWER_PLANT_TYPE, POWER_PLANT_TYPE, POWER_PLANT_COOLING)
domain_for_EV_PP_DO_I_OPER_POWERPLANT(power_plant_all,power_plant_type, power_plant_cooling)
domain_for_EV_PP_GENERATION(power_plant_all,power_plant_type, power_plant_cooling, month%addhour%, states)
domain_for_EV_WS_OPERATION(power_plant_all,ws_type)
domain_for_EV_DEMAND_PERCAP(month%addhour%, states)
domain_for_EV_PP_FUEL(fuel,month,states)
domain_for_EV_PP_WATER_POND(power_plant_all,power_plant_type, power_plant_cooling, month, states)
domain_for_EV_PP_WATER_POND_Ini(power_plant_all,power_plant_type, power_plant_cooling)
domain_for_EV_PP_WATER_DIVERSION(power_plant_all,power_plant_type, power_plant_cooling, month, states)
domain_for_EV_WS_NEWBUILD(power_plant_all,ws_type)
domain_for_EV_WS_LAND(power_plant_all,ws_type,county, zones, landirrtype)
domain_for_EV_DEMAND_STEPS(allsteps)
domain_for_EV_DEMAND_TRANS(county,county,month%addhour%, states)
domain_for_EV_DEMAND_WP(county, month, states)
domain_for_EV_PP_WATER_SURFACE(river,riverplace,county,power_plant_all,power_plant_cooling,sector,month,states)
domain_for_EV_SURFACEDIVERSION_COOL(river,riverplace,county,sector,month,states)
domain_for_EV_PP_WP_COOLWATER(projects,river,riverplace,county,sector,month,states)


domain_for_EV_OTHERELECDEMAND(county, month, states)
domain_for_EV_ELEC_TRANS(county,county,month%addhour%, states)
*artificial variables
domain_for_ART_EE_PP_CAPACITYBAL(POWER_PLANT_ALL,POWER_PLANT_TYPE, POWER_PLANT_COOLING, MONTH%ADDHOUR%, STATES)
domain_for_ART_EE_PP_NEWNGCC_LIMIT(county,power_plant_cooling)
domain_for_ART_EE_PP_PEAKCAPCITY_REQ(states)
domain_for_ART_EE_PP_WATER_SURFACE_DIVBAL2(river,riverplace,county,sector,month,states)
domain_for_ART_EE_DEMAND_COUNTYBAL(county, month%addhour%, states)
domain_for_ART_EE_DEMAND_TRANSBAL(county,month%addhour%, states)


;

set wp_notnow(projects)                    the projects that cannot be built now due to the phase control
     wp_exist_mutual(mutual)               the sets of muturally exclusive projects that has one being built
    wp_excluded(projects)                   the projects should not be bult becasue the other mutual excludingone has been built
;


$endif

*^^^^^^^^^^^^^^^^^
* set all to no;
*^^^^^^^^^^^^^^^^^
domain_for_ART_AE_AGLANDBal(county, zones, landirrtype)                                            =no;
domain_for_AE_AGLANDBal(county, zones, landirrtype)                                                =no;
domain_for_AE_LandTransferLimit(county,irrigstatus)                                                =no;
domain_for_AE_AGSALEBAL(county,primary, states)                                                    =no;
domain_for_AE_LIVEFEED_BAL(county,livestock,states)                                                =no;
domain_for_AE_HAY_BAL(county,primary,states)                                                       =no;
domain_for_AE_CROPSTRATBALANCE(county,zones,crops,landirrtype,states)                              =no;
domain_for_AE_CROPMIXBAL(county,crop_mix,irrigstatus,uplow)                                        =no;
domain_for_AE_VEGE_SUMBAL(county,zones,landirrtype)                                                =no;
domain_for_AE_VEGEMIXBAL(county,vege_mix,irrigstatus,uplow)                                        =no;
domain_for_AE_CROPMIX_PROP2(county,zones,crop_mix,landirrtype)                                     =no;
domain_for_AE_VEGEMIX_PROP2(county,zones,vege_mix,landirrtype)                                     =no;
domain_for_AE_Rice_Bal(county, zones,landirrtype)                                                  =no;
domain_for_AE_LIVEMIXBAL(county, livestock_mix, uplow)                                             =no;
domain_for_AE_LIVEMIX_PROP2(county,livestock_mix)                                                  =no;
domain_for_AV_CROPACRES(county, zones, crops,landirrtype)                                          =no;
domain_for_AV_LANDTRANS(county, landirrtype, zones, landirrtype2,zones2)                           =no;
domain_for_AV_LIVEPROD(county, livestock)                                                          =no;
domain_for_AV_CROPSTRATEGY(county,zones, crops, landirrtype, states, allstrat)                     =no;
domain_for_AV_AGSALE(county,primary, states)                                                       =no;
domain_for_AV_LIVEGRAZING(county,livestock,states)                                                 =no;
domain_for_AV_CROPMIX(county,irrigstatus,mixesa)                                                   =no;
domain_for_AV_VEGMIX(county,irrigstatus,mixesa)                                                    =no;
domain_for_AV_LIVEMIX(county,mixesa)                                                               =no;
domain_for_AV_HAYFEED(county,livestock,primary,states)                                             =no;
domain_for_AV_HAYPURCHASE(county,primary,states)                                                   =no;
domain_for_AV_HAYTRANS(county,county,primary,states)                                               =no;
domain_for_WE_AGWATERUSE_ZONEBAL(county,zones,month,states)                                        =no;
domain_for_WE_AGWATERUSE_SOURCEBAL(county,RiverAndAquifer,month,states)                            =no;
domain_for_WE_ADDALLWATERSUPPLY(citycounty,sector,month,states)                                    =no;
domain_for_WE_DEMANDQUANTITY(customer,sector,month,states)                                         =no;
domain_for_WE_DEMANDCONVEX(customer,sector)                                                        =no;
domain_for_WE_OTHERWATERSOURCEBAL(county, states)                                                  =no;
domain_for_WV_AGZONEWATERUSE(county,zones,month,RiverAndAquifer,states)                            =no;
domain_for_WV_OTHERWATERSOURCE(citycounty,sector,month,states)                                     =no;
domain_for_WV_ADDUPUSERALLWATER(customer,sector,month,states)                                      =no;
domain_for_ART_WE_DEMANDQUANTITY(customer,sector,month,states)                                     =no;
domain_for_WV_WATERDEMAND_STEPS(customer,sector,allsteps)                                          =no;
domain_for_WV_WATERDEMAND(customer,sector)                                                         =no;
domain_for_ART_WE_ADDALLWATERSUPPLY(customer,sector,month,states)                                  =no;
domain_for_WV_SURFACEDIVERSION(river,riverplace,citycounty,sector,month,states)                    =no;
domain_for_WV_FLOW(river,riverplace,downriver,month,states)                                        =no;
domain_for_WV_RETURNFLOW(citycounty,sector,month,states)                                        =no;
domain_for_WV_OUTTOBAY(river,riverplace,month,states)                                              =no;
domain_for_WV_RESERVOIR_WITHDRAW(reservoir,month,states)                                           =no;
domain_for_WV_RESERVOIR_RELEASE(reservoir,month,states)                                            =no;
domain_for_WV_SPRNFLOW(riverplace,states)                                                          =no;
domain_for_WV_RESERVIOR_INVENTORY(reservoir, month, states)                                        =no;
domain_for_WV_RESERVIOR_INVENTORY_INI(reservoir)                                                   =no;
domain_for_WE_FLOWBALANCE(river,riverplace,month,states)                                           =no;
domain_for_WE_OUTOBAYBAL(river, states)                                                            =no;
domain_for_WE_DIVERSIONQMAX(county,sector,river,riverplace,states)                                 =no;
domain_for_WE_RESERVOIR_CAPACITY_BAL(reservoir, month, states)                                     =no;
domain_for_WE_RESERVOIR_CAPACITY_INIBAL(reservoir)                                                 =no;
domain_for_WE_RESERVOIR_BALANCE(reservoir, month,states)                                           =no;
domain_for_WE_RESERVOIR_INIBAL(reservoir)                                                          =no;
domain_for_WE_RESERVOIR_MAXWTIHDRAW(reservoir, month, states)                                      =no;
domain_for_ART_WE_FLOWBALANCE_DEMAND(river,riverplace,month,states)                                =no;
domain_for_ART_WE_FLOWBALANCE_SUPPLY(river,riverplace,month,states)                                =no;
domain_for_ART_WE_OUTOBAYBAL(river, states)                                                        =no;
domain_for_WV_PUMP_GROUNDWATER(aquifer,layer,citycounty,sector,month,states)                       =no;
domain_for_WV_PUMP_STEP(county,Aquifer,layer,states,allstepsw)                                     =no;
domain_for_WV_TOTALCOUNTYPUMP(county, Aquifer, layer, month, states)                               =no;
domain_for_WE_COUNTYPUMPBAL(county, Aquifer, layer, month,states)                                  =no;
domain_for_WE_TOTALCOUNTY_PUMPSTEPBAL(county,Aquifer, layer, states)                               =no;
domain_for_WE_TOTALCOUNTY_PUMP_CONVEXBAL(county,Aquifer, layer, states)                            =no;
domain_for_WE_DRAWDOWN_BAL(aquifer,layer,county)                                                   =no;
domain_for_WV_DRAWDOWN(aquifer, layer, county,steps_dd)                                            =no;
domain_for_WE_SPRINGFLOW_BAL(Springs,states)                                                       =no;
domain_for_WE_EDWARDS_PUMPLIMIT(county,gsector,states)                                             =no;
domain_for_WE_SAWSEDWARDS_PUMPLIMIT(states)                                                        =no;
domain_for_WE_AQUIFER_PUMPLIMIT_EXIST(aquifer,county,states)                                             =no;
domain_for_WE_AQUIFER_PUMPLIMIT_MAG(aquifer,county)                                             =no;
domain_for_ART_WE_DRAWDOWN_BAL(aquifer, layer, county)                                             =no;
domain_for_WE_MIX_GRDPUMPBal(county,aquifer,layer,states,uplow)                                    =no;
domain_for_WV_MIX_GRDPUMP(county,years,states)                                                     =no;
domain_for_WE_MIX_SURGRDBal(county, gsector,source,states,uplow)                                   =no;
domain_for_WV_MIX_SURGRD(county,gsector,mixesa,states)                                             =no;
domain_for_WE_MIX_SALINEBLENDBAL(citycounty,gsector,month,states)                                  =no;
domain_for_WV_WP_USEGROUND(Projects,sector,customer,county,aquifer,layer,month,states)             =no;
domain_for_WV_WP_USEASR(projects,sector,customer,month,states)                                     =no;
domain_for_WV_WP_USESURFACE(projects,sector,customer,sourceriver,riverplace,month,states)          =no;
domain_for_WV_WP_USEOCR(projects,sector,customer,OCR,month,states)                                 =no;
domain_for_WV_WP_USEOUTSIDE(projects,sector,customer,month,states)                                 =no;
domain_for_WV_WP_USESEAWATER(projects,sector,customer,month,states)                                =no;
domain_for_WV_WP_USEREUSE(projects,sector,customer,sector,citycounty,month,states)                 =no;
domain_for_WV_WP_DO_I_OPRT_WATER(Projects)                                                         =no;
domain_for_WV_WP_DO_I_BUILD_WATER(Projects)                                                        =no;
domain_for_WV_WP_PROJECTWATER(projects,sector,customer,month,states)                               =no;
domain_for_WV_WP_RECHARGE_AQUIFER(projects,sector,customer,aquifer,layer, month,states)            =no;
domain_for_WV_WP_SURFACE_ACQUWR(projects,sourceriver,riverplace,county,sector,month,states)        =no;
domain_for_WV_WP_SURFACE_NEWWR(projects,sourceriver,riverplace,month,states)                       =no;
domain_for_WV_WP_ASROCR_INVENTORY_INI(projects)                                                    =no;
domain_for_WV_WP_ASROCR_INVENTORY(projects, month, states)                                         =no;
domain_for_WV_WP_ASR_FROMGROUND(projects,sourcecounty,sourceaquifer,layer,month,states)            =no;
domain_for_WV_WP_ASR_FROMSURFACE(projects,sourceriver,riverplace,county,sector,month,states)       =no;
domain_for_WV_WP_ASR_FROMSURFACE_NEWWR(projects,sourceriver,riverplace,month,states)               =no;
domain_for_WV_WP_ASR_FROMREUSE(projects,sector,citycounty,month,states)                            =no;
domain_for_WV_WP_ASR_FROMEXTRA(projects,sector,citycounty,month,states)                            =no;
domain_for_WV_WP_OCR_FROMSURFACE(projects,sourceriver,riverplace,county,sector,month,states)       =no;
domain_for_WV_WP_OCR_FROMSURFACE_NEWWR(projects,sourceriver,riverplace,month,states)               =no;
domain_for_WV_WP_DO_I_JOINTBULTDWP(jointpair)                                                      =no;
domain_for_WV_WP_REUSE_EFFLUENT(customer,sector,month,states)                                      =no;
domain_for_WV_WP_Conservation(customer)                                                            =no;
domain_for_WE_WP_CAPACITYBAL(projects,month, states)                                               =no;
domain_for_WE_WP_OPERATINGBAL(projects)                                                            =no;
domain_for_WE_WP_SUPPLYBAL(projects,sector,customer,month,states)                                  =no;
domain_for_WE_WP_GROUND_PUMPLIMIT(projects,county,aquifer,groundwatertype,month,states)            =no;
domain_for_WE_WP_SURFACE_DIVBAL(projects,sourceriver,riverplace,month,states)                      =no;
domain_for_WE_WP_ASROCR_BALANCE(projects, month,states)                                            =no;
domain_for_WE_WP_ASROCR_CAPACITY_BAL(projects, month, states)                                      =no;
domain_for_WE_WP_ASROCR_INIBAL(projects)                                                           =no;
domain_for_WE_WP_ASR_INJECT_LIMIT(projects,month,states)                                           =no;
domain_for_WE_WP_ASR_RECOVERY_LIMIT(projects,month,states)                                         =no;
domain_for_WE_WP_CURRENTWR_LIMIT(projects,sourceriver,riverplace,county,sector,states)             =no;
domain_for_WE_WP_NEWWR_LIMIT(projects,sourceriver,riverplace,states)                               =no;
domain_for_WE_WP_Mutual_Exclusive_Bal(mutual)                                                      =no;
*domain_for_WE_WP_PHASE_CONTROL_BAL(projects)                                                      =no;
domain_for_WE_WP_JOINT_CONTROL_BAL(jointpair,projects)                                             =no;
domain_for_WE_WP_REUSE_SUPPLYBAL(customer,sector,month,states)                                     =no;
domain_for_WE_RETURNFLOWBAL(customer,sector,month,states)                                 =no;
domain_for_WE_WP_REUSE_BAL(citycounty,sector,month,states)                                         =no;
domain_for_WV_WM_DYO_ENROLL(county, permittype)                                                    =no;
domain_for_WV_WM_DYO_SUSPEND(county,states)                                                        =no;
domain_for_WV_WM_LEASE_RIVER(river,riverplace,county,sector,riverlocation,county1, sector1,states)   =no;
domain_for_WV_WM_TRADE_RIVER(river,riverplace,county,sector,riverlocation,county1, sector1)          =no;
domain_for_WV_WM_LEASE_AQUIFER(aquifer,county,gsector, county1, sector1,states)                           =no;
domain_for_WV_WM_TRADE_AQUIFER(aquifer,county,gsector, county1, sector1)                                  =no;
domain_for_WE_WM_DYO_SUSPENDLIMIT(county, states)                                                       =no;
domain_for_WE_WM_DYO_COUNTYLIMIT(county,permittype)                                                     =no;
domain_for_WE_WM_TRADE_RIVERLIMIT(river,riverplace,county,sector, states)                               =no;
domain_for_WE_WM_TRADE_EDWARDSLIMIT(county, sector, states)                                             =no;
domain_for_WE_WM_TRADE_EDWARDS_AGLIMIT(county, states)                                                  =no;
domain_for_EE_PP_OPERATE(POWER_PLANT_ALL,POWER_PLANT_TYPE, POWER_PLANT_COOLING)                         =no;
domain_for_EE_PP_RETROFIT_LIMIT(POWER_PLANT_ALL)                                                        =no;
domain_for_EE_PP_CAPACITYBAL(POWER_PLANT_ALL,POWER_PLANT_TYPE,POWER_PLANT_COOLING,MONTH%ADDHOUR%,STATES)=no;
domain_for_EE_PP_TOTALGEN_LIMIT(POWER_PLANT_ALL,POWER_PLANT_TYPE,POWER_PLANT_COOLING, STATEs)           =no;
domain_for_EE_PP_HYDRO_GENEBAL(power_plant_all,month%addhour%, states)                                  =no;
domain_for_EE_PP_NEWNGCC_LIMIT(county,power_plant_cooling)                                              =no;
domain_for_EE_PP_PEAKCAPCITY_REQ(states)                                                                =no;
domain_for_EE_PP_FUEL_BAL(fuel, month,states)                                                           =no;
domain_for_EE_PP_WATER_DIVISIONBAL(power_plant_all,power_plant_type, power_plant_cooling,month,states)  =no;
domain_for_EE_PP_WATER_POND_INITBal(power_plant_all,power_plant_type, power_plant_cooling)              =no;
domain_for_EE_PP_Water_GROUND_DIVBAL(Aquifer,layer,county,month, states)                                =no;
domain_for_EE_PP_WATER_SURFACE_DIVBAL1(river,riverplace,county,power_plant_all,power_plant_cooling,month, states)           =no;
domain_for_EE_PP_WATER_SURFACE_DIVBAL2(river,riverplace,county,sector,month,states)                     =no;
domain_for_EV_SURFACEDIVERSION_COOL(river,riverplace,county,sector,month,states)                        =no;
domain_for_EV_PP_WP_COOLWATER(projects,river,riverplace,county,sector,month,states)                     =no;
domain_for_EE_PP_WP_WATER_BAL(projects,county,month,states)                                             =no;

domain_for_EV_PP_WATER_SURFACE(river,riverplace,county,power_plant_all,power_plant_cooling,sector,month,states)             =no;
domain_for_EE_WS_NEWBUILD_BAL(power_plant_all, ws_type)                                                 =no;
domain_for_EE_WS_LANDBAL(power_plant_all,county,ws_type)                                                =no;
domain_for_EE_WS_LAND_LIMIT(county,zones,landirrtype)                                                   =no;
domain_for_EE_DEMAND_QUANTITYBAL(month%addhour%,states)                                                 =no;
*domain_for_EE_DEMAND_CONVEXITY                                                                          =no;
domain_for_EE_DEMAND_COUNTYBAL(county, month%addhour%, states)                                          =no;
domain_for_EE_DEMAND_TRANSBAL(county,month%addhour%,states)                                             =no;
domain_for_EE_DEMAND_WPBAL(county, month, states)                                                     =no;
domain_for_EV_PP_DO_I_BUILD_NEW_NGPP(POWER_PLANT_ALL,POWER_PLANT_TYPE,POWER_PLANT_COOLING)                       =no;
domain_for_EV_PP_DO_I_RETROFIT_COOLING(POWER_PLANT_ALL,POWER_PLANT_TYPE,POWER_PLANT_COOLING,POWER_PLANT_COOLING0) =no;
domain_for_EV_PP_DO_I_RETROFIT_BOILER(POWER_PLANT_ALL, POWER_PLANT_TYPE, POWER_PLANT_TYPE0, POWER_PLANT_COOLING)  =no;
domain_for_EV_PP_DO_I_OPER_POWERPLANT(power_plant_all,power_plant_type, power_plant_cooling)                     =no;
domain_for_EV_PP_GENERATION(power_plant_all,power_plant_type, power_plant_cooling, month%addhour%, states)       =no;
domain_for_EV_WS_OPERATION(power_plant_all,ws_type)                                                              =no;
domain_for_EV_DEMAND_PERCAP(month%addhour%, states)                                                              =no;
domain_for_EV_PP_FUEL(fuel,month,states)                                                                         =no;
domain_for_EV_PP_WATER_POND(power_plant_all,power_plant_type, power_plant_cooling, month, states)                =no;
domain_for_EV_PP_WATER_POND_Ini(power_plant_all,power_plant_type, power_plant_cooling)                           =no;
domain_for_EV_PP_WATER_DIVERSION(power_plant_all,power_plant_type, power_plant_cooling, month, states)           =no;
domain_for_EV_WS_NEWBUILD(power_plant_all,ws_type)                                                               =no;
domain_for_EV_WS_LAND(power_plant_all,ws_type,county, zones, landirrtype)                                        =no;
domain_for_EV_DEMAND_STEPS(allsteps)                                                                              =no;
domain_for_EV_DEMAND_TRANS(county,county,month%addhour%, states)                                                 =no;
domain_for_EV_DEMAND_WP(county, month, states)                                                                   =no;
domain_for_EV_OTHERELECDEMAND(county, month, states)                                                             =no;
domain_for_EV_ELEC_TRANS(county,county,month%addhour%, states)                                                   =no;
domain_for_ART_EE_PP_CAPACITYBAL(POWER_PLANT_ALL,POWER_PLANT_TYPE, POWER_PLANT_COOLING, MONTH%ADDHOUR%, STATES)  =no;
domain_for_ART_EE_PP_NEWNGCC_LIMIT(county,power_plant_cooling)                                                   =no;
domain_for_ART_EE_PP_PEAKCAPCITY_REQ(states)                                                                     =no;
domain_for_ART_EE_PP_WATER_SURFACE_DIVBAL2(river,riverplace,county,sector,month,states)                                             =no;
domain_for_ART_EE_DEMAND_COUNTYBAL(county, month%addhour%, states)                                               =no;
domain_for_ART_EE_DEMAND_TRANSBAL(county,month%addhour%, states)                                                 =no;
wp_notnow(projects)                                                                                              =no;
wp_excluded(projects)                                                                                            =no;
wp_exist_mutual(mutual)                                                                                          =no;
*^^^^^^^^^^^^^^^^^^^^^^^^^^
* Domain Calculation      ^
*^^^^^^^^^^^^^^^^^^^^^^^^^^
*^^^^^^^^^^^^^^^^^^^^^^^^^^^^
* Agricultural part domain  ^
*^^^^^^^^^^^^^^^^^^^^^^^^^^^^

* ag land and production
domain_for_AE_AGLANDBal(county, zones, landirrtype)
         $AvailLand(county,zones,landirrtype)    =yes;

domain_for_ART_AE_AGLANDBal(county, zones, landirrtype)
         $(domain_for_AE_AGLANDBal(county, zones, landirrtype) and useart)= yes;
domain_for_AV_CROPACRES(county,zones,crops,landirrtype)
         $(domain_for_AE_AGLANDBal(county, zones, landirrtype)
           and cropbudexist(county,crops,landirrtype)) = yes;
domain_for_AV_CROPACRES(county,zones,'vegetables',landirrtype)
         $(domain_for_AE_AGLANDBal(county, zones, landirrtype)
           and sum(mapvegemix(crops,vege_mix), cropbudexist(county,crops,landirrtype))) = yes;


domain_for_AV_LANDTRANS(county, landirrtype,zones, landirrtype2,zones2)
         $(AvailLand(county,zones,landirrtype)
           and AvailLand(county,zones2,landirrtype2)
           and maplandtrans_zones(county, landirrtype, zones, landirrtype2, zones2)) = yes;

domain_for_AE_LandTransferLimit(county,irrigstatus)
         $sum((landirrmapping(Irrigstatus, landirrtype),domain_for_AV_LANDTRANS(county, landirrtype, zones, landirrtype2, zones2)),1) = yes;

domain_for_AV_CROPSTRATEGY(county,zones, crops, landirrtype, stateofnature, allstrat)
         $(probability(stateofnature)
           and sum(primary, crop_strat(county, crops, landirrtype, stateofnature, allstrat, primary))
           and domain_for_AV_CROPACRES(county,zones,crops,landirrtype)$(not sameas(crops,'vegetables')) ) = yes;

domain_for_AV_LIVEGRAZING(county,livestock,stateofnature)
         $( ([   Haysupply(county, stateofnature)*livebudnew(county,livestock,'Pastureland1AU')
              +12*750/2000*(livebudnew(county,livestock,'can_I_grazing')-livebudnew(county,livestock,'Pastureland1AU')) ]
                 * livebudnew(county,livestock,'AU') )
           and sum(domain_for_AV_CROPSTRATEGY(county,zones, crops, landirrtype, stateofnature, allstrat),
                      crop_strat(county, crops, landirrtype, stateofnature, allstrat, 'grazing'))
           ) =yes;

domain_for_AV_LIVEPROD(county, livestock)
         $(livebudexist(county,livestock)
           and ( AvailLand(county,'none','pasture')
                or sum(stateofnature,domain_for_AV_LIVEGRAZING(county,livestock,stateofnature)) ))= yes;


domain_for_AE_AGSALEBAL(county,primary, stateofnature)
         $(sum(domain_for_AV_CROPSTRATEGY(county,zones, crops, landirrtype, stateofnature, allstrat),
                crop_strat(county, crops, landirrtype, stateofnature, allstrat, primary))
           or sum(domain_for_AV_LIVEPROD(county, livestock), livebudnew(county,livestock,primary))
           ) = yes;

domain_for_AV_AGSALE(county,primary, stateofnature)
         $(domain_for_AE_AGSALEBAL(county,primary, stateofnature)
          and not sameas(primary,'grazing')) =yes;

domain_for_AE_CROPSTRATBALANCE(county,zones,crops,landirrtype, stateofnature)
         $sum(domain_for_AV_CROPSTRATEGY(county,zones, crops, landirrtype, stateofnature, allstrat),1)  =yes;

domain_for_AE_LIVEFEED_BAL(county,livestock,stateofnature)
         $([   Haysupply(county, stateofnature)*livebudnew(county,livestock,'Pastureland1AU')
              +12*750/2000*(livebudnew(county,livestock,'can_I_grazing')-livebudnew(county,livestock,'Pastureland1AU')) ]
                 * livebudnew(county,livestock,'AU') ) = yes;

domain_for_AV_HAYFEED(county,livestock,primary, stateofnature)
         $(     domain_for_AE_LIVEFEED_BAL(county,livestock,stateofnature)
           and (sameas(primary,'hay') or sameas(primary,'sorghumhay'))) =yes;

domain_for_AV_HAYTRANS(county,county1,primary,stateofnature)
         $(    sum(domain_for_AV_HAYFEED(county1,livestock,primary, stateofnature), 1)
           and domain_for_AE_AGSALEBAL(county,primary,stateofnature)
           and (sameas(primary,'hay') or sameas(primary,'sorghumhay'))
           and (haytranscost(county,county1)<maxhaytranscost) ) =yes;

domain_for_AV_HAYPURCHASE(county,primary,stateofnature)
         $sum(domain_for_AV_HAYFEED(county,livestock,primary, stateofnature), 1) =yes;

domain_for_AE_HAY_BAL(county,primary,states)
         $sum(domain_for_AV_HAYFEED(county,livestock,primary, stateofnature), 1) =yes;

*ag mixes
domain_for_AE_CROPMIXBAL(county,crop_mix,irrigstatus,uplow)
         $(sum((landirrmapping(Irrigstatus, landirrtype), mapfieldmix(crops,crop_mix), domain_for_AV_CROPACRES(county,zones,crops,landirrtype)),1)
          and sum(mixesa, cropmixdatanew(county,crop_mix,irrigstatus,mixesa) ) )  =yes;

domain_for_AV_CROPMIX(county,irrigstatus,mixesa)
         $(sum(domain_for_AE_CROPMIXBAL(county,crop_mix,irrigstatus,uplow), 1)
          and sum(crop_mix, cropmixdatanew(county,crop_mix,irrigstatus,mixesa) )) = yes;

domain_for_AE_VEGE_SUMBAL(county,zones,landirrtype)
         $sum(vege_mix, domain_for_AV_CROPACRES(county,zones,vege_mix,landirrtype)) =yes;

domain_for_AE_VEGEMIXBAL(county,vege_mix,irrigstatus,uplow)
         $(sum((landirrmapping(Irrigstatus, landirrtype), mapvegemix(crops,vege_mix), domain_for_AV_CROPACRES(county,zones,crops,landirrtype)),1)
          and sum(mixesa, vegemixdatanew(county,vege_mix,irrigstatus,mixesa)) )  =yes;

domain_for_AV_VEGMIX(county,irrigstatus,mixesa)
         $(sum(domain_for_AE_VEGEMIXBAL(county,vege_mix,irrigstatus,uplow), 1)
          and sum(vege_mix, vegemixdatanew(county,vege_mix,irrigstatus,mixesa))) =yes;

domain_for_AE_CROPMIX_PROP2(county,zones,crop_mix,landirrtype)
         $(sum((mapfieldmix(crops,crop_mix), domain_for_AV_CROPACRES(county,zones,crops,landirrtype)) ,1)
          and (sum((landirrmapping(Irrigstatus, landirrtype),mixesa), cropmixdatanew(county,crop_mix,irrigstatus,mixesa) )=0) ) =yes;

domain_for_AE_VEGEMIX_PROP2(county,zones,vege_mix,landirrtype)
         $(sum((mapvegemix(crops,vege_mix), domain_for_AV_CROPACRES(county,zones,crops,landirrtype)),1)
          and (sum((landirrmapping(Irrigstatus, landirrtype),mixesa), vegemixdatanew(county,vege_mix,irrigstatus,mixesa))=0) )  =yes;

domain_for_AE_Rice_Bal(county, zones,landirrtype)
         $domain_for_AV_CROPACRES(county,zones,'ricesecond',landirrtype)   = yes;

domain_for_AV_LIVEMIX(county,mixesa)
         $(sum(domain_for_AV_LIVEPROD(county, livestock),1)
          and sum(livestock_mix, livemixdatanew(county,livestock_mix,mixesa)))= yes;

domain_for_AE_LIVEMIXBAL(county, livestock_mix, uplow)
         $(sum( maplivestockmix(livestock, livestock_mix) , domain_for_AV_LIVEPROD(county, livestock))
          and sum(mixesa, livemixdatanew(county,livestock_mix,mixesa)))= yes;

domain_for_AE_LIVEMIX_PROP2(county,livestock_mix)
         $(sum( maplivestockmix(livestock, livestock_mix) , domain_for_AV_LIVEPROD(county, livestock))
          and (sum(mixesa, livemixdatanew(county,livestock_mix,mixesa))=0))= yes;



*^^^^^^^^^^^^^^^^^^^^^^^^^^^^
* water projects part domain^
*^^^^^^^^^^^^^^^^^^^^^^^^^^^^
nonreuse(sector1)= YES;
nonreuse('mun')$do_i_want_wp = no;
nonreuse('ind')$do_i_want_wp = no;

wp_notnow(projects)
         $(do_i_want_wp
           and (sum(linkphases(projects2, projects),1) and sum(linkphases(projects2, projects),1$exist_projects(projects2))=0))=yes;

wp_exist_mutual(mutual)
         $(do_i_want_wp
           and  sum(mutual_excl(mutual, projects), exist_projects(projects))) = yes;

wp_excluded(projects)
         $(do_i_want_wp
           and  sum(wp_exist_mutual(mutual),mutual_excl(mutual, projects))) = yes;
wp_excluded(projects)$exist_projects(projects)= no;

wp_notnow(projects)$wp_excluded(projects) = yes;

*display wp_excluded, wp_exist_mutual, wp_notnow;

domain_for_WV_WP_USEGROUND(Projects,sector,customer,county,aquifer,layer,month,stateofnature)
         $(sum(mapgroundproject(projects,sector,customer,county,aquifer,layer,groundwatertype),1)
           and investmentcost(projects,'annualfixedcost')
           and do_i_want_wp and probability(stateofnature)
           and (not wp_notnow(projects))) = yes;

domain_for_WV_WP_USEASR(projects,sector,customer,month,stateofnature)
         $(sum(mapinjectprojectrecover(projects, sector, customer),1)
           and investmentcost(projects,'annualfixedcost')
           and do_i_want_wp and probability(stateofnature)
           and (not wp_notnow(projects))) = yes;

domain_for_WV_WP_USESURFACE(projects,sector,customer,sourceriver,riverplace,month,stateofnature)
         $(sum(mapsurfaceproject1(projects,sector,customer,sourceriver,riverplace),1)
           and investmentcost(projects,'annualfixedcost')
           and do_i_want_wp and probability(stateofnature)
           and (not wp_notnow(projects))) = yes;

domain_for_WV_WP_USEOCR(projects,sector,customer,OCR,month,stateofnature)
         $(sum(mapreservoirprojectrecover(projects,sector,customer,OCR),1)
           and investmentcost(projects,'annualfixedcost')
           and do_i_want_wp and probability(stateofnature)
           and (not wp_notnow(projects))) = yes;

domain_for_WV_WP_USEOUTSIDE(projects,sector,customer,month,stateofnature)
         $(sum(mapoutsource(projects,sector,customer),1)
           and investmentcost(projects,'annualfixedcost')
           and do_i_want_wp and probability(stateofnature)
           and (not wp_notnow(projects))) = yes;

domain_for_WV_WP_USESEAWATER(projects,sector,customer,month,stateofnature)
         $(sum(mapseasource(projects,sector,customer),1)
           and investmentcost(projects,'annualfixedcost')
           and do_i_want_wp and probability(stateofnature)
           and (not wp_notnow(projects))) = yes;

domain_for_WV_WP_USEREUSE(projects,sector,customer,sector1,citycounty,month,stateofnature)
         $(sum(mapreuseproject(projects,sector,customer,sector1,citycounty), 1)
           and investmentcost(projects,'annualfixedcost')
           and do_i_want_wp and probability(stateofnature)
           and (not wp_notnow(projects))) = yes;
*display domain_for_WV_WP_USEREUSE, wp_notnow;

domain_for_WE_WP_CAPACITYBAL(projects,month, stateofnature)
         $( sum(domain_for_WV_WP_USEGROUND  (Projects,sector,customer,county,aquifer,layer,month,stateofnature), 1)
           +sum(domain_for_WV_WP_USEASR     (projects,sector,customer,month,stateofnature), 1)
           +sum(domain_for_WV_WP_USESURFACE (projects,sector,customer,sourceriver,riverplace,month,stateofnature), 1)
           +sum(domain_for_WV_WP_USEOCR     (projects,sector,customer,OCR,month,stateofnature), 1)
           +sum(domain_for_WV_WP_USEOUTSIDE (projects,sector,customer,month,stateofnature) , 1)
           +sum(domain_for_WV_WP_USESEAWATER(projects,sector,customer,month,stateofnature), 1)
           +sum(domain_for_WV_WP_USEREUSE   (projects,sector,customer,sector1,citycounty,month,stateofnature), 1)) =yes;

domain_for_WV_WP_DO_I_OPRT_WATER(Projects)
         $sum(domain_for_WE_WP_CAPACITYBAL(projects,month,stateofnature), 1)= yes;

domain_for_WE_WP_OPERATINGBAL(projects)
         $domain_for_WV_WP_DO_I_OPRT_WATER(Projects) = yes;

domain_for_WV_WP_DO_I_BUILD_WATER(Projects)
         $(domain_for_WV_WP_DO_I_OPRT_WATER(Projects) and (not exist_projects (projects))) = yes;

domain_for_WE_WP_SUPPLYBAL(projects,sector,customer,month,stateofnature)
         $( sum(domain_for_WV_WP_USEGROUND  (Projects,sector,customer,county,aquifer,layer,month,stateofnature), 1)
           +sum(domain_for_WV_WP_USEASR     (projects,sector,customer,month,stateofnature), 1)
           +sum(domain_for_WV_WP_USESURFACE (projects,sector,customer,sourceriver,riverplace,month,stateofnature), 1)
           +sum(domain_for_WV_WP_USEOCR     (projects,sector,customer,OCR,month,stateofnature), 1)
           +sum(domain_for_WV_WP_USEOUTSIDE (projects,sector,customer,month,stateofnature) , 1)
           +sum(domain_for_WV_WP_USESEAWATER(projects,sector,customer,month,stateofnature), 1)
           +sum(domain_for_WV_WP_USEREUSE   (projects,sector,customer,sector1,citycounty,month,stateofnature), 1)) =yes;

domain_for_WV_WP_PROJECTWATER(projects,sector,customer,month,stateofnature)
         $domain_for_WE_WP_SUPPLYBAL(projects,sector,customer,month,stateofnature) = yes;

domain_for_WV_WP_RECHARGE_AQUIFER('SanAntonioASR','mun','SanAntonio','Edwards','J17head',month,stateofnature)
         $domain_for_WV_WP_USEASR('SanAntonioASR','mun','SanAntonio',month,stateofnature) =yes;


domain_for_WE_WP_GROUND_PUMPLIMIT(projects,county,aquifer,groundwatertype,month,stateofnature)
         $(sum(domain_for_WV_WP_USEGROUND(Projects,sector,customer,county,aquifer,layer,month,stateofnature), 1)
           and groundprojects_limit(projects,county,aquifer, groundwatertype,'pumplimit')) = yes;

domain_for_WV_WP_SURFACE_ACQUWR(projects,sourceriver,riverplace,county,sector1,month,stateofnature)
         $(sum(domain_for_WV_WP_USESURFACE (projects,sector,customer,sourceriver,riverplace,month,stateofnature), 1)
           and WaterRightTakeout(projects,sourceriver,riverplace,county,sector1) )    =yes;

domain_for_WV_WP_SURFACE_NEWWR(projects,sourceriver,riverplace,month,stateofnature)
         $(sum(domain_for_WV_WP_USESURFACE (projects,sector,customer,sourceriver,riverplace,month,stateofnature), 1)
           and NewWaterRights(projects,sourceriver,riverplace)) = yes;

domain_for_WE_WP_SURFACE_DIVBAL(projects,sourceriver,riverplace,month,stateofnature)
         $( sum(domain_for_WV_WP_SURFACE_ACQUWR(projects,sourceriver,riverplace,county,sector1,month,stateofnature) ,1)
           +sum(domain_for_WV_WP_SURFACE_NEWWR(projects,sourceriver,riverplace,month,stateofnature) ,1))= yes;

domain_for_WV_WP_ASR_FROMGROUND(projects,sourcecounty,sourceaquifer,layer,month,stateofnature)
         $( mapinject_sourceG(projects, sourcecounty,sourceaquifer, layer)
           and sum(domain_for_WV_WP_USEASR(projects,sector,customer,month,stateofnature), 1))=yes;

domain_for_WV_WP_ASR_FROMSURFACE(projects,sourceriver,riverplace,county,sector,month,stateofnature)
         $(sum(mapinject_sourceS(projects, sourceriver),1)
           and WaterRightTakeout(projects,sourceriver,riverplace,county,sector)
           and sum(domain_for_WV_WP_USEASR(projects,sector,customer,month,stateofnature), 1))=yes;

domain_for_WV_WP_ASR_FROMSURFACE_NEWWR(projects,sourceriver,riverplace,month,stateofnature)
         $(sum(mapinject_sourceS(projects, sourceriver),1)
           and NewWaterRights(projects,sourceriver,riverplace)
           and sum(domain_for_WV_WP_USEASR(projects,sector,customer,month,stateofnature), 1))=yes;

domain_for_WV_WP_ASR_FROMREUSE(projects,sector,citycounty,month,stateofnature)
         $(reuse_water(projects,sector,citycounty)
           and sum(domain_for_WV_WP_USEASR(projects,sector1,customer,month,stateofnature), 1))=yes;

domain_for_WV_WP_ASR_FROMEXTRA(projects,sector,citycounty,month,stateofnature)
         $(extrawater(projects,sector,citycounty)
           and sum(domain_for_WV_WP_USEASR(projects,sector,customer,month,stateofnature), 1))=yes;

domain_for_WV_WP_OCR_FROMSURFACE(projects,sourceriver,riverplace,county,sector,month,stateofnature)
         $(sum( mapreservoirproject(projects,sourceriver,riverplace,OCR,injectcounty),1)
           and WaterRightTakeout(projects,sourceriver,riverplace,county,sector)
           and sum(domain_for_WV_WP_USEOCR(projects,sector,customer,OCR,month,stateofnature), 1))= yes;

domain_for_WV_WP_OCR_FROMSURFACE_NEWWR(projects,sourceriver,riverplace,month,stateofnature)
         $(sum( mapreservoirproject(projects,sourceriver,riverplace,OCR,injectcounty),1)
           and NewWaterRights(projects,sourceriver,riverplace)
           and sum(domain_for_WV_WP_USEOCR(projects,sector,customer,OCR,month,stateofnature), 1))= yes;

domain_for_WE_WP_ASROCR_CAPACITY_BAL(projects, month, stateofnature)
         $((reservoirproject_storage(projects) +ASRPara(projects,'Maxstorage'))
           and ( sum(domain_for_WV_WP_USEASR(projects,sector,customer,month,stateofnature), 1)
                +sum(domain_for_WV_WP_USEOCR(projects,sector,customer,OCR,month,stateofnature), 1)))=yes;

domain_for_WE_WP_ASROCR_BALANCE(projects, month,stateofnature)
         $domain_for_WE_WP_ASROCR_CAPACITY_BAL(projects, month, stateofnature)=yes;

domain_for_WE_WP_ASROCR_INIBAL(projects)
         $sum(domain_for_WE_WP_ASROCR_CAPACITY_BAL(projects, month, stateofnature),1) = yes;

domain_for_WV_WP_ASROCR_INVENTORY_INI(projects)$domain_for_WE_WP_ASROCR_INIBAL(projects) =yes;

domain_for_WV_WP_ASROCR_INVENTORY(projects, month, stateofnature)
         $domain_for_WE_WP_ASROCR_CAPACITY_BAL(projects, month, stateofnature) =yes;

domain_for_WE_WP_ASR_INJECT_LIMIT(projects,month,stateofnature)
         $(ASRPara(projects,'MaxDiversionToASR')
           and  sum(domain_for_WV_WP_USEASR(projects,sector,customer,month,stateofnature), 1))=yes;

domain_for_WE_WP_ASR_RECOVERY_LIMIT(projects,month,stateofnature)
         $(ASRPara(projects,'maxrecovery')
           and  sum(domain_for_WV_WP_USEASR(projects,sector,customer,month,stateofnature), 1))=yes;

domain_for_WE_WP_CURRENTWR_LIMIT(projects,sourceriver,riverplace,county,sector,stateofnature)
         $(WaterRightTakeout(projects,sourceriver,riverplace,county,sector)
           and (  sum(domain_for_WV_WP_SURFACE_ACQUWR (projects,sourceriver,riverplace,county,sector,month,stateofnature), 1)
                + sum(domain_for_WV_WP_ASR_FROMSURFACE(projects,sourceriver,riverplace,county,sector,month,stateofnature),1)
                + sum(domain_for_WV_WP_OCR_FROMSURFACE(projects,sourceriver,riverplace,county,sector,month,stateofnature),1)))=yes;

domain_for_WE_WP_NEWWR_LIMIT(projects,sourceriver,riverplace,stateofnature)
         $(NewWaterRights(projects,sourceriver,riverplace)
           and (  sum(domain_for_WV_WP_SURFACE_NEWWR(projects,sourceriver,riverplace,month,stateofnature), 1)
                + sum(domain_for_WV_WP_ASR_FROMSURFACE_NEWWR(projects,sourceriver,riverplace,month,stateofnature),1)
                + sum(domain_for_WV_WP_OCR_FROMSURFACE_NEWWR(projects,sourceriver,riverplace,month,stateofnature),1)))=yes;

domain_for_WE_WP_Mutual_Exclusive_Bal(mutual)
         $(sum(mutual_excl(mutual, projects),1) and do_i_want_wp and not wp_exist_mutual(mutual) ) =yes;

*domain_for_WE_WP_PHASE_CONTROL_BAL(projects)
*         $(sum(projects2, linkphases(projects2, projects)) and do_i_want_wp)= yes;

domain_for_WE_WP_JOINT_CONTROL_BAL(jointpair,projects)
         $(sum(linkjointproj(jointpair, projects),1) and do_i_want_wp)= yes;

domain_for_WV_WP_DO_I_JOINTBULTDWP(jointpair)
         $sum(domain_for_WE_WP_JOINT_CONTROL_BAL(jointpair,projects),1) =yes;

domain_for_WV_WP_Conservation(customer)
         $(do_i_want_wp
           and conservation_Reduction(customer))= yes;
*~~~~~~~~~~~~~~~~~~~~~~~~~~
*  water usage part domain
*~~~~~~~~~~~~~~~~~~~~~~~~~

domain_for_WV_SURFACEDIVERSION(river,riverplace,county,sector,month,stateofnature)
         $(    upperdiversionQ(county,sector,river,riverplace)
          and useexists(county,sector,river,riverplace)) = yes;

domain_for_WV_SURFACEDIVERSION(river,riverplace,city,sector,month,stateofnature)
         $(    sum(mapcitycountytocounty(city, county), upperdiversionQ(county,sector,river,riverplace))
          and useexists(city,sector,river,riverplace)) = yes;

*display domain_for_WV_SURFACEDIVERSION;
domain_for_WV_SURFACEDIVERSION(river,riverplace,county,'ag',month,stateofnature)
         $(sum((mapwater(month,watr),domain_for_AV_CROPSTRATEGY(county,zones, crops, landirrtype, stateofnature, allstrat)),
                crop_strat(county, crops, landirrtype, stateofnature, allstrat, watr) )= 0)=no;

domain_for_WV_SURFACEDIVERSION(river,riverplace,county,'ag',month,stateofnature)
         $(sum(zonewatersource(county, zones, river),AvailLand(county,zones,'furrow')+AvailLand(county,zones,'sprinkler'))=0)=no;


*display  domain_for_AV_CROPSTRATEGY,domain_for_WV_SURFACEDIVERSION,  useexists;

domain_for_WV_SURFACEDIVERSION(river,riverplace,county,'cool',month,stateofnature)=no;


domain_for_WV_PUMP_GROUNDWATER(aquifer,layer,citycounty,gsector(sector),month,stateofnature)
         $ (    sum(mapcitycountytocounty(citycounty,county),AquiferLayerCounty(Aquifer,layer,county))
            and county_wateruse_exist(citycounty, sector)
            and (not sameas(sector, 'cool')))= yes;

domain_for_WV_PUMP_GROUNDWATER(aquifer,layer,county,'ag',month,stateofnature)
         $(sum((mapwater(month,watr),domain_for_AV_CROPSTRATEGY(county,zones, crops, landirrtype, stateofnature, allstrat)),
                crop_strat(county, crops, landirrtype, stateofnature, allstrat, watr) )= 0)=no;

domain_for_WV_PUMP_GROUNDWATER(aquifer,layer,county,'ag',month,stateofnature)
         $(sum(zonewatersource(county, zones, Aquifer),AvailLand(county,zones,'furrow')+AvailLand(county,zones,'sprinkler'))=0)=no;


domain_for_WV_PUMP_GROUNDWATER(aquifer,layer,county,'cool',month,stateofnature)
         $ (    AquiferLayerCounty(Aquifer,layer,county) and do_i_want_pp
            and sum(coolingG(county, aquifer, layer, power_plant_all),1) )=yes;


domain_for_WV_OTHERWATERSOURCE(citycounty, gsector(sector), month, stateofnature)
         $(   sum(mapcitycountytocounty(citycounty,county),otheraquifer_source(county))
          and county_wateruse_exist(citycounty, sector)
          and (not sameas(sector, 'cool'))) = yes;

domain_for_WV_OTHERWATERSOURCE(county, 'ag', month, stateofnature)
         $(sum((mapwater(month,watr),domain_for_AV_CROPSTRATEGY(county,zones, crops, landirrtype, stateofnature, allstrat)),
                crop_strat(county, crops, landirrtype, stateofnature, allstrat, watr) )= 0)=no;

* ag water usage
domain_for_WE_AGWATERUSE_ZONEBAL(county,zones,month,stateofnature)
          $(sum((mapwater(month,watr),domain_for_AV_CROPSTRATEGY(county,zones, crops, landirrtype, stateofnature, allstrat)),
                crop_strat(county, crops, landirrtype, stateofnature, allstrat, watr) )
           and county_wateruse_exist(county, "ag")) = yes;

domain_for_WV_AGZONEWATERUSE(county, zones, month, RiverAndAquifer, stateofnature)
         $(      domain_for_WE_AGWATERUSE_ZONEBAL(county,zones,month,stateofnature)
           and   zonewatersource(county, zones, RiverAndAquifer)
           and(     sum(domain_for_WV_SURFACEDIVERSION(river(riverandAquifer),riverplace,county,'ag',month,stateofnature) ,1)
                 + sum(domain_for_WV_PUMP_GROUNDWATER(aquifer(riverandAquifer),layer,county,'ag',month,stateofnature) ,1)
                 + sum(domain_for_WV_OTHERWATERSOURCE(county,'ag', month, stateofnature)$sameas(RiverAndAquifer, 'other'),1)
                 + (sum(domain_for_WV_WP_PROJECTWATER(projects,'ag',county,month,stateofnature)$sameas(RiverAndAquifer, 'project'),1) )
                  ))= yes;

*display domain_for_WV_AGZONEWATERUSE, domain_for_WV_WP_PROJECTWATER, domain_for_WV_SURFACEDIVERSION;

domain_for_WE_AGWATERUSE_SOURCEBAL(county, RiverAndAquifer, month,stateofnature)
          $sum(domain_for_WV_AGZONEWATERUSE(county, zones, month, RiverAndAquifer, stateofnature),1)= yes;

* water usage by other sectors
domain_for_WE_ADDALLWATERSUPPLY(customer,sector,month,stateofnature)
         $(Demanddata(customer,sector,'annual',"quantity") and monthshare(customer, month, sector)) =yes;

domain_for_WV_ADDUPUSERALLWATER(customer,sector,month,stateofnature)
         $domain_for_WE_ADDALLWATERSUPPLY(customer,sector,month,stateofnature) =yes;

domain_for_ART_WE_ADDALLWATERSUPPLY(customer,sector,month,stateofnature)
         $(domain_for_WE_ADDALLWATERSUPPLY(customer,sector,month,stateofnature) and useart)=yes;

domain_for_WE_DEMANDQUANTITY(customer,sector,month,stateofnature)
         $domain_for_WE_ADDALLWATERSUPPLY(customer,sector,month,stateofnature) =yes;

domain_for_ART_WE_DEMANDQUANTITY(customer,sector,month,stateofnature)
         $domain_for_WE_DEMANDQUANTITY(customer,sector,month,stateofnature)=yes;

domain_for_WV_WATERDEMAND_STEPS(citycounty,sector,steps)
         $((m_WD_coef$(m_quantity_wd and (abs(m_elasticity_wd)> 0.05))>0)  ) =yes;

domain_for_WV_WATERDEMAND(citycounty,sector)
         $(m_quantity_wd and m_price_wd and  (abs(m_elasticity_wd)<= 0.05)   ) =yes;

*display domain_for_WV_WATERDEMAND_STEPS, domain_for_WV_WATERDEMAND;

domain_for_WE_DEMANDCONVEX(customer,sector)
         $sum(steps,domain_for_WV_WATERDEMAND_STEPS(customer,sector,steps))= yes;

domain_for_WE_OTHERWATERSOURCEBAL(county, stateofnature)
         $sum((mapcitycountytocounty(citycounty,county),domain_for_WV_OTHERWATERSOURCE(citycounty,sector,month,stateofnature)),1) = yes;

* surface river flow part
domain_for_WE_FLOWBALANCE(river,riverplace,month,stateofnature)
         $(node_exist(river,riverplace)  and probability(stateofnature)) =yes;

domain_for_WV_FLOW(river,riverplace,downriver,month,stateofnature)
         $sum(riverflowlink(river,riverplace,downriver), domain_for_WE_FLOWBALANCE(river,riverplace,month,stateofnature))= yes;

domain_for_WV_OUTTOBAY(river,out(riverplace),month,stateofnature)
         $domain_for_WE_FLOWBALANCE(river,riverplace,month,stateofnature)=yes;

domain_for_ART_WE_FLOWBALANCE_DEMAND(river,riverplace,month,stateofnature)
         $(domain_for_WE_FLOWBALANCE(river,riverplace,month,stateofnature)  and useart) =yes;

domain_for_ART_WE_FLOWBALANCE_SUPPLY(river,riverplace,month,stateofnature)
         $(domain_for_WE_FLOWBALANCE(river,riverplace,month,stateofnature)  and useart) =yes;

domain_for_WV_RETURNFLOW(customer,sector,month,stateofnature)
         $(sum(domain_for_WV_ADDUPUSERALLWATER(customer,sector,month,stateofnature) ,1)
           +sum((domain_for_WV_AGZONEWATERUSE(county, zones, month, RiverAndAquifer, stateofnature),mapcitycountytocounty(customer,county))$sameas(sector,'ag'),1)) =yes;

domain_for_WE_RETURNFLOWBAL(customer,sector,month,stateofnature)
         $domain_for_WV_RETURNFLOW(customer,sector,month,stateofnature)=1;

domain_for_WV_RETURNFLOW(customer,'min',month,stateofnature)=no;

domain_for_WV_SPRNFLOW(springs(riverplace),stateofnature)$ probability(stateofnature)=yes;

domain_for_WE_OUTOBAYBAL(river, stateofnature)
         $sum(domain_for_WV_OUTTOBAY(river,out,month,stateofnature),minouttobay(river, out))=yes;

domain_for_ART_WE_OUTOBAYBAL(river, stateofnature)
         $(domain_for_WE_OUTOBAYBAL(river, stateofnature) and useart) =yes;

domain_for_WE_DIVERSIONQMAX(county,sector,river,riverplace,stateofnature)
         $(sum(domain_for_WV_SURFACEDIVERSION(river,riverplace,citycounty,sector,month,stateofnature),mapcitycountytocounty(citycounty,county))
           and upperdiversionQ(county,sector,river,riverplace)) =yes;

*display domain_for_WE_DIVERSIONQMAX, upperdiversionQ,domain_for_WV_SURFACEDIVERSION ;
*reservoir part
domain_for_WV_RESERVOIR_WITHDRAW(reservoir,month,stateofnature)
         $(sum(mapreservoir(river, riverplace, reservoir),1) and probability(stateofnature))=yes;

domain_for_WV_RESERVOIR_RELEASE(reservoir,month,stateofnature)
         $domain_for_WV_RESERVOIR_WITHDRAW(reservoir,month,stateofnature)=yes;

domain_for_WE_RESERVOIR_CAPACITY_BAL(reservoir, month, stateofnature)
         $domain_for_WV_RESERVOIR_WITHDRAW(reservoir,month,stateofnature)=yes;

domain_for_WV_RESERVIOR_INVENTORY(reservoir, month, stateofnature)
         $domain_for_WV_RESERVOIR_WITHDRAW(reservoir,month,stateofnature)=yes;

domain_for_WE_RESERVOIR_CAPACITY_INIBAL(reservoir)
         $sum(domain_for_WE_RESERVOIR_CAPACITY_BAL(reservoir, month, stateofnature),1)=yes;

domain_for_WV_RESERVIOR_INVENTORY_INI(reservoir)
         $domain_for_WE_RESERVOIR_CAPACITY_INIBAL(reservoir) =yes;

domain_for_WE_RESERVOIR_BALANCE(reservoir, month,stateofnature)
         $domain_for_WV_RESERVOIR_WITHDRAW(reservoir,month,stateofnature)=yes;

domain_for_WE_RESERVOIR_INIBAL(reservoir)
         $domain_for_WE_RESERVOIR_CAPACITY_INIBAL(reservoir) =yes;

domain_for_WE_RESERVOIR_MAXWTIHDRAW(reservoir, month, stateofnature)
         $sum(domain_for_WE_RESERVOIR_CAPACITY_BAL(reservoir, month, stateofnature),1)=yes;

* ground water part
domain_for_WE_COUNTYPUMPBAL(county, Aquifer, layer, month,stateofnature)
         $AquiferLayerCounty(Aquifer, layer, County) = yes;

domain_for_WV_TOTALCOUNTYPUMP(county, Aquifer, layer, month, stateofnature)
         $domain_for_WE_COUNTYPUMPBAL(county, Aquifer, layer, month,stateofnature)  =yes;

domain_for_WE_TOTALCOUNTY_PUMPSTEPBAL(county,Aquifer, layer, stateofnature)
         $(pumpbase(Aquifer, layer, county)
           and aquiferLayerCountyReg(Aquifer, layer, County)) =yes;

domain_for_WV_PUMP_STEP(county,Aquifer,layer,stateofnature,stepw)
         $(domain_for_WE_TOTALCOUNTY_PUMPSTEPBAL(county,Aquifer, layer, stateofnature)
          and QINCW(STEPw)) =yes;

domain_for_WE_TOTALCOUNTY_PUMP_CONVEXBAL(county,Aquifer, layer, stateofnature)
         $domain_for_WE_TOTALCOUNTY_PUMPSTEPBAL(county,Aquifer, layer, stateofnature) =yes;

domain_for_WE_DRAWDOWN_BAL(aquifer,layer,county)
         $(sum(domain_for_WE_TOTALCOUNTY_PUMPSTEPBAL(county,Aquifer, layer, stateofnature) ,1)
          and ((smax(stepw, endliftsteps(county,aquifer, layer,'normal', stepw))- inilift0(aquifer, layer, county))>0))  =yes;

domain_for_WV_DRAWDOWN(aquifer,layer,county,steps_dd)
         $(domain_for_WE_DRAWDOWN_BAL(aquifer,layer,county)
          and drawdown_cost(county,aquifer,layer,steps_dd)) =yes;

domain_for_ART_WE_DRAWDOWN_BAL(aquifer, layer, county)
         $(domain_for_WE_DRAWDOWN_BAL(aquifer,layer,county) and useart) = yes;

domain_for_WE_SPRINGFLOW_BAL(Springs,stateofnature)
         $domain_for_WV_SPRNFLOW(springs,stateofnature)= yes;

domain_for_WE_EDWARDS_PUMPLIMIT(county, gsector,stateofnature)
         $(sum((mapcitycountytocounty(citycounty,county), county_wateruse_map(county, 'Edwards', gsector, sector1),
                domain_for_WV_PUMP_GROUNDWATER('Edwards',layer,citycounty,sector1,month,stateofnature)),1)
          and  edwardspermit1(county, gsector, 'All') ) = yes;

domain_for_WE_SAWSEDWARDS_PUMPLIMIT(stateofnature)
          $ probability(stateofnature) =yes;

domain_for_WE_AQUIFER_PUMPLIMIT_EXIST(aquifer,county,stateofnature)
         $(not sameas(aquifer,'Edwards')
           and  sum(layer, aquiferLayerCountyReg(Aquifer, layer, County))
           and  exist_supply_climate(aquifer,county,'2020')  ) = yes;

domain_for_WE_AQUIFER_PUMPLIMIT_MAG(aquifer,county)
         $(not sameas(aquifer,'Edwards')
           and sum(layer, aquiferLayerCountyReg(Aquifer, layer, County))
           and MAG_climate(county,aquifer,'2020')) = yes;

* water sources mix part
domain_for_WE_MIX_GRDPUMPBal(county,aquifer,layer,stateofnature,uplow)
         $(sum(domain_for_WV_TOTALCOUNTYPUMP(county, Aquifer, layer, month, stateofnature), 1)
          and do_i_want_watermix) = yes;

domain_for_WV_MIX_GRDPUMP(county,years,stateofnature)
         $(sum(domain_for_WE_MIX_GRDPUMPBal(county,aquifer,layer,stateofnature,uplow) , 1)
          and  sum((Aquifer, layer), -AquiferHistdata(Aquifer, layer, county,years, 'Wells'))
          and do_i_want_watermix) =yes;

domain_for_WE_MIX_SURGRDBal(county, gsector,source, stateofnature,uplow)
         $(county_wateruse_exist(county, gsector)
           and ( sum((domain_for_WV_PUMP_GROUNDWATER(aquifer,layer,citycounty,gsector,month,stateofnature),mapcitycountytocounty(citycounty, county))$sameas(source, 'ground'),1)
                +sum((domain_for_WV_SURFACEDIVERSION(river,riverplace,citycounty,gsector,month,stateofnature),mapcitycountytocounty(citycounty,county))$sameas(source, 'surface'),1) )
           and  do_i_want_watermix
           and  sum(mixesa, hist_sur_groud (county,gsector,source,mixesa)))=yes;

domain_for_WV_MIX_SURGRD(county,gsector,mixesa,stateofnature)
         $(sum(domain_for_WE_MIX_SURGRDBal(county, gsector,source, stateofnature,uplow), 1)
          and  sum(source,  hist_sur_groud (county, gsector, source, mixesa))) =yes;

domain_for_WE_MIX_SALINEBLENDBAL(citycounty,gsector,month,stateofnature)
         $(sum(salinelayer(aquifer,layer),domain_for_WV_PUMP_GROUNDWATER(aquifer,layer,citycounty,gsector,month,stateofnature)) and do_i_want_watermix )=yes;

* reuse part
domain_for_WE_WP_REUSE_SUPPLYBAL(customer,sector,month,stateofnature)
         $((sum(domain_for_WV_WP_USEREUSE(projects,sector,customer,sector1,citycounty,month,stateofnature), 1)
           + sum(domain_for_WV_ADDUPUSERALLWATER(customer,sector,month,stateofnature), 1))
          and Demanddata(customer,sector,'annual',"quantity")  and monthshare(customer, month, sector)
          and sum(mapreuseproject(projects,sector1, citycounty, sector, customer ) ,1)
          and sum(domain_for_WV_WP_USEREUSE(projects,sector1,citycounty,sector,customer,month,stateofnature),1) ) =yes;

domain_for_WV_WP_REUSE_EFFLUENT(customer,sector,month,stateofnature)
         $domain_for_WE_WP_REUSE_SUPPLYBAL(customer,sector,month,stateofnature)=yes;

domain_for_WE_WP_REUSE_BAL(customer,sector,month,stateofnature)
         $domain_for_WV_WP_REUSE_EFFLUENT(customer,sector,month,stateofnature) =yes;


*display  domain_for_WE_WP_REUSE_SUPPLYBAL;

*^^^^^^^^^^^^^^^^^^^^^^^^^^^^
* water market part domain        ^
*^^^^^^^^^^^^^^^^^^^^^^^^^^^^

domain_for_WV_WM_DYO_ENROLL(county, permittype)
         $( sum(sector1, county_wateruse_map(county, 'Edwards', 'ag', sector1))
            and edwardspermit1(county, 'ag', permittype)
            and (not sameas (permittype, 'all'))
            and do_i_want_wm) = yes;

domain_for_WV_WM_DYO_SUSPEND(county,stateofnature)
         $(sum(domain_for_WV_WM_DYO_ENROLL(county, permittype) , 1)
           and DYOprob(stateofnature)) = yes;

domain_for_WE_WM_DYO_SUSPENDLIMIT(county, stateofnature)
         $domain_for_WV_WM_DYO_SUSPEND(county,stateofnature)= yes;

domain_for_WE_WM_DYO_COUNTYLIMIT(county,permittype)
         $domain_for_WV_WM_DYO_ENROLL(county, permittype) =yes;

domain_for_WE_WM_TRADE_RIVERLIMIT(river,riverplace,county,conssector, stateofnature)
         $(upperdiversionQ(county,conssector,river,riverplace)
             and useexists(county,conssector,river,riverplace)
             and probability(stateofnature) and do_i_want_wm)  =yes;

domain_for_WV_WM_LEASE_RIVER(river,riverplace,county,conssector,riverlocation,county1, conssector1,stateofnature)
         $(    domain_for_WE_WM_TRADE_RIVERLIMIT(river,riverplace,county,conssector,stateofnature)
           and domain_for_WE_WM_TRADE_RIVERLIMIT(river,riverlocation,county1,conssector1,stateofnature)
           and domain_for_WE_DIVERSIONQMAX(county1,conssector1,river,riverlocation,stateofnature)
           and (not [sameas(riverplace, riverlocation) and  sameas(conssector, conssector1)and sameas(county, county1)]) ) = yes;

domain_for_WV_WM_TRADE_RIVER(river,riverplace,county,conssector,riverlocation,county1,conssector1)
         $sum(domain_for_WV_WM_LEASE_RIVER(river,riverplace,county,conssector,riverlocation,county1,conssector1,stateofnature) , 1) = yes;

*display domain_for_WV_WM_LEASE_RIVER, domain_for_WE_WM_TRADE_RIVERLIMIT, domain_for_WV_WM_TRADE_RIVER;

domain_for_WE_WM_TRADE_EDWARDSLIMIT(county, gsector, stateofnature)
         $( sum( mapEdwardCounty(layer, county), 1)
         and  sum(sector1, county_wateruse_map(county, 'Edwards', gsector, sector1) )
         and  edwardspermit1(county, gsector, 'unrest')
         and  probability(stateofnature) and do_i_want_wm)  =yes;

domain_for_WV_WM_LEASE_AQUIFER('Edwards',county,gsector, county1, gsector1,stateofnature)
         $(domain_for_WE_WM_TRADE_EDWARDSLIMIT(county, gsector, stateofnature)
           and domain_for_WE_WM_TRADE_EDWARDSLIMIT(county1, gsector1, stateofnature)
           and edwards_trade_limit(county, county1)
           and (not [sameas(county, county1) and  sameas(gsector, gsector1)]))= yes;

domain_for_WV_WM_TRADE_AQUIFER('Edwards',county,gsector, county1, gsector1)
         $sum(domain_for_WV_WM_LEASE_AQUIFER('Edwards',county,gsector, county1, gsector1,stateofnature), 1) = yes;

domain_for_WE_WM_TRADE_EDWARDS_AGLIMIT(county, stateofnature)
         $domain_for_WE_WM_TRADE_EDWARDSLIMIT(county, 'ag', stateofnature) =yes;


*^^^^^^^^^^^^^^^^^^^^^^^^^^^^
* energy part domain        ^
*^^^^^^^^^^^^^^^^^^^^^^^^^^^^
domain_for_EV_PP_DO_I_BUILD_NEW_NGPP(POWER_PLANT_ALL, POWER_PLANT_TYPE, POWER_PLANT_COOLING)
         $(    newpp(power_plant_all, power_plant_type, power_plant_cooling)
         and not sum(power_plant_cooling0, power_plant_exist(power_plant_all, power_plant_type, power_plant_cooling0))
         and do_i_want_pp ) =yes;
display domain_for_EV_PP_DO_I_BUILD_NEW_NGPP;

domain_for_EV_PP_DO_I_RETROFIT_COOLING(POWER_PLANT_ALL, POWER_PLANT_TYPE, POWER_PLANT_COOLING0, POWER_PLANT_COOLING)
         $(      cooling_retrofit(power_plant_all,power_plant_type, power_plant_cooling0, power_plant_cooling)
             and power_plant_exist(power_plant_all, power_plant_type, power_plant_cooling0)
             and do_i_want_pp   )=yes;

domain_for_EV_PP_DO_I_RETROFIT_BOILER(POWER_PLANT_ALL, POWER_PLANT_TYPE0, POWER_PLANT_TYPE, POWER_PLANT_COOLING)
         $(    boiler_retrofit(power_plant_all, power_plant_type0, power_plant_type, power_plant_cooling)
           and power_plant_exist(power_plant_all, power_plant_type0, power_plant_cooling)
           and do_i_want_pp ) =yes;

domain_for_EE_PP_OPERATE(POWER_PLANT_ALL,POWER_PLANT_TYPE, POWER_PLANT_COOLING)
      $( pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling, 'capacity')
         and [ power_plant_exist(power_plant_all, power_plant_type, power_plant_cooling)
             or domain_for_EV_PP_DO_I_BUILD_NEW_NGPP(POWER_PLANT_ALL, POWER_PLANT_TYPE, POWER_PLANT_COOLING)
             or sum(domain_for_EV_PP_DO_I_RETROFIT_COOLING(POWER_PLANT_ALL, POWER_PLANT_TYPE, POWER_PLANT_COOLING0, POWER_PLANT_COOLING),1)
             or sum(domain_for_EV_PP_DO_I_RETROFIT_BOILER(POWER_PLANT_ALL, POWER_PLANT_TYPE0, POWER_PLANT_TYPE, POWER_PLANT_COOLING),1) ]
         and do_i_want_pp  )
       =yes;

domain_for_EV_PP_DO_I_OPER_POWERPLANT(power_plant_all,power_plant_type, power_plant_cooling)
     $ domain_for_EE_PP_OPERATE(POWER_PLANT_ALL,POWER_PLANT_TYPE, POWER_PLANT_COOLING) =yes;

domain_for_EE_PP_RETROFIT_LIMIT(POWER_PLANT_ALL)
         $(    sum(power_plant_exist(power_plant_all, power_plant_type0, power_plant_cooling0) , 1)
           and sum(domain_for_EV_PP_DO_I_RETROFIT_COOLING(POWER_PLANT_ALL, POWER_PLANT_TYPE, POWER_PLANT_COOLING0, POWER_PLANT_COOLING),1)
           and sum(domain_for_EV_PP_DO_I_RETROFIT_BOILER(POWER_PLANT_ALL, POWER_PLANT_TYPE0, POWER_PLANT_TYPE, POWER_PLANT_COOLING),1) )  =yes;

domain_for_EE_PP_CAPACITYBAL(POWER_PLANT_ALL,POWER_PLANT_TYPE, POWER_PLANT_COOLING, MONTH%ADDHOUR%, STATEOFNATURE)
      $(domain_for_EE_PP_OPERATE(POWER_PLANT_ALL,POWER_PLANT_TYPE, POWER_PLANT_COOLING)
       and gen_adj(power_plant_type%addhour%) and do_i_want_pp ) =yes;

domain_for_ART_EE_PP_CAPACITYBAL(POWER_PLANT_ALL,POWER_PLANT_TYPE, POWER_PLANT_COOLING, MONTH%ADDHOUR%, STATEOFNATURE)
      $(domain_for_EE_PP_CAPACITYBAL(POWER_PLANT_ALL,POWER_PLANT_TYPE, POWER_PLANT_COOLING, MONTH%ADDHOUR%, STATEOFNATURE)
       and useart and do_i_want_pp )
      =yes;

domain_for_EV_PP_GENERATION(power_plant_all,power_plant_type, power_plant_cooling, month%addhour%, stateofnature)
         $(domain_for_EE_PP_OPERATE(POWER_PLANT_ALL,POWER_PLANT_TYPE, POWER_PLANT_COOLING)
          and gen_adj(power_plant_type%addhour%)) =yes;

domain_for_EE_PP_TOTALGEN_LIMIT(POWER_PLANT_ALL,POWER_PLANT_TYPE,POWER_PLANT_COOLING, STATEOFNATURE)
         $sum(domain_for_EV_PP_GENERATION(power_plant_all,power_plant_type, power_plant_cooling, month%addhour%, stateofnature) , 1)= yes;

domain_for_EE_PP_HYDRO_GENEBAL(power_plant_all,month%addhour%, stateofnature)
         $domain_for_EV_PP_GENERATION(POWER_PLANT_ALL,'hydro', 'none',month%addhour%, stateofnature) = yes;

domain_for_EE_PP_NEWNGCC_LIMIT(county,power_plant_cooling)
         $(   sum(pp_location(county,power_plant_all),domain_for_EV_PP_DO_I_BUILD_NEW_NGPP(power_plant_all, 'ngcc', power_plant_cooling))
          and do_i_want_pp )=yes;

domain_for_ART_EE_PP_NEWNGCC_LIMIT(county,power_plant_cooling)
         $domain_for_EE_PP_NEWNGCC_LIMIT(county,power_plant_cooling) = yes;

domain_for_EE_PP_PEAKCAPCITY_REQ(stateofnature)
         $(probability(stateofnature) and do_i_want_pp )=yes;

domain_for_ART_EE_PP_PEAKCAPCITY_REQ(stateofnature)
         $domain_for_EE_PP_PEAKCAPCITY_REQ(stateofnature) =yes;

domain_for_EV_WS_OPERATION(power_plant_all,ws_type)
         $(sum(county, windsolar_all(power_plant_all,county,ws_type, 'capacity') ) and do_i_want_pp )=yes;

domain_for_EV_DEMAND_PERCAP(month%addhour%, stateofnature)
         $(Demanddata_pp("quantity") and monthshare_pp(month%addhour%)  and do_i_want_pp )= yes;

domain_for_EE_PP_FUEL_BAL(fuel, month, stateofnature)
         $(sum(domain_for_EV_PP_DO_I_OPER_POWERPLANT(power_plant_all,power_plant_type, power_plant_cooling),
                            link_boiler_fuel(power_plant_type, fuel))
         and fuel_para (fuel, 'fuelheat' ) )=yes;

*display  domain_for_EE_PP_FUEL_BAL ;

domain_for_EV_PP_FUEL(fuel, month, stateofnature)
         $domain_for_EE_PP_FUEL_BAL(fuel, month, stateofnature)   =yes;

domain_for_EE_PP_WATER_DIVISIONBAL(power_plant_all, power_plant_type, power_plant_cooling, month, stateofnature)
         $sum(domain_for_EV_PP_DO_I_OPER_POWERPLANT(power_plant_all,power_plant_type, power_plant_cooling),
                            pp_waterusage(power_plant_all, power_plant_type, power_plant_cooling) ) =yes;

domain_for_EV_PP_WATER_POND(power_plant_all,power_plant_type, power_plant_cooling, month, stateofnature)
         $(domain_for_EE_PP_WATER_DIVISIONBAL(power_plant_all, power_plant_type, power_plant_cooling, month, stateofnature)
           and [sameas(power_plant_cooling, 'rc') or sameas(power_plant_cooling, 'oc')] )=yes;

domain_for_EV_PP_WATER_POND_Ini(power_plant_all,power_plant_type, power_plant_cooling)
         $sum(domain_for_EV_PP_WATER_POND(power_plant_all,power_plant_type, power_plant_cooling, month, stateofnature), 1)= yes;

domain_for_EV_PP_WATER_DIVERSION(power_plant_all,power_plant_type, power_plant_cooling, month, stateofnature)
         $domain_for_EE_PP_WATER_DIVISIONBAL(power_plant_all, power_plant_type, power_plant_cooling, month, stateofnature) =yes;

domain_for_EE_PP_WATER_POND_INITBal(power_plant_all, power_plant_type, power_plant_cooling)
         $domain_for_EV_PP_WATER_POND_Ini(power_plant_all,power_plant_type, power_plant_cooling)  = yes;

domain_for_EE_PP_Water_GROUND_DIVBAL(Aquifer,layer, county,  month, stateofnature)
         $sum(domain_for_EV_PP_WATER_DIVERSION(power_plant_all,power_plant_type, power_plant_cooling, month, stateofnature),coolingG(county, aquifer, layer, power_plant_all))=yes;

domain_for_EE_PP_WATER_SURFACE_DIVBAL1(river,riverplace,county,power_plant_all,power_plant_cooling,month, stateofnature)
         $(sum(domain_for_EV_PP_WATER_DIVERSION(power_plant_all,power_plant_type, power_plant_cooling, month, stateofnature),1)
           and sum(coolingdiverter(river, riverplace, county, power_plant_all, sector),1)) = yes;

domain_for_EE_PP_WATER_SURFACE_DIVBAL2(river,riverplace,county,sector,month, stateofnature)
         $(sum(domain_for_EE_PP_WATER_SURFACE_DIVBAL1(river,riverplace,county,power_plant_all,power_plant_cooling,month, stateofnature),1)
           and sum(coolingdiverter(river, riverplace, county, power_plant_all, sector),1)) = yes;

domain_for_EV_PP_WATER_SURFACE(river,riverplace,county,power_plant_all,power_plant_cooling,sector,month,stateofnature)
         $(domain_for_EE_PP_WATER_SURFACE_DIVBAL1(river,riverplace,county,power_plant_all,power_plant_cooling,month, stateofnature)
           and coolingdiverter(river, riverplace, county, power_plant_all, sector))= yes;

domain_for_Art_EE_PP_WATER_SURFACE_DIVBAL2(river,riverplace,county,sector,month, stateofnature)
         $(domain_for_EE_PP_WATER_SURFACE_DIVBAL2(river,riverplace,county,sector,month, stateofnature) and useart )=yes;

domain_for_EV_SURFACEDIVERSION_COOL(river,riverplace,county,sector,month,stateofnature)
         $domain_for_EE_PP_WATER_SURFACE_DIVBAL2(river,riverplace,county,sector,month, stateofnature) =yes;

domain_for_EV_PP_WP_COOLWATER(projects,river,riverplace,county,sector,month,stateofnature)
         $(     domain_for_WV_WP_PROJECTWATER(projects,'cool',county,month,stateofnature)
           and  domain_for_EE_PP_WATER_SURFACE_DIVBAL2(river,riverplace,county,sector,month,stateofnature)) = yes;

domain_for_EE_PP_WP_WATER_BAL(projects,county,month,stateofnature)
         $domain_for_WV_WP_PROJECTWATER(projects,'cool',county,month,stateofnature)= yes;

display domain_for_EV_PP_WP_COOLWATER, domain_for_EE_PP_WP_WATER_BAL;

domain_for_EE_WS_NEWBUILD_BAL(power_plant_all, ws_type)
         $domain_for_EV_WS_OPERATION(power_plant_all,ws_type)=yes;

domain_for_EV_WS_NEWBUILD(power_plant_all,ws_type)
         $domain_for_EE_WS_NEWBUILD_BAL(power_plant_all, ws_type) = yes;

domain_for_EV_WS_LAND(power_plant_all,ws_type,county, zones, landirrtype)
         $(domain_for_EE_WS_NEWBUILD_BAL(power_plant_all, ws_type)
           and windsolar_all(power_plant_all,county, ws_type, 'landuse')
           and (not sameas(ws_type, 'offshore'))
           and AvailLand(county,zones,landirrtype)
           and [sum(mapwindsolar(power_plant_all0, county, ws_type2)$(not sameas(ws_type2, 'offshore')),
                         + WindSolar_LANDexist(power_plant_all0,ws_type2,county, zones, landirrtype) )
                          < 0.1*AvailLand(county,zones,landirrtype)]) = yes;

domain_for_EE_WS_LANDBAL(power_plant_all,county,ws_type)
         $sum(domain_for_EV_WS_LAND(power_plant_all,ws_type,county, zones, landirrtype),1)=yes;

domain_for_EE_WS_LAND_LIMIT(county,zones,landirrtype)
         $sum(domain_for_EV_WS_LAND(power_plant_all,ws_type,county, zones, landirrtype),1)= yes;

domain_for_EE_DEMAND_QUANTITYBAL(month%addhour%,stateofnature)
         $domain_for_EV_DEMAND_PERCAP(month%addhour%, stateofnature) = yes;

domain_for_EV_DEMAND_STEPS(steps)
         $(sum(domain_for_EV_DEMAND_PERCAP(month%addhour%, stateofnature),1) and qinc(steps)
          and m_ED_coef>0) = yes;



domain_for_EE_DEMAND_COUNTYBAL(county, month%addhour%, stateofnature)
         $(domain_for_EV_DEMAND_PERCAP(month%addhour%, stateofnature) and population(county))= yes;

domain_for_ART_EE_DEMAND_COUNTYBAL(county, month%addhour%, stateofnature)
         $(domain_for_EE_DEMAND_COUNTYBAL(county, month%addhour%, stateofnature) and useart) = yes;

domain_for_EE_DEMAND_TRANSBAL(county,month%addhour%,stateofnature)
         $( sum(pp_potential_exist(county,power_plant_all, power_plant_type, power_plant_cooling),
                 domain_for_EV_PP_GENERATION(power_plant_all,power_plant_type, power_plant_cooling, month%addhour%, stateofnature))
            or sum(mapwindsolar(power_plant_all, county, ws_type),domain_for_EV_WS_OPERATION(power_plant_all,ws_type)) )=yes;

domain_for_EV_DEMAND_TRANS(county,county1,month%addhour%, stateofnature)
         $(    domain_for_EE_DEMAND_COUNTYBAL(county1, month%addhour%, stateofnature)
           and domain_for_EE_DEMAND_TRANSBAL (county,month%addhour%,stateofnature)
           and link_trans_county(county, county1) ) = yes;

domain_for_ART_EE_DEMAND_TRANSBAL(county,month%addhour%, stateofnature)
         $(domain_for_EE_DEMAND_TRANSBAL(county,month%addhour%,stateofnature) and useart)=yes;

domain_for_EE_DEMAND_WPBAL(county, month, stateofnature)
         $(sum (mapcitycountytocounty(customer,county),
              [  sum(domain_for_WV_WP_USEGROUND(Projects,sector,customer,county,aquifer,layer,month,stateofnature),    investmentcost(projects, 'energyperunit'))
               + sum(domain_for_WV_WP_USEASR(projects,sector,customer,month,stateofnature),                            investmentcost(projects, 'energyperunit'))
               + sum(domain_for_WV_WP_USESURFACE(projects,sector,customer,sourceriver,riverplace,month,stateofnature), investmentcost(projects, 'energyperunit'))
               + sum(domain_for_WV_WP_USEOCR(projects,sector,customer,OCR,month,stateofnature),                        investmentcost(projects, 'energyperunit'))
               + sum(domain_for_WV_WP_USEOUTSIDE(projects,sector,customer,month,stateofnature),                        investmentcost(projects, 'energyperunit'))
               + sum(domain_for_WV_WP_USESEAWATER(projects,sector,customer,month,stateofnature),                       investmentcost(projects, 'energyperunit'))
               + sum(domain_for_WV_WP_USEREUSE(projects,sector,customer,sector1,citycounty,month,stateofnature),       investmentcost(projects, 'energyperunit'))] )
           and do_i_want_pp) =yes;

domain_for_EV_DEMAND_WP(county, month, stateofnature)
         $domain_for_EE_DEMAND_WPBAL(county, month, stateofnature)=yes;


