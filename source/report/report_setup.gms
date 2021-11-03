set wel_output/revenue, ConsumerSurplus,ProducerSurplus, AuthSurplus,demandpq, supplypq, watercost,watermarket, NetBenefit, Prob, cost, trade_out, trade_in, lease_in, lease_out,
               demand, Boiler_Retrofit, Cooling_Retrofit, newPP, exist,all_OM, fuel, cooling, OT_penalty, all,Conservation /
    upsector/set.sector, ag_crop, ag_livestock, panelty, project, pp, environment/
    watersources/set.RiverAndAquifer, extra, usage/
    landitem /crop, livestock, windsolar, abandon/
    agitem   /fieldcrop, vege, livestock, overall/
    agwel_item /CropRev, LiveRev, HayTrans, HayPurchase, CropCost, LiveCost, LandTrans/
    status_item    / modelstats, numinfes/
    sditem /price, quantity, quantity_climate/
   ;

set livestock_primary (primary)  livestock primary
/                          AngoraKid
                           CullDoe-Angora
                           AdultMohair
                           YearlingMohair
                           KidMohair
                           Steer
                           Heifer
                           CullCow
                           CullBull
                           MeatGoatKid
                           CullDoe-Meat
                           Lambs
                           CullEwes
                           Wool
                           Stocker     /
    field_primary (primary) field crop primary
 /                         barley
                           hay
                           corn
                           sorghum
                           wheat
                           sorghumhay
                           soybeans
                           oats
                           CottonLint
                           Cottonseed
                           rice
/
    vege_primary(primary) the vegetable primary
/                          cabbage
                           canola
                           cucumber
                           spinach
                           onion
                           peanut
                           sesame
                           cantaloupe
                           honeydew
                           waterMelon
/;

parameter postdecades(decades)
/
2020   10
2030   20
2050   20
2070   20
2090   20/;



* arrays used to check the welfare
scalar welfare1;
parameter
rcomp_welfare(*,*)
rcomp_pump(county,aquifer,layer,*)
rcomp_projects(*,*);


alias(zones, zone)  ;
scalar diff;
parameter
* welfare
          report_welfare_total           (upsector,wel_output,states)                                                 total welfare by sector
          report_welfare_county          (citycounty,upsector,wel_output, states)                                       welfare report by sector and county
          report_agwel_item               (agwel_item,states)                                                         detailed agricultural sector welfare
* water usage part
          report_aquiferpump             (aquifer,layer,citycounty,states)                               total pumping of one county from one layer
          report_aquifersectorpump       (aquifer,layer,citycounty,sector,states)                        total pumping of one county by sector and layer
          report_surfacediversion        (river,citycounty,sector,states)                                total diversion of surfacewater by county and river
          report_addupwater_source       (citycounty,watersources,sector,states)                         total water usage by sector and citycounty
          report_waterdemand             (citycounty,sector,month,sditem,states)                         monthly demand of all sector
          report_unitpumpcost            (citycounty,Aquifer,layer,states)                               the total pumping cost by county and aquifer
          report_project_totalcost       (project,states)                                                water projects total cost
          report_project_unitcost        (project)                                                       water projects unit cost
          report_project_unassigned      (projects)                                                      water projects (not operating) cost
          report_watercost               (citycounty,sector,states)                                      water cost of all counties
          report_wateruseratio           (customer,sector,month,states)                                  water usage over the total diversion from all sources
          report_drawdownvalue           (aquifer,layer,county)                                          water value by drawdown
          report_springvalue             (Springs,states)                                                water value by springs

* agriculture part
          report_landvalue               (county,zones,landirrtype)                                      land value
          report_land_bal                (county,zones,landirrtype,landitem)                             total land use by county zone
          report_agsales_county          (county,agitem,states)                                          agricultural production index
* water market part
          report_watermarket             (riverandaquifer,county,sector,states,wel_output )              the water market cost benefit analysis
          report_DYO_agbenefit           (county,states)                                                 dry year option ag benefit
*electricity
          report_demand_pp               (month%addhour%,sditem,states)                                  price and quantity of elec demand
