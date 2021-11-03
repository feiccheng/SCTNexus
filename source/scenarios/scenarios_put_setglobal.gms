$ontext
put setglobalfile;
put  '$setglobal altrunglobal ' %1.tl:30;
putclose;
execute 'copy "./t/altrunhere.gms"  ".\t\%1.gms"  ';
$offtext

$setglobal altrunglobal base_2030


