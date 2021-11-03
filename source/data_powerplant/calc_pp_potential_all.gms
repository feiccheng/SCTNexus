$ifthen not declared   pp_potential_all
parameter pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling, pp_alli);
$endif


*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*  Merge the cost of all power plants to pp_potential_all
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling, 'capacity_factor')
       $sum(  power_plant_exist(power_plant_all, power_plant_type, power_plant_cooling) ,
                         capacity_factor(power_plant_all) )
        =sum(  power_plant_exist(power_plant_all, power_plant_type, power_plant_cooling) ,
                         capacity_factor(power_plant_all) );

pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling, 'capacity')
       $sum((  power_plant_exist(power_plant_all, power_plant_type, power_plant_cooling), county) ,
                          powerplantcap(county, power_plant_all, power_plant_type))
       =sum((  power_plant_exist(power_plant_all, power_plant_type, power_plant_cooling) ,county),
                          powerplantcap(county, power_plant_all, power_plant_type));

pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling, 'capital_cost')
       $sum(  power_plant_exist(power_plant_all, power_plant_type, power_plant_cooling) ,
                         fixedcost(power_plant_all) )
        =sum(  power_plant_exist(power_plant_all, power_plant_type, power_plant_cooling) ,
                         fixedcost(power_plant_all)*1000000)
          /pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling, 'capacity')  ;

* existing fossil fuel power plant
pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling, 'heatrate')
       $sum(  power_plant_exist(power_plant_all, power_plant_type, power_plant_cooling) ,
                          cooling_existcost(power_plant_all,  power_plant_cooling, 'heatrate') )
       =sum(  power_plant_exist(power_plant_all, power_plant_type, power_plant_cooling) ,
                          cooling_existcost(power_plant_all,  power_plant_cooling, 'heatrate') );

*display pp_potential_all,  power_plant_exist, cooling_existcost;

*adjusting operation cost by heat_percent for chp
pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling, 'boiler_fixed_om')
       $sum(  power_plant_exist(power_plant_all, power_plant_type, power_plant_cooling) ,
                          cooling_existcost(power_plant_all,  power_plant_cooling, 'boiler_fixed_om'))
       =sum(  power_plant_exist(power_plant_all, power_plant_type, power_plant_cooling) ,
                          [cooling_existcost(power_plant_all,  power_plant_cooling, 'boiler_fixed_om') ]
              )
            *(1-heat_percent(power_plant_all) )
            ;



pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling, 'cooling_fixed_om')
       $sum(  power_plant_exist(power_plant_all, power_plant_type, power_plant_cooling) ,
                          cooling_existcost(power_plant_all,  power_plant_cooling, 'cooling_fixed_om'))
       =sum(  power_plant_exist(power_plant_all, power_plant_type, power_plant_cooling) ,
                          [cooling_existcost(power_plant_all,  power_plant_cooling, 'cooling_fixed_om') ]
              )
             *(1-heat_percent(power_plant_all) );



* retrofit the power plant cooling system
pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling_retrofit, pp_alli)
       $sum(  power_plant_exist(power_plant_all, power_plant_type, power_plant_cooling) ,
              cooling_retrofitcost(power_plant_all, power_plant_cooling, power_plant_cooling_retrofit, pp_alli) )
       = sum(  power_plant_exist(power_plant_all, power_plant_type, power_plant_cooling) ,
              cooling_retrofitcost(power_plant_all, power_plant_cooling, power_plant_cooling_retrofit, pp_alli) );

* capacity factor, heatrate and boiler om cost are the same as it was before retrofit
pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling_retrofit, 'capacity_factor')
       $sum(  cooling_retrofit(power_plant_all,power_plant_type, power_plant_cooling, power_plant_cooling_retrofit) ,
               pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling, 'capacity_factor')   )
       = sum(  power_plant_exist(power_plant_all, power_plant_type, power_plant_cooling) ,
               pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling, 'capacity_factor')   );

pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling_retrofit,'heatrate')
       $sum(  cooling_retrofit(power_plant_all,power_plant_type, power_plant_cooling, power_plant_cooling_retrofit) ,
               pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling, 'heatrate')   )
       = sum(  power_plant_exist(power_plant_all, power_plant_type, power_plant_cooling) ,
               pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling, 'heatrate')   );

pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling_retrofit, 'boiler_fixed_om')
       $sum(  cooling_retrofit(power_plant_all,power_plant_type, power_plant_cooling, power_plant_cooling_retrofit) ,
               pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling, 'boiler_fixed_om')   )
       = sum(  power_plant_exist(power_plant_all, power_plant_type, power_plant_cooling) ,
               pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling, 'boiler_fixed_om')
             * pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling, 'capacity')
             / pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling_retrofit, 'capacity')  );

pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling_retrofit, 'capital_cost')
       $sum(  cooling_retrofit(power_plant_all,power_plant_type, power_plant_cooling, power_plant_cooling_retrofit) ,
               pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling, 'capital_cost')   )
       = sum(  power_plant_exist(power_plant_all, power_plant_type, power_plant_cooling) ,
               pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling, 'capital_cost')
             * pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling, 'capacity')
             / pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling_retrofit, 'capacity')   );


* retrofit the boiler
pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling, pp_alli)
        $sum(boiler_retrofit(power_plant_all, power_plant_type0, power_plant_type, power_plant_cooling),
                          boiler_retrofitcost(power_plant_all, pp_alli)   )
        =sum(boiler_retrofit(power_plant_all, power_plant_type0, power_plant_type, power_plant_cooling),
                          boiler_retrofitcost(power_plant_all, pp_alli)   );

display pp_potential_all,boiler_retrofitcost;
pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling, 'cooling_fixed_om')
           $sum(boiler_retrofit(power_plant_all, power_plant_type0, power_plant_type, power_plant_cooling),
                          boiler_retrofitcost(power_plant_all, 'capacity')   )
           =sum( boiler_retrofit(power_plant_all, power_plant_type0, power_plant_type, power_plant_cooling),
                 pp_potential_all(power_plant_all, power_plant_type0, power_plant_cooling, 'cooling_fixed_om')
                * pp_potential_all(power_plant_all, power_plant_type0, power_plant_cooling, 'capacity')
               / pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling, 'capacity')  );

pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling, 'capital_cost')
           $sum(boiler_retrofit(power_plant_all, power_plant_type0, power_plant_type, power_plant_cooling),
                          boiler_retrofitcost(power_plant_all, 'capacity')   )
           =sum( boiler_retrofit(power_plant_all, power_plant_type0, power_plant_type, power_plant_cooling),
                 pp_potential_all(power_plant_all, power_plant_type0, power_plant_cooling, 'capital_cost')
               * pp_potential_all(power_plant_all, power_plant_type0, power_plant_cooling, 'capacity')
             / pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling, 'capacity')   );


*renewable power plant
pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling,'om_cost')
          $sum( power_plant_exist(power_plant_all, power_plant_type, power_plant_cooling) ,
                      renewable_exist(power_plant_all,power_plant_type, 'om_cost') )
          = sum( power_plant_exist(power_plant_all, power_plant_type, power_plant_cooling) ,
                      renewable_exist(power_plant_all,power_plant_type, 'om_cost') );


pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling,'heatrate')
          $sum( power_plant_exist(power_plant_all, power_plant_type, power_plant_cooling) ,
                      renewable_exist(power_plant_all,power_plant_type, 'heatrate') )
          = sum( power_plant_exist(power_plant_all, power_plant_type, power_plant_cooling) ,
                      renewable_exist(power_plant_all,power_plant_type, 'heatrate') );



pp_potential_all(newngcc, 'ngcc', power_plant_cooling, pp_alli)
          $sum(county,  newngcost(newngcc,county, power_plant_cooling,pp_alli) )
          =sum(county,  newngcost(newngcc,county, power_plant_cooling,pp_alli)) ;






* retrofit alternatives of the cooling system of new ngcc power plants


pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling_retrofit, pp_alli)
       $sum(  cooling_retrofit(power_plant_all,power_plant_type, power_plant_cooling, power_plant_cooling_retrofit) ,
               newpp_cooling_retrofitcost(power_plant_all, power_plant_cooling, power_plant_cooling_retrofit, pp_alli) )
       = sum(  newpp(power_plant_all, power_plant_type, power_plant_cooling) ,
               newpp_cooling_retrofitcost(power_plant_all, power_plant_cooling, power_plant_cooling_retrofit, pp_alli) );

pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling_retrofit, 'capacity')
       $ [sum(  cooling_retrofit(power_plant_all,power_plant_type, power_plant_cooling, power_plant_cooling_retrofit) ,
               pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling, 'capacity')   )
         and  sum(power_plant_cooling,  newpp(power_plant_all, power_plant_type, power_plant_cooling))]
       = sum(  newpp(power_plant_all, power_plant_type, power_plant_cooling),
               pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling, 'capacity')*0.95   );


* capacity factor, heatrate and boiler om cost are the same as it was before retrofit
pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling_retrofit, 'om_cost')
       $ [sum(  cooling_retrofit(power_plant_all,power_plant_type, power_plant_cooling, power_plant_cooling_retrofit) ,
               pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling, 'om_cost')   )
         and  sum(power_plant_cooling,  newpp(power_plant_all, power_plant_type, power_plant_cooling))]
       = sum(  newpp(power_plant_all, power_plant_type, power_plant_cooling),
               pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling, 'om_cost')   );

pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling_retrofit, 'capacity_factor')
       $[sum(  cooling_retrofit(power_plant_all,power_plant_type, power_plant_cooling, power_plant_cooling_retrofit) ,
               pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling, 'om_cost')   )
         and  sum(power_plant_cooling,  newpp(power_plant_all, power_plant_type, power_plant_cooling))]
       = sum(  newpp(power_plant_all, power_plant_type, power_plant_cooling),
               pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling, 'capacity_factor')   );

pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling_retrofit,'heatrate')
       $[sum(  cooling_retrofit(power_plant_all,power_plant_type, power_plant_cooling, power_plant_cooling_retrofit) ,
               pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling, 'om_cost')   )
         and  sum(power_plant_cooling,  newpp(power_plant_all, power_plant_type, power_plant_cooling))]
       = sum( newpp(power_plant_all, power_plant_type, power_plant_cooling) ,
               pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling, 'heatrate')   );

pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling_retrofit, 'boiler_fixed_om')
       $[sum(  cooling_retrofit(power_plant_all,power_plant_type, power_plant_cooling, power_plant_cooling_retrofit) ,
               pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling, 'om_cost')   )
         and  sum(power_plant_cooling,  newpp(power_plant_all, power_plant_type, power_plant_cooling))]
       = sum(  newpp(power_plant_all, power_plant_type, power_plant_cooling),
               pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling, 'boiler_fixed_om')   );

pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling_retrofit, 'capital_cost')
       $[sum(  cooling_retrofit(power_plant_all,power_plant_type, power_plant_cooling, power_plant_cooling_retrofit) ,
               pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling, 'om_cost')   )
         and  sum(power_plant_cooling,  newpp(power_plant_all, power_plant_type, power_plant_cooling))]
       = sum( newpp(power_plant_all, power_plant_type, power_plant_cooling) ,
               pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling, 'capital_cost')   );


display pp_potential_all;



* give the coal powerplant ngcc drycooling options
pp_potential_all(power_plant_all, 'ngst', 'Drycooling',pp_alli)
   $(boiler_cost(power_plant_all, 'capacity'))
        = sum(power_plant_cooling, pp_potential_all(power_plant_all, 'ngst', power_plant_cooling,pp_alli) ) ;

pp_potential_all(power_plant_all, 'ngst', 'Drycooling',pp_alli)
   $(boiler_cost(power_plant_all, 'capacity') and pp_potential_all(power_plant_all, 'ngst', 'Drycooling',pp_alli) =0)
    = pp_potential_all(power_plant_all, 'coal', 'Drycooling',pp_alli);

pp_potential_all(power_plant_all, 'ngst', 'Drycooling','capacity')
   $boiler_cost(power_plant_all, 'capacity')
    = pp_potential_all(power_plant_all, 'coal', 'Drycooling','capacity');

pp_potential_all(power_plant_all, 'ngst', 'Drycooling','cooling_fixed_om')
   $boiler_cost(power_plant_all, 'capacity')
    = pp_potential_all(power_plant_all, 'coal', 'Drycooling','cooling_fixed_om');

* covert 20 year 5.5% capital cost to 60 year #% by multiplying 0.432
pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling, 'capital_cost')
        = 0.432* pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling, 'capital_cost') ;

pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling, 'cooling_capital_cost')
        = 0.432* pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling, 'cooling_capital_cost') ;

pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling, 'boiler_capital_cost')
        = 0.432* pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling, 'boiler_capital_cost') ;

cooling_retrofitcost(power_plant_all, power_plant_cooling0, power_plant_cooling, 'cooling_capital_cost')
       = 0.432*cooling_retrofitcost(power_plant_all, power_plant_cooling0, power_plant_cooling, 'cooling_capital_cost') ;

newpp_cooling_retrofitcost(power_plant_all, power_plant_cooling0, power_plant_cooling, 'cooling_capital_cost')
       =0.432*newpp_cooling_retrofitcost(power_plant_all, power_plant_cooling0, power_plant_cooling, 'cooling_capital_cost')   ;

boiler_retrofitcost(power_plant_all, 'boiler_capital_cost')
       =0.432*boiler_retrofitcost(power_plant_all, 'boiler_capital_cost');

cooling_retrofit(power_plant_all,'ngst', power_plant_cooling, power_plant_cooling_retrofit)
           $(boiler_cost(power_plant_all, 'capacity'))
         = cooling_retrofit(power_plant_all,'coal', power_plant_cooling, power_plant_cooling_retrofit);

pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling, 'om_cost')
   = pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling, 'om_cost')
   + pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling, 'cooling_fixed_om')
   + pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling, 'boiler_fixed_om');


pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling, 'variable_cost')
       $(  exist_variable_cost(power_plant_all, power_plant_cooling)
       and pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling, 'capacity') )
         = exist_variable_cost(power_plant_all, power_plant_cooling)    ;

* overwrite the O&M cost of coal and natural gas power plants if the om cost is greater thn 13000 for ng and 55500 for coal

pp_potential_all(power_plant_all,'ngcc', power_plant_cooling, 'om_cost')
        $( pp_potential_all(power_plant_all,'ngcc', power_plant_cooling, 'om_cost')>13000)= 13000;

pp_potential_all(power_plant_all,'ngst', power_plant_cooling, 'om_cost')
        $( pp_potential_all(power_plant_all,'ngst', power_plant_cooling, 'om_cost')>13000)= 13000;

pp_potential_all(power_plant_all,'nggt', power_plant_cooling, 'om_cost')
        $( pp_potential_all(power_plant_all,'nggt', power_plant_cooling, 'om_cost')>13000)= 13000;

pp_potential_all(power_plant_all,'coal', power_plant_cooling, 'om_cost')
        $( pp_potential_all(power_plant_all,'coal', power_plant_cooling, 'om_cost')>55500)= 55500;


pp_potential_all(power_plant_all,'ngcc', power_plant_cooling, 'variable_cost')
        $( pp_potential_all(power_plant_all,'ngcc', power_plant_cooling, 'variable_cost')>2)= 2;

pp_potential_all(power_plant_all,'ngst', power_plant_cooling, 'variable_cost')
        $( pp_potential_all(power_plant_all,'ngst', power_plant_cooling, 'variable_cost')>2)= 2;

pp_potential_all(power_plant_all,'nggt', power_plant_cooling, 'variable_cost')
        $( pp_potential_all(power_plant_all,'nggt', power_plant_cooling, 'variable_cost')>2)= 2;

pp_potential_all(power_plant_all,'coal', power_plant_cooling, 'variable_cost')
        $( pp_potential_all(power_plant_all,'coal', power_plant_cooling, 'variable_cost')>6)= 6;

*pp_potential_all(power_plant_all,power_plant_type, power_plant_cooling, 'variable_cost') =0;


pp_potential_all( power_plant_all, power_plant_type, power_plant_cooling,'TotalCapCost')
      =    pp_potential_all( power_plant_all, power_plant_type, power_plant_cooling,'capacity')
            *(pp_potential_all( power_plant_all, power_plant_type, power_plant_cooling,'capital_cost')
            +pp_potential_all( power_plant_all, power_plant_type, power_plant_cooling,'cooling_capital_cost')
            +pp_potential_all( power_plant_all, power_plant_type, power_plant_cooling,'boiler_capital_cost') )   ;

pp_potential_all( power_plant_all, power_plant_type, power_plant_cooling,'TotalOMCost')
      =    pp_potential_all( power_plant_all, power_plant_type, power_plant_cooling,'capacity')
          *pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling, 'om_cost') ;
