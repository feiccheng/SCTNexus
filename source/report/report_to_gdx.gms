$setglobal altrun %gams.u1%


execute_unload './t/sreport_%altrun%.gdx'
  sreport_AV_LANDTRANS
  sreport_AV_CROPACRES
  sreport_AV_CROPSTRATEGY
  sreport_AV_LIVEPROD
  sreport_AV_LIVEGRAZING
  sreport_AV_HAYFEED
  sreport_AV_HAYPURCHASE
  sreport_AV_HAYTRANS
  sreport_AV_AGSALE
  sreport_AV_CROPMIX
  sreport_AV_VEGMIX
  sreport_AV_LIVEMIX

* water variables
  sreport_WV_AGZONEWATERUSE
  sreport_WV_SURFACEDIVERSION
  sreport_WV_PUMP_GROUNDWATER
  sreport_WV_OTHERWATERSOURCE
  sreport_WV_ADDUPUSERALLWATER
  sreport_WV_WATERDEMAND_STEPS
  sreport_WV_WATERDEMAND

*surface water variables
  sreport_WV_FLOW
  sreport_WV_RETURNFLOW
  sreport_WV_OUTTOBAY
  sreport_WV_RESERVOIR_WITHDRAW
  sreport_WV_RESERVOIR_RELEASE
  sreport_WV_SPRNFLOW
  sreport_WV_RESERVIOR_INVENTORY
  sreport_WV_RESERVIOR_INVENTORY_INI

*ground water variables
  sreport_WV_PUMP_STEP
  sreport_WV_TOTALCOUNTYPUMP
  sreport_WV_DRAWDOWN
* water mix
  sreport_WV_MIX_GRDPUMP
  sreport_WV_MIX_SURGRD

* water projects
  sreport_WV_WP_USEGROUND
  sreport_WV_WP_USEASR
  sreport_WV_WP_USESURFACE
  sreport_WV_WP_USEOCR
  sreport_WV_WP_USEOUTSIDE
  sreport_WV_WP_USESEAWATER
  sreport_WV_WP_USEREUSE
  sreport_WV_WP_PROJECTWATER
  sreport_WV_WP_SURFACE_ACQUWR
  sreport_WV_WP_SURFACE_NEWWR
  sreport_WV_WP_ASROCR_INVENTORY_INI
  sreport_WV_WP_ASROCR_INVENTORY
  sreport_WV_WP_ASR_FROMGROUND
  sreport_WV_WP_ASR_FROMSURFACE
  sreport_WV_WP_ASR_FROMSURFACE_NEWWR
  sreport_WV_WP_RECHARGE_AQUIFER

  sreport_WV_WP_ASR_FROMREUSE
  sreport_WV_WP_ASR_FROMEXTRA
  sreport_WV_WP_OCR_FROMSURFACE
  sreport_WV_WP_OCR_FROMSURFACE_NEWWR
  sreport_WV_WP_REUSE_EFFLUENT
  sreport_WV_WP_Conservation

* water markets
  sreport_WV_WM_DYO_ENROLL
  sreport_WV_WM_DYO_SUSPEND
  sreport_WV_WM_LEASE_RIVER
  sreport_WV_WM_TRADE_RIVER
  sreport_WV_WM_LEASE_AQUIFER
  sreport_WV_WM_TRADE_AQUIFER

* power plants
  sreport_EV_PP_GENERATION
  sreport_EV_DEMAND_PERCAP
  sreport_EV_PP_FUEL
  sreport_EV_PP_WATER_POND
  sreport_EV_PP_WATER_POND_Ini
  sreport_EV_PP_WATER_DIVERSION
  sreport_EV_WS_OPERATION
  sreport_EV_WS_NEWBUILD
  sreport_EV_WS_LAND
  sreport_EV_DEMAND_STEPS
  sreport_EV_DEMAND_TRANS
  sreport_EV_DEMAND_WP

* aritificial variables
  sreport_ART_WE_ADDALLWATERSUPPLY
  sreport_ART_WE_DEMANDQUANTITY
  sreport_ART_WE_FLOWBALANCE_DEMAND
  sreport_ART_WE_FLOWBALANCE_SUPPLY
  sreport_ART_WE_OUTOBAYBAL
  sreport_ART_WE_DRAWDOWN_BAL
  sreport_ART_EE_PP_CAPACITYBAL
  sreport_ART_EE_PP_NEWNGCC_LIMIT
  sreport_ART_EE_PP_PEAKCAPCITY_REQ
  sreport_ART_EE_PP_CAPACITYLIMIT
  sreport_ART_EE_PP_WATER_SURFACE_DIVBAL2
  sreport_ART_EE_WS_CAPACITY_LIMIT
  sreport_ART_EE_DEMAND_COUNTYBAL
  sreport_ART_EE_DEMAND_TRANSBAL

*binary variables
* water projects
  sreport_WV_WP_DO_I_OPRT_WATER
  sreport_WV_WP_DO_I_BUILD_WATER
  sreport_WV_WP_DO_I_JOINTBULTDWP
* power plants
  sreport_EV_PP_DO_I_BUILD_NEW_NGPP
  sreport_EV_PP_DO_I_RETROFIT_COOLING
  sreport_EV_PP_DO_I_RETROFIT_BOILER
  sreport_EV_PP_DO_I_OPER_POWERPLANT

 sreport_modelstats
*sreport_priceindex
*sreport_priceindex_county
sreport_welfare_total
*sreport_welfare_county
sreport_agwel_item
sreport_aquiferpump
sreport_aquifersectorpump
sreport_surfacediversion
sreport_addupwater_source
sreport_waterdemand
sreport_unitpumpcost
sreport_project_totalcost
sreport_project_unitcost


sreport_watercost
sreport_drawdownvalue
sreport_springvalue
sreport_landvalue
sreport_land_bal
sreport_agsales_county
sreport_watermarket
sreport_DYO_agbenefit
sreport_demand_pp

sreport_crop_strat
sreport_Demanddata_pp

sreport_post_AvailLand
sreport_post_iniLift
sreport_post_river_traded
sreport_post_aquifer_traded
sreport_post_WindSolar_LANDexist
sreport_post_WindSolar_NEWexist

sreport_post_linkjointproj
sreport_post_exist_projects
sreport_post_power_plant_exist



sreport_crop_strat
sreport_inflow1
sreport_AquiferHistdatanew
sreport_TotalCountyPumpCost
sreport_endliftsteps
sreport_Demanddata_pp
sreport_Demanddata


  sreport_AE_AGLANDBAL
  sreport_WE_DIVERSIONQMAX
  sreport_WE_COUNTYPUMPBAL
  sreport_WE_EDWARDS_PUMPLIMIT
  sreport_EE_DEMAND_QUANTITYBAL
  sreport_V_NETBENEFIT
