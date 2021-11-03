$ondotl
  sreport_V_NETBENEFIT(altrunhere)                                                                                                        =V_NETBENEFIT;
* agricultural variables
  sreport_AV_LANDTRANS(county, landirrtype,zones, landirrtype2,zones2,altrunhere)                                                         = AV_LANDTRANS(county, landirrtype,zones, landirrtype2,zones2)                        ;
  sreport_AV_CROPACRES(county,zones,crops,landirrtype,altrunhere)                                                                         = AV_CROPACRES(county,zones,crops,landirrtype)                                        ;
  sreport_AV_CROPSTRATEGY(county,zones, crops, landirrtype, stateofnature, allstrat,altrunhere)                                           = AV_CROPSTRATEGY(county,zones, crops, landirrtype, stateofnature, allstrat)          ;
  sreport_AV_LIVEPROD(county, livestock,altrunhere)                                                                                       = AV_LIVEPROD(county, livestock)                                                      ;
  sreport_AV_LIVEGRAZING(county,livestock,stateofnature,altrunhere)                                                                       = AV_LIVEGRAZING(county,livestock,stateofnature)                                      ;
  sreport_AV_HAYFEED(county,livestock,primary,stateofnature,altrunhere)                                                                   = AV_HAYFEED(county,livestock,primary,stateofnature)                                  ;
  sreport_AV_HAYPURCHASE(county,primary,stateofnature,altrunhere)                                                                         = AV_HAYPURCHASE(county,primary,stateofnature)                                        ;
  sreport_AV_HAYTRANS(county1,county,primary,stateofnature,altrunhere)                                                                    = AV_HAYTRANS(county1,county,primary,stateofnature)                                   ;

  sreport_AV_AGSALE(county, primary, stateofnature,altrunhere)                                                                            = AV_AGSALE(county, primary, stateofnature)                                           ;
  sreport_AV_CROPMIX(county,irrigstatus,mixesa,altrunhere)                                                                                = AV_CROPMIX(county,irrigstatus,mixesa)                                               ;
  sreport_AV_VEGMIX(county,irrigstatus,mixesa,altrunhere)                                                                                 = AV_VEGMIX(county,irrigstatus,mixesa)                                                ;
  sreport_AV_LIVEMIX(county,mixesa,altrunhere)                                                                                            = AV_LIVEMIX(county,mixesa)                                                           ;

* water variables
  sreport_WV_AGZONEWATERUSE(county,zones,month,RiverAndAquifer,stateofnature,altrunhere)                                                  = WV_AGZONEWATERUSE(county,zones,month,RiverAndAquifer,stateofnature)                        ;
  sreport_WV_SURFACEDIVERSION(river,riverplace,citycounty,sector,month,stateofnature,altrunhere)                                          = WV_SURFACEDIVERSION(river,riverplace,citycounty,sector,month,stateofnature)                ;
  sreport_WV_PUMP_GROUNDWATER(aquifer,layer,citycounty,sector,month,stateofnature,altrunhere)                                             = WV_PUMP_GROUNDWATER(aquifer,layer,citycounty,sector,month,stateofnature)                   ;
  sreport_WV_OTHERWATERSOURCE(citycounty,sector,month,stateofnature,altrunhere)                                                           = WV_OTHERWATERSOURCE(citycounty,sector,month,stateofnature)                                 ;
  sreport_WV_ADDUPUSERALLWATER(customer,sector,month,stateofnature,altrunhere)                                                            = WV_ADDUPUSERALLWATER(customer,sector,month,stateofnature)                                  ;
  sreport_WV_WATERDEMAND_STEPS(customer,sector,allsteps,altrunhere)                                                                       = WV_WATERDEMAND_STEPS(customer,sector,allsteps)                               ;
  sreport_WV_WATERDEMAND(customer,sector,altrunhere)                                                                                      = WV_WATERDEMAND(customer,sector)                                              ;

