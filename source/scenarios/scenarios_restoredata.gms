
AvailLand(county,zones,landirrtype)                                                     =     save_AvailLand(county,zones,landirrtype)                                                        ;
Stockingrate(county)                                                                    =     save_Stockingrate(county)                                                                       ;
Haysupply(county, stateofnature)                                                        =     save_Haysupply(county, stateofnature)                                                           ;
crop_strat(county, crops, landirrtype, stateofnature, allstrat,alli)                    =     save_crop_strat(county, crops, landirrtype, stateofnature, allstrat,alli)                       ;
increasefactor(customer, sector, month, stateofnature)                                  =     save_increasefactor(customer, sector, month, stateofnature)                                     ;
Demanddata(customer,sector,timing,parameterstructure)                                    =     save_Demanddata(customer,sector,timing,parameterstructure)                                       ;
otheraquifer_source(county)                                                             =     save_otheraquifer_source(county)                                                                ;
inflow1(river,riverplace,month,stateofnature)                                           =     save_inflow1(river,riverplace,month,stateofnature)                                              ;
inflow(river,riverplace,month,stateofnature)                                            =     save_inflow(river,riverplace,month,stateofnature)                                              ;
res_evap_rate(reservoir, month, stateofnature)                                          =     save_res_evap_rate(reservoir, month, stateofnature)                                             ;
iniLift(aquifer,layer, county)                                                          =     save_iniLift(aquifer,layer, county)                                                             ;
drawdownlimit(aquifer, layer, county)                                                   =     save_drawdownlimit(aquifer, layer, county)                                                      ;
SAWSEdwardsProp(stateofnature)                                                          =     save_SAWSEdwardsProp(stateofnature)                                                             ;
mutual_excl(mutual, projects)                                                           =     save_mutual_excl(mutual, projects)                                                              ;
linkphases(projects2, projects)                                                         =     save_linkphases(projects2, projects)                                                            ;
linkjointproj(jointpair, projects)                                                      =     save_linkjointproj(jointpair, projects)                                                         ;
exist_projects(projects)                                                                =     save_exist_projects(projects)                                                                   ;
conservation_Reduction(citycounty)                                                      =     save_conservation_Reduction(citycounty)                                                         ;
river_traded(river, riverplace,county,conssector,riverlocation,county1,conssector1)     =     save_river_traded(river, riverplace,county,conssector,riverlocation,county1,conssector1)   ;
aquifer_traded(aquifer,county,gsector, county1, gsector1)                               =     save_aquifer_traded(aquifer,county,gsector, county1, gsector1)                                  ;
power_plant_exist(power_plant_all, power_plant_type, power_plant_cooling)               =     save_power_plant_exist(power_plant_all, power_plant_type, power_plant_cooling)                  ;
totalpop                                                                                =     save_totalpop                                                                                   ;
population(citycounty)                                                                  =     save_population(citycounty)                                                                     ;

elec_climate_adjust(month)                                                              =     save_elec_climate_adjust(month)                                                                        ;
demanddata_pp(parameterstructure)                                                       =     save_demanddata_pp(parameterstructure)                                                          ;
monthshare_pp(month%addhour%)                                                           =     save_monthshare_pp(month%addhour%)                                                              ;
WindSolar_LANDexist(power_plant_all,ws_type,county, zones, landirrtype)                 =     save_WindSolar_LANDexist(power_plant_all,ws_type,county, zones, landirrtype)                    ;
WindSolar_NEWexist(power_plant_all,ws_type)                                             =     save_WindSolar_NEWexist(power_plant_all,ws_type)                                                ;
ClimateS_month(county, stateofnature, timing,  Regitems)                                =     save_ClimateS_month(county, stateofnature, timing,  Regitems)                                   ;

AquiferHistdatanew(Aquifer, layer, county, stateofnature, Regitems)                     =     save_AquiferHistdatanew(Aquifer, layer, county, stateofnature, Regitems)                         ;

MAG(county,aquifer)                                                                    =      save_MAG(county,aquifer)                                                                        ;
exist_supply(aquifer,county)                                                           =      save_exist_supply(aquifer,county)                                                               ;
