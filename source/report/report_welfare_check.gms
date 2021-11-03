$ondotl
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*  compare the welfare     ~
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


welfare1
         =sum((upsector,wel_output,stateofnature),
                 probability(Stateofnature)
                 *report_welfare_total(upsector,wel_output,stateofnature)   )  ;


rcomp_welfare('ag_rev','report')
         =sum(stateofnature, probability(stateofnature)*report_welfare_total('ag','revenue',stateofnature));

rcomp_welfare('ag_rev','obj')
         =sum(stateofnature,
           probability(stateofnature)
         *[m_Ag_Revenue
         - m_Ag_HayTransCost
         - m_Ag_HayPurchaseCost
         - m_Ag_CropCost
         - m_Ag_LivestockCost
         - m_Ag_LandTransCost]);

rcomp_welfare('water','report')
         =sum((upsector,stateofnature),
                 probability(stateofnature)*report_welfare_total(upsector,'watercost',stateofnature));

rcomp_welfare('water','obj')
         =sum(stateofnature,  probability(stateofnature)*
         [ - m_MunIndMin_OtherCost
         - m_RiverDiversionCost
         - m_OtherSourceDivCost
         - m_GrdPumpCost
         - m_GrdOtherCost
         - m_WP_VariableCost   ])
          - m_WP_FixedCost;


rcomp_welfare('water','test')
         =-sum(stateofnature, probability(stateofnature)*
         [  m_MunIndMin_OtherCost
          + m_RiverDiversionCost
          + m_OtherSourceDivCost
          + m_GrdOtherCost
          + sum(domain_for_WV_PUMP_GROUNDWATER(aquifer,layer,customer,sector,month,stateofnature),
                           WV_PUMP_GROUNDWATER(aquifer,layer,customer,sector,month,stateofnature)
                           *report_unitpumpcost(customer,Aquifer,layer,stateofnature))
          + sum(domain_for_WV_WP_PROJECTWATER(projects,sector,customer,month,stateofnature),
                            WV_WP_PROJECTWATER(projects,sector,customer,month,stateofnature)
                           *report_project_unitcost(projects))
           ] )
          ;


rcomp_welfare('water1','test')
         =-sum(stateofnature, probability(stateofnature)*
         [  m_MunIndMin_OtherCost
          + m_RiverDiversionCost
          + m_OtherSourceDivCost
          + m_GrdOtherCost ])  ;

rcomp_welfare('water1','obj')
         =sum(stateofnature,  probability(stateofnature)*
         [ - m_MunIndMin_OtherCost
         - m_RiverDiversionCost
         - m_OtherSourceDivCost
         - m_GrdOtherCost   ]);

rcomp_welfare('gw','obj')
         =sum(stateofnature, -probability(stateofnature)*m_GrdPumpCost);

rcomp_welfare('wp','obj')
         =sum(stateofnature, probability(stateofnature)*
         [- m_WP_VariableCost    ])
          - m_WP_FixedCost;


rcomp_welfare('gw','test')
         =- sum(domain_for_WV_PUMP_GROUNDWATER(aquifer,layer,customer,sector,month,stateofnature),
                           WV_PUMP_GROUNDWATER(aquifer,layer,customer,sector,month,stateofnature)
                           *report_unitpumpcost(customer,Aquifer,layer,stateofnature)
                           *probability(stateofnature))

           - sum(domain_for_WV_WP_USEGROUND(Projects,sector,customer,county,aquifer,layer,month,stateofnature),
                            WV_WP_USEGROUND(Projects,sector,customer,county,aquifer,layer,month,stateofnature)
                            *report_unitpumpcost(county,Aquifer,layer,stateofnature)
                            *probability(stateofnature))

           - sum(domain_for_WV_WP_ASR_FROMGROUND(projects,county,aquifer,layer,month,stateofnature),
                            WV_WP_ASR_FROMGROUND(projects,county,aquifer,layer,month,stateofnature)
                            *report_unitpumpcost(county,Aquifer,layer,stateofnature)
                            *probability(stateofnature))
  ;

rcomp_welfare('wp','test')
          =- sum(domain_for_WV_WP_PROJECTWATER(projects,sector,customer,month,stateofnature),
                            WV_WP_PROJECTWATER(projects,sector,customer,month,stateofnature)
                           *report_project_unitcost(projects)*probability(stateofnature))
           - sum(projects, report_project_unassigned(projects) )

           + sum(domain_for_WV_WP_USEGROUND(Projects,sector,customer,county,aquifer,layer,month,stateofnature),
                            WV_WP_USEGROUND(Projects,sector,customer,county,aquifer,layer,month,stateofnature)
                            *report_unitpumpcost(county,Aquifer,layer,stateofnature)
                            *probability(stateofnature))

           + sum(domain_for_WV_WP_ASR_FROMGROUND(projects,county,aquifer,layer,month,stateofnature),
                            WV_WP_ASR_FROMGROUND(projects,county,aquifer,layer,month,stateofnature)
                            *report_unitpumpcost(county,Aquifer,layer,stateofnature)
                            *probability(stateofnature))


          ;


rcomp_welfare('CS','report')
         =sum((upsector,stateofnature), probability(stateofnature)*report_welfare_total(upsector,'ConsumerSurplus',stateofnature));

rcomp_welfare('CS','obj')
         =sum(stateofnature,  probability(stateofnature)*
             [ m_WaterDemandIntegral + m_ElecIntegral]);

rcomp_welfare('ppcost','report')
         =sum(stateofnature,  probability(stateofnature)* report_welfare_total('pp','cost',stateofnature));

