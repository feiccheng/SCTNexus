$ifthen not declared validdiverter
set
    mapcitycountytoriverlocation(citycounty,sector,river,riverplace)                     Mapping between riverplace and major cities
    validdiverter(diverters)                                                             Active diverter with full data set
    locatediverter(county,sector,diverters,river,riverplace)                             Locate where a diverter gets water from
    useexists(citycounty,sector,river,riverplace)                                        does this use exist here
    use_exists_at_a_place(sector,river,riverplace)                                       is this sector eleigable at this place
    node_exist(river,riverlocation)                                                      does this node exist on this river
;
Set CityCountyG(citycounty)                                                              cities and countries that can use ground water
    CityCountyS(citycounty)                                                              cities and countries that can use surface water
    MapCityCountySectorS(citycounty, sector)                                             tell what kinds of sectors are active in what cities and counties;
Parameter
    upperdiversionQ(county,sector,river,riverplace)                                      Map the permitted diversion to its corresponding type and county and riverplace
    newwateruse(sector, river,riverplace,month,states)                                   Sum up actual nonagricultural wateruse and assign them to riverplace
;
set diverterbad(diverters)                                                               diverters not set up propoerly;
set whenwateruse(citycounty,sector,month)                                                when water is used in ag ;
set county_wateruse_exist(citycounty, sector)                                            make sure that water use exist in county and sector ;
set county_wateruse_map(county, RiverAndAquifer, sector, sector1)                        map county water use (majorly for removing the effects of cooling water);

Parameter RFplace(citycounty,river, riverplace)                       return flow palces;
parameter unmatchedreturn(citycounty, river, riverplace)       make up the unmatched return flows
/
Bastrop  . GuadSA .CP11_GuadSA  1.00
MAVERICK . NUECES .CP04_NUECES  1.00
Duval    . NUECES .CP30_NUECES  1.00
Fayette  . GuadSA .CP12_GuadSA  1.00
Lavaca   . GuadSA .CP14_GuadSA  1.00
*Travis   . GuadSA .CP09_GuadSA  1.00
/ ;


$endif
  typeofdiverter(diverters,sector)
       $(not typeofdiverter(diverters,sector)
        and  sum(county,AdjCC(diverters,county,sector))) =yes;

   mapdiverterstocounty(diverters,county)
       $(not mapdiverterstocounty(diverters,county)
        and  sum(sector,AdjCC(diverters,county,sector))) =yes;

loop((diverters,county,sector)$AdjCC(diverters,county,sector),
          diversionlocation('nueces', diverters,'CP31_NUECES')=yes; );
*manually fix some
diversionlocation('GuadSA', 'CP21_GuadSA','CP21_GuadSA')=yes;
diversionlocation('GuadSA', 'CP04_GuadSA','CP04_GuadSA')=yes;
diversionlocation('GuadSA', 'CP23_GuadSA','CP23_GuadSA')=yes;

mapdiverterstocounty('OUT_GuadSA', county)$mapdiverterstocounty('CPEST_GuadSA', county) =yes;
mapdiverterstocounty('OUT_Nueces', 'Nueces') =yes;
mapdiverterstocounty('OUT_Minor', 'ARANSAS') =yes;
mapdiverterstocounty('CP24_NUECES', 'Uvalde') =yes;
mapdiverterstocounty('CP26_NUECES', 'MEDINA') =yes;


mapdiverterstocounty(diverters, county)
         $((not sum(county1, mapdiverterstocounty(diverters,county1)))
          and sum(diversionlocation(river, diverters, riverlocation),1) )
         = sum(diversionlocation(river, diverters, riverlocation), mapdiverterstocounty(riverlocation, county)) ;

loop((typeofdiverter(diverters,sector),mapdiverterstocounty(diverters, county)),
     locatediverter(county,sector,diverters,river,riverplace)
           =diversionlocation(river, diverters, riverplace););




option locatediverter:0:4:1;
display  locatediverter, typeofdiverter;
useexists(county,sector,river,riverplace)
          $sum(diverters,locatediverter(county,sector,diverters,river,riverplace))=yes;
