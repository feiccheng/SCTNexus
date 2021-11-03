$ontext
TO DO List
1. change edwards aquifer recharge regression equation
2. livestock budget needs to be updated  in calc_ag_bud
3. edwards recharge needs updates
$offtext

set version(*,*)    the version of data and files;

$include  '%whereisunifying%data_allsets.gms'
$include  '%whereisunifying%data_unify_info.gms'
$include  '%whereismacros%macros_ag_crop_BCyield.gms'

*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* County distances (in miles)
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$include '%whereisunifying%data_unify_distance.gms'


parameter countydistance(citycounty, citycounty) the distance between citycounties in 100 miles;
*One degree of latitude equals approximately 364,000 feet (69 miles).
*One-degree of longitude equals 288,200 feet (54.6 miles).

countydistance(citycounty, county)$(coordinate(citycounty, 'latitude') and coordinate(county, 'latitude'))
    = [  power( (coordinate(citycounty, 'longitude') - coordinate(county, 'longitude'))*54.6, 2)
             + power( (coordinate(citycounty, 'latitude') - coordinate(county, 'latitude'))*69, 2)   ]**0.5;

countydistance(citycounty,city)= sum(mapcitycountytocounty(city, county) , countydistance (citycounty,county));

countydistance(county,citycounty)=   countydistance (county,citycounty)/100;


*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* Historical Climate Info
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* fei move to after ag/water
$include %whereisclimate%data_climate_hist_month.gms

Parameter ClimateS_month(county, states, timing,  Regitems);
 ClimateS_month(county, states, month,  climate)
        $sum(Dates(states,years), 1$Climate_month(county, years,  month,  climate) )
      =sum(Dates(states,years), Climate_month(county, years,  month,  climate) )
         /sum(Dates(states,years), 1$Climate_month(county, years,  month,  climate) )    ;

 ClimateS_month(county, 'Dnormal', month,  climate)
         = ( ClimateS_month(county, 'normal', month,  climate)    + ClimateS_month(county, 'Dry', month,  climate)    )/2;

*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* Ag Part
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$include %whereisag%calc_ag.gms

*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* Water Part
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$include %whereiswater%data_water_pumping.gms


$include %whereiswater%calc_water_river.gms
$include %whereiswater%calc_water_aquifer.gms
$include %whereiswater%calc_water_demand.gms
$include %whereiswater%calc_water_buildup_tuples.gms
$include %whereiswater%data_water_othersources.gms
$include %whereiswater%calc_water_pumpingcost.gms
$include %whereiswater%calc_water_market.gms

*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* Climate Change  Part
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$include %whereisclimate%calc_climate.gms


*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* Water Projects  Part
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

$include %whereiswaterprojects%calc_wp.gms


*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* Power Plants Part
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


$include %whereispowerplant%calc_pp.gms


*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* Model scales and setting
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
parameter  sectorscale(sector)  the scale of sectors to test the nexus effects
;

sectorscale(sector)=1;

parameter elec_climate_adjust(month) the adjustment to electricity demand by month;
elec_climate_adjust(month)=1;

display  elec_climate_adjust  ;


scalar  drawdownpenalty drawdown penalty per feet/10000/
        outtobaybenefit  out to bay benefit      /10/   ;

set uplow  the upper and lower bounds in crop vege and livestock mix/ upper, lower/;
parameter sign_uplow(uplow)    the sign adjustment of upper and lower bounds
    /upper 1, lower -1/;
scalar tolerance_uplow tolerance of upper and lower bounds in the mix
     /0.01/ ;


*~~~~~~~~~~~~~~~~~~~~~~
* create empty arrays to store the recirculating results
*~~~~~~~~~~~~~~~~~~~~


parameter
 WindSolar_NEWexist(power_plant_all,ws_type)                                             exist new solar and wind power plant
 WindSolar_LANDexist(power_plant_all,ws_type,county, zones, landirrtype)                 the land usage of new built exist wind and solar farm     ;
set  ngcc_NEWexist(power_plant_all, power_plant_type, power_plant_cooling)               exist ngcc;

         WindSolar_NEWexist(power_plant_all,ws_type)=0;
         WindSolar_LANDexist(power_plant_all,ws_type,county, zones, landirrtype)  =0;
         ngcc_NEWexist(power_plant_all, power_plant_type, power_plant_cooling) =no;

set  retrofitted_cooling(power_plant_all, power_plant_type, power_plant_cooling)                 retrofitted cooling
     RETROFITted_BOILER(power_plant_all, power_plant_type, power_plant_cooling)                  retrofitted boiler
     retrofitted_cooling_newpp(power_plant_all, power_plant_type, power_plant_cooling)           retrofitted cooling  0f new ngcc;

         retrofitted_cooling(power_plant_all, power_plant_type, power_plant_cooling)=no;
         RETROFITted_BOILER(power_plant_all, power_plant_type, power_plant_cooling)=no;
         retrofitted_cooling_newpp(power_plant_all, power_plant_type, power_plant_cooling)=no;

parameter        aquifer_traded(aquifer,county,sector, county, sector )                                  record  traded edwards permit
                 river_traded(river, riverplace,county,sector, riverlocation,county,sector)  record traded river water right permit      ;

aquifer_traded(aquifer,county1,sector1, county, gsector ) =0;
river_traded(river, riverplace,county,sector, riverlocation,county1,sector1)=0;


