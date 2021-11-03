$ifthen not declared  coolingdiverter
set  coolingdiverter(river, riverplace, citycounty, power_plant_all, sector)  cooling diversion river place
     coolingdiverter1(river, citycounty, power_plant_all, sector) cooling diversion  only specifying county
     hydrodiverter (river, riverplace, citycounty, power_plant_all)           hydro diverter
     coolingG(county, aquifer, layer, power_plant_all)                                         cooling ground water source ;
$endif

* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* update the cooling water diverter
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

county_wateruse_exist(county, 'cool') =no;
*cooling water usage
county_wateruse_exist(county, 'cool')
          $sum((diverters, sector, power_plant_exist(power_plant_all, power_plant_type, power_plant_cooling))$ (not sameas(power_plant_cooling,'none')),
                          PP_diverterlocation(county,power_plant_all,diverters, sector ) )=yes ;

county_wateruse_exist(county, 'cool')
          $sum((diverters, sector, power_plant_all),
                          PP_diverterlocation_new(county,power_plant_all,diverters, sector ) )=yes ;


county_wateruse_exist(county, 'hyd')=no;
county_wateruse_exist(county, 'hyd')
          $sum((diverters, sector ,power_plant_all) ,
                  PP_diverterlocation(county,power_plant_all,diverters, sector )
                             $power_plant_exist(power_plant_all, 'hydro', 'none'))=yes ;
*display county_wateruse_exist;

 county_wateruse_map(county, River, sector, 'cool')
               $sum(( diversionlocation(river, diverters, riverlocation),  power_plant_exist(power_plant_all, power_plant_type, power_plant_cooling))$ (not sameas(power_plant_cooling,'none')),
                          PP_diverterlocation(county,power_plant_all,diverters, sector ) )=yes ;

 county_wateruse_map(county, River, sector, 'cool')
                  $sum(( diversionlocation(river, diverters, riverlocation),  power_plant_all),
                          PP_diverterlocation_new(county,power_plant_all,diverters, sector ) )=yes ;

 county_wateruse_map(county, Aquifer, sector, 'cool')
               $sum(( sameas(Aquifer, divertersandaquifers),power_plant_exist(power_plant_all, power_plant_type, power_plant_cooling))$ (not sameas(power_plant_cooling,'none') ),
                          PP_diverterlocation(county,power_plant_all,divertersandaquifers, sector ) )=yes ;

 county_wateruse_map(county, 'other', sector, 'cool')
               $sum(( power_plant_exist(power_plant_all, power_plant_type, power_plant_cooling))$ (not sameas(power_plant_cooling,'none')),
                          PP_diverterlocation(county,power_plant_all,'other', sector ) )=yes ;

 county_wateruse_map(county, River, 'hyd', 'hyd')= no;

  county_wateruse_map(county,River, sector, 'hyd')
              $sum((diversionlocation(river, diverters, riverlocation), power_plant_all) ,
                  PP_diverterlocation(county,power_plant_all,diverters, sector )
                             $power_plant_exist(power_plant_all, 'hydro', 'none'))=yes ;

*display  county_wateruse_map;
display      UpperdiversionQ1;


display UpperdiversionQ1, UpperdiversionQ;
 coolingdiverter(river, riverlocation, county, power_plant_all, sector) =no;
 coolingdiverter(river, riverlocation, county, power_plant_all, sector)
        =sum((diversionlocation(river, diverters, riverlocation), power_plant_exist(power_plant_all, power_plant_type, power_plant_cooling))$ (not sameas(power_plant_cooling,'none')),
                          PP_diverterlocation(county,power_plant_all,diverters, sector ) ) ;

display  coolingdiverter;
 coolingdiverter(river, riverlocation, county, power_plant_all, sector)
        $sum((diversionlocation(river, diverters, riverlocation)),
                          PP_diverterlocation_new(county,power_plant_all,diverters, sector ) )
        =sum((diversionlocation(river, diverters, riverlocation)),
                          PP_diverterlocation_new(county,power_plant_all,diverters, sector ) ) ;
display  coolingdiverter;

 hydrodiverter (river, riverplace, county, power_plant_all)
       =         sum((diversionlocation(river, diverters, riverplace), power_plant_exist(power_plant_all, 'hydro', 'none'), sector),
                          PP_diverterlocation(county,power_plant_all,diverters, sector ) ) ;

 coolingG(county, aquifer, layer, power_plant_all)
    = sum((PP_G_water(aquifers2, layer) , mapAquifers12(aquifer, aquifers2), power_plant_exist(power_plant_all, power_plant_type, power_plant_cooling), sector)$ (not sameas(power_plant_cooling,'none')),
             PP_diverterlocation(county,power_plant_all, aquifers2, sector ) );


* coolingdiverter1(river, citycounty, power_plant_all, sector)
*      = sum( riverplace,coolingdiverter(river, riverplace, citycounty, power_plant_all, sector));

useexists(county,'cool',river,riverplace)$sum( coolingdiverter(river, riverplace, county, power_plant_all, sector), upperdiversionQ(county,sector,river,riverplace) )
                                          =yes;

*   coolingdiverter(river, riverplace, county, power_plant_all, sector) =no;
*   coolingdiverter(river, riverplace, county, power_plant_all, sector)
*      $sum( coolingdiverter1(river, county, power_plant_all, sector),  upperdiversionQ(county,sector,river,riverplace))=yes;

county_wateruse_exist(county, 'cool')
        $sum( coolingG(county, aquifer, layer, power_plant_all) , 1) = yes;


display coolingdiverter,  hydrodiverter, coolingG, useexists ;
display  'fei1',  UpperdiversionQ;
