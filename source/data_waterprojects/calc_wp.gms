Version("calc_wp.gms", "June 08, 2021")=yes;

$ifthen not declared mapwaterprojecttype
$include %whereiswaterprojects%data_wp_set_allofit.gms
$include %whereiswaterprojects%data_wp_investmentcost.gms
$include %whereiswaterprojects%data_wp_exist_reuse.gms
$include %whereiswaterprojects%data_wp_geo_info.gms
$include %whereiswaterprojects%data_wp_phase_excl.gms
*$include %whereiswaterprojects%data_wp_mag.gms
$include %whereiswaterprojects%data_wp_conservation.gms


set mapwaterprojecttype(projects, waterproject_type)                             map water project type ;
parameter investmentcost(projects, investalli)                                   calculting fixed cost and variable cost of investment projects convert to 60 year cost ;
set missingproject(projects, *)                                                  find the projects with missing iterms;
set Investmentsector(projects,  sector)                                          this tells whether an  investment in a project is relevant in a sector;
set activeprojects(projects)                                                     active water development projects;
parameter WaterRightTakeout(projects,sourceriver,riverplace,county,sector)   water rights acquisition from other owners for projects    ;
set
         WPregion/SA,VC,SAonly, All,set.citycounty/
         link_WPregion(WPregion,citycounty)
         /SA.(Atascosa,Bexar,Caldwell,Comal,Dimmit,Frio,Gonzales,Guadalupe,Hays,Kendall,Karnes,LaSalle,Medina,Uvalde,Wilson,Zavala,SanAntonio)
          VC.(Calhoun,DeWitt,Goliad,Refugio,Victoria,Aransas,Bee,Duval,JimWells,LiveOak,McMullen,Nueces,SanPatricio,VictoriaCity,CorpusChristi)
          SAonly.(Bexar,SanAntonio)
          All.(set.citycounty) /
         WP_all(WPregion) /SA,VC/
         SA_all(WPregion) /SAonly, SanAntonio, Bexar /

;
link_WPregion(WPregion,citycounty)$sameas(WPregion,citycounty)= yes;

parameter  wp_WPregion           (projects,WPregion,sector,waterproject_type)
           wp_WPregion_share     (projects,wpregion,sector,waterproject_type)
;
set        link_wp_WPregion      (projects,WPregion,sector,waterproject_type);
alias (waterproject_type, waterproject_type1), (wpregion, wpregion1);

display link_WPregion;

set needWTP(projects)        the water projects needs wtp/
GulfCoastBee
GulfCoastElOso
GulfCoastBeeIrr
GulfCoastBeeMin
GulfCoastTDCJChaseField
GulfCoastDuval
GulfCoastDuvalMin
GulfCoastSanDiegoMUD1
GulfCoastJimWells
GulfCoastJimWellsIrr
GulfCoastJimWellsMan
GulfCoastJimWellsMin
GulfCoastLiveOakIrr
GulfCoastLiveOakMan
GulfCoastNueces
GulfCoastNuecesIrr
GulfCoastNuecesMin
GulfCoastSanPatricioIrr
GulfCoastSanPatricioMin

ExpandedCzoSAWS_I
ExpandedCzoSAWS_II
ExpandedCzoSAWS_III
/;
$endif

*~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* investment cost calculation ~
*~~~~~~~~~~~~~~~~~~~~~~~~~~~
     investmentcost(projects, 'ProjectYield')$investment(projects,'ProjectYield')= investment(projects,'ProjectYield');
     investmentcost(projects, 'ProjectYield')
                 $sum((county,sector), Exist_Reuse_Cap(projects,county, sector))
                 =sum((county,sector), Exist_Reuse_Cap(projects,county, sector));

     investmentcost(projects, 'ProjectYield')
         $ASRPara(projects, 'maxrecovery')
         =max(investmentcost(projects, 'ProjectYield'), ASRPara(projects, 'maxrecovery') );
* water project cost calcuation

