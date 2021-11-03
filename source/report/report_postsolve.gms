post_AvailLand          (county,zones,landirrtype)                                    =0;
post_iniLift            (aquifer,layer, county)                                       =0;
post_river_traded       (river, riverplace,county,sector,riverlocation,county1,sector1) =0;
post_aquifer_traded     (aquifer,county,sector, county1, sector1)                       =0;
post_WindSolar_LANDexist(power_plant_all,ws_type,county, zones, landirrtype)          =0;
post_WindSolar_NEWexist (power_plant_all,ws_type)                                     =0;

         post_linkjointproj      (jointpair, projects)                                    =no;
         post_exist_projects     (projects)                                               =no;
         post_power_plant_exist  (power_plant_all, power_plant_type, power_plant_cooling) =no;


$ondotl
post_AvailLand(county,zones,landirrtype)
         = AvailLand          (county,zones,landirrtype)
         - sum(domain_for_EV_WS_LAND(power_plant_all,ws_type,county, zones, landirrtype),
                          EV_WS_LAND(power_plant_all,ws_type,county, zones, landirrtype))
         - sum(domain_for_AV_LANDTRANS(county, landirrtype,zones, landirrtype2,zones2) ,
                          AV_LANDTRANS(county, landirrtype,zones, landirrtype2,zones2))
         + sum(domain_for_AV_LANDTRANS(county, landirrtype2, zones2, landirrtype, zones) ,
                          AV_LANDTRANS(county, landirrtype2, zones2, landirrtype, zones))   ;

post_iniLift(aquifer,layer, county)
         $aquiferLayerCountyReg(Aquifer,layer,County)
         =max(0, [sum(domain_for_WV_PUMP_STEP(county,Aquifer,layer,stateofnature,stepw),
                          WV_PUMP_STEP(county,Aquifer,layer,stateofnature,stepw)
                         *endliftsteps(county,aquifer, layer, stateofnature, stepw)
                         *probability(stateofnature))
                - iniLift(aquifer,layer, county)])
          *(1$(postdecades(decadehere)=0)+postdecades(decadehere))
          + inilift(aquifer,layer,county)
  ;
* water projects
post_exist_projects(projects)
         $(exist_projects(projects) or WV_WP_DO_I_BUILD_WATER(Projects)) = yes;

post_linkjointproj      (jointpair, projects)
         $linkjointproj(jointpair, projects)= yes;
post_linkjointproj      (jointpair, projects)
         $WV_WP_DO_I_JOINTBULTDWP(jointpair)= no;

* water markets
post_river_traded       (river, riverplace,county,sector,riverlocation,county1,sector1)
         =                    river_traded(river,riverplace   ,county ,sector ,riverlocation,county1,sector1)
         +sum(domain_for_WV_WM_TRADE_RIVER(river,riverplace   ,county ,sector ,riverlocation,county1,sector1),
                         WV_WM_TRADE_RIVER(river,riverplace   ,county ,sector ,riverlocation,county1,sector1))    ;

post_aquifer_traded     (aquifer,county,gsector, county1, gsector1)
         =                    aquifer_traded     (aquifer,county ,gsector ,county1,gsector1)
             + sum(domain_for_WV_WM_TRADE_AQUIFER(aquifer,county ,gsector ,county1,gsector1),
                              WV_WM_TRADE_AQUIFER(aquifer,county ,gsector ,county1,gsector1))  ;

* energy

post_power_plant_exist(power_plant_all, power_plant_type, power_plant_cooling)
         $power_plant_exist(power_plant_all, power_plant_type, power_plant_cooling)= yes;

post_power_plant_exist(power_plant_all, power_plant_type, power_plant_cooling)
         $EV_PP_DO_I_BUILD_NEW_NGPP(POWER_PLANT_ALL, POWER_PLANT_TYPE, POWER_PLANT_COOLING)= yes;

