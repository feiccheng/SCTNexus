
* adjust the crop mix and the budget to make it matching better
* if the vegetables are in dryland in the mix, we move it to the irrigated land
* watermelon is allowed to be planted in the dryland
* this file should be before the stratergy and the climate yield change
* adjust other crops for cropmix

$ifthen not declared nodryland
set nodryland(crops)                                             crops that are not allowed to be planted in dryland
    noirrig(crops)                                               crops that are not allowed to be irrigated
;

parameter missmappedmix1(county, crops, irrigstatus, mixesa )    the crop mix data not in the budget
          missmappedmix2(county, crops, irrigstatus, mixesa )    the vegetable mix data not in the budget;
set       checkbudmix(county,crops,irrigstatus,*)                used to check the missing crop mix or missing budget;
parameter distcropbud(District,crops,landirrtype, alli)          district level cropbud        ;
alias  (District,District2);
set  priority /p1, p2/
     DistrictPriority(priority,District, District2)
   / p1. Dist10. Dist11,
     p1. Dist11. Dist12,
     p1. Dist12. dist11,
     p2. Dist10. Dist12,
     p2. Dist11. Dist10,
     p2. Dist12. dist10
       / ;

set land_irrig_check(county,irrigstatus,*)                       check to match the land availability and  cropmix;
set checklivebud(county,livestock,*)                             check if the livestock budget matches with mix
    checkliveland(county, *)                                     check if the livestock mix matches with land;
$endif

*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* Match the irrigstatus of crop mix with crop budget
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* check irrigstatus
nodryland(crop_mix) =no;
noirrig(crop_mix)   =no;
nodryland(crop_mix)$sum((mapfieldmix(crops,crop_mix),county,landirrtype), cropbudexist(county,crops,landirrtype) )=yes;
nodryland(crop_mix)$sum((county,mapfieldmix(crops,crop_mix)),  cropbudexist(county,crops,'dryland') )=no;
nodryland(vege_mix)$sum((mapvegemix(crops,vege_mix),county,landirrtype), cropbudexist(county,crops,landirrtype) )=yes;
nodryland(vege_mix)$sum((county,mapvegemix(crops,vege_mix)),  cropbudexist(county,crops,'dryland') )=no;

noirrig(crop_mix)$sum((county,mapfieldmix(crops,crop_mix),landirrtype),  cropbudexist(county,crops,landirrtype) )=yes;
noirrig(crop_mix)$sum((county,mapfieldmix(crops,crop_mix)),  cropbudexist(county,crops,'furrow') )=no;
noirrig(crop_mix)$sum((county,mapfieldmix(crops,crop_mix)),  cropbudexist(county,crops,'sprinkler') )=no;
noirrig(vege_mix)$sum((county,mapvegemix(crops,vege_mix),landirrtype),  cropbudexist(county,crops,landirrtype) )=yes;
noirrig(vege_mix)$sum((county,mapvegemix(crops,vege_mix)),  cropbudexist(county,crops,'furrow') )=no;
noirrig(vege_mix)$sum((county,mapvegemix(crops,vege_mix)),  cropbudexist(county,crops,'sprinkler') )=no;

missmappedmix1(county, nodryland, 'dryland' , mixesa) = cropmixdata(county, nodryland,'dryland', mixesa );
missmappedmix1(county, noirrig, 'irrigated' , mixesa) = cropmixdata(county, noirrig,'irrigated', mixesa );

missmappedmix2(county, nodryland, 'dryland' , mixesa) =sum(sameas(vege_mix, nodryland), veg_all(county, vege_mix,'dryland', mixesa ));
missmappedmix2(county, noirrig, 'irrigated' , mixesa) =sum(sameas(vege_mix, noirrig),  veg_all(county, vege_mix,'irrigated', mixesa ));


* now adjust the cropmixdata and vege_mix
cropmixdata(county, nodryland,'dryland', mixesa )
         = cropmixdata(county, nodryland,'dryland', mixesa )- missmappedmix1(county, nodryland, 'dryland' , mixesa);
cropmixdata(county, nodryland,'irrigated', mixesa )
         = cropmixdata(county, nodryland,'irrigated', mixesa )+ missmappedmix1(county, nodryland, 'dryland' , mixesa);
