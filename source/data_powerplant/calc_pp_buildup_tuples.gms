$ifthen not declared newpp
set newpp(power_plant_all, power_plant_type, power_plant_cooling)                                          link the new ngcc pp with boiler and cooling types;
set cooling_retrofit(power_plant_all,power_plant_type, power_plant_cooling, power_plant_cooling_retrofit)  the potential cooling retrofit;
set boiler_retrofit(power_plant_all, power_plant_type0, power_plant_type, power_plant_cooling)             retrofit the boiler from 0 to power_plant_type;

$endif


* ~~~~~~~~~~~~~~~~~~~~~~~~~~
* Link New NCC
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
newpp(newngcc, 'ngcc', power_plant_cooling)
    $sum(county, newngcost(newngcc,county, power_plant_cooling,'capacity'))  =yes;

pp_location(county,newngcc)
    $sum(power_plant_cooling, newngcost(newngcc,county, power_plant_cooling,'capacity'))  =yes;


*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*the potential cooling retrofit
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cooling_retrofit(power_plant_all,power_plant_type, power_plant_cooling, power_plant_cooling_retrofit)
     $(sum(power_plant_exist(power_plant_all, power_plant_type, power_plant_cooling)  ,
             cooling_retrofitcost(power_plant_all, power_plant_cooling, power_plant_cooling_retrofit, "cooling_capital_cost"))
     or sum(newpp(power_plant_all, power_plant_type, power_plant_cooling)     ,
             newpp_cooling_retrofitcost(power_plant_all, power_plant_cooling, power_plant_cooling_retrofit, "cooling_capital_cost")))=yes;


*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*the potential boiler retrofit
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   boiler_retrofit(power_plant_all, power_plant_type0, 'ngst', power_plant_cooling)
          $SUM( power_plant_exist(power_plant_all, power_plant_type0, power_plant_cooling),
                  boiler_retrofitcost(power_plant_all, 'boiler_capital_cost')) =yes;