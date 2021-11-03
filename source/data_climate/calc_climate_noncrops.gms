$ifthen not declared maplivestock_animal

set maplivestock_animal(livestock, animal)/

(Angoras       ,    MeatGoatsFarm ,    MeatGoatsRange,    SheepHair , SheepWool    ).sheep
 StockersWinter.SteerCalfStocker
 CowCalf       .   CowCalf       /;

parameter
climate_livestock_p(decades, animal, Fregion)                       converge FASOM data to percentage change based on 2015
climate_livestock(county, livestock, decades)                       county level livestock change
 ;

* climate data part
parameter
climate_proj(county, gcms, rcps, decades, Month,climate)                         the GCMs simulated future projection climate data  ;
parameter climate_climate_perc(county, scenarios, decades, Month,climate)        percentage change of climate data
          climateS_scenario(county,month, states,scenarios, decades_sim,climate) the climate data by scenarios and son;

* water part (rivers and aquifer recharge)
parameter climate_inflow_perc(riverlocation, gcms, rcps, decades, month)     inflow under climate change;
parameter climate_recharge(Aquifer, layer, county, scenarios, decades)       aquifer recharge under climate change
          climate_recharge_perc(Aquifer, layer, county, scenarios, decades)  percentage change of recharge under climate change ;

$endif

*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*  livestock yield changes under climate change
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~
climate_livestock_p(decades_sim, animal, Fregion)
               =( climatelivestockF(decades_sim, animal, Fregion)+100)
                 / (climatelivestockF(baseyear, animal, Fregion)+100)  ;

climate_livestock(county, livestock, decades_sim)
               = sum(( regioncountymap (Fregion, county), maplivestock_animal(livestock, animal)),
                      climate_livestock_p(decades_sim, animal, Fregion));

display climate_livestock;
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*  climate data calculation
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~
climate_proj(county, gcms, rcps, decades, Month,climate)
       = climate_proj_raw(county, gcms, rcps, decades, Month,climate)       ;

climate_proj(county, gcms, rcps, decades, Month,climate)
        $(decades.val<2021) =0;

climate_proj(county, 'none', 'none', decades_sim, Month,climate)
       $sum(years$Climate_month(county, years,  month,  climate),1 )
     =   sum(years, Climate_month(county, years,  month,  climate) )
        / sum(years$Climate_month(county, years,  month,  climate),1 )       ;

climate_proj(county, gcms, rcps, decades, Month,climate)
        $(decades.val<2016) =0;

*calculate the percentage chagnes
climate_climate_perc(county, scenarios, decades_sim, Month,climate)
            $climate_proj(county, 'none', 'none', decades_sim, Month,climate)
         = sum(climate_scenarios(gcms, rcps,  scenarios),
                   climate_proj(county, gcms, rcps, decades_sim, Month,climate) )
           /climate_proj(county, 'none', 'none', decades_sim, Month,climate) ;

climate_climate_perc(county, 'base', decades_sim, Month,climate)
            $climate_proj(county, 'none', 'none', decades_sim, Month,climate)   =1;

* climate data  by scenarios
climateS_scenario(county,month, state,scenarios, decades_sim,climate)
         = ClimateS_month(county, state, month,climate)
           *climate_climate_perc(county, scenarios, decades_sim, Month,climate)  ;

*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*  Water Part Climate Change Impacts
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* calculate SWAT effects on river inflow

climate_inflow_perc(riverlocation, gcms, rcps, decades_sim, month)
      $swat(riverlocation, gcms, rcps, baseyear, month, 'FLOW_OUT_mean')
     = swat(riverlocation, gcms, rcps, decades_sim, month, 'FLOW_OUT_mean')
       /swat(riverlocation, gcms, rcps, baseyear, month, 'FLOW_OUT_mean')    ;

climate_inflow_perc(riverlocation, 'none', 'none', decades_sim, month)=1;

climate_inflow_perc(riverlocation, gcms, rcps, decades_sim, month)
         $(climate_inflow_perc(riverlocation, gcms, rcps, decades_sim, month)>5) =5;


* calculate the effects on aquifer recharge