cropmixdata(county, noirrig,'irrigated', mixesa )
         = cropmixdata(county, noirrig,'irrigated', mixesa )- missmappedmix1(county, noirrig, 'irrigated' , mixesa);
cropmixdata(county, noirrig,'dryland', mixesa )
         = cropmixdata(county, noirrig,'dryland', mixesa )+ missmappedmix1(county, noirrig, 'irrigated' , mixesa);

veg_all(county, vege_mix,'dryland', mixesa )
         = veg_all(county, vege_mix,'dryland', mixesa )- sum(sameas(vege_mix, nodryland), missmappedmix2(county, nodryland, 'dryland' , mixesa));
veg_all(county, vege_mix,'irrigated', mixesa )
         = veg_all(county, vege_mix,'irrigated', mixesa )+ sum(sameas(vege_mix, nodryland), missmappedmix2(county, nodryland, 'dryland' , mixesa));
veg_all(county, vege_mix,'irrigated', mixesa )
         = veg_all(county, vege_mix,'irrigated', mixesa )-sum(sameas(vege_mix, noirrig),  missmappedmix2(county, noirrig, 'irrigated' , mixesa));
veg_all(county, vege_mix,'dryland', mixesa )
         = veg_all(county, vege_mix,'dryland', mixesa )+ sum(sameas(vege_mix, noirrig), missmappedmix2(county, noirrig, 'irrigated' , mixesa));

*veg_all(county, vege_mix,irrigstatus, mixesa )
*      $(veg_all(county, vege_mix,irrigstatus, mixesa )<3) =0;
*retest
missmappedmix1(county, nodryland, 'dryland' , mixesa) = cropmixdata(county, nodryland,'dryland', mixesa );
missmappedmix1(county, noirrig, 'irrigated' , mixesa) = cropmixdata(county, noirrig,'irrigated', mixesa );

missmappedmix2(county, nodryland, 'dryland' , mixesa) =sum(sameas(vege_mix, nodryland), veg_all(county, vege_mix,'dryland', mixesa ));
missmappedmix2(county, noirrig, 'irrigated' , mixesa) =sum(sameas(vege_mix, noirrig),  veg_all(county, vege_mix,'irrigated', mixesa ));

* recalculate the mix

cropmixdata(county, vege_mix,irrigstatus, mixesa )=0;
cropmixdata(county, 'vegetables' ,irrigstatus, mixesa )= sum(vege_mix, veg_all(county, vege_mix, irrigstatus, mixesa)  );

display nodryland,noirrig,  missmappedmix1, missmappedmix2;


*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* match crop budget across district when mix exist
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

checkbudmix(county,crops,irrigstatus,'missingmix')
         $sum(landirrmapping(Irrigstatus, landirrtype), cropbudexist(county,crops,landirrtype))= yes;
checkbudmix(county,crops,irrigstatus,'missingmix')
         $sum((mixesa,mapfieldmix(crops,crop_mix))$(not sameas(crop_mix, 'vegetables')), cropmixdata(county, crop_mix, irrigstatus, mixesa ))= no;
checkbudmix(county,crops,irrigstatus,'missingmix')
         $sum((mixesa,mapvegemix(crops,vege_mix)), veg_all(county, vege_mix, irrigstatus, mixesa ))= no;

checkbudmix(county,crops,irrigstatus,'missingbud')  =no;
checkbudmix(county,crops,irrigstatus,'missingbud')
         $(sum((mixesa,mapfieldmix(crops,crop_mix))$(not sameas(crop_mix, 'vegetables')), cropmixdata(county, crop_mix, irrigstatus, mixesa ))>0.001)= yes;
checkbudmix(county,crops,irrigstatus,'missingbud')
         $sum((mixesa,mapvegemix(crops,vege_mix)), veg_all(county, vege_mix, irrigstatus, mixesa ))= yes;
checkbudmix(county,crops,irrigstatus,'missingbud')
         $sum(landirrmapping(Irrigstatus, landirrtype), cropbudexist(county,crops,landirrtype))= no;



* get district cropbud