*model status
          sreport_modelstats             (altrunsall,status_item)                                        record model status




          sreport_priceindex              (agitem,states,altrunsall)                                                 ag production index
          sreport_priceindex_county       (county,agitem,states,altrunsall)                                          the ag production index by county
          sreport_welfare_total           (upsector,wel_output,states,altrunsall)                                    total welfare by sector
          sreport_welfare_county          (citycounty,upsector,wel_output, states,altrunsall)                        welfare report by sector and county
          sreport_agwel_item              (agwel_item,states,altrunsall)                                             agricultural welfare items
          sreport_aquiferpump             (aquifer,layer,citycounty,states,altrunsall)                               total pumping of one county from one layer
          sreport_aquifersectorpump       (aquifer,layer,citycounty,sector,states,altrunsall)                        total pumping of one county by sector and layer
          sreport_surfacediversion        (river,citycounty,sector,states,altrunsall)                                total diversion of surfacewater by county and river
          sreport_addupwater_source       (citycounty,watersources,sector,states,altrunsall)                         total water usage by sector and citycounty
          sreport_waterdemand             (citycounty,sector,month,sditem,states,altrunsall)                         monthly demand of all sector
          sreport_unitpumpcost            (citycounty,Aquifer,layer,states,altrunsall)                               the total pumping cost by county and aquifer
          sreport_project_totalcost       (project,states,altrunsall)                                                water projects total cost
          sreport_project_unitcost        (project,altrunsall)                                                       water projects unit cost


          sreport_watercost               (citycounty,sector,states,altrunsall)                                      water cost of all counties
          sreport_drawdownvalue           (aquifer,layer,county,altrunsall)                                          water value by drawdown
          sreport_springvalue             (Springs,states,altrunsall)                                                water value by springs
          sreport_landvalue               (county,zones,landirrtype,altrunsall)                                      land value
          sreport_land_bal                (county,zones,landirrtype,landitem,altrunsall)                             total land use by county zone
          sreport_agsales_county          (county,agitem,states,altrunsall)                                          agricultural production index
          sreport_watermarket             (riverandaquifer,county,sector,states,wel_output,altrunsall)               the water market cost benefit analysis
          sreport_DYO_agbenefit           (county,states,altrunsall)                                                 dry year option ag benefit
          sreport_demand_pp               (month%addhour%,sditem,states,altrunsall)                                  price and quantity of elec demand

          sreport_crop_strat              (altrunsall,county,crops, landirrtype, states, allstrat, alli)             save the crop yield and water usage
          sreport_Demanddata_pp           (altrunsall,parameterstructure)                                            save the demanddata_pp





;

* the post solve parameters
parameter

         post_AvailLand          (county,zones,landirrtype)
         post_iniLift            (aquifer,layer, county)
         post_river_traded       (river, riverplace,county,sector,riverlocation,county,sector)
         post_aquifer_traded     (aquifer,county,sector, county, sector)
         post_WindSolar_LANDexist(power_plant_all,ws_type,county, zones, landirrtype)
         post_WindSolar_NEWexist (power_plant_all,ws_type)

         sreport_post_AvailLand          (county,zones,landirrtype,altrunsall)
         sreport_post_iniLift            (aquifer,layer, county,altrunsall)
         sreport_post_river_traded       (river, riverplace,county,sector,riverlocation,county,sector,altrunsall)
         sreport_post_aquifer_traded     (aquifer,county,sector, county, sector,altrunsall)
         sreport_post_WindSolar_LANDexist(power_plant_all,ws_type,county, zones, landirrtype,altrunsall)
         sreport_post_WindSolar_NEWexist (power_plant_all,ws_type,altrunsall)
;
set
         post_linkjointproj      (jointpair, projects)
         post_exist_projects     (projects)
         post_power_plant_exist  (power_plant_all, power_plant_type, power_plant_cooling)

         sreport_post_linkjointproj      (jointpair, projects,altrunsall)
         sreport_post_exist_projects     (projects,altrunsall)
         sreport_post_power_plant_exist  (power_plant_all, power_plant_type, power_plant_cooling,altrunsall)
;

parameter
         sreport_crop_strat         (altrunsall,county,crops, landirrtype, states, allstrat, alli)
         sreport_inflow1            (altrunsall,river,riverlocation,month,states)
         sreport_AquiferHistdatanew (altrunsall,Aquifer, layer,county, states, Regitems)
         sreport_TotalCountyPumpCost(altrunsall,county,aquifer,layer,states, allstepsw)
         sreport_endliftsteps       (altrunsall,county,aquifer, layer, states, allstepsw)
         sreport_Demanddata_pp      (altrunsall,parameterstructure)
         sreport_Demanddata         (altrunsall,citycounty,sector,timing,parameterstructure)
;

parameter