*surface water variables
  sreport_WV_FLOW(river,riverplace,downriver,month,stateofnature,altrunhere)                                                              = WV_FLOW(river,riverplace,downriver,month,stateofnature)                                    ;
  sreport_WV_RETURNFLOW(customer,sector,month,stateofnature,altrunhere)                                                                   = WV_RETURNFLOW(customer,sector,month,stateofnature)                              ;
  sreport_WV_OUTTOBAY(river,riverplace,month,stateofnature,altrunhere)                                                                    = WV_OUTTOBAY(river,riverplace,month,stateofnature)                                          ;
  sreport_WV_RESERVOIR_WITHDRAW(reservoir,month,stateofnature,altrunhere)                                                                 = WV_RESERVOIR_WITHDRAW(reservoir,month,stateofnature)                                       ;
  sreport_WV_RESERVOIR_RELEASE(reservoir,month,stateofnature,altrunhere)                                                                  = WV_RESERVOIR_RELEASE(reservoir,month,stateofnature)                                        ;
  sreport_WV_SPRNFLOW(springs,stateofnature,altrunhere)                                                                                   = WV_SPRNFLOW(springs,stateofnature)                                                         ;
  sreport_WV_RESERVIOR_INVENTORY(reservoir, month, stateofnature,altrunhere)                                                              = WV_RESERVIOR_INVENTORY(reservoir, month, stateofnature)                                    ;
  sreport_WV_RESERVIOR_INVENTORY_INI(reservoir,altrunhere)                                                                                = WV_RESERVIOR_INVENTORY_INI(reservoir)                                                      ;

*ground water variables
  sreport_WV_PUMP_STEP(county,Aquifer,layer,stateofnature,allstepsw,altrunhere)                                                           = WV_PUMP_STEP(county,Aquifer,layer,stateofnature,allstepsw)                                 ;
  sreport_WV_TOTALCOUNTYPUMP(county,Aquifer,layer, month, stateofnature,altrunhere)                                                     = WV_TOTALCOUNTYPUMP(county, Aquifer, layer, month, stateofnature)                           ;
  sreport_WV_DRAWDOWN(aquifer,layer,county,steps_dd,altrunhere)                                                                         = WV_DRAWDOWN(aquifer, layer, county,steps_dd)                                              ;
* water mix
  sreport_WV_MIX_GRDPUMP(county,years,stateofnature,altrunhere)                                                                           = WV_MIX_GRDPUMP(county,years,stateofnature)                                                 ;
  sreport_WV_MIX_SURGRD(county,gsector,mixesa,stateofnature,altrunhere)                                                                   = WV_MIX_SURGRD(county,gsector,mixesa,stateofnature)                                         ;