loop((crops,landirrtype),
      distcropbud(District,crops,landirrtype,alli)
          $sum(regioncountymapping(District,county)$cropbudgetnew(county, crops, landirrtype, 'cropland'), 1)
         =sum(regioncountymapping(District,county), cropbudgetnew(county, crops, landirrtype, alli))
         /sum(regioncountymapping(District,county)$cropbudgetnew(county, crops, landirrtype, 'cropland'), 1)  ;
);


display cropbudgetnew;

* make up the budget using other district data

         loop(checkbudmix(county,crops,irrigstatus,'missingbud'),
               loop(landirrmapping(Irrigstatus, landirrtype)$(not sameas(landirrtype, 'irrigated')),
                     cropbudgetnew(county, crops, landirrtype, alli)
                          = sum((DistrictPriority('p1',District, District2),regioncountymapping(District,county)),
                                          distcropbud(District2,crops,landirrtype,alli));
                    cropbudexist(county,crops,landirrtype)=yes;
         );  );

checkbudmix(county,crops,irrigstatus,'missingbud')  =no;
checkbudmix(county,crops,irrigstatus,'missingbud')
         $(sum((mixesa,mapfieldmix(crops,crop_mix))$(not sameas(crop_mix, 'vegetables')), cropmixdata(county, crop_mix, irrigstatus, mixesa ))>0.001)= yes;
checkbudmix(county,crops,irrigstatus,'missingbud')
         $sum((mixesa,mapvegemix(crops,vege_mix)), veg_all(county, vege_mix, irrigstatus, mixesa ))= yes;
checkbudmix(county,crops,irrigstatus,'missingbud')
         $sum(landirrmapping(Irrigstatus, landirrtype), cropbudexist(county,crops,landirrtype))= no;

display cropbudgetnew, checkbudmix;

$ontext
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* kill the budget when mix is missing
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

loop(checkbudmix(county,crops,irrigstatus,'missingmix'),
         cropbudgetnew(county, crops, landirrtype, alli)=0;
         cropbudexist(county,crops,landirrtype)=no;);
$offtext
*recheck
checkbudmix(county,crops,irrigstatus,'missingmix')=no;
checkbudmix(county,crops,irrigstatus,'missingmix')
         $sum(landirrmapping(Irrigstatus, landirrtype), cropbudexist(county,crops,landirrtype))= yes;
checkbudmix(county,crops,irrigstatus,'missingmix')
         $sum((mixesa,mapfieldmix(crops,crop_mix))$(not sameas(crop_mix, 'vegetables') and (mixesa.val>2000)), cropmixdata(county, crop_mix, irrigstatus, mixesa ))= no;
checkbudmix(county,crops,irrigstatus,'missingmix')
         $sum((mixesa,mapvegemix(crops,vege_mix))$(mixesa.val>2000), veg_all(county, vege_mix, irrigstatus, mixesa ))= no;

display checkbudmix,  cropbudexist;

*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* check the land type
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
land_irrig_check(county,irrigstatus,'landexist')=no;
land_irrig_check(county,irrigstatus,'cropmixexist')=no;


land_irrig_check(county,irrigstatus,'landexist')
       $sum((zones,landirrmapping(Irrigstatus, landirrtype)),  AvailLand(county,zones,landirrtype)  ) =yes;
land_irrig_check(county,irrigstatus,'cropmixexist')
       $( sum((crop_mix,mixesa)$(mixesa.val>2000), cropmixdata(county, crop_mix, irrigstatus, mixesa ))
         +sum((vege_mix,mixesa)$(mixesa.val>2000), veg_all(county, vege_mix, irrigstatus, mixesa ))  ) =yes;
land_irrig_check(county,irrigstatus,'notused')
         $land_irrig_check(county,irrigstatus,'landexist')=yes;
land_irrig_check(county,irrigstatus,'notused')
         $land_irrig_check(county,irrigstatus,'cropmixexist')=no;

display land_irrig_check;
* if the land is not used, we turn the irrigated to dryland and turn dryland to pasture

loop(land_irrig_check(county,'irrigated','notused')$(not land_irrig_check(county,'dryland','notused')),
         AvailLand(county,'none','dryland')
                         = AvailLand(county,'none','dryland')
                           +sum(zones,AvailLand(county,zones,'sprinkler')+AvailLand(county,zones,'furrow'));

         AvailLand(county,zones,'sprinkler') =0;
         AvailLand(county,zones,'furrow') =0;

);