post_power_plant_exist(power_plant_all, power_plant_type, power_plant_cooling)
         $sum(domain_for_EV_PP_DO_I_RETROFIT_COOLING(POWER_PLANT_ALL, POWER_PLANT_TYPE, POWER_PLANT_COOLING0, POWER_PLANT_COOLING),
                         EV_PP_DO_I_RETROFIT_COOLING(power_plant_all, power_plant_type, power_plant_cooling0, power_plant_cooling)) = yes;

post_power_plant_exist(power_plant_all, power_plant_type, power_plant_cooling)
         $sum(domain_for_EV_PP_DO_I_RETROFIT_COOLING(POWER_PLANT_ALL, POWER_PLANT_TYPE, POWER_PLANT_COOLING, POWER_PLANT_COOLING_Retrofit),
                         EV_PP_DO_I_RETROFIT_COOLING(power_plant_all, power_plant_type, power_plant_cooling, power_plant_cooling_retrofit)) =no;

post_power_plant_exist(power_plant_all, power_plant_type, power_plant_cooling)
         $sum(domain_for_EV_PP_DO_I_RETROFIT_BOILER(POWER_PLANT_ALL, POWER_PLANT_TYPE0, POWER_PLANT_TYPE, POWER_PLANT_COOLING),
                         EV_PP_DO_I_RETROFIT_BOILER(power_plant_all, power_plant_type0, power_plant_type, power_plant_cooling))=yes;

post_power_plant_exist(power_plant_all, power_plant_type, power_plant_cooling)
         $sum(domain_for_EV_PP_DO_I_RETROFIT_BOILER(POWER_PLANT_ALL, POWER_PLANT_TYPE, POWER_PLANT_TYPE_retrofit, POWER_PLANT_COOLING),
                         EV_PP_DO_I_RETROFIT_BOILER(power_plant_all, power_plant_type, power_plant_type_retrofit, power_plant_cooling)) =no;

post_WindSolar_LANDexist(power_plant_all,ws_type,county, zones, landirrtype)
         =       WindSolar_LANDexist(power_plant_all,ws_type,county,zones,landirrtype)
         + sum(domain_for_EV_WS_LAND(power_plant_all,ws_type,county,zones,landirrtype),
                          EV_WS_LAND(power_plant_all,ws_type,county,zones,landirrtype));

post_WindSolar_NEWexist(power_plant_all,ws_type)
         =sum(domain_for_EV_WS_NEWBUILD(power_plant_all,ws_type),
                         EV_WS_NEWBUILD(power_plant_all,ws_type))
          +          WindSolar_NEWexist(power_plant_all,ws_type)       ;


 sreport_post_AvailLand          (county,zones,landirrtype,altrunhere)                                                 = post_AvailLand          (county,zones,landirrtype)                                              ;
 sreport_post_iniLift            (aquifer,layer, county,altrunhere)                                                    = post_iniLift            (aquifer,layer, county)                                                 ;
 sreport_post_linkjointproj      (jointpair, projects,altrunhere)                                                      = post_linkjointproj      (jointpair, projects)                                                   ;
 sreport_post_exist_projects     (projects,altrunhere)                                                                 = post_exist_projects     (projects)                                                              ;
 sreport_post_river_traded       (river, riverplace,county,sector,riverlocation,county1,sector1,altrunhere)            = post_river_traded       (river, riverplace,county,sector,riverlocation,county1,sector1) ;
 sreport_post_aquifer_traded     (aquifer,county,gsector, county1, gsector1,altrunhere)                                = post_aquifer_traded     (aquifer,county,gsector, county1, gsector1)                             ;
 sreport_post_power_plant_exist  (power_plant_all, power_plant_type, power_plant_cooling,altrunhere)                   = post_power_plant_exist  (power_plant_all, power_plant_type, power_plant_cooling)                ;
 sreport_post_WindSolar_LANDexist(power_plant_all,ws_type,county, zones, landirrtype,altrunhere)                       = post_WindSolar_LANDexist(power_plant_all,ws_type,county, zones, landirrtype)                    ;
 sreport_post_WindSolar_NEWexist (power_plant_all,ws_type,altrunhere)                                                  = post_WindSolar_NEWexist (power_plant_all,ws_type)                                               ;

$offdotl
