$ifthen not declared climate_demand
*water demand part
parameter  climate_Demand(citycounty, sector,decades)                    the water demand percentage changes under climate change and population growth;
parameter  climatewaterdemand( citycounty, month, scenarios, decades)    municipal water demand adjustment based on Griffin's paper ;

* electricity demand part
Parameter elect_demand_climate(month, scenarios, decades)                # electricity demand under climate change
          elect_demand_climate_perc(month, scenarios, decades )          # electricity demand percentage change under climate change
          pop_elec(decades)                                              population used for electricity calculation it is based on 2015 population of south_central and southern region defined by ecrot
          summertemp(Month, scenarios, decades)                          summer temperature for electricity demand calculation purpose
          wintertemp(Month, scenarios, decades)                          winter temperature for electricity demand calculation purpose  ;

parameter ind_Growth(decades)
/
2020   1
2030   1.1
2040   1.2
2050   1.3
2060   1.4
2070   1.5
2080   1.6
2090   1.7
/;


$endif


*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*   Water Demand Changes
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 climate_Demand(county, "ind",decades)
          $(industrialprojection(county, decades) and Demanddata(County,'ind','annual',"quantity"))
      = industrialprojection(county, decades)*inregion_Pop_per(County)
        /industrialprojection(county, '2020') ;

  climate_Demand(citycounty, "mun",decades)
          $Demanddata(cityCounty,'mun','annual',"quantity")
       = populationpercentagechange(decades, citycounty);

  climate_Demand(citycounty, "ind",'2080')$climate_Demand(citycounty, "ind",'2060')
        =  climate_Demand(citycounty, "ind",'2070')
           *  climate_Demand(citycounty, "ind",'2070')/climate_Demand(citycounty, "ind",'2060');

  climate_Demand(citycounty, "ind",'2090')$climate_Demand(citycounty, "ind",'2060')
        =  climate_Demand(citycounty, "ind",'2080')
           *  climate_Demand(citycounty, "ind",'2070')/climate_Demand(citycounty, "ind",'2060');

  climate_Demand(county, "ind",decades)
             $ (Demanddata(County,'ind','annual',"quantity") and climate_Demand(county, "ind",decades) =0)
           = min(climate_Demand(county, "mun",decades), ind_Growth(decades) );

$ontext
  climate_Demand(county,sector,decades)
         $waterdemand_change_new(county,sector,decades)
         =waterdemand_change_new(county,sector,decades)  ;

  climate_Demand(city,sector,decades)
         $sum(mapcitycountytocounty(city, county),waterdemand_change_new(county,sector,decades))
         =sum(mapcitycountytocounty(city, county),waterdemand_change_new(county,sector,decades))   ;
$offtext

  climate_Demand(citycounty, sector,decades)$(decades.val le 2020)=0;

display climate_demand;
*municipal water demand adjustment based on Griffin and Chang (1999)

climatewaterdemand( county, month, scenarios, decades)
             $(decades.val>2010
               and sum( climate_scenarios(gcms, rcps,  scenarios) , ClimateWaterDemandraw(gcms, rcps, decades, county, month)))
     =sum( climate_scenarios(gcms, rcps,  scenarios) ,
                 ClimateWaterDemandraw(gcms, rcps, decades, county, month)
               / ClimateWaterDemandraw(gcms, 'historical', '2010', county, month))
       ;

 climatewaterdemand( county, month, 'base' , baseyear) =1;
 climatewaterdemand( county, month, 'base' , decades)$climatewaterdemand( county, month, 'miroc5_rcp26' , decades) =1;

 climatewaterdemand( city, month, scenarios, decades)
       =sum(mapcitycountytocounty(city, county), climatewaterdemand( county, month, scenarios, decades) );


*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*   electricity Demand Changes
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


pop_elec(decades)=regionalPopulation(decades);

summertemp(Month, scenarios, decades)
       $sum(climate_scenarios(gcms, rcps,  scenarios),   climate_proj('bexar', gcms, rcps, decades, Month,'tmean') )
     =max(0,  sum(climate_scenarios(gcms, rcps,  scenarios),
                   climate_proj('bexar', gcms, rcps, decades, Month,'tmean')- 20.5)) ;

wintertemp(Month, scenarios, decades)
     $sum(climate_scenarios(gcms, rcps,  scenarios),  climate_proj('bexar', gcms, rcps, decades, Month,'tmean'))
     =min(0,  sum(climate_scenarios(gcms, rcps,  scenarios),
                   climate_proj('bexar', gcms, rcps, decades, Month,'tmean')- 15.5)) ;


* G:\My Drive\EDSIMR\Elec Generation

* based on regression result
elect_demand_climate(month, scenarios, decades)
        $( pop_elec(decades)
            and sum(climate_scenarios(gcms, rcps,  scenarios),   climate_proj('bexar', gcms, rcps, decades, Month,'tmean') ))
      =  -4.9725 + 0.8873* log(  pop_elec(decades))
         + 0.0457* summertemp(Month, scenarios, decades)
         -0.0144 * wintertemp(Month, scenarios, decades) ;
* climate change effects
elect_demand_climate_perc(month, scenarios, decades)
      $( elect_demand_climate(month, 'base', decades)  and elect_demand_climate(month, scenarios, decades))
      = exp(elect_demand_climate(month, scenarios, decades)  )
       / exp(elect_demand_climate(month, 'base', decades) )  ;

* this base scenario is population growth effects
elect_demand_climate_perc(month, 'base', decades)
      $( elect_demand_climate(month, 'base', baseyear)  and elect_demand_climate(month, 'base', decades))
      = exp(elect_demand_climate(month, 'base', decades)  )
       / exp(elect_demand_climate(month, 'base', baseyear) )  ;

display elect_demand_climate_perc, elect_demand_climate, pop_elec, regionalPopulation , populationpercentagechange, industrialprojection;


