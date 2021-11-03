
$include whereissource.gms
$showvariables
$if not set wheretopassfiles $setglobal wheretopassfiles  ".\t\"
*this code is used in the merge process and saves a gdx file that contains the tables needed for the ultimate run of
*report final.cal

*save a gdx file with name specified as user1 in the scenario_loop
execute_unload '%wheretopassfiles%%htmlappend%%useyear%.gdx'
*this file has names of tables to put in GDX
$include %whereismergesource%report_merge_runs_unload_for_merge.gms
;
*put out the gdx file name into a list of those names
file gd1 /"%wheretopassfiles%report_merge_gdx_files_to_merge.gms"/;
put gd1 ;
*append it
gd1.ap=1;
put  '"%wheretopassfiles%%htmlappend%%useyear%.gdx"' /;
putclose;

*put out a list of scenarios within the gdx file
file gd2 /"%wheretopassfiles%report_merge_gdx_file_base_cases_for_scenarios.gms"/;
put gd2  ;
*merge it total list
gd2.ap=1;
loop(altrun,
    put altrun.tl:60 '.' whatisbasehere.tl:0 /
);

*put out a list of the base scenario associated with each scenarios within the gdx file
file gd3 /"%wheretopassfiles%report_merge_scenarios_contained_in_gdx.gms"/;
put gd3  ;
*append it
gd3.ap=1;
loop(altrun,
    put altrun.tl:60 " " altrun.te(altrun):0/
);

*put out the gdx file name without the gdx extension into a list of those names
file gd4 /"%wheretopassfiles%report_merge_gdx_files_root_names_to_merge.gms"/;
put gd4 ;
*append it
gd4.ap=1;
put  '%htmlappend%%useyear%' /;
putclose;