* water projects
  sreport_WV_WP_USEGROUND(Projects,sector,customer,county,aquifer,layer,month,stateofnature,altrunhere)                                   = WV_WP_USEGROUND(Projects,sector,customer,county,aquifer,layer,month,stateofnature)         ;
  sreport_WV_WP_USEASR(projects,sector,customer,month,stateofnature,altrunhere)                                                           = WV_WP_USEASR(projects,sector,customer,month,stateofnature)                                 ;
  sreport_WV_WP_USESURFACE(projects,sector,customer,sourceriver,riverplace,month,stateofnature,altrunhere)                                = WV_WP_USESURFACE(projects,sector,customer,sourceriver,riverplace,month,stateofnature)      ;
  sreport_WV_WP_USEOCR(projects,sector,customer,OCR,month,stateofnature,altrunhere)                                                       = WV_WP_USEOCR(projects,sector,customer,OCR,month,stateofnature)                             ;
  sreport_WV_WP_USEOUTSIDE(projects,sector,customer,month,stateofnature,altrunhere)                                                       = WV_WP_USEOUTSIDE(projects,sector,customer,month,stateofnature)                             ;
  sreport_WV_WP_USESEAWATER(projects,sector,customer,month,stateofnature,altrunhere)                                                      = WV_WP_USESEAWATER(projects,sector,customer,month,stateofnature)                            ;
  sreport_WV_WP_USEREUSE(projects,sector,customer,sector1,citycounty,month,stateofnature,altrunhere)                                      = WV_WP_USEREUSE(projects,sector,customer,sector1,citycounty,month,stateofnature)            ;
  sreport_WV_WP_PROJECTWATER(projects,sector,customer,month,stateofnature,altrunhere)                                                     = WV_WP_PROJECTWATER(projects,sector,customer,month,stateofnature)                           ;
  sreport_WV_WP_SURFACE_ACQUWR(projects,sourceriver,riverplace,county,sector,month,stateofnature,altrunhere)                              = WV_WP_SURFACE_ACQUWR(projects,sourceriver,riverplace,county,sector,month,stateofnature)    ;
  sreport_WV_WP_SURFACE_NEWWR(projects,sourceriver,riverplace,month,stateofnature,altrunhere)                                             = WV_WP_SURFACE_NEWWR(projects,sourceriver,riverplace,month,stateofnature)                   ;
  sreport_WV_WP_ASROCR_INVENTORY_INI(projects,altrunhere)                                                                                 = WV_WP_ASROCR_INVENTORY_INI(projects)                                                       ;
  sreport_WV_WP_ASROCR_INVENTORY(projects, month, stateofnature,altrunhere)                                                               = WV_WP_ASROCR_INVENTORY(projects, month, stateofnature)                                     ;
  sreport_WV_WP_ASR_FROMGROUND(projects,sourcecounty,sourceaquifer,layer,month,stateofnature,altrunhere)                                  = WV_WP_ASR_FROMGROUND(projects,sourcecounty,sourceaquifer,layer,month,stateofnature)        ;
  sreport_WV_WP_ASR_FROMSURFACE(projects,sourceriver,riverplace,county,sector,month,stateofnature,altrunhere)                             = WV_WP_ASR_FROMSURFACE(projects,sourceriver,riverplace,county,sector,month,stateofnature)   ;
  sreport_WV_WP_ASR_FROMSURFACE_NEWWR(projects,sourceriver,riverplace,month,stateofnature,altrunhere)                                     = WV_WP_ASR_FROMSURFACE_NEWWR(projects,sourceriver,riverplace,month,stateofnature)           ;
  sreport_WV_WP_RECHARGE_AQUIFER(projects,sector,citycounty,aquifer,layer, month,stateofnature,altrunhere)                                = WV_WP_RECHARGE_AQUIFER(projects,sector,citycounty,aquifer,layer, month,stateofnature)      ;

  sreport_WV_WP_ASR_FROMREUSE(projects,sector,citycounty,month,stateofnature,altrunhere)                                                  = WV_WP_ASR_FROMREUSE(projects,sector,citycounty,month,stateofnature)                        ;
  sreport_WV_WP_ASR_FROMEXTRA(projects,sector,citycounty,month,stateofnature,altrunhere)                                                  = WV_WP_ASR_FROMEXTRA(projects,sector,citycounty,month,stateofnature)                        ;
  sreport_WV_WP_OCR_FROMSURFACE(projects,sourceriver,riverplace,county,sector,month,stateofnature,altrunhere)                             = WV_WP_OCR_FROMSURFACE(projects,sourceriver,riverplace,county,sector,month,stateofnature)   ;
  sreport_WV_WP_OCR_FROMSURFACE_NEWWR(projects,sourceriver,riverplace,month,stateofnature,altrunhere)                                     = WV_WP_OCR_FROMSURFACE_NEWWR(projects,sourceriver,riverplace,month,stateofnature)           ;
  sreport_WV_WP_REUSE_EFFLUENT(customer,sector,month,stateofnature,altrunhere)                                                            = WV_WP_REUSE_EFFLUENT(customer,sector,month,stateofnature)                                  ;
  sreport_WV_WP_Conservation(customer,altrunhere)                                                                                         = WV_WP_Conservation(customer)                                                               ;

* water markets
  sreport_WV_WM_DYO_ENROLL(county, permittype,altrunhere)                                                                                 = WV_WM_DYO_ENROLL(county, permittype)                                                                    ;
  sreport_WV_WM_DYO_SUSPEND(county,stateofnature,altrunhere)                                                                              = WV_WM_DYO_SUSPEND(county,stateofnature)                                                                 ;
  sreport_WV_WM_LEASE_RIVER(river,riverplace,county,sector,riverlocation,county,sector,stateofnature,altrunhere)                          = WV_WM_LEASE_RIVER(river,riverplace,county,sector,riverlocation,county,sector,stateofnature)             ;
  sreport_WV_WM_TRADE_RIVER(river,riverplace,county,sector,riverlocation,county,sector,altrunhere)                                        = WV_WM_TRADE_RIVER(river,riverplace,county,sector,riverlocation,county,sector)                           ;
  sreport_WV_WM_LEASE_AQUIFER(aquifer,county,sector,county, sector,stateofnature,altrunhere)                                              = WV_WM_LEASE_AQUIFER(aquifer,county,sector,county, sector,stateofnature)                                 ;
  sreport_WV_WM_TRADE_AQUIFER(aquifer,county,sector,county, sector,altrunhere)                                                            = WV_WM_TRADE_AQUIFER(aquifer,county,sector,county, sector)                                               ;

