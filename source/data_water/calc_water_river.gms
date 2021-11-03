$ifthen not declared typeofdiverter

*~~~~~~~~~~~~~~~~~
* river part
*~~~~~~~~~~~~~~~~

$include '%whereiswater%data_water_river_diverter_upperlimit.gms'
$include '%whereiswater%data_water_river_diverter_mapriverplace.gms'
$include '%whereiswater%data_water_river_diverter_county.gms'
$include '%whereiswater%data_water_river_diverter_citydiverter.gms'
$include '%whereiswater%data_water_river_diverter_histuse.gms'

$include '%whereiswater%data_water_river_flow_naturalized_inflow.gms'
$include '%whereiswater%data_water_river_flow_spring_flows.gms'
$include '%whereiswater%data_water_river_flow_histflow.gms'
$include '%whereiswater%data_water_river_outtobay.gms'

Set       evp                      Major reservoirs evaporation parameter
         / storage, evaporation /;
$include '%whereiswater%data_water_river_reservoir_hist_prep_evap.gms'
$include '%whereiswater%data_water_river_reservoir_capacity.gms'
$include '%whereiswater%data_water_river_reservoir_grid.gms'


set  mapdiverterstocounty(diverters, county)  tell citycounty where each diverter is located
set typeofdiverter(diverters,sector)                                     the sector of diverters         ;



*^^^^^^ Adjust the Region N Corpus Christi water system^^^^^^^^^^^^^6

parameter   AdjCC (diverters, county, sector)  reallocate the water to different county based on the system though cp3131 belongs to cc
  /
X1  .   BEE          .   mun        2925
X2  .   SANPATRICIO  .   mun        18219
X3  .   LIVEOAK      .   mun        3363
X4  .   NUECES       .   mun        71905
X5  .   Aransas      .   mun        3121
X6  .   Nueces       .   ind        59308
X7  .   Nueces       .   min        220
X8  .   SANPATRICIO  .   ind        39277
X9  .   outofarea    .   mun         4991   / ;

typeofdiverter(diverters,sector)$sum(river, UpperdiversionQ1(river,diverters,sector)) = yes;

typeofdiverter(diverters,sector)
         $ sum(county,  AdjCC (diverters, county, sector))=yes ;
UpperdiversionQ1('nueces', diverters,  sector)
         $ sum(county,  AdjCC (diverters, county, sector))
          =   sum(county,  AdjCC (diverters, county, sector));


UpperdiversionQ1('nueces', 'CP3131_NUECES', 'mun')
          =   UpperdiversionQ1('nueces', 'CP3131_NUECES', 'mun')
           -  sum((county,diverters),  AdjCC (diverters, county,'mun'))  ;

UpperdiversionQ1('nueces', 'CP3131_NUECES', 'ind')
          =   UpperdiversionQ1('nueces', 'CP3131_NUECES', 'ind')
           -  sum((county,diverters),  AdjCC (diverters, county,'ind'))
            -  sum((county,diverters),  AdjCC (diverters, county,'min'))    ;

mapdiverterstocounty1(diverters, county)
         $ sum(sector,  AdjCC (diverters, county, sector))=yes ;


Set     Springs(riverlocation)              Springs in the ground model
            /
             CP75_guadSA              San Marcos Spring (San Marcos River at San Marcos)
*             SprSanped             San Pedro Sring
*             SprTonio              San Antonio Spring
             CP05_guadSA              Comal Spring (Comal River at New Braunfels)
*             CP24nus               Leona Spring
*             SprHueco              Hueco Spring
            / ;
set    springflowlink(river,riverlocation,riverlocation)                 River flow link between minorsprings and downstream major control points;
set    minorspring2(riverlocation)                                       Springs not located at major control points
               / 215332_GuadSA,  539101_GuadSA /;
set    minorSpring(riverlocation)                                        Springs set as exogenous in the model but have spring flow data from WRAP;


parameter
          Springflow(river,riverlocation,month,states)                   Flows by state and month at primary locations in Acre feet
          RealFlow(river, riverlocation, month, year)                    Real flow in the river observed by USGS;
parameter  realflowremove(river, riverlocation)                          remove real flow when there is no enough data;

Parameters
          inflow(river,riverlocation,month, states)                      Origional inflows to each riverplace by month and states in acre feet
          inflow1(river,riverlocation,month,states)                      Origional net inflows to each riverplace by month and state in acre feet
          midflow(river, riverlocation, month, states, years)            merge year with states;

Parameter wateruseyear1(river,riverlocation,sector, years,month)         Matching diverters with wateruse to its riverbain
          wateruse(river, riverlocation,sector,month,states)             Actual wateruse by CP sector and state in a month
          yearsum2(river, states)                                        parameter for wateruse calc
;

parameter res_evap_rate(reservoir, month, states)                        reservoir evaporation rate ;
parameter delta_reservoir_grid(reservoir, grid,griditem)                 delta of reservoir grid for modeling purpose;
$endif


*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* map diverters to citycounty
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
mapdiverterstocounty(diverters, county)=no;
mapdiverterstocounty(diverters, county)$mapdiverterstocounty1(diverters, county)=yes ;

