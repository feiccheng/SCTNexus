


set projects  all water projects names from 2021 region L&N report
/

*ASR
$include %whereiswaterprojects%data_wp_set_asr.gms

$offlisting
* seawater desalination
$include %whereiswaterprojects%data_wp_set_seadesal.gms
$include %whereiswaterprojects%data_wp_set_groundbrackish.gms
$include %whereiswaterprojects%data_wp_set_groundfresh.gms
$include %whereiswaterprojects%data_wp_set_ocr.gms
$include %whereiswaterprojects%data_wp_set_reuse.gms
$include %whereiswaterprojects%data_wp_set_mixed.gms
$include %whereiswaterprojects%data_wp_set_wtpexp.gms
$include %whereiswaterprojects%data_wp_set_outside.gms
$include %whereiswaterprojects%data_wp_set_misc.gms
/ ;

alias (projects, projects2);
Alias(projects, project);

*ASR
set ASRprojects(projects)   acquifer storage and recovery project list /
$include %whereiswaterprojects%data_wp_set_asr.gms
/  ;
* seawater desalination
set SeaDesalprojects(projects)   seawater desalination projects/
$include %whereiswaterprojects%data_wp_set_seadesal.gms
/  ;

*brackish ground water
set BWDesalprojects(projects) brackish groundwater project list including cross county delivery /
$include %whereiswaterprojects%data_wp_set_groundbrackish.gms
/ ;
* ground fresh
set groundprojects(projects)   fresh groundwater project list including delivery across counties/
$include %whereiswaterprojects%data_wp_set_groundfresh.gms
/   ;
*OCR
set OCRprojects(projects)   off-channel reservoir water projects list/
$include %whereiswaterprojects%data_wp_set_ocr.gms
 / ;
*reuse
set reuseprojects(projects)  reuse water project list/
$include %whereiswaterprojects%data_wp_set_reuse.gms


/ ;

*surface
set surfaceprojects(projects)   surface water project list
/
$include %whereiswaterprojects%data_wp_set_wtpexp.gms
/ ;

* outside projects
set outsideprojects(projects) outside water projects list/
$include %whereiswaterprojects%data_wp_set_outside.gms
/ ;

* mixed projects
set mixedprojects(projects) mixed type projects list
/
$include %whereiswaterprojects%data_wp_set_mixed.gms
/ ;
set     investalli investment items from budget table
/
AG                 agriculture sector
MUN                municipal sector
IND                industry sector
COOL               power plant cooling
Min                mining sector
TotalCost          total cost
year               debt payment years
Interest           the interest rate
Pipeline           the pipeline cost
WTP                water treatment cost
AnnualCost         total annual cost of O&M and capity
EnergyAmount       total energy amount for pumping will be used if fully operated (kwh)
EnergyPrice        the price of energy
EnergyCost         the total energy cost if fully operated = energyAmount*energy price
Reservoir          the cost of building reservior and dam
Pumpstation        the cost of operating pump station
PurchaseWaterCost  the cost of purchase water when no water rights
PurchaseAmount     the amount of water purchased
PurchaseUnitPrice  the unit price of purchasing water
ProjectYield       the yield of project
PeakFactor         the peak factor
discfactor         the discount factor (need to divide by 100 to amortized the cost
annualfixedcost    the annual fixed cost
Optcost            O&M cost without purchasing water or electricity
unitvariablecost   the cost of purchasing water
energyperunit      electricty usage per acft water

averagecost        the average cost of water projects
/   ;

set waterproject_type types of water project
/ground, surface, brackishground, ASR, OCR,  seawater, reuse, outside/;

set groundwatertype/fresh, brackish/;

set
 exist_projects (projects)       exist and operating projects
/
CRWAWellsRanch_I    , TrinityNBU            ,  GBRAMidBasin
CzoSSLGC            , CzoSAWS               ,  SanAntonioASR
KerrvilleExistASR   ,  TrinityOliver
TrinityWeco         , VistaRidge
CRWAWellsRanch_II   , BWSAWS

OsoReuse            ,   NuecesManuReuse    ,         SanPatricioManuReuse
AllisonReuse        , WhitecapReuse        ,         LagunaReuse        ,       GreenwoodReuse
CCMAReuse           , KyleReuse            ,         NewBraunfelReuse   ,       SeguinReuse
SAWSReuse           , SARAReuse            ,         SanMacrosReuse

ARANSAS_ReuseMun
ATASCOSA_ReuseMin
BANDERA_ReuseMun
BEXAR_ReuseInd
CALHOUN_ReuseInd
COMAL_ReuseInd
DEWITT_ReuseMin
DIMMIT_ReuseMin
FAYETTE_ReuseMin
FRIO_ReuseMin
GONZALES_ReuseInd
GONZALES_ReuseMin
GUADALUPE_ReuseInd
JIMWELLS_ReuseMun
KARNES_ReuseMin
KENDALL_ReuseMun
KERR_ReuseMun
LASALLE_ReuseMin
LAVACA_ReuseMin
LIVEOAK_ReuseMin
MAVERICK_ReuseMun
MCMULLEN_ReuseMin
MEDINA_ReuseMun
SANPATRICIO_ReuseMun
UVALDE_ReuseMun
WEBB_ReuseMun
Webb_ReuseMin
WILSON_ReuseMin

 /


Projects_retireplan(decades, projects) the water projects retirement plan
/
2030. TrinityWeco
2050. TrinityOliver
*2050. GBRAwestCanyon
*2050. WellsRanch
/

 ;
