*~~~~~~~~~~~~~~~~~~~~
*agricultural sector
*~~~~~~~~~~~~~~~~~~~~
$macro m_Ag_Revenue                                                              \
         sum(domain_for_AV_AGSALE(county, primary, stateofnature),               \
                        AV_AGSALE(county, primary, stateofnature)                \
                       *commodprice(county, primary) )

$macro m_Ag_HayTransCost                                                         \
         sum(domain_for_AV_HAYTRANS(county,county1,primary,stateofnature),       \
                        AV_HAYTRANS(county,county1,primary,stateofnature)        \
                        *haytranscost(county,county1))

$macro m_Ag_HayPurchaseCost                                                      \
         sum(domain_for_AV_HAYPURCHASE(county,primary,stateofnature),            \
                        AV_HAYPURCHASE(county,primary,stateofnature)             \
                      *(maxhaytranscost+commodprice(county, primary)) )

$macro m_Ag_CropCost                                                             \
         sum((domain_for_AV_CROPACRES(county,zones,crops,landirrtype), aginput), \
                         AV_CROPACRES(county,zones,crops,landirrtype)            \
                        *cropbudgetnew(county, crops, landirrtype,aginput))

$macro m_Ag_LivestockCost                                                        \
         sum((domain_for_AV_LIVEPROD(county, livestock),aginput),                \
                         AV_LIVEPROD(county, livestock)                          \
                        *livebudnew(county, livestock,aginput) )

$macro m_Ag_LandTransCost                                                           \
         sum(domain_for_AV_LANDTRANS(county,landirrtype,zones,landirrtype2,zones2), \
                        AV_LANDTRANS(county,landirrtype,zones,landirrtype2,zones2)  \
                        *landtransfercost(landirrtype,landirrtype2))

*~~~~~~~~~~~~~~~~~~~~
* Water Demand Part
*~~~~~~~~~~~~~~~~~~~~
$macro m_WD_coef                                                                   \
         m_vdemandstep_coef(m_price_wd,m_quantity_wd,m_elasticity_wd,m_truncation_wd,m_stepsize_wd)

* mun, ind and min sector benefit
$macro m_WaterDemandIntegral                                                         \
         (integralceS(m_domain_for_v_demandsteps_wd,m_v_demandsteps_wd,m_domain_for_v_demand_wd,m_v_demand_wd,m_WD_coef,m_price_wd,m_elasticity_wd))

* rec and other sector benefit
$macro m_RecOth_Revenue                                                                                                \
        [ sum(domain_for_WV_SURFACEDIVERSION(river,riverplace,customer,'rec',month,stateofnature),                    \
                         WV_SURFACEDIVERSION(river,riverplace,customer,'rec',month,stateofnature)*Priceother('rec') )  \
        + sum(domain_for_WV_SURFACEDIVERSION(river,riverplace,customer,'oth',month,stateofnature),                     \
                         WV_SURFACEDIVERSION(river,riverplace,customer,'oth',month,stateofnature)*Priceother('oth') ) ]
* other cost of mun ind and min sector
$macro m_MunIndMin_OtherCost                                                                \
         sum(domain_for_WV_ADDUPUSERALLWATER(customer,sector,month,stateofnature),          \
                        WV_ADDUPUSERALLWATER(customer,sector,month,stateofnature)           \
                        *Demanddata(customer,sector,'annual',"othercost"))

*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* Pumping cost, outtobay benefit and drawndown penalty
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

$macro m_RiverDiversionCost                                                                        \
         sum(domain_for_WV_SURFACEDIVERSION(river,riverplace,customer,sector,month,stateofnature), \
                        WV_SURFACEDIVERSION(river,riverplace,customer,sector,month,stateofnature)  \
                       *(baselift(sector)* PumpCostPerFoot                                         \
                        +Demanddata(customer,sector,'annual','treatment')))

$macro m_OtherSourceDivCost                                                                       \
         sum(domain_for_WV_OTHERWATERSOURCE(customer,sector, month, stateofnature),               \
                        WV_OTHERWATERSOURCE(customer,sector, month, stateofnature)                \
                       *(baselift(sector)* PumpCostPerFoot                                        \
                        +Demanddata(customer,sector,'annual','treatment')))

$macro m_GrdPumpCost                                                                              \
         sum(domain_for_WV_PUMP_STEP(county,Aquifer,layer,stateofnature,stepw),                   \
                        WV_PUMP_STEP(county,Aquifer,layer,stateofnature,stepw)                    \
                       *totalcountypumpcost(county,aquifer,layer,stateofnature, stepw) )

$macro m_GrdOtherCost                                                                             \
         sum(domain_for_WV_PUMP_GROUNDWATER(aquifer,layer,customer,sector,month,stateofnature),   \
                        WV_PUMP_GROUNDWATER(aquifer,layer,customer,sector,month,stateofnature)    \
                        *Demanddata(customer,sector,'annual','treatment') )


