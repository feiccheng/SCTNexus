


$ontext
$ifthen setglobal addmix

*^^^^^5.2 limit flow in hist real flow mix *^^^^^
RealFlowUPPER(river, riverplace, month, stateofnature)
      $sum(years, RealFlow(river, riverplace, month, years)
*and sum(out(riverlocation),1)=0
     )..
   sum(riverflowlink(river,riverplace,downriver),
         FLOW(river,riverplace,downriver,month,stateofnature) )


=l=
      sum(mixesa,
           FlowMix(river,riverplace,stateofnature, mixesa)* RealFlow(river, riverplace, month, mixesa))*1.5;




RealFlowLOWER(river, riverplace, month, stateofnature)
       $sum(years, RealFlow(river, riverplace, month, years)
*and sum(out(riverlocation),1)=0
        )..
   sum(riverflowlink(river,riverplace, downriver),
         FLOW(river,riverplace,downriver,month,stateofnature) )


=g=
      sum(mixesa,
           FlowMix(river,riverplace,stateofnature, mixesa)* RealFlow(river, riverplace, month, mixesa))*0.5;

$endif
$offtext
*^^^^^5.2 limit recreation to average flow*^^^^^

NONCONSUSEMAX(node_exist(river,riverplace),month,stateofnature)
                  $(    sum((county,nonconssector)
                            $(    newwateruse(nonconssector,river,riverplace, month,stateofnature)
                              and useexists(county,nonconssector,river,riverplace)
                              and mapcitycountytoriverlocation(county,nonconssector,river,riverplace)
                              and (not sameas(nonconssector, 'hyd'))),1)
                              )..

* Diversions
  sum(useexists(county,nonconssector,river,riverplace)$(not sameas(nonconssector, 'hyd')),
         SURFACEDIVERSION(river,riverplace,county,nonconssector,month,stateofnature) )

 =L=
*recreation in the river

*flow to downstream
[(sum(riverflowlink(river,riverplace,downriver)$(not sum(out(downriver),1)),
         FLOW(river,riverplace,downriver,month,stateofnature))

 +OUTTOBAY(river,riverplace,month,stateofnature)
         $sum(riverflowlink(river,riverplace,out),1)

* Inflow
  + inflow1(river,riverplace,month,stateofnature)

* Flow from upstream
 +sum(riverflowlink(river,upriver,riverplace),
         FLOW(river,upriver,riverplace,month,stateofnature)))/2    ]

*recreation in the reserviors
*  + sum(is_reservior_here(river,riverplace),
*          RESCARRY(river, riverplace, month,stateofnature))

;

*^^^^^ 6.5 reservoir volume grid
$ontext
RESVOLUMEGRID(reservoir, month, stateofnature)
     $ sum(mapreservoir(river, riverplace, reservoir), 1)..

   (RESCARRY_Ini(reservoir)$ (sameas(month, "jan"))
    + RESCARRY(reservoir, month-1,stateofnature)$ (not sameas(month, "jan")) )

         =e=
   sum(grid, reservoir_grid(reservoir, grid, 'volume')
             * RESGRID(reservoir, month, stateofnature, grid) );


RESGRIDCONS(reservoir, month, stateofnature)
         $ sum(mapreservoir(river, riverplace, reservoir), 1)..

    sum(grid,  RESGRID(reservoir, month, stateofnature, grid)
                    $reservoir_grid(reservoir, grid, 'volume')   )=L=1;


     =e= sum(grid,     reservoir_grid(reservoir, grid, 'volume')
                      * RESGRID(reservoir, month, stateofnature, grid)
                  + delta_reservoir_Grid(reservoir, grid, 'volume')
                    * RESGRID_SEG(reservoir, month, stateofnature, grid) );

*^^^^^ 6.5 reservoir surface area grid

RESSURFACEGRID(reservoir, month, stateofnature)
     $ sum(mapreservoir(river, riverplace, reservoir), 1)..

     RESSURFACE(reservoir, month, stateofnature)
     =e= sum(grid, reservoir_grid(reservoir, grid, 'surfacearea')
                  * RESGRID(reservoir, month, stateofnature, grid)
                  + delta_reservoir_Grid(reservoir, grid, 'surfacearea')
                    * RESGRID_SEG(reservoir, month, stateofnature, grid));

