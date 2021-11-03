
WV_WATERDEMAND.up(citycounty,sector)
         $domain_for_WV_WATERDEMAND(citycounty,sector)
      = Demanddata(citycounty,sector,'annual',"quantity")*1;

WV_WATERDEMAND.lo(citycounty,sector)
         $domain_for_WV_WATERDEMAND(citycounty,sector)
      = Demanddata(citycounty,sector,'annual',"quantity")*0.9;


* aquifer drawdown limits
WV_DrawDown.up(aquifer,layer,county,steps_dd)
         $domain_for_WV_DrawDown(aquifer,layer,county,steps_dd)
         =drawdown_stepdiff(county,aquifer,layer,steps_dd);

* release no more than half of capacity per month
WV_RESERVOIR_RELEASE.up(reservoir,month,stateofnature)
         $domain_for_WV_RESERVOIR_RELEASE(reservoir,month,stateofnature)
         =0.5*sum((river,riverplace),reservoircapacity(river, reservoir, riverplace, 'conservation'));

WV_WP_Conservation.up(customer)$do_i_want_wp
         =max(conservation_Reduction(customer),0.1*Demanddata(customer,'mun','annual',"quantity") ) ;
WV_SPRNFLOW.lo(Springs,stateofnature) =springmin(springs)/smin(month,  SpringSeasonal(springs, month)) ;

*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*     setup the initial value of integer variables
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
WV_WP_DO_I_BUILD_WATER.l(Projects) = 0;

EV_PP_DO_I_BUILD_NEW_NGPP.l(POWER_PLANT_ALL, POWER_PLANT_TYPE, POWER_PLANT_COOLING)=0;

EV_PP_DO_I_RETROFIT_COOLING.l(power_plant_all, power_plant_type, power_plant_cooling0, power_plant_cooling) =0;

EV_PP_DO_I_RETROFIT_BOILER.l(power_plant_all, power_plant_type0, power_plant_type, power_plant_cooling)   =0;

EV_WS_NEWBUILD.l(power_plant_all,ws_type)  =0;














$ontext
$ifthen.energy setglobal energy
*^^^^^^^^^^^^^^^^^^^^^^^^^^^^
* energy part domain        ^
*^^^^^^^^^^^^^^^^^^^^^^^^^^^^

* recirculating ponds
      EV_PP_POND.up(power_plant_all,power_plant_type, 'rc', month, stateofnature)
             $domain_for_EV_PP_POND(power_plant_all,power_plant_type, 'rc', month, stateofnature)
       = 2*pp_waterusage(power_plant_all, power_plant_type, 'rc')
                   *pp_potential_all(power_plant_all, power_plant_type, 'rc', 'capacity')*24*31    ;

*once through pond
      EV_PP_POND.up(power_plant_all,power_plant_type, 'oc', month, stateofnature)
             $domain_for_EV_PP_POND(power_plant_all,power_plant_type, 'oc', month, stateofnature)
          = (5*31*24
             * pp_potential_all(power_plant_all, power_plant_type, 'oc', 'capacity')
            *pp_potential_all(power_plant_all, power_plant_type, 'oc', 'capacity_factor')
            *pp_waterusage(power_plant_all, power_plant_type, 'oc'))
                 $pp_potential_all(power_plant_all, power_plant_type, 'oc', 'capacity')
;

* recirculating ponds
      EV_PP_POND_Ini.up(power_plant_all,power_plant_type, 'rc', month, stateofnature)
             $domain_for_EV_PP_POND(power_plant_all,power_plant_type, 'rc', month, stateofnature)
       = 2*pp_waterusage(power_plant_all, power_plant_type, 'rc')
                   *pp_potential_all(power_plant_all, power_plant_type, 'rc', 'capacity')*24*31    ;

*once through pond
      EV_PP_POND_Ini.up(power_plant_all,power_plant_type, 'oc', month, stateofnature)
             $domain_for_EV_PP_POND(power_plant_all,power_plant_type, 'oc', month, stateofnature)
          = (5*31*24
             * pp_potential_all(power_plant_all, power_plant_type, 'oc', 'capacity')
            *pp_potential_all(power_plant_all, power_plant_type, 'oc', 'capacity_factor')
            *pp_waterusage(power_plant_all, power_plant_type, 'oc'))
                 $pp_potential_all(power_plant_all, power_plant_type, 'oc', 'capacity')
;

* to simplify the model, assume once through pond is larger than 20 day water usage
      EV_PP_POND_Ini.lo(power_plant_all,power_plant_type, 'oc', month, stateofnature)
             $domain_for_EV_PP_POND(power_plant_all,power_plant_type, 'oc', month, stateofnature)
          = (20*24
             * pp_potential_all(power_plant_all, power_plant_type, 'oc', 'capacity')
            *pp_potential_all(power_plant_all, power_plant_type, 'oc', 'capacity_factor')
            *pp_waterusage(power_plant_all, power_plant_type, 'oc'))
                 $pp_potential_all(power_plant_all, power_plant_type, 'oc', 'capacity')
;

      EV_PP_POND.lo(power_plant_all,power_plant_type, 'oc', month, stateofnature)
             $domain_for_EV_PP_POND(power_plant_all,power_plant_type, 'oc', month, stateofnature)
          = (20*24
             * pp_potential_all(power_plant_all, power_plant_type, 'oc', 'capacity')
            *pp_potential_all(power_plant_all, power_plant_type, 'oc', 'capacity_factor')
            *pp_waterusage(power_plant_all, power_plant_type, 'oc'))
                 $pp_potential_all(power_plant_all, power_plant_type, 'oc', 'capacity')
;

$endif.energy

$offtext