$macro m_OutToBayBenefit                                                                          \
         sum(domain_for_WV_OUTTOBAY(river,riverplace,month,stateofnature),                        \
                        WV_OUTTOBAY(river,riverplace,month,stateofnature)*outtobaybenefit )

$macro m_DrawDownPenalty                                                                          \
         sum(domain_for_WV_DRAWDOWN(aquifer, layer, county,steps_dd),                             \
                        WV_DRAWDOWN(aquifer, layer, county,steps_dd)                              \
                        *drawdown_stepdiff(county,aquifer,layer,steps_dd)                         \
                        *drawdown_cost(county,aquifer,layer,steps_dd))

*~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* Water Projects Part
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$macro m_WP_FixedCost                                                                                 \
       [+ sum(domain_for_WV_WP_DO_I_OPRT_WATER(Projects),                                             \
                         WV_WP_DO_I_OPRT_WATER(Projects)*investmentcost(projects,'Optcost'))          \
        + sum(domain_for_WV_WP_DO_I_BUILD_WATER(Projects),                                            \
                         WV_WP_DO_I_BUILD_WATER(Projects)*investmentcost(projects,'annualfixedcost')) \
        + sum(exist_projects (projects),investmentcost(projects,'annualfixedcost') )  ]


$macro m_WP_VariableCost                                                                                         \
    [   sum(domain_for_WV_WP_PROJECTWATER(projects,sector,customer,month,stateofnature),                         \
                      WV_WP_PROJECTWATER(projects,sector,customer,month,stateofnature)                           \
                      *( investmentcost(projects,'unitvariablecost')                                             \
                        +0.12*investmentcost(projects, 'energyperunit')$(do_i_want_pp=0)))                       \
     + sum(domain_for_WV_WP_RECHARGE_AQUIFER(projects,sector,customer,aquifer,layer, month,stateofnature),       \
                      WV_WP_RECHARGE_AQUIFER(projects,sector,customer,aquifer,layer, month,stateofnature)        \
                      *( investmentcost(projects,'unitvariablecost')                                             \
                        +0.12*investmentcost(projects, 'energyperunit')$(do_i_want_pp=0)))   ]


$macro m_WP_ConservationCost                                                                          \
       sum(domain_for_WV_WP_Conservation(customer),                                                   \
                      WV_WP_Conservation(customer)*conservecost(customer))


*~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* Water Market Part
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$macro m_WM_TradeLease_TransCost                                                                                                             \
        [   50*sum(domain_for_WV_WM_TRADE_RIVER(river,riverplace,county,conssector,riverlocation,county1, conssector1),                       \
                             WV_WM_TRADE_RIVER(river,riverplace,county,conssector,riverlocation,county1, conssector1))                       \
         + 50*sum(domain_for_WV_WM_TRADE_AQUIFER('Edwards',county,gsector, county1, gsector1),                                               \
                             WV_WM_TRADE_AQUIFER('Edwards',county,gsector, county1, gsector1))                                               \
                                                                                                                                              \
         + 100*sum(domain_for_WV_WM_LEASE_RIVER(river,riverplace,county,conssector,riverlocation,county1, conssector1,stateofnature),         \
                              WV_WM_LEASE_RIVER(river,riverplace,county,conssector,riverlocation,county1, conssector1,stateofnature))         \
         + 100*sum(domain_for_WV_WM_LEASE_AQUIFER('Edwards',county,gsector, county1, gsector1,stateofnature),                                 \
                              WV_WM_LEASE_AQUIFER('Edwards',county,gsector, county1, gsector1,stateofnature))  ]

* dyo normal year payment is 54, but count the trans cost here only
$macro m_DYO_Cost                                                                                \
           sum(domain_for_WV_WM_DYO_ENROLL(county, permittype),                                  \
                          WV_WM_DYO_ENROLL(county, permittype) *5)

* assume the benefit to environment is 2* dyopayment
$macro m_DYO_Benefit                                                                             \
           sum(domain_for_WV_WM_DYO_SUSPEND(county,stateofnature) ,                              \
                          WV_WM_DYO_SUSPEND(county,stateofnature)*2* DYOpayment(stateofnature))


*~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* Energy Part
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$macro m_ED_coef                                                                                     \
         m_vdemandstep_coef(m_price_pp,m_quantity_pp,m_elasticity_pp,m_truncation_pp,m_stepsize_pp)

$macro m_ElecIntegral                                                                                 \
         (integralceS_PP(m_domain_for_v_demandsteps_pp,m_v_demandsteps_pp,m_ED_coef,m_elasticity_pp))

