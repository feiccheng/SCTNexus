*   CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
*    Agricultural Part
*   CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC

$ifthen not declared livestockbud
$include %whereisag%data_ag_set_all.gms
$include %whereisag%data_ag_primary_price.gms
$include %whereisag%data_ag_stockingrate.gms

* include livestock and crop budget and mixes.
$include  %whereisag%data_ag_budget.gms
$include  %whereisag%data_ag_mix.gms
$include  %whereisag%data_ag_crop_vegetable_mix.gms
$include  %whereisag%data_ag_land.gms

$include  %whereisag%data_ag_set_tuples.gms

parameter commodprice(county, primary)           Prices of commod drawn from budgets   ;
$endif


*~~~~~~~~~~~~~~~~~~
* commodity prices
*~~~~~~~~~~~~~~~~~~
commodprice(county, primary )=PrimaryBasePrice(primary);
commodprice(county, 'grazing')=0;

*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* cropbudget and mix check and adjustment
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$include %whereisag%calc_ag_mix.gms
$include %whereisag%calc_ag_bud.gms
$include %whereisag%calc_ag_checkbudmix.gms

*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*  Deficit Irrigation
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$include %whereisag%data_ag_deficitIrrig_EPIC.gms
$include %whereisag%data_ag_deficitIrrig_BLANEY_CRIDDLE.gms
$include %whereisag%calc_ag_deficitIrrig.gms

display probability;

*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*  Grazing and hay supplyment
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

*An AUM is equal to 750 lb of forage (25 lb/day x 30 days/month)
*1 AUM year is 750*12/2000 ton of hay
scalar HayperAUM hay is 750 lb (0.375 ton) per aum  /0.375/  ;
$include %whereisag%calc_ag_grazing.gms
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*  profit calculation
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$include %whereisag%calc_ag_profit.gms


*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* set up the up bound of crops if not in the mix
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
parameter cropprop(county,landirrtype, crops)  the upper bound of crop proportion;
cropprop(county, landirrtype,crops)
       $( cropbudexist(county,crops,landirrtype)
        and sum((landirrmapping(Irrigstatus, landirrtype), mixesa,mapfieldmix(crops,crop_mix)),
                       cropmixdata(county, crop_mix, irrigstatus, mixesa ))
         )=0.05;

cropprop(county, landirrtype,vege_mix)
       $sum((landirrmapping(Irrigstatus, landirrtype),mixesa,mapvegemix(crops,vege_mix)),
                       veg_all(county, vege_mix, irrigstatus, mixesa ))= 0 ;


display cropprop;

parameter haytranscost(county,county)    the shipping cost of hay across county per ton;
$ontext
*a "truck trailer" also known as a "full load" of hay usually delivered direct to the ranch.
Full loads consist of approximately 350 to 424 bales long distance domestic.
18 to 24 tons of hay are loaded on the truck depending on the truck type trailer length and axle capacity.
This hay is usually sold by the ton versus by the bale and is more cost effective.

assume $4 per mile per load and  20 tons per load

$offtext
 haytranscost(county,county1)
     = countydistance(county,county1)*4/20*100;

scalar maxhaytranscost                   the maximum hay shipping cost allowed
        /30/;
display haytranscost  ;
