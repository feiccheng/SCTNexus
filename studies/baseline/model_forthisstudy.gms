* to do list
* SAWS can provide recycled water to CPS

 set stateofnature(states)        subset of states to run small model ;
     stateofnature(state)=yes;

alias(stateofnature, sonfrom, sonto);
parameter pp_bound(uplow)
/
  upper 0.3
  lower 0.2
/

scalar scalobjj scaling factor for objective function /1/   ;

parameter drawdown_unitpanelty(aquifer,layer,county)      the drawdown unit panelty
/
Carrizo                 .        layer1        .        ATASCOSA         20
Carrizo                 .        layer1        .        FRIO             20
Carrizo                 .        layer1        .        GONZALES         20
Carrizo                 .        layer1        .        LASALLE          50
Carrizo                 .        layer1        .        WILSON           20
Carrizo                 .        layer3        .        ATASCOSA         20
Carrizo                 .        layer3        .        FRIO             20
Carrizo                 .        layer3        .        GONZALES         80
Carrizo                 .        layer3        .        WILSON           20

Carrizo                 .        layer5        .        BEE              40
Carrizo                 .        layer5        .        BEXAR            250
Carrizo                 .        layer5        .        FRIO             20
Carrizo                 .        layer5        .        GUADALUPE        40
Carrizo                 .        layer5        .        GONZALES         80
Carrizo                 .        layer5        .        KARNES           200
Carrizo                 .        layer5        .        MCMULLEN         120
Carrizo                 .        layer5        .        MEDINA           40
Carrizo                 .        layer5        .        UVALDE           300
Carrizo                 .        layer5        .        WEBB             100

Carrizo                 .        layer6        .        ATASCOSA         60
Carrizo                 .        layer6        .        BEE              80
Carrizo                 .        layer6        .        FRIO             120
Carrizo                 .        layer6        .        MEDINA           60

Carrizo                 .        layer7        .        ATASCOSA         60
Carrizo                 .        layer7        .        BEE              60
Carrizo                 .        layer7        .        BEXAR            150
Carrizo                 .        layer7        .        CALDWELL         20
Carrizo                 .        layer7        .        DIMMIT           20
Carrizo                 .        layer7        .        FRIO             200
Carrizo                 .        layer7        .        GUADALUPE        100
Carrizo                 .        layer7        .        MEDINA           40
Carrizo                 .        layer7        .        UVALDE           200
Carrizo                 .        layer7        .        WILSON           80
Carrizo                 .        layer7        .        ZAVALA           80

Carrizo                 .        layer8        .        ATASCOSA         20
Carrizo                 .        layer8        .        BEE              20
Carrizo                 .        layer8        .        BEXAR            150
Carrizo                 .        layer8        .        DIMMIT           20
Carrizo                 .        layer8        .        FRIO             120
Carrizo                 .        layer8        .        GUADALUPE        120
Carrizo                 .        layer8        .        MEDINA           20
Carrizo                 .        layer8        .        UVALDE           140
Carrizo                 .        layer8        .        WILSON           20
Carrizo                 .        layer8        .        ZAVALA           130

EdwardsTrinity          .        layer1        .        BANDERA          60
EdwardsTrinity          .        layer1        .        EDWARDS          60
EdwardsTrinity          .        layer1        .        GILLESPIE        60
EdwardsTrinity          .        layer1        .        KERR             420
EdwardsTrinity          .        layer1        .        REAL             60
EdwardsTrinity          .        layer1        .        KINNEY           40

EdwardsTrinity          .        layer2        .        KERR             120
EdwardsTrinity          .        layer2        .        BEXAR            120
EdwardsTrinity          .        layer2        .        COMAL            120
EdwardsTrinity          .        layer2        .        HAYS             90
EdwardsTrinity          .        layer2        .        KENDALL          100
EdwardsTrinity          .        layer2        .        UVALDE           80

GulfCoast               .        layer1        .        ARANSAS          20
GulfCoast               .        layer1        .        BEE              20
GulfCoast               .        layer1        .        CALHOUN          40
GulfCoast               .        layer1        .        DEWITT           80
GulfCoast               .        layer1        .        Duval            40
GulfCoast               .        layer1        .        GOLIAD           40
GulfCoast               .        layer1        .        JIMWELLS         20
GulfCoast               .        layer1        .        Lavaca           80
GulfCoast               .        layer1        .        LIVEOAK          120
GulfCoast               .        layer1        .        Nueces           20
GulfCoast               .        layer1        .        REFUGIO          20
GulfCoast               .        layer1        .        SANPATRICIO      40
GulfCoast               .        layer1        .        VICTORIA         20