* agricultural variables
  sreport_V_NETBENEFIT(altrunsall)                                                                                                  obj value
  sreport_AV_LANDTRANS(county, landirrtype,zones, landirrtype2,zones2,altrunsall)                                                   LANDTRANSfer variable
  sreport_AV_CROPACRES(county,zones,crops,landirrtype,altrunsall)                                                                   Harvested acres by crop
  sreport_AV_CROPSTRATEGY(county,zones, crops, landirrtype, states, allstrat,altrunsall)                                            Water strategy decision
  sreport_AV_LIVEPROD(county, livestock,altrunsall)                                                                                 Livestock production (Unit is budget or AU)
  sreport_AV_LIVEGRAZING(county,livestock,states,altrunsall)                                                                        livestock grazing by state of natures
  sreport_AV_HAYFEED(county,livestock,primary,states,altrunsall)                                                                    extra hay needed to feed animals
  sreport_AV_HAYPURCHASE(county,primary,states,altrunsall)                                                                          the hay purchased for livestock by county
  sreport_AV_HAYTRANS(county1,county,primary,states,altrunsall)                                                                     the transaction of hay across counties

  sreport_AV_AGSALE(county, primary, states,altrunsall)                                                                             Amount of agricultural production sales at market
  sreport_AV_CROPMIX(county,irrigstatus,mixesa,altrunsall)                                                                          Crop mix use
  sreport_AV_VEGMIX(county,irrigstatus,mixesa,altrunsall)                                                                           vegetable mix use
  sreport_AV_LIVEMIX(county,mixesa,altrunsall)                                                                                      livestock mix use

* water variables
  sreport_WV_AGZONEWATERUSE(county,zones,month,RiverAndAquifer,states,altrunsall)                                                   agricultural water usage by zone
  sreport_WV_SURFACEDIVERSION(river,riverplace,citycounty,sector,month,states,altrunsall)                                           surface water division
  sreport_WV_PUMP_GROUNDWATER(aquifer,layer,citycounty,sector,month,states,altrunsall)                                              ground water pumping amount
  sreport_WV_OTHERWATERSOURCE(citycounty,sector,month,states,altrunsall)                                                            water from other aquifers or other sources
  sreport_WV_ADDUPUSERALLWATER(customer,sector,month,states,altrunsall)                                                             add up the water for mun ind and min sectors
  sreport_WV_WATERDEMAND_STEPS(customer,sector,allsteps,altrunsall)                                                                 water demand steps
  sreport_WV_WATERDEMAND(customer,sector,altrunsall)                                                                                water demands without steps

*surface water variables
  sreport_WV_FLOW(river,riverplace,downriver,month,states,altrunsall)                                                               surface water flows
  sreport_WV_RETURNFLOW(customer,sector,month,states,altrunsall)                                                                    the water that were not used in reuse
  sreport_WV_OUTTOBAY(river,riverplace,month,states,altrunsall)                                                                     out to bay flows
  sreport_WV_RESERVOIR_WITHDRAW(reservoir,month,states,altrunsall)                                                                  reservoir water withdraw
  sreport_WV_RESERVOIR_RELEASE(reservoir,month,states,altrunsall)                                                                   reservoir water release
  sreport_WV_SPRNFLOW(springs,states,altrunsall)                                                                                    spring flows
  sreport_WV_RESERVIOR_INVENTORY(reservoir, month, states,altrunsall)                                                               reservoir inventory
  sreport_WV_RESERVIOR_INVENTORY_INI(reservoir,altrunsall)                                                                          reservoir initial inventory

*ground water variables
  sreport_WV_PUMP_STEP(county,Aquifer,layer,states,allstepsw,altrunsall)                                                            ground water pumping steps to count the lift and drawdown
  sreport_WV_TOTALCOUNTYPUMP(county, Aquifer, layer, month, states,altrunsall)                                                      total ground water pumping by county
  sreport_WV_DRAWDOWN(aquifer, layer, county,steps_dd,altrunsall)                                                            aquifer draw down
* water mix
  sreport_WV_MIX_GRDPUMP(county,years,states,altrunsall)                                                                            ground water mix
  sreport_WV_MIX_SURGRD(county,gsector,mixesa,states,altrunsall)                                                                    surface-ground water mix