RESGRIDCONS(reservoir, month, stateofnature)
         $ sum(mapreservoir(river, riverplace, reservoir), 1)..

    sum(grid,  RESGRID(reservoir, month, stateofnature, grid)
                    $delta_reservoir_grid(reservoir, grid, 'surfacearea')   )=L=1;

RESGRIDSEGBAL(reservoir, month, stateofnature, grid)
      $ delta_reservoir_grid(reservoir, grid, 'surfacearea')..
  RESGRID_SEG(reservoir, month, stateofnature, grid)
      =L=  RESGRID(reservoir, month, stateofnature, grid)    ;

$offtext



$ontext
*pumping limits

PUMPLIMIT(county, aquifer, gsector,  stateofnature)
        $(sum(layer, AquiferLayerCounty(Aquifer, layer, County))
            and not sameas (aquifer, 'Edwards')
          and county_wateruse_exist(county, gsector)
)..

 sum((AquiferLayerCounty(Aquifer, layer, County),  month ),
        PUMP_GROUNDWATER( Aquifer, layer,county,gsector, month,stateofnature)
                $( (sameas(gsector, 'ag')
                         and      sum((mapwater(month,watr), cropbudexist(county,crops,landirrtype,crop_mix),allstrat),
                     crop_strat(county, crops, landirrtype, crop_mix, stateofnature, allstrat, watr) )
                         and sum((zones),  AvailLand(county, zones, 'furrow')+ AvailLand(county, zones, 'sprinkler') )  )
                  or [not sameas(gsector, 'ag') and  not  sameas(gsector, 'cool')  ]
$ifthen setglobal energy
                  or [ not sameas(gsector, 'ag') and  sum(power_plant_all, coolingG(county, aquifer, layer, power_plant_all)) ]
$endif


             )
      +sum(mapcitycountytocounty(city,county),
                      PUMP_GROUNDWATER( Aquifer, layer,city,gsector, month,stateofnature)
                              $(sameas(gsector,'mun')))
)
             =L=aquiferpermit(aquifer, gsector, county)  +0.01

         + sum((AquiferLayerCounty(Aquifer, layer, County) ),
                 ARTPUMPLIMIT(county, aquifer, gsector, stateofnature)
                $( useart
                    and [(sameas(gsector, 'ag')
                         and      sum((mapwater(month,watr), cropbudexist(county,crops,landirrtype,crop_mix),allstrat),
                     crop_strat(county, crops, landirrtype, crop_mix, stateofnature, allstrat, watr) )
                         and sum((zones),  AvailLand(county, zones, 'furrow')+ AvailLand(county, zones, 'sprinkler') )  )
                  or [not sameas(gsector, 'ag') and  not  sameas(gsector, 'cool')  ]
$ifthen setglobal energy
                  or [ not sameas(gsector, 'ag') and  sum(power_plant_all, coolingG(county, aquifer, layer, power_plant_all)) ]
$endif


             ])
      +sum(mapcitycountytocounty(city,county),
                     ARTPUMPLIMIT(city, aquifer, gsector, stateofnature)
                              $(useart and sameas(gsector,'mun')))
)

;


*ag pumplimit

PUMPLIMIT_ag(county, aquifer, stateofnature)
        $(sum(layer, AquiferLayerCounty(Aquifer, layer, County))
            and not sameas (aquifer, 'Edwards')
          and county_wateruse_exist(county, 'ag')
          and  sum((mapwater(month,watr), cropbudexist(county,crops,landirrtype,crop_mix),allstrat),
                     crop_strat(county, crops, landirrtype, crop_mix, stateofnature, allstrat, watr) )
                         and sum((zones),  AvailLand(county, zones, 'furrow')+ AvailLand(county, zones, 'sprinkler') )
)..

 sum((AquiferLayerCounty(Aquifer, layer, County),  month ),
        PUMP_GROUNDWATER( Aquifer, layer,county,'ag', month,stateofnature)
                $( (     sum((mapwater(month,watr), cropbudexist(county,crops,landirrtype,crop_mix),allstrat),
                     crop_strat(county, crops, landirrtype, crop_mix, stateofnature, allstrat, watr) )
                         and sum((zones),  AvailLand(county, zones, 'furrow')+ AvailLand(county, zones, 'sprinkler') )  )

             )

)
             =G= 0.3* aquiferpermit(aquifer, 'ag', county)   ;


