*report_merge_the_runs_to_get_ready_for_finalcal.gms


alias( *,universalset1,universalset2,universalset3);

$include whereissource
$showvariables
set altrunsall
     /
$include %wheretopassfiles%report_merge_scenarios_contained_in_gdx.gms
/
display altrunsall;

alias(altrunsall,altruns);

$offlisting

$include %whereisreport%report_setup.gms
$include %whereisscenario%scenarios_savedata.gms
$onlisting

set whatisbaseacrossscenarios(altrunsall,altrunsall)
    /
$include %wheretopassfiles%report_merge_gdx_file_base_cases_for_scenarios.gms
    / ;
display whatisbaseacrossscenarios;

alias(altrun2,altrun,altrunsall);
singleton set whatisbasehere(altrunsall) which scenario is the base one;

set files_to_merge names of the files that were merged /
$include %wheretopassfiles%report_merge_gdx_files_root_names_to_merge.gms
/

display files_to_merge;

$include %wheretopassfiles%report_merge_contains_the_gdxmerge_instruction_to_run


set altrunreporton(altrunsall);
scalar sc_temp /0/;


*set linkaltruns2(altrunsall,allperiods,allperiods,cropgcmhall,livegcmhall,watergcmhall,tradegcmhall,pestgcmhall,forestgcmhall,cropmixadaptall,otherclimatecases ) link alternative runs up
alias(aunivers,*);

set linkaltruns(altrunsall,scenarios,decades)  link alternative runs up
/
$include %wheretopassfiles%report_link_altrunhere.gms
/;
*here we list the arrays to being in from the merged gdx file
*two params here first one in name of array
* second is its parameters in terms of active set names - skip things in quotes dont use *


$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_modelstats                        altrunsall,status_item
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_agwel_item                        agwel_item,states,altrunsall
*$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_priceindex                       agitem,states,altrunsall
*$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_priceindex_county                county,agitem,states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_welfare_total                    upsector,wel_output,states,altrunsall
*$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_welfare_county                   citycounty,upsector,wel_output, states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_aquiferpump                       aquifer,layer,citycounty,states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_aquifersectorpump                 aquifer,layer,citycounty,sector,states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_surfacediversion                  river,citycounty,sector,states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_addupwater_source                 citycounty,watersources,sector,states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_waterdemand                       citycounty,sector,month,sditem,states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_unitpumpcost                      citycounty,Aquifer,layer,states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_project_totalcost                 project,states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_project_unitcost                  project,altrunsall

$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_watercost                         citycounty,sector,states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_drawdownvalue                     aquifer,layer,county,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_springvalue                       Springs,states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_landvalue                         county,zones,landirrtype,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_land_bal                          county,zones,landirrtype,landitem,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_agsales_county                    county,agitem,states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_watermarket                       riverandaquifer,county,sector,states,wel_output,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_DYO_agbenefit                     county,states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_demand_pp                         month%addhour%,sditem,states,altrunsall

$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_crop_strat                        altrunsall,county,crops,landirrtype,states,allstrat,alli
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_Demanddata_pp                     altrunsall,parameterstructure
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_post_AvailLand                    county,zones,landirrtype,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_post_iniLift                      aquifer,layer,county,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_post_river_traded                 river,riverplace,county,sector,riverlocation,county1,sector1,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_post_aquifer_traded               aquifer,county,sector,county1,sector1,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_post_WindSolar_LANDexist          power_plant_all,ws_type,county,zones,landirrtype,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_post_WindSolar_NEWexist           power_plant_all,ws_type,altrunsall

$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_post_linkjointproj                jointpair,projects,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_post_exist_projects               projects,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_post_power_plant_exist            power_plant_all,power_plant_type,power_plant_cooling,altrunsall

$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_crop_strat                        altrunsall,county,crops,landirrtype,states,allstrat,alli
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_inflow1                           altrunsall,river,riverlocation,month,states
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_AquiferHistdatanew                altrunsall,Aquifer,layer,county,states,Regitems
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_TotalCountyPumpCost               altrunsall,county,aquifer,layer,states,allstepsw
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_endliftsteps                      altrunsall,county,aquifer,layer,states,allstepsw
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_Demanddata_pp                     altrunsall,parameterstructure
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_Demanddata                        altrunsall,citycounty,sector,timing,parameterstructure