* amortize the cost using 3% interest rate with 50 years.
      investmentcost(projects,'annualfixedcost')
      = investment(projects, 'TotalCost')*0.03887 ;


* O&M cost = total annual cost- discounted fixed cost - other seperately counted cost (e.g. electricity and water )
      investmentcost(projects,'Optcost')
      =[  investment(projects, 'AnnualCost')
       - investment(projects, 'TotalCost')* investment(projects, 'discfactor')/100
       - investment(projects, 'EnergyCost')
       - investment(projects, 'PurchaseWaterCost')]*0.7;


* variable cost per acft with volume part
     investmentcost(projects,'unitvariablecost')
       $investmentcost(projects, 'ProjectYield')
     =  investment(projects,'PurchaseUnitPrice')
      +400$needWTP(projects)
      +[  investment(projects, 'AnnualCost')
       - investment(projects, 'TotalCost')* investment(projects, 'discfactor')/100
       - investment(projects, 'EnergyCost')
       - investment(projects, 'PurchaseWaterCost')]
      *0.3/investmentcost(projects, 'ProjectYield');



* energy volume per acft for each projects
* add the electricity usage by WTP
*https://www.sciencetheearth.com/uploads/2/4/6/5/24658156/electricity_use_and_management_in_the_municipal_water_supply_and_wastewater_industries.pdf
* Table 4-6 and
* 3.07 acft = 1MG
* ground water 2100 kwh/MG, surface 1600kwh/MG, desalination 12000 kwh/MG
* reuse is about 2960 kwh/MG (no discharge situation  Table 5-5 )
* generate treatment is about 2000 kwh/MG

    investmentcost(projects, 'energyperunit')  $investmentcost(projects,'ProjectYield')
    = investment(projects,'energyamount')/investmentcost(projects,'ProjectYield')
     + ((12000-1600)/3.07)$(SeaDesalprojects(projects) or BWDesalprojects(projects))
     + ((2960-1600)/3.07)$reuseprojects(projects);

Investmentsector(projects,  investsector)$sum( sameas(investsector, investalli),  investment(projects, investalli))=yes;
$ontext
* exist reuse water cost
*The Cost of Alternative Water Supply and Efficiency Options in California : Table 2
* 50% fixed cost, 35%  OM 15% variable

Water Recycling and Reuse Cost
Sample
Size
Non-Potable Reuse Facility
($/AF) Distribution
($/AF)
Total Cost of Non-Potable
Reuse ($/AF)
Low Median High Low Median High
Small Project (= 10,000 AFY) 7 $550 $590 $1,200 $950 $1,500 $1,500 $2,100

 *potable cost
https://www.epa.gov/sites/default/files/2018-01/documents/potablereusecompendium_3.pdf
$offtext



investmentcost(projects,'annualfixedcost')
        $sum(county, Exist_Reuse_Cap(projects,county,'mun'))
         =2177*sum((county), Exist_Reuse_Cap(projects,county,'mun')) ;
investmentcost(projects,'Optcost')
        $sum((county), Exist_Reuse_Cap(projects,county,'mun'))
         =650*sum((county), Exist_Reuse_Cap(projects,county,'mun')) ;

investmentcost(projects,'unitvariablecost')
        $sum((county), Exist_Reuse_Cap(projects,county,'mun'))
         =200;


investmentcost(projects,'annualfixedcost')
        $sum((county), Exist_Reuse_Cap(projects,county,'min'))
         =600*sum((county), Exist_Reuse_Cap(projects,county,'min')) ;
investmentcost(projects,'Optcost')
        $sum((county), Exist_Reuse_Cap(projects,county,'min'))
         =420*sum((county), Exist_Reuse_Cap(projects,county,'min')) ;

investmentcost(projects,'unitvariablecost')
        $sum((county), Exist_Reuse_Cap(projects,county,'min'))
         =100;


investmentcost(projects,'annualfixedcost')
        $sum((county), Exist_Reuse_Cap(projects,county,'ind'))
         =600*sum((county), Exist_Reuse_Cap(projects,county,'ind')) ;