* ag edwards pumping limits
EdwardsPumpLimit_ag(county, stateofnature)
      $( sum( mapEdwardCounty(layer, county), 1)
         and  county_wateruse_map(county, 'Edwards', 'ag', 'ag')  )..

  sum((county_wateruse_map(county, 'Edwards', 'ag', 'ag'),mapEdwardCounty(layer, county)  , month),
                 PUMP_GROUNDWATER('Edwards', layer,county,'ag', month,stateofnature)
                      $(
                      (   sum((mapwater(month,watr), cropbudexist(county,crops,landirrtype,crop_mix),allstrat),
                                                 crop_strat(county, crops, landirrtype, crop_mix, stateofnature, allstrat, watr) )
                         and sum((zones),  AvailLand(county, zones, 'furrow')+ AvailLand(county, zones, 'sprinkler') )
)  )

 )
    =G= 0.3* edwardspermit(county, 'ag')   +0.01;
$offtext






$ifthen.ww setglobal watermarket

$endif.ww
* upper and lower bound of pumping mix




$ifthen setglobal addmix
$ontext
PUMPMIXUPPER(county, stateofnature)
         $( sum(AquiferLayerCounty(aquifer, layer, county) ,1)
         and   sum(county_wateruse_exist(county, gsector),1)
          ) ..
    sum(mixesa,
         PUMPMIX(county, mixesa,stateofnature))=l=1;

$offtext

$endif
$ontext
*^^^^^7.1 Ending water balance*^^^^^
* fei, use inregion_pop_per(county) as proxy for pumping needs

ENDLIFTBAL(Aquifer,layer,county, stateofnature)$AquiferLayerCountyReg(Aquifer, layer, county)..

        ENDLIFT(Aquifer, layer, county, stateofnature) $(not sameas(Aquifer, "Edwards") )
       +  DEM("Edwards",layer) -  ENDLIFT(Aquifer, layer, county, stateofnature)$( sameas(Aquifer, "Edwards") )

     =E=
        sum(Regitems,
            AquiferHistdatanew(Aquifer, layer, county, stateofnature, Regitems)
             *AquiferCountyReg(Aquifer, layer, county, Regitems))

* pump is outflow use negative sign
*Aquifers except Edwards

      +{         - sum(( AquiferLayerCounty(Aquifer, layer, County),  month)  ,
                  TOTALCOUNTYPUMP(county, Aquifer, layer, month,stateofnature)
                  * AquiferCountyReg(Aquifer, layer,county, "Wells")
*/inregion_pop_per(county)
                 )
                  + countyrestuse(county, aquifer, layer)  * AquiferCountyReg(Aquifer, layer,county, "Wells") *2

                 +IniLift(Aquifer,layer, county)*AquiferCountyReg(Aquifer, layer, county, "LagLift")
      } $(not sameas(Aquifer, "Edwards"))

*Edwards Aquifers


      +{       - sum( ( mapEdwardCounty("J17Head", county1), month),
                 TOTALCOUNTYPUMP(county1, "Edwards", "J17Head", month,stateofnature)
                 *AquiferCountyReg(Aquifer, layer,'none', "J17HeadUse"))

               - sum( ( mapEdwardCounty("J27Head", county1),  month),
                 TOTALCOUNTYPUMP(county1, "Edwards", "J27Head", month,stateofnature)
                 *AquiferCountyReg(Aquifer, layer,'none', "J27HeadUse"))


              +((DEM("Edwards","J17Head") - IniLift("Edwards", "J17Head", 'none'))*AquiferCountyReg("Edwards", layer,'none', "J17Head")
                +(DEM("Edwards","J27Head") - IniLift("Edwards", "J27Head", 'none'))*AquiferCountyReg("Edwards", layer,'none', "J27Head")    )
       }$( sameas(Aquifer, "Edwards") )  ;






*^^^^^7.3 County Average lift distance Equation *^^^^^
CountyLiftBal(county, aquifer, layer, stateofnature)$AquiferLayerCountyReg(Aquifer, layer, County)..

        CountyLift(county, aquifer, layer, stateofnature)
   =E=
       { ( ENDLIFT(aquifer,layer,county,stateofnature)+ INILift(aquifer,layer,county))/2
       }

               ;
$offtext




