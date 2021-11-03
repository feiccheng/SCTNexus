
option limrow=0;
option limcol=0;
option solprint=off;
option profile=1;
option profiletol=0.05;
option dispwidth= 20;
option savepoint=1;
$if exist INFEWS_Base_p.gdx execute_loadpoint "INFEWS_base_p.gdx";

INFEWS.optfile=1;
INFEWS.scaleopt=1;

$setglobal solverhere mip
option rmip=cplex;
option  mip=cplex;

$include %whereisscenario%scenarios_baseline.gms
display pp_potential_all;

