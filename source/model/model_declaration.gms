$onlisting
variables
  V_NETBENEFIT                                                                                                   Net Benefit of Water Transfer
;
positive variables
* agricultural variables
  AV_LANDTRANS(county, landirrtype,zones, landirrtype2,zones2)                                                   LANDTRANSfer variable
  AV_CROPACRES(county,zones,crops,landirrtype)                                                                   Harvested acres by crop
  AV_CROPSTRATEGY(county,zones, crops, landirrtype, states, allstrat)                                            Water strategy decision
  AV_LIVEPROD(county, livestock)                                                                                 Livestock production (Unit is budget or AU)
  AV_LIVEGRAZING(county,livestock,states)                                                                        livestock grazing by state of natures
  AV_HAYFEED(county,livestock,primary,states)                                                                    extra hay needed to feed animals
  AV_HAYPURCHASE(county,primary,states)                                                                          the hay purchased for livestock by county
  AV_HAYTRANS(county1,county,primary,states)                                                                     the transaction of hay across counties

  AV_AGSALE(county, primary, states)                                                                             Amount of agricultural production sales at market
  AV_CROPMIX(county,irrigstatus,mixesa)                                                                          Crop mix use
  AV_VEGMIX(county,irrigstatus,mixesa)                                                                           vegetable mix use
  AV_LIVEMIX(county,mixesa)                                                                                      livestock mix use

* water variables
  WV_AGZONEWATERUSE(county,zones,month,RiverAndAquifer,states)                                                   agricultural water usage by zone
  WV_SURFACEDIVERSION(river,riverplace,citycounty,sector,month,states)                                           surface water division
  WV_PUMP_GROUNDWATER(aquifer,layer,citycounty,sector,month,states)                                              ground water pumping amount
  WV_OTHERWATERSOURCE(citycounty,sector,month,states)                                                            water from other aquifers or other sources
  WV_ADDUPUSERALLWATER(customer,sector,month,states)                                                             add up the water for mun ind and min sectors
  WV_WATERDEMAND_STEPS(customer,sector,allsteps)                                                                 water demand steps
  WV_WATERDEMAND(customer,sector)                                                                                water demands without steps

*surface water variables
  WV_FLOW(river,riverplace,downriver,month,states)                                                               surface water flows
  WV_RETURNFLOW(customer,sector,month,states)                                                                 the water that were not used in reuse
  WV_OUTTOBAY(river,riverplace,month,states)                                                                     out to bay flows
  WV_RESERVOIR_WITHDRAW(reservoir,month,states)                                                                  reservoir water withdraw
  WV_RESERVOIR_RELEASE(reservoir,month,states)                                                                   reservoir water release
  WV_SPRNFLOW(springs,states)                                                                                    spring flows
  WV_RESERVIOR_INVENTORY(reservoir, month, states)                                                               reservoir inventory
  WV_RESERVIOR_INVENTORY_INI(reservoir)                                                                          reservoir initial inventory

*ground water variables
  WV_PUMP_STEP(county,Aquifer,layer,states,allstepsw)                                                            ground water pumping steps to count the lift and drawdown
  WV_TOTALCOUNTYPUMP(county, Aquifer, layer, month, states)                                                      total ground water pumping by county
  WV_DRAWDOWN(aquifer, layer, county,steps_dd)                                                                  aquifer draw down
* water mix
  WV_MIX_GRDPUMP(county,years,states)                                                                            ground water mix
  WV_MIX_SURGRD(county,gsector,mixesa,states)                                                                    surface-ground water mix

