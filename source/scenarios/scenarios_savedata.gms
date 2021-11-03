$ifthen not declared save_AvailLand
parameter
save_AvailLand(county,zones,landirrtype)
save_Stockingrate(county)
save_Haysupply(county, states)
save_crop_strat(county, crops, landirrtype, states, allstrat,alli)
save_increasefactor(customer, sector, month, states)
save_Demanddata(customer,sector,timing,parameterstructure)
save_otheraquifer_source(county)
save_inflow1(river,riverplace,month,states)
save_inflow(river,riverplace,month,states)
save_res_evap_rate(reservoir, month, states)
save_iniLift(aquifer,layer, county)
save_drawdownlimit(aquifer, layer, county)
save_SAWSEdwardsProp(states)
save_mutual_excl(mutual, projects)
save_linkphases(projects2, projects)
save_linkjointproj(jointpair, projects)
save_exist_projects(projects)
save_conservation_Reduction(citycounty)
save_river_traded(river, riverplace,county,conssector,riverlocation,county,conssector1)
save_aquifer_traded(aquifer,county,gsector, county1, gsector1)
save_power_plant_exist(power_plant_all, power_plant_type, power_plant_cooling)
save_totalpop
save_population(citycounty)
save_elec_climate_adjust(month)
save_demanddata_pp(parameterstructure)
save_monthshare_pp(month%addhour%)
save_WindSolar_LANDexist(power_plant_all,ws_type,county, zones, landirrtype)
save_WindSolar_NEWexist(power_plant_all,ws_type)
save_ClimateS_month(county, states, timing,  Regitems)
save_AquiferHistdatanew(Aquifer, layer, county, states, Regitems)
save_MAG(county,aquifer)
save_exist_supply(aquifer,county)

;
$endif

save_AvailLand(county,zones,landirrtype)                                                        = AvailLand(county,zones,landirrtype)                                                       ;
save_Stockingrate(county)                                                                       = Stockingrate(county)                                                                      ;
save_Haysupply(county, stateofnature)                                                           = Haysupply(county, stateofnature)                                                          ;
save_crop_strat(county, crops, landirrtype, stateofnature, allstrat,alli)                       = crop_strat(county, crops, landirrtype, stateofnature, allstrat,alli)                      ;
save_increasefactor(customer, sector, month, stateofnature)                                     = increasefactor(customer, sector, month, stateofnature)                                    ;
save_Demanddata(customer,sector,timing,parameterstructure)                                       = Demanddata(customer,sector,timing,parameterstructure)                                      ;
save_otheraquifer_source(county)                                                                = otheraquifer_source(county)                                                               ;
save_inflow1(river,riverplace,month,stateofnature)                                              = inflow1(river,riverplace,month,stateofnature)                                             ;
save_inflow(river,riverplace,month,stateofnature)                                               = inflow(river,riverplace,month,stateofnature)                                             ;
save_res_evap_rate(reservoir, month, stateofnature)                                             = res_evap_rate(reservoir, month, stateofnature)                                            ;
save_iniLift(aquifer,layer, county)                                                             = iniLift(aquifer,layer, county)                                                            ;
save_drawdownlimit(aquifer, layer, county)                                                      = drawdownlimit(aquifer, layer, county)                                                     ;
save_SAWSEdwardsProp(stateofnature)                                                             = SAWSEdwardsProp(stateofnature)                                                            ;
save_mutual_excl(mutual, projects)                                                              = mutual_excl(mutual, projects)                                                             ;
save_linkphases(projects2, projects)                                                            = linkphases(projects2, projects)                                                           ;
save_linkjointproj(jointpair, projects)                                                         = linkjointproj(jointpair, projects)                                                        ;
save_exist_projects(projects)                                                                   = exist_projects(projects)                                                                  ;
save_conservation_Reduction(citycounty)                                                         = conservation_Reduction(citycounty)                                                        ;
save_river_traded(river, riverplace,county,conssector,riverlocation,county1,conssector1)        = river_traded(river, riverplace,county,conssector,riverlocation,county1,conssector1)       ;
save_aquifer_traded(aquifer,county,gsector, county1, gsector1)                                  = aquifer_traded(aquifer,county,gsector, county1, gsector1)                                 ;
save_power_plant_exist(power_plant_all, power_plant_type, power_plant_cooling)                  = power_plant_exist(power_plant_all, power_plant_type, power_plant_cooling)                 ;
save_totalpop                                                                                   = totalpop                                                                                  ;
save_population(citycounty)                                                                     = population(citycounty)                                                                    ;
save_elec_climate_adjust(month)                                                                 = elec_climate_adjust(month)                                                                ;
save_demanddata_pp(parameterstructure)                                                          = demanddata_pp(parameterstructure)                                                         ;
save_monthshare_pp(month%addhour%)                                                              = monthshare_pp(month%addhour%)                                                             ;
save_WindSolar_LANDexist(power_plant_all,ws_type,county, zones, landirrtype)                    = WindSolar_LANDexist(power_plant_all,ws_type,county, zones, landirrtype)                   ;
save_WindSolar_NEWexist(power_plant_all,ws_type)                                                = WindSolar_NEWexist(power_plant_all,ws_type)                                               ;
save_ClimateS_month(county, stateofnature,timing,Regitems)                                      = ClimateS_month(county, stateofnature, timing,  Regitems)                                   ;

save_AquiferHistdatanew(Aquifer, layer, county, stateofnature, Regitems)                        = AquiferHistdatanew(Aquifer, layer, county, stateofnature, Regitems)                         ;

save_MAG(county,aquifer)                                                                        = MAG(county,aquifer)                                                                         ;
save_exist_supply(aquifer,county)                                                               = exist_supply(aquifer,county)                                                                ;

