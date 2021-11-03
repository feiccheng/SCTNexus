
set
    mapcropprimary(crops, primary)                                match crops to its primary products
    maplivestockprimary(livestock, primary)                       match livestock to its primary products
    mapfieldmix(crops,crop_mix)                                   map crops in the major mix
/
     pasture               .      hay
     hay                   .      hay
     wheat                 .      wheat
     oats                  .      oats
     sorghumhay            .      sorghumhay
     barley                .      barley
     corn                  .      corn
     sorghum               .      sorghum
     soybeans              .      soybeans
     (ricefirst,ricesecond).      rice
     cotton                .      cotton
/
    mapvegemix(crops,vege_mix)
/
     cabbage      . cabbage
     cucumber     . cucumber
     onion        . onion
     sesame       . sesame
     cantaloupe   . cantaloupe
     waterMelon   . waterMelon
     honeydew     . honeydew
     spinach      . spinach
     peanut       . peanut
     canola       . canola
/
   maplivestockmix(livestock, livestock_mix)
/
Angoras           . goatsangora
MeatGoatsFarm     . MeatGoats
MeatGoatsRange    . MeatGoats
SheepHair         . SheepHair
SheepWool         . SheepWool
StockersWinter    . Stockers
CowCalf           . BeefCow

/;

mapcropprimary(crops, primary)
                  $sum((county, irrigstatus), cropbud(county, crops, irrigstatus, primary)) =yes;

maplivestockprimary(livestock, primary)
                  $sum((county,FeedingMethod), livestockbud(county, livestock, FeedingMethod, primary))  =yes;

mapfieldmix(crops,'vegetables')$sum(mapvegemix(crops,vege_mix),1) =yes;

display mapcropprimary,maplivestockprimary, mapfieldmix;