$ontext
 CONV_PUMP_STEP2(county,Aquifer, layer, stateofnature)
                           $(pumpbase(Aquifer, layer, county)
              and aquiferLayerCountyReg(Aquifer, layer, County))..

  sum(steps,  PUMP_STEP(county,Aquifer, layer, stateofnature,steps)) =g= 1;
$offtext


$ontext


EdwardsMarket(layer, county, stateofnature)
             $ (mapEdwardCounty(layer, county)
                 and county_wateruse_exist(county, 'ag'))..

sum(month,PUMP_GROUNDWATER('Edwards',layer,county, 'ag',month,stateofnature)
                  $ mapEdwardCounty(layer, county)  )

         =g=
          sum( mapEdwardCounty(layer, county),
              sum(zonewatersource(county, zones, 'edwards'),
                       AvailLand(county, zones, 'sprinkler')  )
             +sum(zonewatersource(county, zones, 'edwards'),
                       AvailLand(county, zones, 'furrow')  ));





 EdwardsPolicy(aquifer, layer,county, stateofnature)
           $ EdwardMAxLift(Aquifer, layer, county) ..
* edwards total pumping per year should be less than 400,000 acft
    ENDLIFT(aquifer,layer,county,stateofnature)
             $EdwardMAxLift(Aquifer, layer, county)
         =L=  EdwardMAxLift(Aquifer, layer, county) ;




* comal spring flow is greater than 200 cfs
EdwardsPolicy2("ComalSpring", stateofnature)..
  SPRNFLOW("CP05_guadSA",stateofnature)
     =G=200*1.98*365;

$offtext


*CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC*
*^^[8]water management constraints*^^
*CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC*


$ifthen setglobal newprojects




$ifthen.ee2 setglobal energy






*$offtext
display sector,conssector,sector1,nonag;
*Yesbuild.fx(Projects)=0;
*option limrow=100;
*option limcol=100;
Option IterLim = 1000000000;
Option ResLim=1000000000;

*option solprint=on;

*option solslack=1;
*NETBENEFIT.up=1000000000;
*ENDLIFT.up(aquifer, layer,county, stateofnature)= 1000;
*ENDLIFT.lo(aquifer, layer,county, stateofnature)= -200;
*TOTALCOUNTYPUMP.fx('Frio','Carrizo', 'layer6', month,stateofnature)=0 ;

model EdRiverbasin4 Edwards aquifer riversim model /all/;
*edriverbasin4.optfile=1;

*DO_I_BUILD_NEW_NGPP.up(power_plant_all, power_plant_type, power_plant_cooling)=1;

$ontext
set iteration      Allow 10 iterations in the following code/iter1*iter20/ ;
scalar keepgoing   trigger for iterations /1/
       itertimes    save the total iteration times/1/
       saveobj     save objective function value of last iteration
       converge    the difference between current objective function value and saveobj    ;
parameter
       objj(iteration);

$offtext



*SURFACEDIVERSION.fx(river,riverplace,citycounty,sector,month,states)$(sameas ( sector,'oth'))=0;

$ontext
file gckfile "gamschk file"  /%system.fn%.gck/;
put gckfile;
$onput
analysis

postopt

variable

  ADDUPUSERALLWATER(aransas,mun,dec,MWet)
  DIRECTRETURN(aransas,MUN,dec,MWet)

EQUATION

REUSESUPPLYBAL(ARANSAS,mun,dec,MWet)

$offput
putclose;



*option rMIp=conopt;
*option rMIp=cplex;
option rMIp=gamschk;
$offtext


*$include model_scale
*option threads=0;
option savepoint=2;
*option threads=31;
option optcr= 0.05;
EdRiverbasin4.Cheat=0;
EdRiverbasin4.optfile=1;
EdRiverbasin4.scaleopt=1;
*option limrow=0;
*option limcol=0;


*option rMIp=cplex;
*NETBENEFIT.up=100000000000;
*RESGRID.up(reservoir, month, stateofnature, grid)=1;
*$if exist EdRiverbasin4_p1.gdx execute_loadpoint "EdRiverbasin4_p1.gdx";

*minouttobay(river, out)=0.5*minouttobay(river, out);
*PROJECTWATER.up(projects,customer,conssector,month,stateofnature)=100000;

*option rMIP=gamschk;
*Solve EdRiverbasin4  maximizing NETBENEFIT using rMIP;

