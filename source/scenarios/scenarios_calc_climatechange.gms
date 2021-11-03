if((not sameas(scenariohere,'base')),
* crop yield
ClimateS_month(county, stateofnature,month, climate)
         =save_ClimateS_month(county, stateofnature, month,climate)
         *climate_climate_perc(county, scenariohere, decadehere, Month,climate)      ;

$include %whereisag%calc_ag_deficitIrrig.gms
$include %whereisag%calc_ag_grazing.gms



Stockingrate(county)
         $crop_strat(county, 'hay', 'Dryland', 'normal', 'noirrig', 'grazing')
     =  save_Stockingrate(county)
         /    crop_strat(county, 'hay', 'Dryland', 'normal', 'noirrig', 'grazing')
        *save_crop_strat(county, 'hay', 'Dryland', 'Normal', 'noirrig', 'grazing')  ;

* inflow and aquifer recharge

inflow(river,riverlocation,month,stateofnature)
         =sum(climate_scenarios(gcms,rcps,scenariohere),
                 save_inflow(river,riverlocation,month,stateofnature)
                 *climate_inflow_perc(riverlocation, gcms, rcps, decadehere, month) );


$include '%whereiswater%calc_water_inflow.gms'

res_evap_rate(reservoir, month, stateofnature)=save_res_evap_rate(reservoir, month, stateofnature);

AquiferHistdatanew(Aquifer, layer,county, states, "recharge")
          =save_AquiferHistdatanew(Aquifer, layer,county, states, "Recharge")
           *climate_recharge_perc(Aquifer, layer,county, scenariohere, decadehere)     ;

* water and electricity demand
increasefactor(customer, 'mun', month, stateofnature)
         $sum(mapcitycountytocounty(customer, county),climatewaterdemand(county, month, scenariohere, decadehere))
         =sum(mapcitycountytocounty(customer, county),climatewaterdemand(county, month, scenariohere, decadehere))  ;


monthshare_pp(month%addhour%)= save_monthshare_pp(month%addhour%);

elec_climate_adjust(month)=elect_demand_climate_perc(month, scenariohere, decadehere);



);