useexists(county,'ag',river,riverplace)
          $(sum(zones, AvailLand(county,zones,'furrow')+AvailLand(county,zones,'sprinkler'))=0)=no;
useexists(city,'mun',river,riverplace)
          $sum((mapcitycountytocounty(city,county),diverters),locatediverter(county,'mun',diverters,river,riverplace))=yes;

option useexists:0:0:4;
display useexists
*option node_exist<riverflowlink;
option use_exists_at_a_place<useexists;
*option is_reservior_here<reservoircapacity;


node_exist(river,riverlocation)$(sum((years,month),Naturalizedflows(river,riverlocation,years,month)) )=yes;
node_exist(river,out)$sum(riverflowlink(river,riverlocation,out) ,1)=yes;


display  typeofdiverter,  mapdiverterstocounty, diversionlocation, upperdiversionQ1;

loop(typeofdiverter(diverters,sector),
     loop(county$(mapdiverterstocounty(diverters,county) ),
               loop(diversionlocation(river,diverters,riverplace)$upperdiversionQ1(river,diverters,sector),
                    validdiverter(diverters)= yes;)));


diverterbad(diverters)=yes;
diverterbad(validdiverter)=no;
display diverterbad, validdiverter;

* limited by the data, we could only split large city municiple water use from county level

          upperdiversionQ(county,sector1,river,riverplace)
                     $node_exist(river,riverplace)
              = sum((sectormap(sector1, sector),
                     locatediverter(county,sector,validdiverter,river,riverplace))
                             $upperdiversionQ1(river,validdiverter,sector),
                      upperdiversionQ1(river,validdiverter,sector));

display 'test diversionq',  upperdiversionQ;
$ontext
         upperdiversionQ(county,sector,river,riverplace)
                     $(node_exist(river,riverplace)
                       and not sameas(sector, "mun"))
              = sum(mapcitycountytocounty(citycounty, county), upperdiversionQ(citycounty,sector,river,riverplace));


         upperdiversionQ(city,sector,river,riverplace)
                     $(node_exist(river,riverplace)
                       and not sameas(sector, "mun"))
               =0;

  CountySurfaceShare_MI(citycounty, river)
          $sum((sector, riverplace,river1), upperdiversionQ(citycounty,sector,river1,riverplace))
      = sum((riverplace,sector), upperdiversionQ(citycounty,sector,river,riverplace))
       /sum((riverplace, sector, river1), upperdiversionQ(citycounty,sector,river1,riverplace));
$offtext

         newwateruse(sector,river,riverplace,month,states)
                 $node_exist(river,riverplace)
         =wateruse(river,riverplace,sector,month,states);

* when water is used in ag
whenwateruse(county,"ag",month)
      $(sum( (mapwater(month,watr) ,crops,landirrtype, crop_mix, states, allstrat ),1$crop_strat(county, crops, landirrtype, states, allstrat, watr)))=yes;
whenwateruse(citycounty,sector,month)$(not sameas(sector, "ag")) =yes;
display whenwateruse;

loop(county,
    loop(validdiverter$(   mapdiverterstocounty(validdiverter,county)),
         loop(typeofdiverter(validdiverter,sector),
             loop( diversionlocation(river,validdiverter,riverplace)$node_exist(river,riverplace),
                  mapcitycountytoriverlocation(county,sector,river,riverplace)=yes;
))));


*file junk;
*put junk
*loop(citycounty$(sum(mapcitycountytoriverlocation(citycounty,sector,river,riverplace),1)=0),
*   put 'bad city', citycounty.tl:20 /);
CityCountyG(citycounty)$sum((sameas(citycounty,county),Aquifer, layer)$AquiferLayerCounty(Aquifer, layer, County),1) =yes;
CityCountyG(citycounty)$sum((mapcitycountytocounty(citycounty, county), Aquifer, layer)$AquiferLayerCounty(Aquifer, layer, County),1)=yes;
CityCountyS(citycounty)$sum(mapcitycountytoriverlocation(citycounty,sector,river,riverplace),1)=yes;
MapCityCountySectorS(citycounty, sector)$sum(mapcitycountytoriverlocation(citycounty,sector,river,riverplace),1)=yes;

