$ifthen not declared wp
scalar do_i_want_wp              do i want water projects yes=1 no =0  /0/
       do_i_want_pp              do i want power plants   yes=1 no =0   /0/
       do_i_want_wm              do i want water markets  yes=1 no =0   /0/
       do_i_want_watermix        do i want water mix  yes=1 no =0       /0/

;
scalar useart /0/;
$endif

* set up the water projects, power plants and water markets
do_i_want_wp=0;
do_i_want_pp=0;
do_i_want_wm=0;
useart=0;

$ifthen setglobal newprojects
    do_i_want_wp=1;
$endif

$ifthen setglobal energy
    do_i_want_pp=1;
$endif

$ifthen setglobal watermarket
    do_i_want_wm=1;
$endif

$ifthen setglobal watermix
    do_i_want_watermix=1;
$endif


$ifthen setglobal useart
     useart=1;
$endif


* set up the hourly or montly model
$ifthen setglobal hourly
$    setglobal addhour ,agg_hour
$else
$    setglobal addhour
$endif
