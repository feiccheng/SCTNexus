loop(linkaltruns(altrun,scenarios,decades),

         scenariohere(scenarios) = yes;
         decadehere(decades)     = yes;
         altrunhere(altrun)      = yes;
         altrunlast(altrunsall)$link_lastperiod(altrunhere, altrunsall)= yes;

display scenariohere, decadehere, altrunhere, altrunlast;

$$       include %whereisscenario%scenarios_restoredata.gms


AvailLand          (county,zones,landirrtype)                                      =  sreport_post_AvailLand          (county,zones,landirrtype,altrunlast)                                        ;
iniLift            (aquifer,layer, county)                                         =  sreport_post_iniLift            (aquifer,layer, county,altrunlast)                                           ;
linkjointproj      (jointpair, projects)                                           =  sreport_post_linkjointproj      (jointpair, projects,altrunlast)                                             ;
exist_projects     (projects)                                                      =  sreport_post_exist_projects     (projects,altrunlast)                                                        ;
river_traded       (river, riverplace,county,sector,riverlocation,county1,sector1) =  sreport_post_river_traded       (river, riverplace,county,sector,riverlocation,county1,sector1,altrunlast)   ;
aquifer_traded     (aquifer,county,gsector, county1, gsector1)                     =  sreport_post_aquifer_traded     (aquifer,county,gsector, county1, gsector1,altrunlast)                       ;
power_plant_exist  (power_plant_all, power_plant_type, power_plant_cooling)        =  sreport_post_power_plant_exist  (power_plant_all, power_plant_type, power_plant_cooling,altrunlast)          ;
WindSolar_LANDexist(power_plant_all,ws_type,county, zones, landirrtype)            =  sreport_post_WindSolar_LANDexist(power_plant_all,ws_type,county, zones, landirrtype,altrunlast)              ;
WindSolar_NEWexist (power_plant_all,ws_type)                                       =  sreport_post_WindSolar_NEWexist (power_plant_all,ws_type,altrunlast)                                         ;



$$       include %whereisscenario%scenarios_calc_climatechange.gms
$$       include %whereisscenario%scenarios_calc_popgrowth.gms
$$       include %whereisreport%report_presolve_save.gms

*$$       if exist INFEWS_p.gdx execute_loadpoint "INFEWS_p.gdx";

$$       include %whereismodel%model_domain.gms
$$       include %whereismodel%model_bounds.gms
$$       include %whereismodel%model_scale.gms

         solve INFEWS using %solverhere% max V_NETBENEFIT;

$$       include  %whereisreport%report_inloops.gms
$$       include  %whereisreport%report_postsolve.gms

         scenariohere(scenarios)= no;
         decadehere(decades)= no;
         altrunhere(altrunsall)=no;
         altrunlast(altrunsall)=no;

$ontext
display   Demanddata, SAWSEdwardsProp, conservation_Reduction,population, totalpop , demanddata_pp

AvailLand
iniLift
linkjointproj
exist_projects
river_traded
aquifer_traded
power_plant_exist
WindSolar_LANDexist
WindSolar_NEWexist
endliftsteps
TotalCountyPumpCost
$offtext
);
