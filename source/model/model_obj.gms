*CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC*
*^^^^^^^^^^           [0] Objective Function of the Model: NETBENEFIT Function*^^^^
*CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC*
E_OBJ..
   V_NETBENEFIT =e=
 [  sum(stateofnature,
       probability(stateofnature)
    *  (
$$       include %whereismodel%model_obj_art.gms
* agricultural sector
         + m_Ag_Revenue
         - m_Ag_HayTransCost
         - m_Ag_HayPurchaseCost
         - m_Ag_CropCost
         - m_Ag_LivestockCost
         - m_Ag_LandTransCost

* mun, ind, min, rec and oth sector benefit
* mun/ind/min get benefit from the integral

         + m_WaterDemandIntegral
         + m_RecOth_Revenue
         - m_MunIndMin_OtherCost

* water pumping and treatment cost
         - m_RiverDiversionCost
         - m_OtherSourceDivCost
         - m_GrdPumpCost
         - m_GrdOtherCost
         + m_OutToBayBenefit
         - m_DrawDownPenalty
* water projects
         - m_WP_VariableCost
         - m_WP_ConservationCost

* water markets
         - m_WM_TradeLease_TransCost
         + m_DYO_Benefit
* power plants
         + m_ElecIntegral
         - m_PP_VariableCost
         - m_PP_FuelCost
         - m_PP_OnceThroughPenalty
    ))
* fixed costs
         - m_DYO_Cost
         - m_WP_FixedCost
         - m_PP_RetrofitCost_Cooling
         - m_PP_RetrofitCost_Boiler
         - m_PP_NEWBUILDCost
         - m_PP_ExistFixedCost
         - m_PP_OMCost
]/scalobjj;



