*CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
* municipal conservation project (demand reduction)
*CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC


set countyL(citycounty) county or city in region L
/
ATASCOSA,      BEXAR,          CALDWELL,         CALHOUN,
COMAL,         DEWITT,         DIMMIT,           FRIO,
GOLIAD,        GONZALES,       GUADALUPE,        HAYS,
KARNES,        KENDALL,        LASALLE,          MEDINA
REFUGIO,       UVALDE,         VICTORIACITY,     WILSON,
ZAVALA,        SanAntonio
 /
 countyN(citycounty)  county or city in region N
/
CorpusChristi,   ARANSAS,      BEE,           DUVAL,
NUECES,          LIVEOAK,      SANPATRICIO,   JIMWELLS/
 countyK(citycounty) county or city in region K
/
BASTROP,  BLANCO,   FAYETTE,  GILLESPIE/
*,   TRAVIS/

 countyP(citycounty) county or city in region P
/LAVACA/

countyJ(citycounty) county or city in region J
 /KINNEY, BANDERA  , KERR, Real, EDWARDS /

countyM(citycounty) county or city in region M
/WEBB, MAVERICK/;
parameter conservecost(citycounty)  unit cost of conservation in different regions;
          conservecost(citycounty)$countyL(citycounty)=700;
          conservecost(citycounty)$countyN(citycounty)=510;
          conservecost(citycounty)$countyK(citycounty)=300;
          conservecost(citycounty)$countyP(citycounty)=340;
          conservecost(citycounty)$countyM(citycounty)=650;
          conservecost(citycounty)$countyJ(citycounty)=910;

* don't forget to proportate it
TABLE demand_reduction (citycounty, decades)      municipal water demand reduction in acft per whole county

                2020       2030        2040         2050         2060         2070

ATASCOSA         152        505         903         1290         1518         1815
BEXAR            325        946        1561         2208         2962         3849
CALDWELL           9         15          22           33           48          149
CALHOUN            6         14          16           22           31           41
COMAL            878       2768        5149         7043         9154        11495
DEWITT           399        435         435          471          763          890
DIMMIT           811        953        1037         1157          702          853
FRIO             129        383         667          838          998         1127
GOLIAD           395        460         477          415          120          133
GONZALES         491        783        1142         1591         1887         2297
GUADALUPE        244        376         671         1332         2318         3590
HAYS             213        906        1301         2004         3166         4988
KARNES           278        533         679          786          816          943
KENDALL          136        484         985         1513         1888         2307
LASALLE          696        842         984         1186          635          789
MEDINA           139        384         631          839          979         1162
REFUGIO          283        195         118           69          129          146
UVALDE           198        568         971         1420         1796         2001
VICTORIACITY     809       2200        3642         5158         6705         7517
WILSON           224        548         955         1389         1778         2274
ZAVALA            94        286         504          720          872         1034
SanAntonio       696       1851        2811        11205        27471        46888
CorpusChristi   2305       7354       10985        10667        10765        10898
ARANSAS           78        225         218          203          200          200
BEE              117        333         542          710          706          707
DUVAL             57        167         241          285          290          297
NUECES           310        749        1148         1563         1892         2068
LIVEOAK           46        103         109          102           91           91
SANPATRICIO      144        230         283          391          452          456
JIMWELLS         192        598        1044         1179         1324         1402
BASTROP          961       1619        2086         2734         3629         4816
BLANCO            37         62          58           54           53           53
FAYETTE           96        114         140          201          273          338
GILLESPIE        317        599         733          916         1094         1301
*TRAVIS          4467       9939       13799        17534        21264        25375
LAVACA           100        153         207          274          261          338
MAVERICK         208        728        1313         1758         2290         3175
WEBB                                                2631         6420        10753
KINNEY            58         58          58           58           58           58
BANDERA          499        554         583          593          601          606
KERR             166        166         166          167          167          167
;
demand_reduction(citycounty, '2090')=
    demand_reduction(citycounty, '2070')
  +max(0,  +demand_reduction(citycounty, '2070')
          -demand_reduction(citycounty, '2050'));

demand_reduction(citycounty, '2080')=
    demand_reduction(citycounty, '2090')  /2
   +demand_reduction(citycounty, '2070')  /2  ;

demand_reduction(county, decades)
      =inregion_Pop_per(County)
       *demand_reduction(county, decades) ;


parameter conservation_Reduction(citycounty);

conservation_Reduction(citycounty)=demand_reduction (citycounty, '2020') ;
