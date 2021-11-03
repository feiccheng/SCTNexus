*execute 'gams run_base.gms r=.\t\a2 s=.\t\a3'
*execute 'gams run_scenarios.gms  r=.\t\a3 s=.\t\a4'
$include whereissource

execute 'gams %whereisreport%report_to_gdx.gms  r=./t/a4_base u1=base'
execute 'gams %whereisreport%report_to_gdx.gms  r=./t/a4_miroc5_rcp45 u1=miroc4_rcp45'
execute 'gams %whereisreport%report_to_gdx.gms  r=./t/a4_ipsl_rcp45 u1=a4_ipsl_rcp45'
execute 'gams %whereisreport%report_to_gdx.gms  r=./t/a4_miroc5_rcp85 u1=miroc4_rcp85'
execute 'gams %whereisreport%report_to_gdx.gms  r=./t/a4_ipsl_rcp85 u1=a4_ipsl_rcp85'

*execute 'gams run_report.gms'