rcomp_welfare('ppcost','obj')
        =sum(stateofnature,  probability(stateofnature)*
         [ - m_PP_VariableCost
         - m_PP_FuelCost
         - m_PP_OnceThroughPenalty  ])
         - m_PP_RetrofitCost_Cooling
         - m_PP_RetrofitCost_Boiler
         - m_PP_NEWBUILDCost
         - m_PP_ExistFixedCost
         - m_PP_OMCost     ;

rcomp_welfare('other','report')
         =sum(stateofnature,  probability(stateofnature)*
          [report_welfare_total('rec','revenue',stateofnature)
         +report_welfare_total('oth','revenue',stateofnature)
         +report_welfare_total('environment','revenue',stateofnature)
         +report_welfare_total('mun','Conservation',stateofnature) ]);

rcomp_welfare('other','obj')
        = sum(stateofnature, probability(stateofnature)*
         [+ m_RecOth_Revenue
         + m_OutToBayBenefit
         - m_DrawDownPenalty
         - m_WP_ConservationCost ])  ;


rcomp_welfare('total','report')
         = rcomp_welfare('ag_rev','report')
         + rcomp_welfare('water','report')
         + rcomp_welfare('CS','report')
         + rcomp_welfare('ppcost','report')
         + rcomp_welfare('other','report');

rcomp_welfare('total','obj')
         = rcomp_welfare('ag_rev','obj')
         + rcomp_welfare('water','obj')
         + rcomp_welfare('CS','obj')
         + rcomp_welfare('ppcost','obj')
         + rcomp_welfare('other','obj');

rcomp_welfare('total','trueone') =V_NETBENEFIT.l;



*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*  compare the groundwater pump    ~
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


rcomp_pump(county,aquifer,layer,'totalcountypump')
         =sum(domain_for_WV_TOTALCOUNTYPUMP(county, Aquifer, layer, month, stateofnature),
                         WV_TOTALCOUNTYPUMP(county, Aquifer, layer, month, stateofnature)
                         *probability(stateofnature))  ;

rcomp_pump(county,aquifer,layer,'pumpsteps')
         =sum(domain_for_WV_PUMP_STEP(county,Aquifer,layer,stateofnature,stepw),
                         WV_PUMP_STEP(county,Aquifer,layer,stateofnature,stepw)
                        *QINCW(STEPw)*pumpbase(Aquifer, layer, county)*probability(stateofnature)) ;

rcomp_pump(county,aquifer,layer,'pump')
         = sum((domain_for_WV_PUMP_GROUNDWATER(aquifer,layer,customer,sector,month,stateofnature),mapcitycountytocounty(customer,county)),
                           WV_PUMP_GROUNDWATER(aquifer,layer,customer,sector,month,stateofnature)
                           *probability(stateofnature))

          + sum(domain_for_WV_WP_USEGROUND(Projects,sector,customer,county,aquifer,layer,month,stateofnature),
                            WV_WP_USEGROUND(Projects,sector,customer,county,aquifer,layer,month,stateofnature)
                            *probability(stateofnature))

          + sum(domain_for_WV_WP_ASR_FROMGROUND(projects,county,aquifer,layer,month,stateofnature),
                            WV_WP_ASR_FROMGROUND(projects,county,aquifer,layer,month,stateofnature)
                            *probability(stateofnature))   ;

*display rcomp_pump     ;

*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*  compare water projects   ~
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


rcomp_projects(projects,'report')
         =sum(stateofnature, report_project_totalcost(projects,stateofnature)*probability(stateofnature))
         -sum(stateofnature, probability(stateofnature)
           *[
           + sum(domain_for_WV_WP_USEGROUND(Projects,sector,customer,county,aquifer,layer,month,stateofnature),
                            WV_WP_USEGROUND(Projects,sector,customer,county,aquifer,layer,month,stateofnature)
                            *report_unitpumpcost(county,Aquifer,layer,stateofnature))
           + sum(domain_for_WV_WP_ASR_FROMGROUND(projects,county,aquifer,layer,month,stateofnature),
                            WV_WP_ASR_FROMGROUND(projects,county,aquifer,layer,month,stateofnature)
                            *report_unitpumpcost(county,Aquifer,layer,stateofnature)) ])  ;

rcomp_projects(projects,'obj')
= sum(stateofnature, probability(stateofnature)
           *[  m_WP_FixedCost
           + m_WP_VariableCost ])  ;


rcomp_projects(projects,'report_unit')
        =+ sum(domain_for_WV_WP_PROJECTWATER(projects,sector,customer,month,stateofnature),
                            WV_WP_PROJECTWATER(projects,sector,customer,month,stateofnature)
                           *report_project_unitcost(projects)*probability(stateofnature))

         + report_project_unassigned(projects)

         -sum(stateofnature, probability(stateofnature)
           *[
           + sum(domain_for_WV_WP_USEGROUND(Projects,sector,customer,county,aquifer,layer,month,stateofnature),
                            WV_WP_USEGROUND(Projects,sector,customer,county,aquifer,layer,month,stateofnature)
                            *report_unitpumpcost(county,Aquifer,layer,stateofnature))
           + sum(domain_for_WV_WP_ASR_FROMGROUND(projects,county,aquifer,layer,month,stateofnature),
                            WV_WP_ASR_FROMGROUND(projects,county,aquifer,layer,month,stateofnature)
                            *report_unitpumpcost(county,Aquifer,layer,stateofnature)) ])  ;


rcomp_projects('total','report') =sum(projects, rcomp_projects(projects,'report'));
rcomp_projects('total','report_unit') =sum(projects, rcomp_projects(projects,'report_unit'));
rcomp_projects('total','obj') =sum(projects, rcomp_projects(projects,'obj'));
rcomp_projects('total','obj_true') =rcomp_welfare('wp','obj');

*display rcomp_projects;

$offdotl