* city water usage eixst

county_wateruse_exist(county, "ag")$(sum((crop_mix, mixesa),cropmixdata(county, crop_mix,"irrigated", mixesa ) )
                                  and sum((zones, landirrmapping("irrigated", landirrtype)), AvailLand(county,zones,landirrtype)))=yes;
county_wateruse_exist(county, "ind")$Demanddata(County,'ind','annual',"quantity")=yes;
county_wateruse_exist(county, "min")$Demanddata(County,'min','annual',"quantity")=yes;
county_wateruse_exist(citycounty, "mun")$Demanddata(cityCounty,'mun','annual',"quantity")=yes;
county_wateruse_exist(county, "oth")$sum(useexists(county,"oth",river,riverplace) ,1)=yes ;
county_wateruse_exist(county, "hyd")$sum(useexists(county,"hyd",river,riverplace) ,1)=yes ;
county_wateruse_exist(county, "rec")$sum(useexists(county,"rec",river,riverplace) ,1)=yes ;

display county_wateruse_exist ;
county_wateruse_map(county, river(RiverAndAquifer), sector, sector1)$(county_wateruse_exist(county, sector) and sameas(sector, sector1))= yes;
county_wateruse_map(county, Aquifer(RiverAndAquifer), sector, sector1)$(county_wateruse_exist(county, sector)
                                                          and sameas(sector, sector1)
                                                          and sum(layer,  AquiferLayerCounty(aquifer, layer, county) ))
                              = yes;


county_wateruse_map(county,Aquifer(RiverAndAquifer), 'hyd', 'hyd')$ sum(layer,  AquiferLayerCounty(aquifer, layer, county) ) =no;
county_wateruse_map(county,Aquifer(RiverAndAquifer), 'rec', 'rec')$ sum(layer,  AquiferLayerCounty(aquifer, layer, county) )=no;
display county_wateruse_map;

* return flows


set mapriverlocationtocounty(riverlocation,county)
    mapriverlocationtocounty1(riverlocation,county);

mapriverlocationtocounty(riverlocation,county)=mapdiverterstocounty(riverlocation,county);
mapriverlocationtocounty(riverlocation,county)
         $(not mapriverlocationtocounty(riverlocation,county)
           and sum((sector1,river), upperdiversionQ(county,sector1,river,riverlocation)) )= yes;

mapriverlocationtocounty1(riverlocation,county)
         =mapriverlocationtocounty(riverlocation,county);

display  RFpercent;
set RFplace_link(customer,river,riverlocation);
loop(mapriverlocationtocounty(riverlocation,county),
         loop(riverflowlink(river,riverlocation,downriver),
                 if(sum(mapriverlocationtocounty1(downriver,county1)$(not sameas(county, county1)),1),
                         RFplace_link(county,river,downriver) = yes;
);););

RFplace_link(county,river,riverplace)$mapriverlocationtocounty(riverplace,county)=no;
RFplace_link(county,river,out)$sum(mapriverlocationtocounty(out,county),minouttobay(river, out))= yes;

RFplace_link(county, river, riverplace)
         $((not RFplace_link(county, river, riverplace))
          and unmatchedreturn(county, river, riverplace))= yes ;

RFplace_link('outofarea', river, riverplace) =no;


parameter test_returnflow(county,*)  ;

test_returnflow(county,'rf')
          =sum(RFplace_link(county,river,riverlocation),1);

test_returnflow(county,'diverters')
         =sum(mapdiverterstocounty(diverters,county),1);

RFplace(citycounty, river, riverplace)=0;
RFplace(county, river, riverplace)
         $RFplace_link(county,river,riverplace)
         =1/ test_returnflow(county,'rf');

display rfplace, RFplace_link;


RFplace(city, river, riverplace)=sum(mapcitycountytocounty(city,county),RFplace(county, river, riverplace)) ;

display test_returnflow, rfplace;


