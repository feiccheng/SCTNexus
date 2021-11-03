*^^^^^^^^^^^^^^^^^^^^^^^
* unifying sets
*^^^^^^^^^^^^^^^^^^^^^^^^
Set       years                    All possible years in the model
         / 1934*2018 /

          mixesa(years)            Year when the mix data is available
         / 1970*2016      /


          sector                 Type of water use
         /
           ag                     Agricultural water use
           ind                    Industrial water use
           mun                    Municipal water use
           rec                    Recretional water use
           min                    Mining water use including fracking
           hyd                    Hydro power water use
           frack                  water for hydraulic fracturing
           cool                   water for power plant cooling
           oth                    Other type of water use

           livestock              livestock water use
         /

          conssector(sector)       consumptive use sectors other than electricity cooling
         /ag, ind, mun,  min, oth, frack, cool/

          nonconssector(sector)    non consumptive use sectors
         /rec/


Set       sector1(sector)                           Small type of use set
           / ag, ind, mun,min, rec,oth , hyd, cool/
          Nonag(sector)                             Nonagricultural type of use set
           / mun,ind,rec,oth, min ,cool/
          sectormap(sector1, sector)                Mapping sectors to the samll sector set
           / ag.ag,
            ind.ind ,    min.min,
             mun.mun
             oth.oth,
            rec.rec ,
            hyd.hyd
            cool.cool

           /
*for now prevent groundwater for hyd, rec, and other
           gsector(sector)                           Groundwater could only be used in ag & ind & mun  &min
           / ag, ind, mun, min,cool/
           demandsector (sector)                     only include ind and mun sector
           /mun, ind/
            nonreuse(sector)                          the sectors that will not reuse the water
          states                   Nine states of nature and all state
         /
           all                    used in cropbudget
           HDry                   Heavily dry
           MDry                   Medium dry
           Dry                    Dry
           Dnormal                Dry-normal
           Normal                 Normal
           Wnormal                Normal-wet
           Wet                    Wet
           MWet                   Medium wet
           HWet                   Heavily wet
        /

          state(states)            Nine states of nature
          ;
          state(states)=yes;
          state("all")=no;
          nonreuse(sector1)= YES;
Set    Dates(states,years)         recharge YEARS REPRESENTED BY A STATE OF NATURE
       /Hdry.    (1956, 2011,1951, 2014),
        Mdry.    (1954,1953,1963,1948,1934,2013),
        Dry.     (1955,1984,1950,2006,2008,2009,1989),
        Dnormal. (1962,1943,1952,1940),
        Normal.  (1996,1988,1939,1937,1980,1964,1983,1982,1947,1938,1993,
                  1967,1999,1978,1949, 2012),
        Wnormal. (1945,1995,1994,1946,1942,1944,1969,2000,1966,1965,1974,1970,
                  2003,1959,1961,2005,1972),
        Wet.     (2010,1960,1941,1968,1976,1936,1971,1977,1975,1985,2001,1979,
                  1990,1997,1998,1957,1986),
        Mwet.    (1935,1981,1973,1991,2002,1958, 2015),
        Hwet.    (1987,2004,2007,1992)/
alias (years, year);

PARAMETER
        NDAT                              Total Number of Years
        Probability(states)               RECHARGE PROBABILITIES
        NRech(states)                     Number of Years in each Group ;

        NDAT =  sum(Dates(states,years),1);
        NRech(states) = sum(years$Dates(states,years),1) ;
        Probability(states) =  NRech(states) / NDAT ;