$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_AV_LANDTRANS                      county,landirrtype,zones,landirrtype2,zones2,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_AV_CROPACRES                      county,zones,crops,landirrtype,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_AV_CROPSTRATEGY                   county,zones,crops,landirrtype,states,allstrat,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_AV_LIVEPROD                       county,livestock,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_AV_LIVEGRAZING                    county,livestock,states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_AV_HAYFEED                        county,livestock,primary,states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_AV_HAYPURCHASE                    county,primary,states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_AV_HAYTRANS                       county1,county,primary,states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_AV_AGSALE                         county,primary,states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_AV_CROPMIX                        county,irrigstatus,mixesa,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_AV_VEGMIX                         county,irrigstatus,mixesa,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_AV_LIVEMIX                        county,mixesa,altrunsall

$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_WV_AGZONEWATERUSE                 county,zones,month,RiverAndAquifer,states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_WV_SURFACEDIVERSION               river,riverplace,citycounty,sector,month,states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_WV_PUMP_GROUNDWATER               aquifer,layer,citycounty,sector,month,states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_WV_OTHERWATERSOURCE               citycounty,sector,month,states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_WV_ADDUPUSERALLWATER              customer,sector,month,states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_WV_WATERDEMAND_STEPS              customer,sector,allsteps,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_WV_WATERDEMAND                    customer,sector,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_WV_FLOW                           river,riverplace,downriver,month,states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_WV_RETURNFLOW                     customer,sector,month,states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_WV_OUTTOBAY                       river,riverplace,month,states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_WV_RESERVOIR_WITHDRAW             reservoir,month,states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_WV_RESERVOIR_RELEASE              reservoir,month,states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_WV_SPRNFLOW                       springs,states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_WV_RESERVIOR_INVENTORY            reservoir,month,states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_WV_RESERVIOR_INVENTORY_INI        reservoir,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_WV_PUMP_STEP                      county,Aquifer,layer,states,allstepsw,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_WV_TOTALCOUNTYPUMP                county,Aquifer,layer,month,states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_WV_DRAWDOWN                       aquifer,layer,county,steps_dd,altrunsall

$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_WV_MIX_GRDPUMP                    county,years,states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_WV_MIX_SURGRD                     county,gsector,mixesa,states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_WV_WP_USEGROUND                   Projects,sector,customer,county,aquifer,layer,month,states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_WV_WP_USEASR                      projects,sector,customer,month,states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_WV_WP_USESURFACE                  projects,sector,customer,sourceriver,riverplace,month,states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_WV_WP_USEOCR                      projects,sector,customer,OCR,month,states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_WV_WP_USEOUTSIDE                  projects,sector,customer,month,states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_WV_WP_USESEAWATER                 projects,sector,customer,month,states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_WV_WP_USEREUSE                    projects,sector,customer,sector1,citycounty,month,states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_WV_WP_PROJECTWATER                projects,sector,customer,month,states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_WV_WP_SURFACE_ACQUWR              projects,sourceriver,riverplace,county,sector,month,states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_WV_WP_SURFACE_NEWWR               projects,sourceriver,riverplace,month,states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_WV_WP_ASROCR_INVENTORY_INI        projects,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_WV_WP_ASROCR_INVENTORY            projects,month,states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_WV_WP_ASR_FROMGROUND              projects,sourcecounty,sourceaquifer,layer,month,states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_WV_WP_ASR_FROMSURFACE             projects,sourceriver,riverplace,county,sector,month,states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_WV_WP_ASR_FROMSURFACE_NEWWR       projects,sourceriver,riverplace,month,states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_WV_WP_RECHARGE_AQUIFER            projects,sector,citycounty,aquifer,layer,month,states,altrunsall

$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_WV_WP_ASR_FROMREUSE               projects,sector,citycounty,month,states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_WV_WP_ASR_FROMEXTRA               projects,sector,citycounty,month,states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_WV_WP_OCR_FROMSURFACE             projects,sourceriver,riverplace,county,sector,month,states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_WV_WP_OCR_FROMSURFACE_NEWWR       projects,sourceriver,riverplace,month,states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_WV_WP_REUSE_EFFLUENT              customer,sector,month,states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_WV_WP_Conservation                customer,altrunsall

