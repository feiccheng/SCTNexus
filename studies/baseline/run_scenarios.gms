
set altrun(altrunsall)
/

base_2030
base_2050
base_2070
base_2090
$ontext
miroc5_rcp45_2030
miroc5_rcp45_2050
miroc5_rcp45_2070
miroc5_rcp45_2090

ipsl-cm5a-lr_rcp45_2030
ipsl-cm5a-lr_rcp45_2050
ipsl-cm5a-lr_rcp45_2070
ipsl-cm5a-lr_rcp45_2090


miroc5_rcp85_2030
miroc5_rcp85_2050
miroc5_rcp85_2070
miroc5_rcp85_2090
ipsl-cm5a-lr_rcp85_2030
ipsl-cm5a-lr_rcp85_2050
ipsl-cm5a-lr_rcp85_2070
ipsl-cm5a-lr_rcp85_2090
$offtext
/;

option limrow=0;
option limcol=0;
option solprint=off;
option profile=1;
option profiletol=0.05;
option dispwidth= 20;
option savepoint=0;

INFEWS.optfile=1;
INFEWS.scaleopt=1;


file gckfile2 "gamschk file"  /run_scenarios.gck/;
put gckfile2;
$onput

blocklist
#picture
analysis
displaycr
variables
AV_LANDTRANS(HAYS)

$offput
putclose;


$setglobal solverhere mip
option rmip=gamschk;
option rmip=cplex;

$include %whereisscenario%scenarios_loops.gms