set            timing                       timing of items plus some retrofit stuff
                                          /reduceproportion,reduceamount,replaceamount,
                                           coef,annual,allmonths,jan,feb,mar,apr,may,jun,jul,aug,sep,oct,nov,dec/
               months(timing)                   All the months
               /  coef
                  allmonths
                  annual
                  reduceproportion,reduceamount,replaceamount
                  Jan                     January
                  Feb                     February
                  Mar                     March
                  Apr                     April
                  May                     May
                  Jun                     June
                  Jul                     July
                  Aug                     August
                  Sep                     September
                  Oct                     October
                  Nov                     November
                  Dec                     December
               /
                month(timing)                    The months included in the model
                    / Jan                     January
                      Feb                     February
                      Mar                     March
                      Apr                     April
                      May                     May
                      Jun                     June
                      Jul                     July
                      Aug                     August
                      Sep                     September
                      Oct                     October
                      Nov                     November
                      Dec                     December/

         citycounty                   List of  counties and cities in  the model
               /

                                Nueces      ,    KENDALL     ,    BEXAR       ,    WILSON      ,    KARNES
                                GUADALUPE   ,    KERR        ,    COMAL       ,    GILLESPIE   ,    BANDERA
                                MEDINA      ,    GOLIAD      ,    HAYS        ,    GONZALES    ,    BASTROP
                                DEWITT      ,    CALDWELL    ,    VICTORIA    ,    CALHOUN     ,    BLANCO
                                REFUGIO     ,    SANPATRICIO,    REAL        ,    EDWARDS     ,    UVALDE
                                KINNEY      ,    ZAVALA      ,    DIMMIT      ,    LASALLE    ,    MCMULLEN
                                FRIO        ,    ATASCOSA    ,    LIVEOAK    ,    WEBB        ,    JIMWELLS
                                MAVERICK    ,    ARANSAS     ,    BEE         , Duval         ,     Fayette
*                                 Travis      ,
                               Lavaca

            CorpusChristi,     SanAntonio,       VictoriaCity,      outofarea  ,none

               /

         City(citycounty)             Major municipal cities  covered in the model

               /
                 CorpusChristi,     SanAntonio
                 VictoriaCity

               /
         county(citycounty)                   List of  counties  in  the model
               /
                                Nueces      ,    KENDALL     ,    BEXAR       ,    WILSON      ,    KARNES
                                GUADALUPE   ,    KERR        ,    COMAL       ,    GILLESPIE   ,    BANDERA
                                MEDINA      ,    GOLIAD      ,    HAYS        ,    GONZALES    ,    BASTROP
                                DEWITT     ,    CALDWELL    ,    VICTORIA    ,    CALHOUN     ,    BLANCO
                                REFUGIO     ,    SANPATRICIO,    REAL        ,    EDWARDS     ,    UVALDE
                                KINNEY      ,    ZAVALA      ,    DIMMIT      ,    LASALLE    ,    MCMULLEN
                                FRIO        ,    ATASCOSA    ,    LIVEOAK    ,    WEBB        ,    JIMWELLS
                                MAVERICK    ,    ARANSAS     ,    BEE        , Duval         ,     Fayette
*                                Travis      ,
                                  Lavaca   , outofarea     ,none

                /
        countyfips
             /   355        ,        259        ,        29        ,        493        ,        255
                 187        ,        265        ,        91        ,        171        ,        19
                 325        ,        175        ,        209        ,        177        ,        21
                 123        ,        55        ,        469        ,        57        ,        31
                 391        ,        409        ,        385        ,        137        ,        463
                 271        ,        507        ,        127        ,        283        ,        311
                 163        ,        13        ,        297        ,        479        ,        249
                 323        ,        7        ,        25        ,        131        ,        149
                 453        ,        285

                  /

         mapcitytocounty(city, county)           The mapping between municipal city and its physical county location
            /

             VictoriaCity  .   Victoria
             SanAntonio    .   Bexar
             CorpusChristi .   Nueces
           /     ;

alias(county, county1);
alias(citycounty,customer);
alias (month, month1);
set      mapcitycountytocounty(citycounty, county)                                           map items in citycounty to counties     ;

mapcitycountytocounty(county, county)=yes;
mapcitycountytocounty(city, county)$mapcitytocounty(city, county)=yes;

* ^^^^^^^^^^^^^^^^^^
* water part sets
*^^^^^^^^^^^^^^^^^^^

