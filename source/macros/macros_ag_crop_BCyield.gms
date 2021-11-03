*   Formula used to calculate BCResult
*http://www.fao.org/docrep/S2022E/s2022e07.htm#TopOfPage

*    ETo = p (0.46 T mean + 8)
$macro m_ET0(Tmean_month)                                      \
       DAYLIGHT(MONTH)*(0.46*  Tmean_month +8)


* water needs = kc (factor) * et0 * days    (converted to feet)
$macro m_WaterNeeds(ET0)                                       \
       (ET0                                                    \
             *BCDATA("irrigated",CROPs,STAGE,MONTH)            \
             *BCDATA("irrigated",CROPs,STAGE,"COEF"))


* efficienty rainfall (0.8*P-25 if P>75 | 0.6*P-10 if P<75)
* then convert to daily basis
$macro m_RootWater(prec_month)                                   \
       max( 0, prec_month*0.8 -25, prec_month*0.6 -10)/Days(month)

* total irrigation water needed by month and stage
$macro m_IrrigNeeds(WaterNeeds, RootWater)                      \
      max(0, WaterNeeds- ROOTWATER *BCDATA("irrigated",CROPs,STAGE,MONTH))

* irrigation water consumed after adjusting the irrigation efficiency and deficit irrigation strategy
$macro m_WaterUse(WaterNeeds,ROOTWATER,BCstrategy )                                   \
      sum(stage, max(0, WaterNeeds*irrigrate(BCstrategy)- ROOTWATER *BCDATA("irrigated",CROPs,STAGE,MONTH)))/waterEfficiency(BCstrategy)/304.8




*http://www.fao.org/docrep/016/i2800e/i2800e.pdf
*  (1-Ya/Yx)=k*(1-ETa/ETx)
*   Ya=(1- k*(1-ETa/ETx))*Yx
* crop yield of BC strategies if irrigated budget exists
$macro  m_BC_cropyield_irrigbud(county,crops,landirrtype, state, BCstrategy,primary )                        \
      sum(strat_irr(BCstrategy, landirrtype) ,                                                               \
       ( cropresponse(crops)                                                                               \
        * (irrigrate(BCstrategy)-save_dryland_waterlevel(county,crops))/(1-save_dryland_waterlevel(county,crops))  \
         )* (cropbud(county,crops,'irrigated',primary)-cropbud(county,crops,'dryland',primary)   )         \
         +cropbud(county,crops,'dryland',primary))


$macro  m_BC_cropyield_drybud1(county,crops, state, primary )                                  \
          (cropresponse(crops)                                                                               \
        * (sum((stage,month),ROOTWATER(county,MONTH,state)*BCDATA("dryland",CROPs,STAGE,MONTH))/sum((stage,month),WaterNeeds(crops,county,month,stage,'normal')) -save_dryland_waterlevel(county,crops))   \
           /(1-save_dryland_waterlevel(county,crops))                                                     \
         )* (cropbud(county,crops,'irrigated',primary)-cropbud(county,crops,'dryland',primary)   )         \
         +cropbud(county,crops,'dryland',primary)

* irrigated only crops
$macro  m_BC_cropyield_irrigbud_only(county,crops,landirrtype, state, BCstrategy,primary )                   \
      sum(strat_irr(BCstrategy, landirrtype) ,                                                               \
       ( cropresponse(crops)                                                                                 \
        * irrigrate(BCstrategy)                                                                              \
         )* (cropbud(county,crops,'irrigated',primary)*0.6  )                                                \
         +cropbud(county,crops,'irrigated',primary)*0.4)


* make the crops only have dryland options

*   Ya=(1- k*(1-ETa/ETx))*Yx
*   Ynormal= (1- k*(1-ETa_normal/ETx))*Yx
*Ya= (1- k*(1-ETa/ETx))/ (1- k*(1-ETa_normal/ETx))* Ynormal
$macro m_BC_cropyield_drybud(rootwater, waterneeds ,basestate)                                                                   \
        max(0.01,  [ 1                                                                                                           \
        - cropresponse (crops)                                                                                                   \
        * max(0, (1- sum((month,stage),(ROOTWATER(county,MONTH,state)* BCDATA("dryland",CROPs,STAGE,MONTH) )  )     \
               / sum((month,stage),  WaterNeeds(crops, county, month,stage, state)*304.8) )) ]                                         \
         /    [ 1                                                                                                                \
        - cropresponse (crops)                                                                                                   \
        * max(0, (1- sum((month,stage),(ROOTWATER(county,MONTH,basestate)* BCDATA("dryland",CROPs,STAGE,MONTH)  )  ) \
               / sum((month,stage),  WaterNeeds(crops, county, month,stage, basestate)*304.8))) ] )                                    \
        * cropbud(county, crops, 'dryland',  primary)







$ontext
cropwateruse_bc(county, crops, BCstrategy, month, state)
       $ cropresponse (crops)
       = sum(stage, IrrigNeeds(Crops, county, month, stage, state)  )/waterEfficiency(BCstrategy)*irrigrate(BCstrategy);


crop_strat_bc(county, crops, landirrtype, state, BCstrategy, primary)
      $(cropbud(county, crops, 'irrigated',  primary) and cropresponse (crops))
       = sum(strat_irr(BCstrategy, landirrtype) ,
          ( 1
        - cropresponse (crops)
        * max(0, (1- [sum((month,stage),(ROOTWATER(state,COUNTY,MONTH)* BCDATA("irrigated",CROPs,STAGE,MONTH)/Days(month)  )  )
               +sum(month, cropwateruse_bc(county, crops, BCstrategy ,month, state)* waterEfficiency(BCstrategy) ) ]
               / sum((month,stage),  WaterNeeds(crops, county, month,stage, state))
            ))
          )* cropbud(county, crops, 'irrigated',  primary)  );



* make the crops only have dryland options

*   Ya=(1- k*(1-ETa/ETx))*Yx
*   Ynormal= (1- k*(1-ETa_normal/ETx))*Yx
*Ya= (1- k*(1-ETa/ETx))/ (1- k*(1-ETa_normal/ETx))* Ynormal

crop_strat_bc(county, crops, 'dryland', state, 'noirrig', primary)
      $(cropbud(county, crops, 'dryland',  primary) and cropresponse (crops)
        and ( cropbud(county, crops, 'irrigated',  primary)=0)   )
       =
          [ 1
        - cropresponse (crops)
        * max(0, (1- sum((month,stage),(ROOTWATER(state,COUNTY,MONTH)* BCDATA("dryland",CROPs,STAGE,MONTH)/Days(month)  )  )
               / sum((month,stage),  WaterNeeds(crops, county, month,stage, state))
              )) ]
         /          [ 1
        - cropresponse (crops)
        * max(0, (1- sum((month,stage),(ROOTWATER(state,COUNTY,MONTH)* BCDATA("dryland",CROPs,STAGE,MONTH)/Days(month)  )  )
               / sum((month,stage),  WaterNeeds(crops, county, month,stage, 'normal'))
              )) ]
        * cropbud(county, crops, 'dryland',  primary)  ;

$offtext