loop(land_irrig_check(county,'irrigated','notused')$ land_irrig_check(county,'dryland','notused'),
         AvailLand(county,'none','pasture')
                         = AvailLand(county,'none','pasture')
                           +AvailLand(county,'none','dryland')
                           +sum(zones,AvailLand(county,zones,'sprinkler')+AvailLand(county,zones,'furrow'));

         AvailLand(county,zones,'sprinkler') =0;
         AvailLand(county,zones,'furrow') =0;
         AvailLand(county,'none','dryland')=0;

);

*recheck
land_irrig_check(county,irrigstatus,'notused') =no;
land_irrig_check(county,irrigstatus,'notused')
         $sum((zones,landirrmapping(Irrigstatus, landirrtype)),  AvailLand(county,zones,landirrtype)  )=yes;
land_irrig_check(county,irrigstatus,'notused')
         $( sum((crop_mix,mixesa)$(mixesa.val>2000),cropmixdata(county, crop_mix, irrigstatus, mixesa ))
           +sum((vege_mix,mixesa)$(mixesa.val>2000),veg_all(county, vege_mix, irrigstatus, mixesa ))  )=no;

land_irrig_check(county,irrigstatus,'noland') =no;
land_irrig_check(county,irrigstatus,'noland')
         $( sum((crop_mix,mixesa)$(mixesa.val>2000),cropmixdata(county, crop_mix, irrigstatus, mixesa ))
           +sum((vege_mix,mixesa)$(mixesa.val>2000),veg_all(county, vege_mix, irrigstatus, mixesa ))  )=yes;

land_irrig_check(county,irrigstatus,'noland')
         $sum((zones,landirrmapping(Irrigstatus, landirrtype)),  AvailLand(county,zones,landirrtype)  )=no;

* kill the cropmix, vegmix and budget if no land available
loop(land_irrig_check(county,irrigstatus,'noland'),
            veg_all(county, vege_mix, irrigstatus, mixesa )=0;
            cropmixdata(county, crop_mix, irrigstatus, mixesa )=0;
            cropbudgetnew(county, crops, landirrtype, alli)=0;
            cropbudexist(county,crops,landirrtype)=no;);

*recheck
land_irrig_check(county,irrigstatus,'noland')  =no;
land_irrig_check(county,irrigstatus,'noland')
         $( sum((crop_mix,mixesa)$(mixesa.val>2000),cropmixdata(county, crop_mix, irrigstatus, mixesa ))
           +sum((vege_mix,mixesa)$(mixesa.val>2000),veg_all(county, vege_mix, irrigstatus, mixesa ))  )=yes;

land_irrig_check(county,irrigstatus,'noland')
         $sum((zones,landirrmapping(Irrigstatus, landirrtype)),  AvailLand(county,zones,landirrtype)  )=no;
display land_irrig_check,  AvailLand;

* adjust the available land area to make sure it is not higher than historical peak

$ifthen not declared checkland
parameter checkland(county,irrigstatus,*)      used to check the land acres;
set       needadj(county,irrigstatus)          the county that need the adjustment;

$endif
checkland(county,'dryland', 'availand') = AvailLand(county, 'none', 'dryland');
checkland(county,'irrigated','availand')= sum(zones, AvailLand(county, zones, 'sprinkler')+AvailLand(county, zones, 'furrow'));
*checkland(county,'pasture', 'availand') = sum(zones, AvailLand(county, zones, 'pasture'));

checkland(county,irrigstatus, 'mix')
         =smax(mixesa$(mixesa.val>2000), sum(crop_mix,cropmixdata(county, crop_mix,irrigstatus, mixesa)))*inregion_Pop_per(County);

checkland(county,irrigstatus, 'mixOverAvailable')
         $checkland(county,irrigstatus,'availand')
        =checkland(county,irrigstatus, 'mix')/ checkland(county,irrigstatus,'availand')  ;
checkland(county,irrigstatus, 'diff')
        = checkland(county,irrigstatus,'availand') - checkland(county,irrigstatus, 'mix');

