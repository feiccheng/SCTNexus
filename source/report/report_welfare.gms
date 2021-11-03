
$ondotl
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*  report the welfare     ~
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* pumping and other costs
report_welfare_total(upsector,'watercost',stateofnature)
         =-sum((customer,month, sameas(upsector, sector)),
                         report_watercost(customer,sector,stateofnature)
                        *report_waterdemand(customer,sector,month,'quantity',stateofnature) )  ;

* revenue or consumer surplus by sectors
report_welfare_total('ag','revenue',stateofnature)
         =m_Ag_Revenue
         - m_Ag_HayTransCost
         - m_Ag_HayPurchaseCost
         - m_Ag_CropCost
         - m_Ag_LivestockCost
         - m_Ag_LandTransCost ;

report_welfare_total(upsector,'ConsumerSurplus',stateofnature)
         =sum(sameas(upsector, sector), m_WaterDemandIntegral  )       ;

report_welfare_total('mun','Conservation',stateofnature)
         =- m_WP_ConservationCost ;

report_welfare_total('rec','revenue',stateofnature)
         =sum(domain_for_WV_SURFACEDIVERSION(river,riverplace,customer,'rec',month,stateofnature),
                         WV_SURFACEDIVERSION(river,riverplace,customer,'rec',month,stateofnature)*Priceother('rec') )  ;

report_welfare_total('oth','revenue',stateofnature)
         =sum(domain_for_WV_SURFACEDIVERSION(river,riverplace,customer,'oth',month,stateofnature),
                         WV_SURFACEDIVERSION(river,riverplace,customer,'oth',month,stateofnature)*Priceother('oth') )  ;

report_welfare_total('environment','revenue',stateofnature)
        = + m_OutToBayBenefit
          - m_DrawDownPenalty ;


report_welfare_total('pp','ConsumerSurplus',stateofnature)
         =m_ElecIntegral  ;

*Boiler_Retrofit, Cooling_Retrofit, newPP, exist,all_OM, fuel, cooling, OT_penalty
report_welfare_total('pp','cost',stateofnature)
        = - m_PP_VariableCost
         - m_PP_FuelCost
         - m_PP_OnceThroughPenalty
         - m_PP_RetrofitCost_Cooling
         - m_PP_RetrofitCost_Boiler
         - m_PP_NEWBUILDCost
         - m_PP_ExistFixedCost
         - m_PP_OMCost     ;

* benefit gain by trading or leasing out the water permits
report_welfare_total(upsector,'watermarket',stateofnature)
         =sum((riverandaquifer,county,sameas(upsector, sector)),
                   report_watermarket(riverandaquifer,county,sector,stateofnature,'Revenue')
                  -report_watermarket(riverandaquifer,county,sector,stateofnature,'cost')) ;

report_welfare_total('ag','watermarket',stateofnature)
         =report_welfare_total('ag','watermarket',stateofnature)
          +sum(county, report_DYO_agbenefit(county,stateofnature));


*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*  Itemized agricultural cost    ~
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


report_agwel_item('CropRev',stateofnature)
         =sum(domain_for_AV_AGSALE(county, field_primary, stateofnature),
                         AV_AGSALE(county, field_primary, stateofnature)
                        *commodprice(county, field_primary) )
         +sum(domain_for_AV_AGSALE(county, vege_primary, stateofnature),
                         AV_AGSALE(county, vege_primary, stateofnature)
                        *commodprice(county, vege_primary) ) ;

report_agwel_item('LiveRev',stateofnature)
         =sum(domain_for_AV_AGSALE(county, livestock_primary, stateofnature),
                         AV_AGSALE(county, livestock_primary, stateofnature)
                        *commodprice(county, livestock_primary) )  ;

report_agwel_item('HayTrans',stateofnature)
         = - m_Ag_HayTransCost;

report_agwel_item('HayPurchase',stateofnature)
         = - m_Ag_HayPurchaseCost;

report_agwel_item('CropCost',stateofnature)
         = - m_Ag_CropCost;

report_agwel_item('LiveCost',stateofnature)
         = - m_Ag_LivestockCost;

report_agwel_item('LandTrans',stateofnature)
         = - m_Ag_LandTransCost;



$offdotl