* water projects
  WV_WP_USEGROUND(Projects,sector,customer,county,aquifer,layer,month,states)                                    water supply from ground water projects
  WV_WP_USEASR(projects,sector,customer,month,states)                                                            water supply from ASR projects
  WV_WP_USESURFACE(projects,sector,customer,sourceriver,riverplace,month,states)                                 water supply from surface water projects
  WV_WP_USEOCR(projects,sector,customer,OCR,month,states)                                                        water supply from OCR projects
  WV_WP_USEOUTSIDE(projects,sector,customer,month,states)                                                        water supply from outside of the region
  WV_WP_USESEAWATER(projects,sector,customer,month,states)                                                       water supply from sea water desalination
  WV_WP_USEREUSE(projects,sector,customer,sector1,citycounty,month,states)                                       water supply from reuse wwtp
  WV_WP_PROJECTWATER(projects,sector,customer,month,states)                                                      water supply from all projects by month and customer
  WV_WP_SURFACE_ACQUWR(projects,sourceriver,riverplace,county,sector,month,states)                               surface project diverted water from existing water rights
  WV_WP_SURFACE_NEWWR(projects,sourceriver,riverplace,month,states)                                              surface project diverted water from new water rights
  WV_WP_ASROCR_INVENTORY_INI(projects)                                                                           asr and ocr water inventory initial balance
  WV_WP_ASROCR_INVENTORY(projects, month, states)                                                                asr and ocr water inventory balance
  WV_WP_ASR_FROMGROUND(projects,sourcecounty,sourceaquifer,layer,month,states)                                   ASR water sources from ground water
  WV_WP_ASR_FROMSURFACE(projects,sourceriver,riverplace,county,sector,month,states)                              ASR water sources from surface water
  WV_WP_ASR_FROMSURFACE_NEWWR(projects,sourceriver,riverplace,month,states)                                      ASR water sources from surface water using new water rights
  WV_WP_RECHARGE_AQUIFER(projects,sector,citycounty,aquifer,layer, month,states)

  WV_WP_ASR_FROMREUSE(projects,sector,citycounty,month,states)                                                   ASR water sources from reuse water
  WV_WP_ASR_FROMEXTRA(projects,sector,citycounty,month,states)                                                   ASR water sources from extra water supply when there is supplus
  WV_WP_OCR_FROMSURFACE(projects,sourceriver,riverplace,county,sector,month,states)                              OCR water sources from surface water
  WV_WP_OCR_FROMSURFACE_NEWWR(projects,sourceriver,riverplace,month,states)                                      OCR water sources from surface water using new water rights
  WV_WP_REUSE_EFFLUENT(customer,sector,month,states)                                                             the effluent taken for reuse
  WV_WP_Conservation(customer)                                                                                   water conservation for municipal sector

* water markets
  WV_WM_DYO_ENROLL(county, permittype)                                                                           water market dry year option enrollment
  WV_WM_DYO_SUSPEND(county,states)                                                                               water market dry year option suspend amount
  WV_WM_LEASE_RIVER(river,riverplace,county,sector,riverlocation,county,sector,states)                           water market river water permits lease
  WV_WM_TRADE_RIVER(river,riverplace,county,sector,riverlocation,county,sector)                                  water market river water permits trade
  WV_WM_LEASE_AQUIFER(aquifer,county,sector,county, sector,states)                                               water market aquifer water permits lease
  WV_WM_TRADE_AQUIFER(aquifer,county,sector,county, sector)                                                      water market aquifer water permits trade

* power plants
  EV_PP_GENERATION(power_plant_all,power_plant_type, power_plant_cooling, month%addhour%, states)                the generation from each power plants
  EV_DEMAND_PERCAP(month%addhour%, states)                                                                       electricity demand per capita
  EV_PP_FUEL(fuel,month,states)                                                                                  power plant fuel consumption
  EV_PP_WATER_POND(power_plant_all,power_plant_type, power_plant_cooling, month, states)                         inventory level of cooling pond
  EV_PP_WATER_POND_Ini(power_plant_all,power_plant_type, power_plant_cooling)                                    initial inventory level of cooling pond
  EV_PP_WATER_DIVERSION(power_plant_all,power_plant_type, power_plant_cooling, month, states)                    cooling water diversion
  EV_WS_OPERATION(power_plant_all,ws_type)                                                                       new wind and solar plants operation
  EV_WS_NEWBUILD(power_plant_all,ws_type)                                                                        new wind and solar plants
  EV_WS_LAND(power_plant_all,ws_type,county, zones, landirrtype)                                                 Land use by solar and wind
  EV_DEMAND_STEPS(allsteps)                                                                                      electricity demand by steps
  EV_DEMAND_TRANS(county,county,month%addhour%, states)                                                          electricity trans across county
  EV_DEMAND_WP(county, month, states)                                                                            water project electricity demand
  EV_PP_WATER_SURFACE(river,riverplace,county,power_plant_all,power_plant_cooling,sector,month,states)           surface cooling water required by pp
  EV_SURFACEDIVERSION_COOL(river,riverplace,county,sector,month,states)                                          surface water division
  EV_PP_WP_COOLWATER(projects,river,riverplace,county,sector,month,states)                                       cooling water from water projects


