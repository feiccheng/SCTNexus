# How to run SCTNEXUS Model

### the following is the script file. 
##### the work in Step 2 can be split to different processers. 

#### Step 1:
execute 'gams run_base.gms r=.\t\a2 s=.\t\a3'
execute 'gams run_scenarios.gms  r=.\t\a3 s=.\t\a4'

#### Step 2:
$include whereissource 

execute 'gams %whereisreport%report_to_gdx.gms  r=./t/a4_base u1=base' \
execute 'gams %whereisreport%report_to_gdx.gms  r=./t/a4_miroc5_rcp45 u1=miroc4_rcp45' \
execute 'gams %whereisreport%report_to_gdx.gms  r=./t/a4_ipsl_rcp45 u1=a4_ipsl_rcp45' \
execute 'gams %whereisreport%report_to_gdx.gms  r=./t/a4_miroc5_rcp85 u1=miroc4_rcp85' \
execute 'gams %whereisreport%report_to_gdx.gms  r=./t/a4_ipsl_rcp85 u1=a4_ipsl_rcp85' 

#### Step 3: 
execute 'gams run_report.gms r=./t/a1'

#### Step 4:
execute 'gams %whereisreport%report_finalcal.gms  r=./t/merged pw=140'
