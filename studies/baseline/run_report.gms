$set env ide=%gams.ide% lo=%gams.lo%
*$include %whereisreport%report_to_gdx.gms

$include whereissource.gms
*execute 'gams %whereisreport%report_merge_write_the_GDXMERGE_command.gms %env%'

execute 'gams %whereisreport%report_merge_the_runs_to_get_ready_for_finalcal.gms r=./t/a2 s=./t/merged %env% '
*$offtext
execute 'gams %whereisreport%report_finalcal.gms %env% r=./t/merged '