* move the extra irrigated to dryland
display availLand;
loop(county$(checkland(county,'irrigated', 'mixOverAvailable')<1),
            AvailLand(county,zones,'sprinkler')= AvailLand(county,zones,'sprinkler')* checkland(county,'irrigated','mixOverAvailable');
            AvailLand(county,zones,'furrow')= AvailLand(county,zones,'furrow')* checkland(county,'irrigated','mixOverAvailable');
            AvailLand(county,'none','dryland')
                 =AvailLand(county,'none','dryland') + checkland(county,'irrigated', 'diff');  );


display availLand;
display checkland;

checkland(county,'dryland', 'availand')=0;
checkland(county,irrigstatus, 'mixOverAvailable') =0;
checkland(county,'dryland', 'availand') =  AvailLand(county, 'none', 'dryland');
checkland(county,'irrigated','availand')= sum(zones, AvailLand(county, zones, 'sprinkler')+AvailLand(county, zones, 'furrow'));
checkland(county,irrigstatus, 'mix')
         =smax(mixesa$(mixesa.val>2000), sum(crop_mix,cropmixdata(county, crop_mix,irrigstatus, mixesa)))*inregion_Pop_per(County);

checkland(county,irrigstatus, 'mixOverAvailable')
         $checkland(county,irrigstatus,'availand')
        =checkland(county,irrigstatus, 'mix')/ checkland(county,irrigstatus,'availand')  ;
checkland(county,irrigstatus, 'diff')
        = checkland(county,irrigstatus,'availand') - checkland(county,irrigstatus, 'mix');

loop(county$(checkland(county,'dryland', 'mixOverAvailable')<1),
            AvailLand(county,'none','dryland')= AvailLand(county,'none','dryland')* checkland(county,'dryland','mixOverAvailable');
  );

AvailLand(county, zones, landirrtype)$(AvailLand(county, zones, landirrtype)<1)=0;

needadj(county,irrigstatus)=no;
needadj(county,irrigstatus)
        $(checkland(county,irrigstatus,'availand')>checkland(county,irrigstatus,'mix')+0.1)=yes;
display needadj, checkland, AvailLand;


* zone water sources
zonewatersource(county, "none", "none")$ sum(landirrtype,AvailLand(county, "none", landirrtype))=yes;

* relink the land transfering and zones
set maplandtrans_zones(county, landirrtype, zones, landirrtype2, zones)     the land transfering from zones to zone and type to type;

loop((county, zones, landirrtype)$AvailLand(county, zones, landirrtype),
         loop(maplandtrans(landirrtype, landirrtype2) ,
                 maplandtrans_zones(county, landirrtype, zones, landirrtype2, zones)
                                       $(sameas(landirrtype2, 'Furrow') or sameas(landirrtype2, 'Sprinkler'))= yes;
                 maplandtrans_zones(county, landirrtype, zones, landirrtype2, 'none')
                                       $(sameas(landirrtype2, 'pasture') or sameas(landirrtype2, 'dryland'))= yes;

););


display maplandtrans_zones;

cropbudexist(county,crops,LandirrType)=no;
cropbudexist(county,crops,LandirrType)
                    $(cropbudgetnew(county, crops, landirrtype,  "cropland") and sum(zones, AvailLand(county,zones,landirrtype)))=yes;
cropbudexist(county,'vegetables',LandirrType)
                    $(sum(vege_mix, cropbudgetnew(county, vege_mix, landirrtype,  "cropland")) and sum(zones, AvailLand(county,zones,landirrtype)))=yes;


*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* match livestock budget with mix and pasture land ~
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



checklivebud(county, livestock, 'needbud')
         $SUM((maplivestockmix(livestock, livestock_mix),mixesa), livestockmixdata(county, livestock_mix, mixesa ))=YES;
checklivebud(county, livestock, 'needbud')
         $livebudnew(county,livestock,'AU')=no;

checklivebud(county, livestock, 'needmix')
         $livebudnew(county,livestock,'AU') =yes;
checklivebud(county, livestock, 'needmix')
         $SUM((maplivestockmix(livestock, livestock_mix),mixesa), livestockmixdata(county, livestock_mix, mixesa ))=no;


checkliveland(county, 'nolandavail')
         $SUM((maplivestockmix(livestock, livestock_mix),mixesa), livestockmixdata(county, livestock_mix, mixesa ))=yes;
