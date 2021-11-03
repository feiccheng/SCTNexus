

AvailLand(county, zones, landirrtype) $(AvailLand(county, zones, landirrtype) <5)=0;

AvailLand("KINNEY","none", "dryland")=  sum( landirrtype, AvailLand("KINNEY","zone1", landirrtype)) +AvailLand("KINNEY","none", "dryland");
AvailLand("MAVERICK","none", "dryland")=  sum( landirrtype, AvailLand("MAVERICK","zone1", landirrtype)) +AvailLand("MAVERICK","none", "dryland");
AvailLand("KINNEY","zone1", landirrtype)=0;
AvailLand("MAVERICK","zone1", landirrtype) =0;


crop_strat(county, crops, 'furrow', crop_mix, states, allstrat, crop_primary)
    $(crop_strat(county, crops, 'furrow', crop_mix, states, allstrat, crop_primary) >crop_strat(county, crops, 'furrow', crop_mix, states,'full-f', crop_primary))
          =0;

crop_strat(county, crops, 'sprinkler', crop_mix, states, allstrat,crop_primary)
    $(crop_strat(county, crops, 'sprinkler', crop_mix, states, allstrat, crop_primary) >crop_strat(county, crops, 'sprinkler', crop_mix, states,'full-s', crop_primary) )
          =0;

display availland, zonewatersource,  crop_strat;


parameter hayeffect(county, states);

hayeffect(county, states)  $ crop_strat(county, "hay", "dryland", "hay", "normal", "Hay-dryland", "hay")
    =(crop_strat(county, "hay", "dryland", "hay", states, "Hay-dryland", "hay")
                          /crop_strat(county, "hay", "dryland", "hay", "normal", "Hay-dryland", "hay")  )
                           ;
display otheraquifer_source, surfacegap;
*option reslim=1000000000;
option DispWidth=20;
display pumpbase, AquiferHistdatanew, aquiferLayerCountyReg, AquiferCountyReg;

set countyprimary(county, primary)  map county and its crop product
   countyliveprimary(county,feedingmethod, primary)  map county and its livestock product
option    countyprimary<cropprimaryexist;
option countyliveprimary<liveprimaryexist  ;







*display  RFplace_WP;


display climate_demand;
