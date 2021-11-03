
$ifthen setglobal hourly
$    setglobal addhour ,agg_hour
$else
$    setglobal addhour
$endif


$include '%whereispowerplant%data_pp_set_all.gms'

$include '%whereispowerplant%data_pp_link_exist.gms'
$include '%whereispowerplant%data_pp_capacity_location.gms'
$include '%whereispowerplant%data_pp_waterdiverter.gms'
$include '%whereispowerplant%data_pp_fuel_generation.gms'
$include '%whereispowerplant%data_pp_demand.gms'
$include '%whereispowerplant%data_pp_cost_renewable_exist.gms'
$include '%whereispowerplant%data_pp_cost_conventional_exist.gms'
$include '%whereispowerplant%data_pp_cost_new_ngcc.gms'
$include '%whereispowerplant%data_pp_hydro.gms'


$include '%whereispowerplant%calc_pp_coolingwater.gms'
$include '%whereispowerplant%calc_pp_cost.gms'
$include '%whereispowerplant%calc_pp_demand.gms'
$include '%whereispowerplant%calc_pp_buildup_tuples.gms'


*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*   Generation Adjustment if set model as hourly
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

*genartion adjustment by power plant type
*this will be more detailed when work on the solar and wind power plant
parameter gen_adj1(power_plant_type, hour) adjust the generation of solar
          gen_adj(power_plant_type%addhour%) adjust the generation of solar ;

gen_adj1(power_plant_type, hour)=1;
gen_adj1('solar', hour)=0;
*texas avarage peak hour is 5.64 hours, assume between 12:30-5pm
gen_adj1('solar', '12')=0.64;
gen_adj1('solar', '13')=1;
gen_adj1('solar', '14')=1;
gen_adj1('solar', '15')=1;
gen_adj1('solar', '16')=1;
gen_adj1('solar', '17')=1;

$ifthen.a setglobal hourly
gen_adj(power_plant_type, agg_hour)
      = sum(map_agg_hour(hour, agg_hour), gen_adj1(power_plant_type,hour))
       / sum(hour, 1$map_agg_hour(hour, agg_hour)) ;

$else.a
gen_adj(power_plant_type)
      = sum(hour, gen_adj1(power_plant_type,hour))
       / 24 ;

$endif.a

display gen_adj  ;

*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*  Merge the cost of all power plants to pp_potential_all
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

$include '%whereispowerplant%calc_pp_potential_all.gms'


set pp_potential_exist(county, power_plant_all, power_plant_type, power_plant_cooling)   link the cooling and boiler of all power plants ;
    pp_potential_exist(county, power_plant_all, power_plant_type, power_plant_cooling)
         $sum(pp_location(county, power_plant_all) ,pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling, 'capacity') )
           =yes;

*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* water usage calculation
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

$include '%whereispowerplant%calc_pp_waterusage.gms'

*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* Build new renewable power plants
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

$include '%whereispowerplant%data_pp_cost_new_renewable.gms'
$include %whereispowerplant%calc_pp_new_renewable.gms

*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* the electricity transmission lines
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

$include  %whereispowerplant%data_pp_transmission.gms
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* water consumption/ diversion rate and the return rate
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
parameter PP_water_consdiv_rate(power_plant_cooling)   the power plant water consumption rate
/
ri 1
rc 1
oc 0.1
on 1
/   ;

parameter PP_water_returnrate(power_plant_cooling)       the power plant water return rate
/ on 0.9/;
