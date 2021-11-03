

$include %whereisclimate%data_climate_allsets.gms
$include %whereisclimate%data_climate_swat_flow.gms
$include %whereisclimate%data_climate_temp_prec.gms
$include %whereisclimate%data_climate_sens_fasom.gms
$include %whereisclimate%calc_climate_noncrops.gms
$include %whereisclimate%data_climate_waterdemand_new.gms
*$include %whereisclimate%calc_climate_cropyield.gms


$include %whereisclimate%data_projection_indmincool.gms
$include %whereisclimate%data_projection_populationpercentage.gms
$include %whereisclimate%data_climate_mundemand_percapita.gms
$include %whereisclimate%calc_climate_demand.gms

$include %whereisclimate%data_climate_MAG.gms

* make some adjustment to aquifer regression

aquiferLayerCountyReg(Aquifer, layer, County)
         $((MAG(county,aquifer)=0) and not sameas(aquifer, 'Edwards'))= no;

aquiferLayerCounty(Aquifer, layer, County)
         $((MAG(county,aquifer)=0) and not sameas(aquifer, 'Edwards'))= no;


MAG_climate(county,aquifer,decades)
         $(not sum(layer, aquiferLayerCountyReg(Aquifer, layer, County)))=0;

MAG(county,aquifer) =MAG_climate(county,aquifer,'2020');


