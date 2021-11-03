
$include whereissource.gms
$onmulti
set gdxfiles /
$include %wheretopassfiles%report_merge_gdx_files_to_merge.gms
/;
$offmulti

display gdxfiles;
file gdx1a /%wheretopassfiles%report_merge_contains_the_gdxmerge_instruction_to_run.gms/;

put gdx1a;
gdx1a.pw=1000;
put '$call gdxmerge '
loop(gdxfiles,
     put '.\t\' gdxfiles.tl:0 '  ');
put 'output=%wheretopassfiles%merged.gdx'