GulfCoast               .        layer2        .        BEE              40
GulfCoast               .        layer2        .        DEWITT           180
GulfCoast               .        layer2        .        Duval            40
GulfCoast               .        layer2        .        Fayette          40
GulfCoast               .        layer2        .        GOLIAD           20
GulfCoast               .        layer2        .        JIMWELLS         20
GulfCoast               .        layer2        .        KARNES           100
GulfCoast               .        layer2        .        LIVEOAK          80
GulfCoast               .        layer2        .        Nueces           40
GulfCoast               .        layer2        .        SANPATRICIO      20
GulfCoast               .        layer2        .        WEBB             80

GulfCoast               .        layer3        .        BEE              20
GulfCoast               .        layer3        .        DEWITT           60
GulfCoast               .        layer3        .        Duval            20
GulfCoast               .        layer3        .        JIMWELLS         20
GulfCoast               .        layer3        .        KARNES           100
GulfCoast               .        layer3        .        Lavaca           20
GulfCoast               .        layer3        .        LIVEOAK          20
GulfCoast               .        layer3        .        MCMULLEN         20

GulfCoast               .        layer4        .        BEE              40
GulfCoast               .        layer4        .        DEWITT           20
GulfCoast               .        layer4        .        Duval            20
GulfCoast               .        layer4        .        Fayette          90
GulfCoast               .        layer4        .        JIMWELLS         20
GulfCoast               .        layer4        .        KARNES           100
GulfCoast               .        layer4        .        Lavaca           50
GulfCoast               .        layer4        .        LIVEOAK          20
GulfCoast               .        layer4        .        MCMULLEN         20
GulfCoast               .        layer4        .        WEBB             140

/;

drawdown_unitpanelty(aquifer,layer,county)
    $((not sameas(aquifer,'edwards'))
      and AquiferLayerCountyReg(Aquifer, layer, county)
      and (drawdown_unitpanelty(aquifer,layer,county) =0))=20;


   drawdown_cost(county,aquifer,layer,steps_dd)$drawdown_PumpVol(county,aquifer,layer)
          = max(99,
             [drawdown_PumpVol(county,aquifer,layer)
            *drawdown_unitpanelty(aquifer,layer,county)] )
            *(1+ drawdown_dist(steps_dd)/100);

   drawdown_cost('none',"Edwards",layer,steps_dd)$drawdown_PumpVol('none',"Edwards",layer)
          = ( [drawdown_PumpVol('none',"Edwards",layer)
            *5]
            *(1+ drawdown_dist(steps_dd)/100));

  Demanddata(citycounty,sector,'annual','treatment')
         $Demanddata (citycounty,sector,'annual',"quantity")  =400;

   Demanddata(citycounty,sector,'annual',"othercost")
         $Demanddata (citycounty,sector,'annual',"quantity")
              = Demanddata(citycounty,sector,'annual','price')
               -Demanddata(citycounty,sector,'annual','treatment') -100;

   Demanddata(citycounty,sector,'annual',"elasticity")
         $Demanddata (citycounty,sector,'annual',"elasticity")  =-0.06;

$ontext
  Demanddata(county,sector,'annual','quantity')
         $waterdemand_climate_new(county,sector,'2020')
         =waterdemand_climate_new(county,sector,'2020')*inregion_Pop_per(County)  ;

  Demanddata(county,sector,'annual','quantity')
         $(waterdemand_climate_new(county,sector,'2020') and sum(city, mapcitycountytocounty(city,county)) )
         =waterdemand_climate_new(county,sector,'2020')*inregion_Pop_per(County)
          - sum(mapcitycountytocounty(city,county), Demanddata(city,sector,'annual','quantity') )   ;
$offtext

    Demanddata('Karnes','min','annual',"quantity")=1000;
    Demanddata('Dimmit','min','annual',"quantity")=1000;
    Demanddata('Lasalle','min','annual',"quantity")=5100;
    Demanddata('MCMULLEN','min','annual',"quantity")=3000;

     Demanddata_pp('price')  =102;
Demanddata_pp('elasticity')  =-0.1;



display demanddata;


$setglobal useart
$setglobal newprojects
$setglobal energy
*$setglobal watermarket
*$setglobal hourly
*$setglobal watermix

option limrow=0;
option limcol=0;
option solprint=off;
option profile=1;
option profiletol=0.05;
option dispwidth= 20;
option savepoint=1;


$include %whereismodel%model_setup.gms
$include %whereismodel%model_structure.gms
$include %whereismodel%model_iwantgamschk.gms
$include %whereismodel%model_scale.gms

$setglobal solverhere rmip




$if exist INFEWS_Base_p.gdx execute_loadpoint "INFEWS_base_p.gdx";
*EV_DEMAND_STEPS.fx(stateofnature,'s31')=1;

INFEWS_Base.optfile=1;
INFEWS_Base.scaleopt=1;

*option MIp=gamschk;
*option rMIp=gamschk;
*option rmip=cplex;
*solve INFEWS_base using %solverhere% max V_NETBENEFIT;

