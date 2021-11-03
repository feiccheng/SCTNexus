$ifthen not declared cropbudexist
parameter cropbudgetnew(county, crops, landirrtype, alli)                new crop budget transfered irrigstatus to landirrtype;
parameter livebudnew(county,livestock,alli)                              the new livestock budget           ;
set cropbudexist(county,crops,LandirrType)                               does this crop exist
    livebudexist(county,livestock)                                       does this livestock exist
;
$endif


* take the average of ricesecond and ricefirst as the budget of ricesecond, because we are running a static model
cropbud(county, "ricesecond", irrigstatus, alli)=
         (cropbud(county, "ricefirst", irrigstatus, alli)+cropbud(county, "ricesecond", irrigstatus,  alli))/2;

display cropbud;
*fei 2021, adjust the water usage???
cropbudgetnew(county, crops, landirrtype, alli)
                   = sum(landirrmapping(Irrigstatus, landirrtype),  cropbud(county, crops, irrigstatus, alli) );
display 'fei222' , cropbudgetnew;
cropbudgetnew(county, crops, "irrigated", alli) =0;
cropbudgetnew(county, 'hay','furrow', alli) =0;
cropbudgetnew(county, 'hay','sprinkler', alli) =0;

cropbudexist(county,crops,LandirrType)=no;
cropbudexist(county,crops,LandirrType)
                    $cropbudgetnew(county, crops, landirrtype,  "cropland") =yes;
cropbudexist(county,'vegetables',LandirrType)
                    $sum(vege_mix, cropbudgetnew(county, vege_mix, landirrtype,  "cropland")) =yes;

livebudnew(county,livestock,alli)=livestockbud(county, livestock,'pasture', alli) ;



* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* adjust the livestock budget
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* the following should be rebuilt in python /R


* assume the winter stocker is 0.6 AU, feeding on the grazing only
* all other budgets are in the unit of 1 AU
* they all need 1 AU pasture land, and make up the feed by grazing and hay
* meat goat farm is on the west with lower pasture yield, range on the east with higher pasture yield

* kill the farm and ranges in wrong places
livebudnew(county,'MeatGoatsFarm',alli)$(StockingRate(county) ne 35)=0;
livebudnew(county,'MeatGoatsRange',alli)$(StockingRate(county) =35)=0;

*rebuild the aum and pasture needs
livebudnew(county,livestock,'Pastureland1AU')$sum(primary, livebudnew(county,livestock,primary)) =1;
livebudnew(county,'StockersWinter','Pastureland1AU') =0;

livebudnew(county,livestock,'AU')$sum(primary, livebudnew(county,livestock,primary)) =1;
livebudnew(county,'StockersWinter','AU')$sum(primary, livebudnew(county,'StockersWinter',primary)) =0.6;

livebudnew(county,livestock,'can_I_grazing')$livebudnew(county,livestock,'AU') =1;

livebudnew(county,livestock,'GrazingAUM')=0;

livebudexist(county,livestock) =no;
livebudexist(county,livestock)
                    $ livebudnew(county,livestock,'AU')=yes;

livebudnew(county, livestock,'head')
         =sum(livestock_mix, livebudnew(county, livestock,livestock_mix));
livebudnew(county, livestock,livestock_mix)=0;