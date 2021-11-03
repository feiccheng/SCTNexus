Demanddata(citycounty,sector,'annual',"quantity")
         $climate_Demand(citycounty,sector,decadehere)
         = save_Demanddata(citycounty,sector,'annual',"quantity")
          * climate_Demand(citycounty,sector,decadehere)     ;


SAWSEdwardsProp(stateofnature)
         =SAWSLimit(stateofnature,decadehere) ;

conservation_Reduction(citycounty)
         =demand_reduction(citycounty, decadehere);

population(citycounty)
         = save_population(citycounty)
         * climate_Demand (citycounty,'mun',decadehere);

totalpop
         =sum(county, population(county));

demanddata_pp('quantity')
         = save_demanddata_pp('quantity')
          *totalpop/save_totalpop;

MAG(county,aquifer)
         =MAG_climate(county,aquifer,decadehere);

exist_supply(aquifer,county)
         =exist_supply_climate(aquifer,county,decadehere);

$include '%whereiswater%calc_water_endlift.gms'
$include '%whereiswater%calc_water_countypumpingcost.gms'




