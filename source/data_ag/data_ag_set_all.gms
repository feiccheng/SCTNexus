*^^^^^^^^^^^^^^^^^^^^^^^
*  crops and livestock
*^^^^^^^^^^^^^^^^^^^^^^^

set alli                      all elements in crop budget and livestock budget
/
$include %whereisag%data_ag_set_primary.gms
*livestock name
$include %whereisag%data_ag_set_livestockname.gms
* livestock name in mix

                           goatsangora                   Name of Angoras         counted in livestockmix per budget (Unit is Head)
                           MeatGoats                     Name of MeatGoatsFarm  MeatGoatsRange  counted in livestockmix per budget (Unit is Head)
                           Stockers                      Name of StockersWinter  counted in livestockmix per budget (Unit is Head)
                           BeefCow                       Name of CowCalf         counted in livestockmix per budget (Unit is Head)


* other crop names, cropnames in mix and primary product
                           Vegetables                Vegetables at all
                           ricefirst                 first year rice \ product is rice \unit is CWT
                           ricesecond                second year rice (optional) \ product is rice \unit is CWT
                           cotton                    cotton     (has two products CottonLint and cottonseed)
                           pasture                   Improved pastureland (product is Grazing)
                           yield

$include %whereisag%data_ag_set_exog_input.gms
$include %whereisag%data_ag_set_endo_input.gms
                                                      /  ;


set livestock(alli)                      the name of livestock in the model
                 /
$include %whereisag%data_ag_set_livestockname.gms
                           /
    crops(alli)                          the name of crops in the model
                           /
$include %whereisag%data_ag_set_cropname.gms
                           /
    FeedingMethod                        the method of Feeding livestock
                           /Pasture             Feed livestock on native pasture land
                            Grazing             Feed livestock on rented improved pasture
                           /

;

set primary(alli)                        primary output of livestock and crops
/
$include %whereisag%data_ag_set_primary.gms
/;

set livestock_mix(alli)                  livestock name in livestock mix
/
$include %whereisag%data_ag_set_livestockmix.gms
/ ;

set crop_mix(crops)                      the name of crops in crop mix
/

$include %whereisag%data_ag_set_fieldcropmix.gms
$include %whereisag%data_ag_set_vegmix.gms
/;

set vege_mix(crops)                      the name of vegetables in mix
/
$include %whereisag%data_ag_set_vegmix.gms

/
;

set aginput(alli)                        input in agricultural sector
/
$include %whereisag%data_ag_set_exog_input.gms
/ ;

alias(crops, crop);
alias(crop_mix, crop_mix2);
alias(livestock, livestock2);

*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*~ Ag land
*~~~~~~~~~~~~~~~~~

Set      District                                        Crop budget data are grouped by district
              /Dist10,Dist11,Dist12, alldist/
            regioncountymapping(District,county)         Agregion and its county mapping
               /  Dist10.        (      BANDERA        ,        COMAL           ,        HAYS        ,        REAL
                                        BASTROP        ,        EDWARDS         ,        KENDALL     ,        UVALDE
                                        BEXAR          ,        GILLESPIE       ,        KERR        ,        WILSON
                                        BLANCO         ,        GONZALES        ,        KINNEY      ,        MEDINA
                                        CALDWELL       ,        GUADALUPE         ),

                  Dist11.        (       ARANSAS        ,        CALHOUN        ,        GOLIAD        ,        Nueces
                                         BEE            ,        DEWITT         ,        KARNES        ,        REFUGIO
                                         SANPATRICIO    ,        VICTORIA       ,        Fayette       ,       Lavaca ),

                  Dist12.        (      ATASCOSA      ,        JIMWELLS        ,        MAVERICK        ,        WEBB
                                        DIMMIT        ,        LASALLE         ,        MCMULLEN        ,        ZAVALA
                                        FRIO         ,        LIVEOAK           ,        Duval )

               /
              ;