$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_WV_WM_DYO_ENROLL                  county,permittype,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_WV_WM_DYO_SUSPEND                 county,states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_WV_WM_LEASE_RIVER                 river,riverplace,county,sector,riverlocation,county1,sector1,states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_WV_WM_TRADE_RIVER                 river,riverplace,county,sector,riverlocation,county1,sector1,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_WV_WM_LEASE_AQUIFER               aquifer,county,sector,county1,sector1,states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_WV_WM_TRADE_AQUIFER               aquifer,county,sector,county1,sector1,altrunsall

$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_EV_PP_GENERATION                  power_plant_all,power_plant_type,power_plant_cooling,month%addhour%,states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_EV_DEMAND_PERCAP                  month%addhour%,states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_EV_PP_FUEL                        fuel,month,states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_EV_PP_WATER_POND                  power_plant_all,power_plant_type,power_plant_cooling,month,states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_EV_PP_WATER_POND_Ini              power_plant_all,power_plant_type,power_plant_cooling,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_EV_PP_WATER_DIVERSION             power_plant_all,power_plant_type,power_plant_cooling,month,states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_EV_WS_OPERATION                   power_plant_all,ws_type,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_EV_WS_NEWBUILD                    power_plant_all,ws_type,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_EV_WS_LAND                        power_plant_all,ws_type,county,zones,landirrtype,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_EV_DEMAND_STEPS                   allsteps,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_EV_DEMAND_TRANS                   county,county1,month%addhour%,states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_EV_DEMAND_WP                      county,month,states,altrunsall

$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_ART_WE_ADDALLWATERSUPPLY          customer,sector,month,states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_ART_WE_DEMANDQUANTITY             customer,sector,month,states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_ART_WE_FLOWBALANCE_DEMAND         river,riverplace,month,states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_ART_WE_FLOWBALANCE_SUPPLY         river,riverplace,month,states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_ART_WE_OUTOBAYBAL                 river,states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_ART_WE_DRAWDOWN_BAL               aquifer,layer,county,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_ART_EE_PP_CAPACITYBAL             POWER_PLANT_ALL,POWER_PLANT_TYPE,POWER_PLANT_COOLING,MONTH%ADDHOUR%,STATES,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_ART_EE_PP_NEWNGCC_LIMIT           county,power_plant_cooling,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_ART_EE_PP_PEAKCAPCITY_REQ         states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_ART_EE_PP_CAPACITYLIMIT           uplow,altrunsall
*$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_ART_EE_PP_WATER_SURFACE_DIVBAL2   river,riverplace,county,sector,month,states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_ART_EE_WS_CAPACITY_LIMIT          altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_ART_EE_DEMAND_COUNTYBAL           county,month%addhour%,states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_ART_EE_DEMAND_TRANSBAL            county,month%addhour%,states,altrunsall

$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_WV_WP_DO_I_OPRT_WATER             Projects,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_WV_WP_DO_I_BUILD_WATER            Projects,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_WV_WP_DO_I_JOINTBULTDWP           jointpair,altrunsall

$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_EV_PP_DO_I_BUILD_NEW_NGPP         POWER_PLANT_ALL,POWER_PLANT_TYPE,POWER_PLANT_COOLING,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_EV_PP_DO_I_RETROFIT_COOLING       POWER_PLANT_ALL,POWER_PLANT_TYPE,POWER_PLANT_COOLING,POWER_PLANT_COOLING0,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_EV_PP_DO_I_RETROFIT_BOILER        POWER_PLANT_ALL,POWER_PLANT_TYPE,POWER_PLANT_TYPE0,POWER_PLANT_COOLING,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_EV_PP_DO_I_OPER_POWERPLANT        power_plant_all,power_plant_type,power_plant_cooling,altrunsall

$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_AE_AGLANDBAL                      county,zones,landirrtype,altrunsall
*$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_WE_DIVERSIONQMAX                  county,sector,river,riverplace,states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_WE_COUNTYPUMPBAL                  county,Aquifer,layer,month,states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_WE_EDWARDS_PUMPLIMIT              county,gsector,states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_EE_DEMAND_QUANTITYBAL             month%addhour%,states,altrunsall
$batinclude %whereisreport%report_merge_bring_data_from_a_gdx          sreport_V_NETBENEFIT                      altrunsall
$onlisting