* aritificial variables
  ART_AE_AGLANDBal(county, zones, landirrtype)
  ART_WE_ADDALLWATERSUPPLY(customer,sector,month,states)
  ART_WE_DEMANDQUANTITY(customer,sector,month,states)
  ART_WE_FLOWBALANCE_DEMAND(river,riverplace,month,states)
  ART_WE_FLOWBALANCE_SUPPLY(river,riverplace,month,states)
  ART_WE_OUTOBAYBAL(river, states)
  ART_WE_DRAWDOWN_BAL(aquifer, layer, county)
  ART_EE_PP_CAPACITYBAL(POWER_PLANT_ALL,POWER_PLANT_TYPE, POWER_PLANT_COOLING, MONTH%ADDHOUR%, STATES)
  ART_EE_PP_NEWNGCC_LIMIT(county,power_plant_cooling)
  ART_EE_PP_PEAKCAPCITY_REQ(states)
  ART_EE_PP_CAPACITYLIMIT(uplow)
  ART_EE_PP_WATER_SURFACE_DIVBAL2(river,riverplace,county,sector,month,STATEs)
  ART_EE_WS_CAPACITY_LIMIT
  ART_EE_DEMAND_COUNTYBAL(county, month%addhour%, states)
  ART_EE_DEMAND_TRANSBAL(county,month%addhour%, states)


 ;


BINARY Variables
* water projects
  WV_WP_DO_I_OPRT_WATER(Projects)                                                                                do I operate water proejcts
  WV_WP_DO_I_BUILD_WATER(Projects)                                                                               do I build water projects
  WV_WP_DO_I_JOINTBULTDWP(jointpair)                                                                             do i build the joint water projects
* power plants
  EV_PP_DO_I_BUILD_NEW_NGPP(POWER_PLANT_ALL, POWER_PLANT_TYPE, POWER_PLANT_COOLING)                              do i build new natural gas power plant
  EV_PP_DO_I_RETROFIT_COOLING(POWER_PLANT_ALL, POWER_PLANT_TYPE, POWER_PLANT_COOLING, POWER_PLANT_COOLING)       do i retrofit cooling towel of existing power plant
  EV_PP_DO_I_RETROFIT_BOILER(POWER_PLANT_ALL, POWER_PLANT_TYPE, POWER_PLANT_TYPE, POWER_PLANT_COOLING)           do I retrofit boiler of existing power plants
  EV_PP_DO_I_OPER_POWERPLANT(power_plant_all,power_plant_type, power_plant_cooling)                              do i operate power plants
;

 equations
  E_OBJ                                                                                                         Objective function
* agricultural equations
  AE_AGLANDBAL(county, zones, landirrtype)                                                                      agricultural Land  balance
  AE_LandTransferLimit(county,irrigstatus)                                                                      agricultural land transfer limit
  AE_AGSALEBAL(county, primary, states)                                                                         sum up the agricultural production
  AE_LIVEFEED_BAL(county,livestock,states)                                                                      extra hay feed needed for livestock
  AE_HAY_BAL(county,primary,states)                                                                             the hay balance (shiped or purchased)
  AE_CROPSTRATBALANCE(county,zones,crops,landirrtype, states)                                                   Crop strategy balance
* ag mix
  AE_CROPMIXBAL(county,crop_mix,irrigstatus,uplow)                                                              the crop mix balance
  AE_VEGE_SUMBAL(county,zones,landirrtype)                                                                      sum up the vegetable acres to 'vegetable'
  AE_VEGEMIXBAL(county,vege_mix,irrigstatus,uplow)                                                              vegetable mix balance
  AE_CROPMIX_PROP2(county,zones,crop_mix,landirrtype)                                                           propertion limits for field crops not in the mix
  AE_VEGEMIX_PROP2(county,zones,vege_mix,landirrtype)                                                           propertion limits for vegetables not in the mix
  AE_Rice_Bal(county, zones,landirrtype)                                                                        limit the area of second rice to be smaller than first year rice
  AE_LIVEMIXBAL(county, livestock_mix, uplow)                                                                   livestock mix balance
  AE_LIVEMIX_PROP2(county,livestock_mix)                                                                        propertion limits for livestock not in the mix