* power plants
  sreport_EV_PP_GENERATION(power_plant_all,power_plant_type, power_plant_cooling, month%addhour%, stateofnature,altrunhere)               = EV_PP_GENERATION(power_plant_all,power_plant_type, power_plant_cooling, month%addhour%, stateofnature)  ;
  sreport_EV_DEMAND_PERCAP(month%addhour%, stateofnature,altrunhere)                                                                      = EV_DEMAND_PERCAP(month%addhour%, stateofnature)                                                         ;
  sreport_EV_PP_FUEL(fuel,month,stateofnature,altrunhere)                                                                                 = EV_PP_FUEL(fuel,month,stateofnature)                                                                    ;
  sreport_EV_PP_WATER_POND(power_plant_all,power_plant_type, power_plant_cooling, month, stateofnature,altrunhere)                        = EV_PP_WATER_POND(power_plant_all,power_plant_type, power_plant_cooling, month, stateofnature)           ;
  sreport_EV_PP_WATER_POND_Ini(power_plant_all,power_plant_type, power_plant_cooling,altrunhere)                                          = EV_PP_WATER_POND_Ini(power_plant_all,power_plant_type, power_plant_cooling)                             ;
  sreport_EV_PP_WATER_DIVERSION(power_plant_all,power_plant_type, power_plant_cooling, month, stateofnature,altrunhere)                   = EV_PP_WATER_DIVERSION(power_plant_all,power_plant_type, power_plant_cooling, month, stateofnature)      ;
  sreport_EV_WS_OPERATION(power_plant_all,ws_type,altrunhere)                                                                             = EV_WS_OPERATION(power_plant_all,ws_type)                                                                ;
  sreport_EV_WS_NEWBUILD(power_plant_all,ws_type,altrunhere)                                                                              = EV_WS_NEWBUILD(power_plant_all,ws_type)                                                                 ;
  sreport_EV_WS_LAND(power_plant_all,ws_type,county, zones, landirrtype,altrunhere)                                                       = EV_WS_LAND(power_plant_all,ws_type,county, zones, landirrtype)                                          ;
  sreport_EV_DEMAND_STEPS(allsteps,altrunhere)                                                                                            = EV_DEMAND_STEPS(allsteps)                                                                 ;
  sreport_EV_DEMAND_TRANS(county,county1,month%addhour%, stateofnature,altrunhere)                                                        = EV_DEMAND_TRANS(county,county1,month%addhour%, stateofnature)                                        ;
  sreport_EV_DEMAND_WP(county, month, stateofnature,altrunhere)                                                                           = EV_DEMAND_WP(county, month, stateofnature)                                                          ;
  sreport_EV_SURFACEDIVERSION_COOL(river,riverplace,county,sector,month,stateofnature,altrunhere)                                         = EV_SURFACEDIVERSION_COOL(river,riverplace,county,sector,month,stateofnature)                            ;

* aritificial variables
  sreport_ART_WE_ADDALLWATERSUPPLY(customer,sector,month,stateofnature,altrunhere)                                                        = ART_WE_ADDALLWATERSUPPLY(customer,sector,month,stateofnature)                                                ;
  sreport_ART_WE_DEMANDQUANTITY(customer,sector,month,stateofnature,altrunhere)                                                           = ART_WE_DEMANDQUANTITY(customer,sector,month,stateofnature)                                                   ;
  sreport_ART_WE_FLOWBALANCE_DEMAND(river,riverplace,month,stateofnature,altrunhere)                                                      = ART_WE_FLOWBALANCE_DEMAND(river,riverplace,month,stateofnature)                                              ;
  sreport_ART_WE_FLOWBALANCE_SUPPLY(river,riverplace,month,stateofnature,altrunhere)                                                      = ART_WE_FLOWBALANCE_SUPPLY(river,riverplace,month,stateofnature)                                              ;
  sreport_ART_WE_OUTOBAYBAL(river, stateofnature,altrunhere)                                                                              = ART_WE_OUTOBAYBAL(river, stateofnature)                                                                      ;
  sreport_ART_WE_DRAWDOWN_BAL(aquifer, layer, county,altrunhere)                                                                          = ART_WE_DRAWDOWN_BAL(aquifer, layer, county)                                                                  ;
  sreport_ART_EE_PP_CAPACITYBAL(POWER_PLANT_ALL,POWER_PLANT_TYPE, POWER_PLANT_COOLING, MONTH%ADDHOUR%, stateofnature,altrunhere)          = ART_EE_PP_CAPACITYBAL(POWER_PLANT_ALL,POWER_PLANT_TYPE, POWER_PLANT_COOLING, MONTH%ADDHOUR%, stateofnature)  ;
  sreport_ART_EE_PP_NEWNGCC_LIMIT(county,power_plant_cooling,altrunhere)                                                                  = ART_EE_PP_NEWNGCC_LIMIT(county,power_plant_cooling)                                                          ;
  sreport_ART_EE_PP_PEAKCAPCITY_REQ(stateofnature,altrunhere)                                                                             = ART_EE_PP_PEAKCAPCITY_REQ(stateofnature)                                                                     ;
  sreport_ART_EE_PP_CAPACITYLIMIT(uplow,altrunhere)                                                                                       = ART_EE_PP_CAPACITYLIMIT(uplow)                                                                               ;
  sreport_ART_EE_PP_WATER_SURFACE_DIVBAL2(river,riverplace,county,sector,month,stateofnature,altrunhere)                                  = ART_EE_PP_WATER_SURFACE_DIVBAL2(river,riverplace,county,sector,month,stateofnature)                                             ;
  sreport_ART_EE_WS_CAPACITY_LIMIT(altrunhere)                                                                                            = ART_EE_WS_CAPACITY_LIMIT                                                                                     ;
  sreport_ART_EE_DEMAND_COUNTYBAL(county, month%addhour%, stateofnature,altrunhere)                                                       = ART_EE_DEMAND_COUNTYBAL(county, month%addhour%, stateofnature)                                       ;
  sreport_ART_EE_DEMAND_TRANSBAL(county,month%addhour%, stateofnature,altrunhere)                                                         = ART_EE_DEMAND_TRANSBAL(county,month%addhour%, stateofnature)                                                 ;