set          LandirrType                                 Land types
          /Irrigated,       Dryland,       Furrow,    Sprinkler,  Pasture/

          Irrigstatus(landirrtype)                       Irrigation status
          /irrigated                     land can be irrigated
           dryland                       land is not irrigated
           /
          landirrmapping(Irrigstatus, landirrtype)       map to irrigation system type incuding dryland
          /
           irrigated. irrigated
           irrigated. furrow
           irrigated. sprinkler
           dryland  . dryland
          /
;

*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*~ Ag water
*~~~~~~~~~~~~~~~~~


set       watr(alli)     Monthly water use
          /jan-water,feb-water,mar-water,apr-water,may-water,jun-water
           jul-water,aug-water,sep-water,oct-water,nov-water,dec-water/

         mapwater(timing,watr)  map months to labels for water use
            /
            Jan       .        Jan-water
            Feb       .        Feb-water
            Mar       .        Mar-water
            Apr       .        Apr-water
            May       .        May-water
            Jun       .        Jun-water
            Jul       .        Jul-water
            Aug       .        Aug-water
            Sep       .        Sep-water
            Oct       .        Oct-water
            Nov       .        Nov-water
            Dec       .        Dec-water
             /   ;



$ontext
set crop_primary(primary)                                primary crop production  (here grazing is not included)
/
*crop primary
                           cabbage                   cabbage     unit is   Carton
                           hay                       hay         unit is   Ton
                           cucumber                  cucumber    unit is   CWT
                           onion                     onion       unit is   Sack
                           sesame                    sesame      unit is   CWT
                           wheat                     wheat       unit is   Bushel
                           oats                      oats        unit is     bushel
                           honeydew                  honeydew    unit is   Carton
                           sorghumhay                sorghumhay  unit is   Roll
                           barley                    barley      unit is   Ton
                           canola                    canola      unit is   Bushel
                           corn                      corn        unit is   Bushel
                           spinach                   spinach     unit is   Carton
                           peanut                    peanut      unit is   CWT
                           sorghum                   sorghum     unit is   CWT
                           cantaloupe                cantaloupe  unit is   Carton
                           waterMelon                waterMelon  unit is   CWT
                           soybeans                  soybeans    unit is   Bushel
                           rice                      rice (product of ricefirst and ricesecond) unit is   CWT
                           CottonLint                CottonLint  unit is   Pound
                           Cottonseed                Cottonseed  unit is   Ton
                           grazing                   grazing     unit is   acres

/
    livestock_primary(primary)   livestock production
/
*livestock primary
                           AngoraKid                     Primary output of Angoras          in livestockmix per budget (Unit is) CWT
                           CullDoe-Angora                Primary output of Angoras          in livestockmix per budget (Unit is) CWT
                           AdultMohair                   Primary output of Angoras          in livestockmix per budget (Unit is) Pound
                           YearlingMohair                Primary output of Angoras          in livestockmix per budget (Unit is) Pound
                           KidMohair                     Primary output of Angoras          in livestockmix per budget (Unit is) Pound
                           Steer                         Primary output of CowCalf          in livestockmix per budget (Unit is) CWT
                           Heifer                        Primary output of CowCalf          in livestockmix per budget (Unit is) CWT
                           CullCow                       Primary output of CowCalf          in livestockmix per budget (Unit is) CWT
                           CullBull                      Primary output of CowCalf          in livestockmix per budget (Unit is) CWT
                           MeatGoatKid                   Primary output of MeatGoatsFarm  MeatGoatsRange   in livestockmix per budget (Unit is) CWT
                           CullDoe-Meat                  Primary output of MeatGoatsFarm  MeatGoatsRange   in livestockmix per budget (Unit is) CWT
                           Lambs                         Primary output of SheepHair      SheepWool        in livestockmix per budget (Unit is) CWT
                           CullEwes                      Primary output of SheepHair      SheepWool        in livestockmix per budget (Unit is) CWT
                           Wool                          Primary output of SheepWool        in livestockmix per budget (Unit is) Pound
                           Stocker                       Primary output of StockersWinter   in livestockmix per budget (Unit is) CWT
/
$offtext