investmentcost(projects,'Optcost')
        $sum((county), Exist_Reuse_Cap(projects,county,'ind'))
         =420*sum((county), Exist_Reuse_Cap(projects,county,'ind')) ;

investmentcost(projects,'unitvariablecost')
        $sum((county), Exist_Reuse_Cap(projects,county,'ind'))
         =100;

     investmentcost(projects,'averagecost')
       $investmentcost(projects, 'ProjectYield')
         =(investmentcost(projects,'Optcost')
           + investmentcost(projects,'annualfixedcost') )
          /investmentcost(projects, 'ProjectYield')
         +investmentcost(projects,'unitvariablecost') ;

set toohighcost(projects);

toohighcost(projects)
         $(investmentcost(projects,'averagecost') >500)=yes;

toohighcost(projects)
         $(not exist_projects (projects) )= no;
toohighcost(projects)
         $sum((county,sector), Exist_Reuse_Cap(projects,county,sector))=no;

display toohighcost;

investmentcost(toohighcost(projects),'annualfixedcost')
         =800*investmentcost(projects, 'ProjectYield');

investmentcost(toohighcost(projects),'Optcost')
         =220*investmentcost(projects, 'ProjectYield');

investmentcost(toohighcost(projects),'unitvariablecost')
         =100;


     investmentcost(projects,'averagecost')
       $investmentcost(projects, 'ProjectYield')
         =(investmentcost(projects,'Optcost')
           + investmentcost(projects,'annualfixedcost') )
          /investmentcost(projects, 'ProjectYield')
         +investmentcost(projects,'unitvariablecost') ;







display investmentcost;
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* adjust the geo info~
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


mapgroundproject(projects,sector,customer,county,aquifer,layer,groundwatertype)
         $(not aquiferLayerCounty(aquifer, layer, county)) =no;

mapinject_sourceG(projects,sourcecounty,sourceaquifer,layer)
         $(not aquiferLayerCounty(sourceaquifer,layer,sourcecounty)) =no;


*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* water projects mapping and checkup~
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

mapwaterprojecttype(groundprojects, 'ground')= yes;
mapwaterprojecttype(BWDesalprojects, 'brackishground')= yes;
mapwaterprojecttype(surfaceprojects, 'surface')=yes;
mapwaterprojecttype(ASRprojects, 'ASR')=yes;
mapwaterprojecttype(OCRprojects, 'OCR')=yes;
mapwaterprojecttype(SeaDesalprojects, 'seawater')=yes;
mapwaterprojecttype(reuseprojects, 'reuse')=yes;
mapwaterprojecttype(outsideprojects, 'outside')=yes;


missingproject(projects, 'cost')=yes;
missingproject(projects, 'cost')$sum(investalli, investmentcost(projects,investalli))= no;
missingproject(projects,waterproject_type)$mapwaterprojecttype(projects, waterproject_type)=yes;

missingproject(projects,'ground')$sum( mapgroundproject(projects,sector, customer , county, aquifer, layer, 'fresh'),1)=no;
missingproject(projects,'brackishground')$sum( mapgroundproject(projects,sector, customer , county, aquifer, layer, 'brackish'),1)=no;

missingproject(projects,'ground1')$sum( mapgroundproject(projects,sector, customer , county, aquifer, layer, 'fresh'),1)=yes;
missingproject(projects,'brackishground1')$sum( mapgroundproject(projects,sector, customer , county, aquifer, layer, 'brackish'),1)=yes;
missingproject(projects,'ground1')$mapwaterprojecttype(projects, 'ground')=no;
missingproject(projects,'brackishground1')$mapwaterprojecttype(projects, 'brackishground')=no;

missingproject(projects,'ASR')$sum(ASRitem, ASRPara(projects, ASRitem))=no;
missingproject(projects,'ASR1')$sum(ASRitem, ASRPara(projects, ASRitem))=yes;
missingproject(projects,'ASR1')$mapwaterprojecttype(projects, 'ASR')=no;

