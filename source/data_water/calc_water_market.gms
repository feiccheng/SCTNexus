$ifthen not declared aquiferpermit
parameter aquiferpermit(aquifer, sector, county) proxy aquifer permit by county using historical record;
parameter edwardspermit1(county, sector, permittype);


set edwardsregion_trade  edwards region for trade/westtoeast, midtoeast, westtomid /;
set edwards_trade_limits_set(edwardsregion_trade, county, county)      edwards aquifer trading limits by the regulation
/ westtoeast. Uvalde. (Comal, Hays, Guadalupe, Caldwell)
  midtoeast . (Medina, Atascosa, Bexar). (Comal, Hays, Guadalupe, Caldwell)
  westtomid. Uvalde. (Medina, Atascosa, Bexar) /
;

$endif


aquiferpermit(aquifer, sector, county) = smax(years,  sum(layer, histpump (county,  aquifer, layer, sector, years) ));

aquiferpermit(aquifer, 'ag', county)=  aquiferpermit(aquifer, 'ag', county)+ aquiferpermit(aquifer, 'livestock', county);
aquiferpermit(aquifer, 'livestock', county)=0;
aquiferpermit('other', sector, county)=0;
aquiferpermit('Edwards', sector, county)=0;


edwardspermit1(county, gsector, permittype)
    =sum( (permitno),
          EdwardsPermit(permitno, county, gsector, permittype)     )    ;
edwardspermit1('comal', 'min', 'all')= 3300;
edwardspermit1('hays', 'min', 'all')= 60;

display edwardspermit1;






parameter edwards_trade_limit(county, county1)         the edwards trading limits;
edwards_trade_limit(county, county1)
    $(sum(AquiferLayerCounty('Edwards', layer, county) , 1)
      and sum(AquiferLayerCounty('Edwards', layer, county1) , 1)
        and (not sameas(county, county1))) =1;

edwards_trade_limit(county, county1)
     $edwards_trade_limits_set('westtoeast', county, county1)=1/5;
edwards_trade_limit(county, county1)
     $edwards_trade_limits_set('midtoeast', county, county1)=1/3;
edwards_trade_limit(county, county1)
     $edwards_trade_limits_set('westtomid', county, county1)=3/5;

display edwards_trade_limit ;