set         RiverAndAquifer                     River and Aquifer names covered in the model
           /      GuadSA                 Guadalup and San Antonio river (they are one estuary)
                  Minor                  Minor rivers in San Antonio-Nueces riverbasin e.g mission river & Aransas river
                  Nueces                  Nueces riverbasin
                  Edwards              Edwards BFZ aquifer (San Antonio Segment)
                  Carrizo              Carrizo-Wilcox aquifer (southern portion)
                  GulfCoast            Gulf Cost Aquifer (central portion)
                  EdwardsTrinity         Edwards Trinity Aquifer
                  none                         zones not linked to  any water source
                  other
                  project
            /


         river(RiverAndAquifer)               River names covered in the model


               /
                  GuadSA                 Guadalup and San Antonio river (they are one estuary)
                  Minor                  Minor rivers in San Antonio-Nueces riverbasin e.g mission river & Aransas river
                  Nueces                  Nueces riverbasin
                  other
               /

         Aquifer(RiverAndAquifer)           auqifer names covered in the model
           /
                 Edwards              Edwards BFZ aquifer (San Antonio Segment)
                 Carrizo              Carrizo-Wilcox aquifer (southern portion)
                 EdwardsTrinity              Edwards Trinity Aquifer
                 GulfCoast            Gulf Cost Aquifer (central portion)
                 other                all other minor and unknown aquifers

         /
         source                   water supply sources
        / Surface, Ground,reuse ,Total  /

;

*  data_water_river_diverters.gms includes list of secondary diverters and reservoirs for three riverbasins in south central Texas
$include %whereiswater%data_water_river_diverters.gms

set divertersandaquifers       set of diverter and aquifer plus water source names
    /set.diverters2,set.RiverAndAquifer, newWR , X1*X9/;
set diverters(divertersandaquifers)      set of diverter names
    /set.diverters2,none, newWR , X1*X9 /;

*  data_water_river_riverplaces includes riverplaces and mapped with downstream riverplaces
$include %whereiswater%data_water_river_diverter_riverplaceset.gms


set  Aquifers2(divertersandaquifers)         Names of aquifers covered
             /Edwards
              Carrizo
              EdwardsTrinity
              GulfCoast
*              other
             /
  mapAquifers12(aquifer, aquifers2);
  mapAquifers12(aquifer, aquifers2)$sameas(aquifer, aquifers2)=yes;



set   Regitems items in the aquifer data
               /   Intercept  , Lift,      Wells    ,  Drains ,  RiverLeakge , ET
                   Recharge   , ReservLeak  ,   StreamLeak   ,     LagLift   , ppt, tmean, tmax, tmin
                   J17Head    ,   j27head,  j27headUse ,      J17HeadUse, J17Head_Lag, J27Head_Lag  /
      layer Layers in the aquifer
            /layer1*layer8, j17head, j27head, none/
      climate(Regitems) climate variables /ppt, tmean, tmax, tmin/;



Alias    (riverplace, riverlocation, upriver, downriver);
set       out(riverplace) places where flows go into bay or ocean
                         /out_GuadSA,  OUT_Nueces , OUT_minor/;


*^^^^^^^^^^^^^^^^^^^^^
* climate part sets
*^^^^^^^^^^^^^^^^^^^^^
set decades /1980,1990,2010, 2015, 2020, 2030, 2040, 2050, 2060, 2070, 2080, 2090/;
set decades_sim(decades) decades used in simulation  /2020, 2030, 2040, 2050, 2060, 2070, 2080, 2090/;

singleton set baseyear (decades) the baseline year  /2020/;


alias ( aquifer,sourceaquifer, injectaquifer),  (layer, layer2);
alias(sector, sectorfrom);
alias (sector, investsector);
alias(county,injectcounty, sourcecounty);
alias(river,sourceriver);
alias( gsector, gsector1)   ;
alias (conssector, conssector1);
