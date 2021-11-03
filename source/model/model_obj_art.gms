
  - 9999999999*(
     sum(domain_for_ART_AE_AGLANDBal(county, zones, landirrtype),
                    ART_AE_AGLANDBal(county, zones, landirrtype))

   + sum(domain_for_ART_WE_ADDALLWATERSUPPLY(customer,sector,month,stateofnature),
                    ART_WE_ADDALLWATERSUPPLY(customer,sector,month,stateofnature))
   + sum(domain_for_ART_WE_DEMANDQUANTITY(customer,sector,month,stateofnature),
                    ART_WE_DEMANDQUANTITY(customer,sector,month,stateofnature))
   + sum(domain_for_ART_WE_FLOWBALANCE_DEMAND(river,riverplace,month,stateofnature),
                    ART_WE_FLOWBALANCE_DEMAND(river,riverplace,month,stateofnature))
   + sum(domain_for_ART_WE_FLOWBALANCE_SUPPLY(river,riverplace,month,stateofnature),
                    ART_WE_FLOWBALANCE_SUPPLY(river,riverplace,month,stateofnature))
   + sum(domain_for_ART_WE_OUTOBAYBAL(river, stateofnature),
                    ART_WE_OUTOBAYBAL(river, stateofnature))
   + sum(domain_for_ART_WE_DRAWDOWN_BAL(aquifer, layer, county),
                    ART_WE_DRAWDOWN_BAL(aquifer, layer, county))

   + sum(domain_for_ART_EE_PP_CAPACITYBAL(POWER_PLANT_ALL,POWER_PLANT_TYPE, POWER_PLANT_COOLING, MONTH%ADDHOUR%, STATEOFNATURE),
                    ART_EE_PP_CAPACITYBAL(POWER_PLANT_ALL,POWER_PLANT_TYPE, POWER_PLANT_COOLING, MONTH%ADDHOUR%, STATEOFNATURE))
   + sum(domain_for_ART_EE_PP_NEWNGCC_LIMIT(county,power_plant_cooling),
                    ART_EE_PP_NEWNGCC_LIMIT(county,power_plant_cooling))
   + sum(domain_for_ART_EE_PP_PEAKCAPCITY_REQ(STATEOFNATURE),
                    ART_EE_PP_PEAKCAPCITY_REQ(STATEOFNATURE))
   + sum(domain_for_ART_EE_PP_WATER_SURFACE_DIVBAL2(river,riverplace,county,sector,month,STATEOFNATURE),
                    ART_EE_PP_WATER_SURFACE_DIVBAL2(river,riverplace,county,sector,month,STATEOFNATURE))
   + sum(domain_for_ART_EE_DEMAND_COUNTYBAL(county, month%addhour%,STATEOFNATURE),
                    ART_EE_DEMAND_COUNTYBAL(county, month%addhour%,STATEOFNATURE))
   + sum(domain_for_ART_EE_DEMAND_TRANSBAL(county,month%addhour%,STATEOFNATURE),
                    ART_EE_DEMAND_TRANSBAL(county,month%addhour%,STATEOFNATURE))
   + sum(uplow, ART_EE_PP_CAPACITYLIMIT(uplow))$(do_i_want_pp and useart)
   + ART_EE_WS_CAPACITY_LIMIT$(do_i_want_pp and useart)
     )
