$ifthen not declared peakfactor

parameter peakfactor                                             the peak factor of august to make sure enough capacity in the hottest summer  ;
parameter demanddata_pp(parameterstructure)      electricity demand matrix;
parameter electricgap                                            supply and demand gap percentage in South Central texas   ;

* set up the steps for electricity demand
set          allstepse                                           Seperable quantity steps   for electricity generation
         /  e1*e30  /
          stepe(allstepse)                                       subset of allstepse
;
          stepe(allstepse)=yes;
parameter
          QINCE(allSTEPSe)                                       Seperable quantity increments  for electricity generation
         /
             e1   eps,      e2  .20,      e3  .3,      e4  .4,       e5  .5,      e6   .60,
             e7   .7,      e8   .8,     e9  .85,     e10  0.9,     e11  .94,     e12   0.96,    e13  0.98,    e14   0.99,
             e15   1,      e16  1.01,   e17  1.02,    e18  1.04,    e19  1.06,    e20  1.1,     e21  1.2,     e22   1.4,
             e23   1.5,    e24  1.6,    e25  1.7,     e26  1.8,     e27  2,       e28  2.2,     e29  2.6,     e30   3

         /  ;
parameter delta_qince(allstepse)                                 the increase steps of qince (for grid purpose);


$endif




*~~~~~~~~~~~~~~~~~~~~~~~
* calculate peak factor
*~~~~~~~~~~~~~~~~~~~~~~~
peakfactor
     = smax((years2) , peakdemand(years2, 'aug') /demandprojection(years2, 'aug') )   ;

*~~~~~~~~~~~~~~~~~~~~~~~
* calculate electricity demand pqe
*~~~~~~~~~~~~~~~~~~~~~~~
*source:
*The price elasticity of electricity demand in the United States: A three-dimensional analysis

parameter  demanddata_pp1(timing)                 the quantity by month
           monthshare_pp(month%addhour%)          the monthly share of electricity consumption;

      Demanddata_pp1(month)
            $sum(years, 1$electric_supply(years,month))
              = sum(years, electric_supply(years,month))*0.124
                 / sum(years, 1$electric_supply(years,month))    ;
      Demanddata_pp1('annual') =sum(month, Demanddata_pp1(month));

      monthshare_pp(month%addhour%)
              = Demanddata_pp1(month)/Demanddata_pp1('annual')
$ifthen.a setglobal hourly
               *sum(map_agg_hour(hour, agg_hour), elec_hourly_share(hour, month))/100
$endif.a
;

      demanddata_pp('quantity')=Demanddata_pp1('annual');

       Demanddata_pp('price')
                = electricprice('aug');

       Demanddata_pp('elasticity') =-0.2;
       Demanddata_pp('tfac') =  5;

display demanddata_pp, monthshare_pp,Demanddata_pp1 ;

*~~~~~~~~~~~~~~~~~~~~~~~
* calculate electricity gap used as exogenous supply
*~~~~~~~~~~~~~~~~~~~~~~~

   electricgap$sum((years, month), electric_demand(years, month))
          =  sum(month, electric_demand('2016', month))*0.124- sum((power_plant_all,month), electricgeneration(power_plant_all, '2016',  month));

*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* Steps setup for the electricity demand
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

delta_qince(allstepse) =QINCE(allSTEPSe+1)- QINCE(allSTEPSe);

delta_qince(allstepse)$(delta_qince(allstepse)<0)=0;
 stepe(allstepse)$( delta_qince(allstepse)=0)=no;
display delta_qince, stepe;