display mapdiverterstocounty;
* make up the location using riverplace when missing
mapdiverterstocounty(diverters, county)
         $((not sum(county1, mapdiverterstocounty(diverters,county1)))
          and sum(diversionlocation(river, diverters, riverlocation),1) )
         = sum(diversionlocation(river, diverters, riverlocation), mapdiverterstocounty(riverlocation, county)) ;
display mapdiverterstocounty;

*~~~~~~~~~~~~~~~~~~~~~~~~~
* spring flow calculation
*~~~~~~~~~~~~~~~~~~~~~~~~

     riverflowlink(river,upriver,downriver)$sum(riverflowlink(river, upriver, minorspring2), riverflowlink(river, minorspring2, downriver))=yes;
     springflowlink(river,upriver, minorspring2)$riverflowlink(river,upriver, minorspring2)=yes;
     springflowlink(river,minorspring2,downriver)$riverflowlink(river,minorspring2,downriver)=yes;

     riverflowlink(river,upriver,minorspring2)=no;
     riverflowlink(river,minorspring2,downriver) =no;
     springflowlink("GuadSA","CP04_GuadSA","CP04_GuadSA" )   =yes;


     Springflow(river,riverlocation,month,states)
                     $ sum(Dates(states, years)$springflows(river,riverlocation, years, month),1)
                 = sum(Dates(states, years), springflows(river,riverlocation, years, month))
                  /sum(Dates(states, years)$springflows(river,riverlocation, years, month),1)   ;

     minorSpring(riverlocation)$sum((river,month,states), Springflow(river,riverlocation,month,states)  )=yes;
     minorSpring(riverlocation)$Springs(riverlocation)=no;
display minorspring;

*~~~~~~~~~~~~~~~~~~~~~~~~~
* river flow calculation
*~~~~~~~~~~~~~~~~~~~~~~~~

*naturalized flow
* add minor springs into the naturalized flow, because springflow is set as adjustments in WRAP
      Naturalizedflows(river, downriver,years,month)=
                 Naturalizedflows(river, downriver,years,month)
                 + sum( springflowlink(river,minorspring,downriver) ,Springflows(river, minorspring, years, month));

* calculate the median of naturalized flow using python
      midflow(river, riverlocation, month, states, years)
                = sum( Dates(states, years),  Naturalizedflows(river, riverlocation,years,month) );

$EmbeddedCode Python:
import itertools
import operator
import statistics
data= list(gams.get("midflow"))
#print(data[0:5])
result=[]
#print(len(result))
for i in range(0, len(data)):
    (x, value)=data[i]
    x=x[:4]+(value,)
    result.append(x)

it = itertools.groupby(result, operator.itemgetter(0,1,2,3))

inflow=[]
for key, subiter in it:
    m=[]
    for item in subiter:
         m.append(item[4])
    z=statistics .median(m)
    z= key+(z,)
    inflow.append(z)

gams.set('inflow', inflow)

$endEmbeddedCode  inflow

$include '%whereiswater%calc_water_inflow.gms'

display inflow1  ;

* real flow

     RealFlow(river, riverlocation, month, years)
             =sum( riverflowlink(river,riverlocation,riverplace), streamflow(riverlocation, years, month))   ;

     realflowremove(river, riverlocation)= sum(years$sum(month, RealFlow(river, riverlocation, month, years)) ,1);
     RealFlow(river, riverlocation, month, years)$(realflowremove(river, riverlocation)<6)=0;


*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* historical water usage calculation
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* aggregate historical river water usage
     wateruseyear1(river,riverlocation,sector, years,month)
        = sum((diversionlocation(river, diverters, riverlocation), typeofdiverter(diverters,sector)),
               wateruseyear(diverters,years,month));

    yearsum2(river, states)
        =  sum(Dates(states,years)
                 $sum((riverlocation,sector,month),
                          wateruseyear1(river,riverlocation,sector, years,month)),
                    1 )             ;

     wateruse(river, riverlocation,sector,month,states)$yearsum2(river,states)
        = sum((Dates(states,years)),wateruseyear1(river,riverlocation,sector, years,month))
           /  yearsum2(river, states)
                ;

*^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
* Reservoirs
*^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

* evap rate
res_evap_rate(reservoir, month, states)
      $ sum((Dates(states,year), res_grid(reservoir,quad)) ,
            1$evaporationrate(quad, year, month)     )
     = sum((Dates(states,year), res_grid(reservoir,quad)) ,
            evaporationrate(quad, year, month)-precipitationrate(quad, year, month)     )
      / sum((Dates(states,year), res_grid(reservoir,quad)) ,
            1$evaporationrate(quad, year, month)     );

* delta of reservoir gird
delta_reservoir_grid(reservoir, grid,griditem)
      =reservoir_grid(reservoir, grid+1,griditem) - reservoir_grid(reservoir, grid,griditem) ;
delta_reservoir_grid(reservoir, grid,griditem)
        $(delta_reservoir_grid(reservoir, grid,griditem)  <0) =0;