checkliveland(county, 'nolandavail')
         $AvailLand(county,'none','pasture') =no;

checkliveland(county, 'nomix')
         $AvailLand(county,'none','pasture') =yes;
checkliveland(county, 'nomix')
         $SUM((maplivestockmix(livestock, livestock_mix),mixesa), livestockmixdata(county, livestock_mix, mixesa ))=no;

loop(checklivebud(county, livestock, 'needmix'),
           livebudnew(county,livestock, alli)=0;);

* kill the stocker if there is no grazing land
livebudnew(county,'StockersWinter', alli)
        $(sum(Cropbudexist(county, crops, landirrtype), cropbudgetnew(county, crops, landirrtype, 'grazing'))=0)=0;


livebudexist(county,livestock) =no;
livebudexist(county,livestock)
                    $ livebudnew(county,livestock,'AU')=yes;

*recheck
checklivebud(county, livestock, 'needbud') =no;
checklivebud(county, livestock, 'needbud')
         $SUM((maplivestockmix(livestock, livestock_mix),mixesa), livestockmixdata(county, livestock_mix, mixesa ))=YES;
checklivebud(county, livestock, 'needbud')
         $livebudnew(county,livestock,'AU') =no;

checklivebud(county, livestock, 'needmix') =no;
checklivebud(county, livestock, 'needmix')
         $livebudnew(county,livestock,'AU') =yes;
checklivebud(county, livestock, 'needmix')
         $SUM((maplivestockmix(livestock, livestock_mix),mixesa), livestockmixdata(county, livestock_mix, mixesa ))=no;


display checklivebud;




* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* adjust the land water sources
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
zonewatersource(county, zones, RiverAndAquifer)$(sum(landirrtype, AvailLand(county, zones, landirrtype))=0) =no;
zonewatersource(county, zones, 'project')$(sum(landirrtype, AvailLand(county, zones, landirrtype))) =yes;
zonewatersource(county, 'none', 'project')=no;
zonewatersource(county,zones, 'other')$zonewatersource(county,zones, 'project')=yes;


*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* turn the cropmix, vegemix and livestock mix to be propertion
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

parameter cropmixdatanew(county,crop_mix,irrigstatus,mixesa)          crop mix propertional
          vegemixdatanew(county,vege_mix,irrigstatus,mixesa)          vegetable mix propertional
          livemixdatanew(county,livestock_mix,mixesa)                 livesstock mix propertional
          croptotal(county,irrigstatus,mixesa)                        temp array to store crop acres total
          livetotal(county,mixesa)                                    temp array to store livestock total

;

croptotal(county,irrigstatus,mixesa)= sum(crop_mix,      cropmixdata(county,crop_mix,irrigstatus,mixesa));
livetotal(county,mixesa)            = sum(livestock_mix, livestockmixdata(county,livestock_mix,mixesa));

cropmixdatanew(county,crop_mix,irrigstatus,mixesa)
         $croptotal(county,irrigstatus,mixesa)
         = cropmixdata(county,crop_mix,irrigstatus,mixesa)
           /croptotal(county,irrigstatus,mixesa) ;

vegemixdatanew(county,vege_mix,irrigstatus,mixesa)
         $cropmixdata(county,'vegetables',irrigstatus,mixesa)
         =veg_all(county,vege_mix,irrigstatus,mixesa)
         /cropmixdata(county,'vegetables',irrigstatus,mixesa);

livemixdatanew(county,livestock_mix,mixesa)
         $ livetotal(county,mixesa)
         = livestockmixdata(county,livestock_mix,mixesa)
         / livetotal(county,mixesa) ;

cropmixdatanew(county,crop_mix,irrigstatus,mixesa)
         $(cropmixdatanew(county,crop_mix,irrigstatus,mixesa)<0.01) =0;
vegemixdatanew(county,vege_mix,irrigstatus,mixesa)
         $(vegemixdatanew(county,vege_mix,irrigstatus,mixesa)<0.01)=0;

livemixdatanew(county,livestock_mix,mixesa)
         $(livemixdatanew(county,livestock_mix,mixesa)< 0.01)= 0;
*display cropmixdatanew, vegemixdatanew, livemixdatanew;