$macro m_PP_RetrofitCost_Cooling                                                                                                               \
         sum(domain_for_EV_PP_DO_I_RETROFIT_COOLING(POWER_PLANT_ALL, POWER_PLANT_TYPE, POWER_PLANT_COOLING0, POWER_PLANT_COOLING),             \
                        EV_PP_DO_I_RETROFIT_COOLING(power_plant_all, power_plant_type, power_plant_cooling0, power_plant_cooling)              \
                     * ( pp_potential_all( power_plant_all, power_plant_type, power_plant_cooling,'TotalCapCost')                              \
                        -pp_potential_all( power_plant_all, power_plant_type, power_plant_cooling0,'TotalCapCost') ))

$macro m_PP_RetrofitCost_Boiler                                                                                                                \
         sum(domain_for_EV_PP_DO_I_RETROFIT_BOILER(POWER_PLANT_ALL, POWER_PLANT_TYPE0, POWER_PLANT_TYPE, POWER_PLANT_COOLING),                 \
                        EV_PP_DO_I_RETROFIT_BOILER(power_plant_all, power_plant_type0, power_plant_type, power_plant_cooling)                  \
                     * ( pp_potential_all( power_plant_all, power_plant_type, power_plant_cooling,'TotalCapCost')                              \
                        -pp_potential_all( power_plant_all, power_plant_type0, power_plant_cooling,'TotalCapCost') ))

$macro m_PP_NEWBUILDCost                                                                                                                       \
       [ sum(domain_for_EV_PP_DO_I_BUILD_NEW_NGPP(POWER_PLANT_ALL, POWER_PLANT_TYPE, POWER_PLANT_COOLING),                                     \
                        EV_PP_DO_I_BUILD_NEW_NGPP(POWER_PLANT_ALL, POWER_PLANT_TYPE, POWER_PLANT_COOLING)                                      \
                       *pp_potential_all( power_plant_all, power_plant_type, power_plant_cooling,'TotalCapCost')  )                            \
       + sum((domain_for_EV_WS_NEWBUILD(power_plant_all,ws_type), mapwindsolar(power_plant_all, county, ws_type)),                             \
                         EV_WS_NEWBUILD(power_plant_all,ws_type)                                                                                \
                       *windsolar_all(power_plant_all,county, ws_type, 'capital_cost'))                                                         \
       + sum(domain_for_EV_WS_LAND(power_plant_all,ws_type,county,zones,landirrtype)  ,                                                         \
                        EV_WS_LAND(power_plant_all,ws_type,county,zones,landirrtype))]


$macro m_PP_ExistFixedCost                                                                                                          \
       [ sum(power_plant_exist(power_plant_all, power_plant_type, power_plant_cooling),                                             \
                 pp_potential_all( power_plant_all, power_plant_type, power_plant_cooling,'TotalCapCost'))                          \
       + sum(mapwindsolar(power_plant_all, county, ws_type), windsolar_all(power_plant_all,county, ws_type, 'capital_cost'))]


$macro m_PP_OMCost                                                                                                                  \
       [ sum(domain_for_EV_PP_DO_I_OPER_POWERPLANT(power_plant_all,power_plant_type, power_plant_cooling),                          \
                        EV_PP_DO_I_OPER_POWERPLANT(power_plant_all,power_plant_type, power_plant_cooling)                           \
                       *pp_potential_all( power_plant_all, power_plant_type, power_plant_cooling,'TotalOMCost'))                    \
       + sum((domain_for_EV_WS_OPERATION(power_plant_all,ws_type), mapwindsolar(power_plant_all, county, ws_type)),                 \
                        EV_WS_OPERATION(power_plant_all,ws_type)                                                                    \
                       *windsolar_all(power_plant_all,county, ws_type, 'om_cost'))]

$macro m_PP_VariableCost                                                                                                            \
         sum(domain_for_EV_PP_GENERATION(power_plant_all,power_plant_type, power_plant_cooling, month%addhour%, stateofnature)  ,   \
                        EV_PP_GENERATION(power_plant_all,power_plant_type, power_plant_cooling, month%addhour%, stateofnature)      \
                        *pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling, 'variable_cost') )

*fuel cost
$macro m_PP_FuelCost                                                                             \
        sum(domain_for_EV_PP_FUEL(fuel, month, stateofnature),                                   \
                       EV_PP_FUEL(fuel, month, stateofnature)                                    \
                       *max(.01, fuel_para (fuel,'fuelprice' )+fuel_para (fuel,'trans' )  ) )

* once through penalty
$macro m_PP_OnceThroughPenalty                                                                                                   \
       [sum(domain_for_EV_PP_WATER_DIVERSION(power_plant_all,power_plant_type,'oc' , month, stateofnature) ,      \
                       EV_PP_WATER_DIVERSION(power_plant_all,power_plant_type,'oc' , month, stateofnature)*99 )   \
       +sum(domain_for_EV_PP_WATER_DIVERSION(power_plant_all,power_plant_type,'on' , month, stateofnature) ,      \
                       EV_PP_WATER_DIVERSION(power_plant_all,power_plant_type,'on' , month, stateofnature)*99 )]  \






