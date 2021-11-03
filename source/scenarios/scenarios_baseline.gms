$include %whereisscenario%scenarios_buildupruns.gms
$include %whereisscenario%scenarios_savedata.gms
$include %whereisreport%report_setup.gms



 scenariohere('base')= yes;
 decadehere('2020')= yes;
 altrunhere('base_2020')= yes;

$if exist INFEWS_base.gdx execute_loadpoint "INFEWS_Base.gdx";

$include %whereismodel%model_domain.gms
$include %whereismodel%model_bounds.gms
$include %whereismodel%model_scale.gms

$include %whereisreport%report_presolve_save.gms


*option MIp=gamschk;
*option rmip=cplex;
solve INFEWS using %solverhere% max V_NETBENEFIT;

$include  %whereisreport%report_inloops.gms
$include  %whereisreport%report_postsolve.gms
$include  %whereisreport%report_welfare_check.gms