* water equations --demand
  WE_AGWATERUSE_ZONEBAL(county,zones,month,states)                                                              agricultural water usage total by county zone month
  WE_AGWATERUSE_SOURCEBAL(county,RiverAndAquifer,month,states)                                                  agricultural water sources
  WE_ADDALLWATERSUPPLY(citycounty,sector,month,states)                                                          add up water for municipal industrial and mining sectors
  WE_DEMANDQUANTITY(customer,sector,month,states)                                                               demand balance for mun ind and min sectors
  WE_DEMANDCONVEX(customer,sector)                                                                              the convexity of water demand
  WE_OTHERWATERSOURCEBAL(county, states)                                                                        the limitation of using other water sources

*water equations-- surface
  WE_FLOWBALANCE(river,riverplace,month,states)                                                                 the river flows balance
  WE_RETURNFLOWBAL(customer,sector,month,states)                                                                the return flow calculation if there is reuse
  WE_OUTOBAYBAL(river, states)                                                                                  river flow out to bay requirement
  WE_DIVERSIONQMAX(county,sector,river,riverplace,states)                                                       the diversion max limitation by river water permits
  WE_RESERVOIR_CAPACITY_BAL(reservoir, month, states)                                                           reservoir capacity balance
  WE_RESERVOIR_CAPACITY_INIBAL(reservoir)                                                                       reservoir initial capacity balance
  WE_RESERVOIR_BALANCE(reservoir, month,states)                                                                 reservoir inventory balance
  WE_RESERVOIR_INIBAL(reservoir)                                                                                reservoir initial inventory balance
  WE_RESERVOIR_MAXWTIHDRAW(reservoir, month, states)                                                            reservoir maximum withdraw limits

*water equations-- groundwater
  WE_COUNTYPUMPBAL(county, Aquifer, layer, month,states)                                                        total ground water pumping balance
  WE_TOTALCOUNTY_PUMPSTEPBAL(county,Aquifer, layer, states)                                                     split total ground water pumping to steps
  WE_TOTALCOUNTY_PUMP_CONVEXBAL(county,Aquifer, layer, states)                                                  the convexity of groudwater pumping steps
  WE_DRAWDOWN_BAL(aquifer,layer,county)                                                                         aquifer draw down limits
  WE_SPRINGFLOW_BAL(Springs,states)                                                                             the spring flow balance from regression
  WE_EDWARDS_PUMPLIMIT(county,gsector,states)                                                                   edwards pumping limits by permits
  WE_SAWSEDWARDS_PUMPLIMIT(states)                                                                              SAWS regulation to limit water from edwards
  WE_AQUIFER_PUMPLIMIT_EXIST(aquifer,county,states)                                                                    aquifer pump limits  of existing supply
  WE_AQUIFER_PUMPLIMIT_MAG(aquifer,county)                                                                      aquifer pump limits of mag


*water sources mix
  WE_MIX_GRDPUMPBal(county,aquifer,layer,states,uplow)                                                          ground water sources mix balance
  WE_MIX_SURGRDBal(county, gsector,source,states,uplow)                                                         surface and ground water mixes balance
  WE_MIX_SALINEBLENDBAL(citycounty,gsector,month,states)                                                        limit the saline water usage when not through the water projects
* water projects
  WE_WP_CAPACITYBAL(projects,month, states)                                                                      water projects capacity balances
  WE_WP_OPERATINGBAL(projects)                                                                                   water projects operation balance (built before operate)
  WE_WP_SUPPLYBAL(projects,sector,customer,month,states)                                                         water projects supply balances to month and customer
  WE_WP_GROUND_PUMPLIMIT(projects,county,aquifer,groundwatertype,month,states)                                   ground water projects pumping limits
  WE_WP_SURFACE_DIVBAL(projects,sourceriver,riverplace,month,states)                                             surface water diversion balance

  WE_WP_ASROCR_BALANCE(projects, month,states)                                                                   asr and ocr water balance
  WE_WP_ASROCR_CAPACITY_BAL(projects, month, states)                                                             asr and ocr capacity limit
  WE_WP_ASROCR_INIBAL(projects)                                                                                  asr and ocr initial and ending period balance
  WE_WP_ASR_INJECT_LIMIT(projects,month,states)                                                                  asr projects inject rate limits
  WE_WP_ASR_RECOVERY_LIMIT(projects,month,states)                                                                asr projects recovery rate limits
  WE_WP_CURRENTWR_LIMIT(projects,sourceriver,riverplace,county,sector,states)                                    diversion limits of existing water rights
  WE_WP_NEWWR_LIMIT(projects,sourceriver,riverplace,states)                                                      diversion limits of new water rights

  WE_WP_Mutual_Exclusive_Bal(mutual)                                                                             muturally exclusive project balance