climate_recharge(Aquifer, layer, county, scenarios, decades)
       $  sum((climate_scenarios(gcms, rcps,  scenarios),   month),
                climate_proj(county, gcms, rcps, decades, Month,'tmax'))
      = sum(climate_scenarios(gcms, rcps,  scenarios),
              RegRecharge(Aquifer, layer, county, 'ppt')
              * sum(month, climate_proj(county, gcms, rcps, decades, Month,'ppt'))
            +
              RegRecharge(Aquifer, layer, county, 'tmax')
              * smax(month, climate_proj(county, gcms, rcps, decades, Month,'tmax'))  );
*zzz     need to change the regression

climate_recharge('Edwards', layer, 'none', scenarios, decades)
 $sum(MapEdwardsRecharge(layer, county)$sum((climate_scenarios(gcms, rcps,  scenarios),month), climate_proj(county, gcms, rcps, decades, Month,'ppt')),1)
      = sum(climate_scenarios(gcms, rcps,  scenarios),
              RegRecharge('Edwards', layer, 'none', 'ppt')
              *sum(month, [ sum((MapEdwardsRecharge(layer, county)), climate_proj(county, gcms, rcps, decades, Month,'ppt'))
                   / sum((MapEdwardsRecharge(layer, county)), 1$ climate_proj(county, gcms, rcps, decades, Month,'ppt'))
                 ] )
            +
              RegRecharge('Edwards', layer, 'none', 'tmax')
              *[ sum((month,MapEdwardsRecharge(layer, county)), climate_proj(county, gcms, rcps, decades, Month,'tmax'))
                   / sum((month,MapEdwardsRecharge(layer, county)), 1$climate_proj(county, gcms, rcps, decades, Month,'tmax'))
                 ]);

* calculate historical level mean

climate_recharge(Aquifer, layer, county, scenarios, baseyear)
      = sum(climate_scenarios(gcms, rcps,  scenarios),
              RegRecharge(Aquifer, layer, county, 'ppt')
              * sum(month, climate_proj(county, gcms, rcps, baseyear, Month,'ppt'))
            +
              RegRecharge(Aquifer, layer, county, 'tmax')
              * smax(month, climate_proj(county, gcms, rcps, baseyear, Month,'tmax'))  );

*zzz     need to change the regression
climate_recharge('Edwards', layer, 'none', scenarios, baseyear)
         $sum(MapEdwardsRecharge(layer, county)$sum((climate_scenarios(gcms, rcps,  scenarios),month), climate_proj(county, gcms, rcps, baseyear, Month,'ppt')),1)
      = sum(climate_scenarios(gcms, rcps,  scenarios),
              RegRecharge('Edwards', layer, 'none', 'ppt')
              *sum(month, [ sum((MapEdwardsRecharge(layer, county)), climate_proj(county, gcms, rcps, baseyear, Month,'ppt'))
                   / sum((MapEdwardsRecharge(layer, county)), 1$ climate_proj(county, gcms, rcps, baseyear, Month,'ppt'))
                 ] )
            +
              RegRecharge('Edwards', layer, 'none', 'tmax')
              *[ sum((month,MapEdwardsRecharge(layer, county)), climate_proj(county, gcms, rcps, baseyear, Month,'tmax'))
                   / sum((month,MapEdwardsRecharge(layer, county)), 1$climate_proj(county, gcms, rcps, baseyear, Month,'tmax'))
                 ]);



display climate_inflow_perc, climate_recharge;

climate_recharge(Aquifer, layer, county, scenarios, decades)
    = max(0, climate_recharge(Aquifer, layer, county, scenarios, decades));


climate_recharge_perc(Aquifer, layer, county, scenarios, decades)
  $climate_recharge(Aquifer, layer, county, 'base', baseyear)
 =climate_recharge(Aquifer, layer, county, scenarios, decades)
  /climate_recharge(Aquifer, layer, county, 'base', baseyear)     ;

display   climate_recharge_perc;

*climate_recharge_perc(Aquifer, layer, county, 'base', decades)
*  $sum(scenarios, climate_recharge(Aquifer, layer, county, scenarios, '2015'))=1;