* water projects
  sreport_WV_WP_USEGROUND(Projects,sector,customer,county,aquifer,layer,month,states,altrunsall)                                    water supply from ground water projects
  sreport_WV_WP_USEASR(projects,sector,customer,month,states,altrunsall)                                                            water supply from ASR projects
  sreport_WV_WP_USESURFACE(projects,sector,customer,sourceriver,riverplace,month,states,altrunsall)                                 water supply from surface water projects
  sreport_WV_WP_USEOCR(projects,sector,customer,OCR,month,states,altrunsall)                                                        water supply from OCR projects
  sreport_WV_WP_USEOUTSIDE(projects,sector,customer,month,states,altrunsall)                                                        water supply from outside of the region
  sreport_WV_WP_USESEAWATER(projects,sector,customer,month,states,altrunsall)                                                       water supply from sea water desalination
  sreport_WV_WP_USEREUSE(projects,sector,customer,sector1,citycounty,month,states,altrunsall)                                       water supply from reuse wwtp
  sreport_WV_WP_PROJECTWATER(projects,sector,customer,month,states,altrunsall)                                                      water supply from all projects by month and customer
  sreport_WV_WP_SURFACE_ACQUWR(projects,sourceriver,riverplace,county,sector,month,states,altrunsall)                               surface project diverted water from existing water rights
  sreport_WV_WP_SURFACE_NEWWR(projects,sourceriver,riverplace,month,states,altrunsall)                                              surface project diverted water from new water rights
  sreport_WV_WP_ASROCR_INVENTORY_INI(projects,altrunsall)                                                                           asr and ocr water inventory initial balance
  sreport_WV_WP_ASROCR_INVENTORY(projects, month, states,altrunsall)                                                                asr and ocr water inventory balance
  sreport_WV_WP_ASR_FROMGROUND(projects,sourcecounty,sourceaquifer,layer,month,states,altrunsall)                                   ASR water sources from ground water
  sreport_WV_WP_ASR_FROMSURFACE(projects,sourceriver,riverplace,county,sector,month,states,altrunsall)                              ASR water sources from surface water
  sreport_WV_WP_ASR_FROMSURFACE_NEWWR(projects,sourceriver,riverplace,month,states,altrunsall)                                      ASR water sources from surface water using new water rights
  sreport_WV_WP_RECHARGE_AQUIFER(projects,sector,citycounty,aquifer,layer, month,states,altrunsall)

  sreport_WV_WP_ASR_FROMREUSE(projects,sector,citycounty,month,states,altrunsall)                                                   ASR water sources from reuse water
  sreport_WV_WP_ASR_FROMEXTRA(projects,sector,citycounty,month,states,altrunsall)                                                   ASR water sources from extra water supply when there is supplus
  sreport_WV_WP_OCR_FROMSURFACE(projects,sourceriver,riverplace,county,sector,month,states,altrunsall)                              OCR water sources from surface water
  sreport_WV_WP_OCR_FROMSURFACE_NEWWR(projects,sourceriver,riverplace,month,states,altrunsall)                                      OCR water sources from surface water using new water rights
  sreport_WV_WP_REUSE_EFFLUENT(customer,sector,month,states,altrunsall)                                                             the effluent taken for reuse
  sreport_WV_WP_Conservation(customer,altrunsall)                                                                                   water conservation for municipal sector

* water markets
  sreport_WV_WM_DYO_ENROLL(county, permittype,altrunsall)                                                                           water market dry year option enrollment
  sreport_WV_WM_DYO_SUSPEND(county,states,altrunsall)                                                                               water market dry year option suspend amount
  sreport_WV_WM_LEASE_RIVER(river,riverplace,county,sector,riverlocation,county,sector,states,altrunsall)                           water market river water permits lease
  sreport_WV_WM_TRADE_RIVER(river,riverplace,county,sector,riverlocation,county,sector,altrunsall)                                  water market river water permits trade
  sreport_WV_WM_LEASE_AQUIFER(aquifer,county,sector,county, sector,states,altrunsall)                                               water market aquifer water permits lease
  sreport_WV_WM_TRADE_AQUIFER(aquifer,county,sector,county, sector,altrunsall)                                                      water market aquifer water permits trade

