$ifthen not declared  mapwindsolar
set mapwindsolar(power_plant_all, county, ws_type)                                       link the wind and solar power plants with types and location;
parameter solar_month(power_plant_all, county,states, month, pp_alli)                    calcuate solar monthly generation and efficiency;

parameter windsolar_all(power_plant_all,county, ws_type, pp_alli)                        wind solar cost and other data
          windsolar_generation(power_plant_all,county, ws_type,month%addhour%,states)    windsolar generation (wind in the unit of per turbine and solar in the unit of per MW panel);
$endif

*source:http://web.mit.edu/windenergy/windweek/Presentations/Wind%20Energy%20101.pdf
* this calculate the capacity of individual turbine
      newwind(power_plant_all,county,windtype,"capacity")
      =0.5*density*3.14*blade*blade*Power(newwind(power_plant_all,county, windtype, "windspeed"),3)*powereff/1000000;

 newwind(power_plant_all,county,windtype,"capital_cost")
    =newwind(power_plant_all,county,windtype,"capital_cost")
     * newwind(power_plant_all,county,windtype,"capacity")  ;

 newwind(power_plant_all,county,windtype,"om_cost")
    =newwind(power_plant_all,county,windtype,"om_cost")
     * newwind(power_plant_all,county,windtype,"capacity")  ;


* solar source
*https://www.nrel.gov/docs/fy14osti/62641.pdf
* efficiency is about 1/7
    newsolar(power_plant_all, county, "capital_cost")
    =  newsolar(power_plant_all, county, "capital_cost")/7;

      newsolar(power_plant_all, county, "om_cost")
  =  newsolar(power_plant_all, county, "om_cost")  /7;


option mapwindsolar<newwind;

mapwindsolar(power_plant_all, county, 'solar')
     $ newsolar(power_plant_all,county, 'capital_cost')=yes;

* 1/7 is max potential efficiency
   solar_month(power_plant_all, county,states, month, 'efficiency')
         = sum(mapwindsolar(power_plant_all, county,'solar'),  1-[0.15+ 0.0047*ClimateS_month(county, states, month,  'tmean')])/7;
*generation unit MW, as solar panel in 1000 sqm
   solar_month(power_plant_all, county,states, month, 'generation')
         =sum(mapwindsolar(power_plant_all, county, 'solar'),
                     solarradiation(county,month)
                    *Days(month)
                    *solar_month(power_plant_all, county,states, month, 'efficiency') );


* build new wind power plant
   windsolar_all(power_plant_all,county, 'landbase',  pp_alli)
           $newwind(power_plant_all,county, 'landbase',pp_alli)
           =newwind(power_plant_all,county,'landbase', pp_alli)      ;

   windsolar_all(power_plant_all, county,'landbase', 'landuse')
        $windsolar_all(power_plant_all,county, 'landbase', 'capacity')
        = land_wind * windsolar_all(power_plant_all,county, 'landbase', 'capacity')    ;

   windsolar_all(power_plant_all, county,'offshore',  pp_alli)
           $newwind(power_plant_all,county, 'offshore',pp_alli)
           =newwind(power_plant_all,county,'offshore', pp_alli)      ;


  windsolar_all(power_plant_all,county, 'solar',pp_alli)
           $ newsolar(power_plant_all,county, pp_alli)
           =newsolar(power_plant_all,county, pp_alli)      ;

* land use per 1mw theory capacity ( should be 1000 m2, but with other use, about 3000 m2)
    windsolar_all(power_plant_all,county, 'solar', 'landuse')
          $windsolar_all(power_plant_all,county, 'solar', 'capital_cost')
           = land_solar/7     ;
* real capacity per 1mw theory capacity  (theory capacity factor)
    windsolar_all(power_plant_all,county, 'solar', 'capacity')
          $windsolar_all(power_plant_all,county, 'solar', 'capital_cost')
          =1/7;

*5.64 is the total hours in a day
*   gen_adj('solar', agg_hour)*sum(hour, 1$map_agg_hour(agg_hour, hour))/5.64 is the percentage of total generation
 windsolar_generation(power_plant_all, county,'solar',month%addhour%, states)
          =solar_month(power_plant_all, county,states, month, 'generation')
           *gen_adj('solar'%addhour%)*sum(hour, 1$map_agg_hour(hour%addhour%))/5.64

 ;

 windsolar_generation(power_plant_all,county, windtype,month%addhour%, states)
         =    newwind(power_plant_all,county,windtype,"capacity")
            * newwind(power_plant_all,county,windtype,"capacity_factor")
            * Days(month)
            * sum(hour, 1$map_agg_hour(hour%addhour%))

;


display windsolar_all;