missingproject(projects,'surface')$sum(mapsurfaceproject1(projects,sector, customer,  sourceriver,riverplace),1)=no;

missingproject(projects,'OCR')$reservoirproject_storage(projects)=no;

missingproject(projects,'outside')$sum(mapoutsource(projects,sector, customer), 1)=no;
missingproject(projects,'seawater')$sum(mapseasource(projects,sector, customer), 1)=no;

missingproject(projects,'reuse')$sum(mapreuseproject(projects,sector, citycounty, sector, citycounty ), 1)=no;
missingproject(projects,'reuse1')$sum(mapreuseproject(projects,sector, citycounty, sector, citycounty ), 1)=yes;
missingproject(projects,'reuse1')$reuseprojects(projects)=no;


activeprojects(projects)$sum(waterproject_type, mapwaterprojecttype(projects,waterproject_type))= yes;
activeprojects(projects)$sum(waterproject_type, missingproject(projects, waterproject_type))=no;



display   missingproject, activeprojects, mapwaterprojecttype;

*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* water projects destination  ~
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
set link_project_sector_customer(projects,sector,citycounty) link the water projects with city county;

link_project_sector_customer(projects,sector,customer)
   $sum( mapgroundproject(projects,sector, customer , county, aquifer, layer, groundwatertype),1) =yes;
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* water rights associated with water projects  ~
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

WaterRightTakeout(projects,sourceriver,riverplace,county,sector)
         =sum((diversionlocation(sourceriver, diverters, riverplace),mapdiverterstocounty(diverters, county)),
                 WaterRightTakeout1(projects,sourceriver,diverters,sector));

display WaterRightTakeout;

*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* Calculate water projects proportion ~
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



wp_WPregion(projects,WPregion,sector,'ground')
         $sum(mapgroundproject(projects,sector,customer,county,aquifer,layer,groundwatertype),link_WPregion(WPregion,customer))=1;

wp_WPregion(projects,WPregion,sector,'ASR')
         $sum(mapinjectprojectrecover(projects, sector, customer),link_WPregion(WPregion,customer))=1;

wp_WPregion(projects,WPregion,sector,'surface')
         $sum(mapsurfaceproject1(projects,sector,customer,sourceriver,riverplace),link_WPregion(WPregion,customer))=1;


wp_WPregion(projects,WPregion,sector,'OCR')
         $sum(mapreservoirprojectrecover(projects,sector,customer,OCR),link_WPregion(WPregion,customer))=1;

wp_WPregion(projects,WPregion,sector,'outside')
         $sum(mapoutsource(projects,sector,customer),link_WPregion(WPregion,customer))=1;

wp_WPregion(projects,WPregion,sector,'seawater')
         $sum(mapseasource(projects,sector,customer),link_WPregion(WPregion,customer))=1;

wp_WPregion(projects,WPregion,sector,'reuse')
         $sum(mapreuseproject(projects,sector,customer,sector1,citycounty),link_WPregion(WPregion,customer))=1;

wp_WPregion_share(projects,wpregion,sector,waterproject_type)
         $sum((WP_all,sector1,waterproject_type1),
                 wp_WPregion(projects,WP_all,sector1,waterproject_type1))
         =wp_WPregion(projects,wpregion,sector,waterproject_type)
         /sum((WP_all,sector1,waterproject_type1),
                 wp_WPregion(projects,WP_all,sector1,waterproject_type1));

wp_WPregion_share(projects,SA_all,sector,waterproject_type)
         $wp_WPregion(projects,SA_all,sector,waterproject_type)
         =wp_WPregion_share(projects,'SA',sector,waterproject_type);


link_wp_WPregion      (projects,WPregion,sector,waterproject_type)
         $wp_WPregion_share(projects,wpregion,sector,waterproject_type) = yes;

option wp_wpregion:0:3:1;
display  wp_WPregion, wp_WPregion_share;
