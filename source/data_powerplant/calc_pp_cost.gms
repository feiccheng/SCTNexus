$ifthen not declared boiler_retrofitcost
parameter boiler_retrofitcost(power_plant_all, pp_alli)                                                    existing coal boiler retrofit cost ;
parameter heat_percent(power_plant_all)                                                                    % of the fuel used for heat purpose
          heat_percent1(power_plant_all, years, month)                                                     temp % of fuel used for heat purpose ;
$endif



*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* Calculate cooling retrofit cost
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

*new ngcc
newpp_cooling_retrofitcost(power_plant_all, power_plant_cooling, power_plant_cooling_retrofit, 'cooling_capital_cost')
    $newpp_cooling_retrofitcost(power_plant_all, power_plant_cooling, power_plant_cooling_retrofit, 'capacity')
    = newpp_cooling_retrofitcost(power_plant_all, power_plant_cooling, power_plant_cooling_retrofit, 'cooling_capital_cost')
     /newpp_cooling_retrofitcost(power_plant_all, power_plant_cooling, power_plant_cooling_retrofit, 'capacity') ;


*existing
* the retrofit cost of broiler and cooling system is the difference between current cost and retrofit cost
* now we add them back
cooling_retrofitcost(power_plant_all, power_plant_cooling, power_plant_cooling_retrofit, 'cooling_fixed_om')
   $cooling_retrofitcost(power_plant_all, power_plant_cooling, power_plant_cooling_retrofit, 'cooling_fixed_om')
        = cooling_existcost(power_plant_all,  power_plant_cooling, 'cooling_fixed_om')
          +cooling_retrofitcost(power_plant_all, power_plant_cooling, power_plant_cooling_retrofit, 'cooling_fixed_om')  ;


*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* Calculate boiler retrofit cost
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* source: NEMS retrofit coal boiler to natural gas boiler
* capital cost increment in dollar per kw = 267*(75/cap)^0.35
* fixed om is reduced by 33%
* variable om is reduced by 25%
* heat rate penalty is 5%
         boiler_retrofitcost(power_plant_all, 'capacity')
       =boiler_cost(power_plant_all, 'capacity')  ;

         boiler_retrofitcost(power_plant_all, 'capacity_factor')$boiler_cost(power_plant_all, 'capacity')
       =capacity_factor(power_plant_all)  ;


          boiler_retrofitcost(power_plant_all, 'boiler_capital_cost')$boiler_cost(power_plant_all, 'capacity')
       =267*(75/boiler_cost(power_plant_all, 'capacity'))**0.35*1000;

          boiler_retrofitcost(power_plant_all, 'boiler_fixed_om')
       = boiler_cost(power_plant_all, 'boiler_fixed_om')*0.67;
          boiler_retrofitcost(power_plant_all, 'heatrate')
      =boiler_cost(power_plant_all,'heatrate')*0.95;


*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* Calculate cost for heat/electricity hybrid plants
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


 heat_percent1(power_plant_all, years, month)
       $ totalfuel(power_plant_all, years, month)
 = 1-electricfuel(power_plant_all, years, month)/ totalfuel(power_plant_all, years, month)  ;

 heat_percent1(power_plant_all, years, month)$( heat_percent1(power_plant_all, years, month)   <0)=0;

heat_percent(power_plant_all)
         $sum( (years, month), heat_percent1(power_plant_all, years, month))
        =sum( (years, month),heat_percent1(power_plant_all, years, month))/sum( (years, month),1$heat_percent1(power_plant_all, years, month))   ;

*display heat_percent,  heat_percent1, power_plant_exist;

heat_percent('canyon')=0;
heat_percent('CedroHill')=0;
heat_percent('ECRPapalote2')=0;
