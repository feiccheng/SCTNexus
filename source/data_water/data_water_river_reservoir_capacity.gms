
*^^^^^^^^^           Reservoir Capacity Data Set          ^^^^^^^^^^^^^^^
*source:  http://www.twdb.texas.gov/surfacewater/rivers/reservoirs/index.asp
*a reservoir is treated as both a diverter and a river place, since it is an actual water diversion point
* canyan@cp03gdsn,    coleto creek@cp16gdsn,  medina lake@cp21gdsn, braunig lake@cp30gdsn
* calaveras lake@cp31gdsn, olmos@cp18gdsn, lake mcqueeney@cp06gdsn, upper nueces@cp04nus
* lake gonzales@ 51723gdsn, lake dunlap@ 548801gdsn, lake corpuschristi@cp3031nus, choke canyan@cp2731nus

$ontext
parameter reservoircapacity(river,riverplace) Normal storage capacity of major reservoirs (>5000 acft)(unit: acft)

         /
           Guadsa.         cp03_GuadSA              378781
           Guadsa.         cp16_GuadSA              31040
           Guadsa.         cp21_GuadSA              254823
           Guadsa.         cp30_GuadSA              26500
           Guadsa.         cp31_GuadSA              63200
           Guadsa.         cp18_GuadSA              12600
*          cp06_GuadSA has 3 reservoirs
           Guadsa.         cp06_GuadSA              17400
*           Guadsa.         cp06_GuadSA              5000
*           Guadsa.         CP06_GuadSA
*           Guadsa.         517231_GuadSA            6500    (this should be linked to cp06_GuadSA)
*           Guadsa.         548801_GuadSA            5900    (this should be linked to cp06_GuadSA)


*           Nueces.          CP2731_Nueces             662821
           Nueces.          CP04_Nueces               5200
*           Nueces.          cp3031_Nueces             254732



         /;

$offtext

set reservoir /
    canyon         @cp03gdsn
    coletocreek    @cp16gdsn
    medina         @cp21gdsn
    corpuschristi  @cp3031nus
    chokecanyon    @cp2731nus

/;

set capitem / conservation conservation pool
              flood        flood  poll/;

table reservoircapacity(river, reservoir, riverplace, capitem)
* the capacity of flood pool use the volumn at max design elevation or max of volumn if max design elevation doesn't exist
                                                  conservation             flood
  guadsa.    canyon           .  cp03_GuadSA        378781                 817431
  guadsa.    coletocreek      .  cp16_GuadSA        31040                  107410
  guadsa.    medina           .  cp21_GuadSA        254823                 280969
  Nueces.    corpuschristi    .  cp30_NUECES        662820                 740979
  Nueces.    chokecanyon      .  cp27_NUECES        256062                 272328
;

set mapreservoir(river, riverplace, reservoir);
option   mapreservoir <reservoircapacity;
display mapreservoir;

set res_grid(reservoir,quad) map reservoir to the quad grid defined by twdb
/
canyon           .809
coletocreek      .910
medina           .809
corpuschristi    .910
chokecanyon      .909
/  ;


$ontext
set res_reg_item /surarea surface area, surareaSQ surface area squared/
table  res_surface_vol(reservoir, res_reg_item)  reservoir vol~surface+surface^2
* result is based on Elevation-Area-Capacity Curves from  https://waterdatafortexas.org/reservoirs/statewide
                     surareaSQ            surarea
canyon                0.0038               15.636
coletocreek           0.0005               10.795
medina                0.0038               18.768
corpuschristi         0.0005               2.2176
chokecanyon           0.0008               5.8127      ;

$offtext

