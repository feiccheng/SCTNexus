
Set power_plant_all                                              powerplant names
           /
$include %whereispowerplant%data_pp_set_conventional_exist.gms
$include %whereispowerplant%data_pp_set_renewable_exist.gms
$include %whereispowerplant%data_pp_set_new_ngccrecirculate.gms
$include %whereispowerplant%data_pp_set_new_ngccdry.gms
$include %whereispowerplant%data_pp_set_new_solar.gms
$include %whereispowerplant%data_pp_set_new_wind.gms
 /  ;
set    renewable_power_plant(power_plant_all)                    existing renewable power plant
      /
$include %whereispowerplant%data_pp_set_renewable_exist.gms
      /  ;

set    conventional_power_plant(power_plant_all)                 existing conventional power plant
     /
$include %whereispowerplant%data_pp_set_conventional_exist.gms
    /   ;

set newngccdry(power_plant_all)                                  new ngcc power plant use dry cooling
/
$include %whereispowerplant%data_pp_set_new_ngccdry.gms
/
;

set newngcc(power_plant_all)                                     new ngcc power plant
/
$include %whereispowerplant%data_pp_set_new_ngccrecirculate.gms
$include %whereispowerplant%data_pp_set_new_ngccdry.gms
/;

set newwindpp(power_plant_all)                                     new wind farm
/
$include %whereispowerplant%data_pp_set_new_wind.gms
/  ;

set newsolarpp(power_plant_all)                                    new solar farm
/
$include %whereispowerplant%data_pp_set_new_solar.gms
/;


set
    power_plant_type         existing power plant type
   /coal           coal fired power plant
    ngcc           natural gas combined cycle
    ngst           natural gas steam turbine
    nggt           natural gas combustion turbine
    hydro          hydro power plant
    solar          solar power plant
    wind           wind power plant
    biomass        biomass power plant
    petroleum
    /
   power_plant_cooling      existing power plant cooling system
   /rc            recirculating cooling with pond
    ri            recirculating without pond
    on            once through without pond
    oc            once through with pond
    none          no cooling needed
    DryCooling    dry cooling
*    re            general recirculating
   /;


alias (power_plant_type, power_plant_type0), (power_plant_cooling,  power_plant_cooling0), (power_plant_all, power_plant_all0);
alias (power_plant_cooling, power_plant_cooling_retrofit);
alias (power_plant_type, power_plant_type_retrofit);


set pp_alli             cost and other items in the power plants and energy part
/om_cost
 capital_cost
 wind_capital_cost      build new wind power plant capitial cost in dollar per mw
 wind_fixed_om          build new wind power plant fixed operating om cost in dollar per mw
 solar_capital_cost     build new solar power plant capital cost in dollar per mw
 solar_fixed_om         build new solar power plant fixed operating om cost in dollar per mw
 cooling_capital_cost   capital cost of new cooling retrofit in dollar per mwh
 cooling_fixed_om       increment cooling fixed om cost in dollar per mwh
 boiler_fixed_om        exist boiler fixed om cost in dollar per mwh
 boiler_variable_om     exist boiler variable om cost in dollar per mwh
 boiler_capital_cost    capital cost of new boiler retrofit in dollar per mw
 boiler_fixed_om_new    new boiler fixed om cost in dollar per mw
 boiler_variable_om_new new boiler variable om cost in dollar per mw
 windspeed              wind speed in m per second
 solarhour              solar in kwh per kw per day
 capacity               power generation capacity in mw
 capacity_factor        capacity_factor
 heatrate               heat rate in mmbtu per Mwh
 fuelprice              fuel price in dollar per mmbtu
 fuelheat               fuel heat in mmbtu per ton
 variable_cost          variable cost
 profit                 the profit of power plant to adjust the cost
 waterflow             cooling water Intake rate at acft per hour
 tempdiff               temperature difference of intake and discharged water in C
 evap                   cooling water evaporation
 drift                  cooling water drift
 blowdown               cooling water blow down
 consumption            cooling water consumption
 solarpotential         solar insolation rate(KWh per sq.m per day)
 landuse                the land use of wind and solar
 generation             wind and solar generation per machine or squre meter
 efficiency             solar efficiency
 trans                  fuel transportation cost
 TotalCapCost           total Capital Cost
 TotalOMCost            total OM Cost

/ ;

set fuel /coal, ng, biomass,petroleum/;