*  WE_WP_PHASE_CONTROL_BAL(projects)                                                                              phase control of water projects
  WE_WP_JOINT_CONTROL_BAL(jointpair,projects)                                                                    joint built project control
* reuse
  WE_WP_REUSE_SUPPLYBAL(customer,sector,month,states)                                                            water supply for reuse comes from mun and in effluent
  WE_WP_REUSE_BAL(citycounty,sector,month,states)                                                                the reuse balance
*water markets
  WE_WM_DYO_TOTALLIMIT                                                                                           water market dry year option enrollment limits
  WE_WM_DYO_SUSPENDLIMIT(county, states)                                                                         water market dry year option suspending limit
  WE_WM_DYO_COUNTYLIMIT(county,permittype)                                                                       water market dry year option enrollment limits by county
  WE_WM_TRADE_RIVERLIMIT(river,riverplace,county,conssector,states)                                              water market river water permit trading and leasing limits
  WE_WM_TRADE_EDWARDSLIMIT(county,sector, states)                                                                water market aquifer water permit trading and leasing limits
  WE_WM_TRADE_EDWARDS_AGLIMIT(county,states)                                                                     water market aquifer ag sector water permit trading and leasing limits
* power plants
  EE_PP_OPERATE(POWER_PLANT_ALL,POWER_PLANT_TYPE, POWER_PLANT_COOLING)                                           power plant operation balance
  EE_PP_RETROFIT_LIMIT(POWER_PLANT_ALL)                                                                          power plant retrofiting limits
  EE_PP_CAPACITYBAL(POWER_PLANT_ALL,POWER_PLANT_TYPE, POWER_PLANT_COOLING, MONTH%ADDHOUR%, STATES)               power plant capacity balance (operating ones must already exists)
  EE_PP_TOTALGEN_LIMIT(POWER_PLANT_ALL,POWER_PLANT_TYPE,POWER_PLANT_COOLING, STATEs)                             power plant total generation limits by capacity factor
  EE_PP_HYDRO_GENEBAL(power_plant_all,month%addhour%, states)                                                    hydrology power plant generation balance
  EE_PP_NEWNGCC_LIMIT(county,power_plant_cooling)                                                                the limits of builidng new ngcc (one per time)
  EE_PP_PEAKCAPCITY_REQ(states)                                                                                  the capacity requirement for the peak hour
  EE_PP_CAPACITYLIMIT(uplow)                                                                                     the capacity constraint to speed up model
  EE_PP_FUEL_BAL(fuel, month,states)                                                                             fuel usage balance
  EE_PP_WATER_DIVISIONBAL(power_plant_all,power_plant_type, power_plant_cooling,month,states)                    cooling water diversion balance
  EE_PP_WATER_POND_INITBal(power_plant_all,power_plant_type, power_plant_cooling)                                cooling pond initial level balance
  EE_PP_Water_GROUND_DIVBAL(Aquifer,layer,county,month, states)                                                  cooling water division balance from ground water
  EE_PP_WATER_SURFACE_DIVBAL1(river,riverplace,county,power_plant_all,power_plant_cooling,month, states)
  EE_PP_WATER_SURFACE_DIVBAL2(river,riverplace,county,sector,month, states)
  EE_PP_WP_WATER_BAL(projects,county,month,states)

  EE_WS_NEWBUILD_BAL(power_plant_all, ws_type)                                                                   wind solar plant new construction balance
  EE_WS_CAPACITY_LIMIT                                                                                           wind solar plant capacity limits for reliability
  EE_WS_LANDBAL(power_plant_all,county,ws_type)                                                                  wind solar plannts land use balance
  EE_WS_LAND_LIMIT(county,zones,landirrtype)                                                                     land use limits by wind solar
  EE_DEMAND_QUANTITYBAL(month%addhour%,states)                                                                   electricity demand balance
  EE_DEMAND_CONVEXITY                                                                                            electricity steps convexity
  EE_DEMAND_COUNTYBAL(county, month%addhour%, states)                                                            electricity county level demand balance
  EE_DEMAND_TRANSBAL(county,month%addhour%,states)                                                               electrcity trans balance
  EE_DEMAND_WPBAL(county, month, states)                                                                         water projects electricity demand balance

;