* power plants
  sreport_EV_PP_GENERATION(power_plant_all,power_plant_type, power_plant_cooling, month%addhour%, states,altrunsall)                the generation from each power plants
  sreport_EV_DEMAND_PERCAP(month%addhour%, states,altrunsall)                                                                       electricity demand per capita
  sreport_EV_PP_FUEL(fuel,month,states,altrunsall)                                                                                  power plant fuel consumption
  sreport_EV_PP_WATER_POND(power_plant_all,power_plant_type, power_plant_cooling, month, states,altrunsall)                         inventory level of cooling pond
  sreport_EV_PP_WATER_POND_Ini(power_plant_all,power_plant_type, power_plant_cooling,altrunsall)                                    initial inventory level of cooling pond
  sreport_EV_PP_WATER_DIVERSION(power_plant_all,power_plant_type, power_plant_cooling, month, states,altrunsall)                    cooling water diversion
  sreport_EV_WS_OPERATION(power_plant_all,ws_type,altrunsall)                                                                       new wind and solar plants operation
  sreport_EV_WS_NEWBUILD(power_plant_all,ws_type,altrunsall)                                                                        new wind and solar plants
  sreport_EV_WS_LAND(power_plant_all,ws_type,county, zones, landirrtype,altrunsall)                                                 Land use by solar and wind
  sreport_EV_DEMAND_STEPS(allsteps,altrunsall)                                                                                      electricity demand by steps
  sreport_EV_DEMAND_TRANS(county,county,month%addhour%, states,altrunsall)                                                          electricity trans across county
  sreport_EV_DEMAND_WP(county, month, states,altrunsall)                                                                            water project electricity demand
  sreport_EV_SURFACEDIVERSION_COOL(river,riverplace,county,sector,month,states,altrunsall)                                          cooling surface diversion


* aritificial variables
  sreport_ART_WE_ADDALLWATERSUPPLY(customer,sector,month,states,altrunsall)
  sreport_ART_WE_DEMANDQUANTITY(customer,sector,month,states,altrunsall)
  sreport_ART_WE_FLOWBALANCE_DEMAND(river,riverplace,month,states,altrunsall)
  sreport_ART_WE_FLOWBALANCE_SUPPLY(river,riverplace,month,states,altrunsall)
  sreport_ART_WE_OUTOBAYBAL(river, states,altrunsall)
  sreport_ART_WE_DRAWDOWN_BAL(aquifer, layer, county,altrunsall)
  sreport_ART_EE_PP_CAPACITYBAL(POWER_PLANT_ALL,POWER_PLANT_TYPE, POWER_PLANT_COOLING, MONTH%ADDHOUR%, STATES,altrunsall)
  sreport_ART_EE_PP_NEWNGCC_LIMIT(county,power_plant_cooling,altrunsall)
  sreport_ART_EE_PP_PEAKCAPCITY_REQ(states,altrunsall)
  sreport_ART_EE_PP_CAPACITYLIMIT(uplow,altrunsall)
  sreport_ART_EE_PP_WATER_SURFACE_DIVBAL2(river,riverplace,county,sector,  month,states,altrunsall)
  sreport_ART_EE_WS_CAPACITY_LIMIT(altrunsall)
  sreport_ART_EE_DEMAND_COUNTYBAL(county, month%addhour%, states,altrunsall)
  sreport_ART_EE_DEMAND_TRANSBAL(county,month%addhour%, states,altrunsall)

*binary variables
* water projects
  sreport_WV_WP_DO_I_OPRT_WATER(Projects,altrunsall)                                                                                do I operate water proejcts
  sreport_WV_WP_DO_I_BUILD_WATER(Projects,altrunsall)                                                                               do I build water projects
  sreport_WV_WP_DO_I_JOINTBULTDWP(jointpair,altrunsall)                                                                             do i build the joint water projects
* power plants
  sreport_EV_PP_DO_I_BUILD_NEW_NGPP(POWER_PLANT_ALL, POWER_PLANT_TYPE, POWER_PLANT_COOLING,altrunsall)                              do i build new natural gas power plant
  sreport_EV_PP_DO_I_RETROFIT_COOLING(POWER_PLANT_ALL, POWER_PLANT_TYPE, POWER_PLANT_COOLING, POWER_PLANT_COOLING,altrunsall)       do i retrofit cooling towel of existing power plant
  sreport_EV_PP_DO_I_RETROFIT_BOILER(POWER_PLANT_ALL, POWER_PLANT_TYPE, POWER_PLANT_TYPE, POWER_PLANT_COOLING,altrunsall)           do I retrofit boiler of existing power plants
  sreport_EV_PP_DO_I_OPER_POWERPLANT(power_plant_all,power_plant_type, power_plant_cooling,altrunsall)                              do i operate power plants
* save important marginals
  sreport_AE_AGLANDBAL(county, zones, landirrtype,altrunsall)
  sreport_WE_DIVERSIONQMAX(county,sector,river,riverplace,states,altrunsall)
  sreport_WE_COUNTYPUMPBAL(county, Aquifer, layer, month,states,altrunsall)
  sreport_WE_EDWARDS_PUMPLIMIT(county,gsector,states,altrunsall)
  sreport_EE_DEMAND_QUANTITYBAL(month%addhour%,states,altrunsall)


;