*binary variables
* water projects
  sreport_WV_WP_DO_I_OPRT_WATER(Projects,altrunhere)                                                                                      = WV_WP_DO_I_OPRT_WATER(Projects)                                                                       ;
  sreport_WV_WP_DO_I_BUILD_WATER(Projects,altrunhere)                                                                                     = WV_WP_DO_I_BUILD_WATER(Projects)                                                                      ;
  sreport_WV_WP_DO_I_JOINTBULTDWP(jointpair,altrunhere)                                                                                   = WV_WP_DO_I_JOINTBULTDWP(jointpair)                                                                    ;
* power plants
  sreport_EV_PP_DO_I_BUILD_NEW_NGPP(POWER_PLANT_ALL, POWER_PLANT_TYPE, POWER_PLANT_COOLING,altrunhere)                                    = EV_PP_DO_I_BUILD_NEW_NGPP(POWER_PLANT_ALL, POWER_PLANT_TYPE, POWER_PLANT_COOLING)                        ;
  sreport_EV_PP_DO_I_RETROFIT_COOLING(POWER_PLANT_ALL, POWER_PLANT_TYPE, POWER_PLANT_COOLING, POWER_PLANT_COOLING,altrunhere)             = EV_PP_DO_I_RETROFIT_COOLING(POWER_PLANT_ALL, POWER_PLANT_TYPE, POWER_PLANT_COOLING, POWER_PLANT_COOLING) ;
  sreport_EV_PP_DO_I_RETROFIT_BOILER(POWER_PLANT_ALL, POWER_PLANT_TYPE, POWER_PLANT_TYPE, POWER_PLANT_COOLING,altrunhere)                 = EV_PP_DO_I_RETROFIT_BOILER(POWER_PLANT_ALL, POWER_PLANT_TYPE, POWER_PLANT_TYPE, POWER_PLANT_COOLING)     ;
  sreport_EV_PP_DO_I_OPER_POWERPLANT(power_plant_all,power_plant_type, power_plant_cooling,altrunhere)                                    = EV_PP_DO_I_OPER_POWERPLANT(power_plant_all,power_plant_type, power_plant_cooling)                        ;

  sreport_AE_AGLANDBAL(county, zones, landirrtype,altrunhere)                                                                             = AE_AGLANDBAL.m(county, zones, landirrtype)                                                               ;
  sreport_WE_DIVERSIONQMAX(county,sector,river,riverplace,stateofnature,altrunhere)                                                       = WE_DIVERSIONQMAX.m(county,sector,river,riverplace,stateofnature)                                         ;
  sreport_WE_COUNTYPUMPBAL(county, Aquifer, layer, month,stateofnature,altrunhere)                                                        = WE_COUNTYPUMPBAL.m(county, Aquifer, layer, month,stateofnature)                                          ;
  sreport_WE_EDWARDS_PUMPLIMIT(county,gsector,stateofnature,altrunhere)                                                                   = WE_EDWARDS_PUMPLIMIT.m(county,gsector,stateofnature)                                                     ;
  sreport_EE_DEMAND_QUANTITYBAL(month%addhour%,stateofnature,altrunhere)                                                                  = EE_DEMAND_QUANTITYBAL.m(month%addhour%,stateofnature)                                                    ;



$offdotl
