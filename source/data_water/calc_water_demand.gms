*   CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
*   Water Demand Data
*   CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC

$ifthen not declared waterrates
$include '%whereiswater%data_water_demand_setup.gms'
$include '%whereiswater%data_water_demand_pq.gms'

parameter waterdemand(citycounty, sector, parameterstructure)         Mun ind min  power sectors water demand price quantity and other parameter;
parameter  monthshare(citycounty, month, sector)                      monthly share of mun and ind by county;
Parameter
          Demanddata(citycounty,sector,timing,parameterstructure)     Parameters for Demand functions in each river
          increasefactor(citycounty, sector, month, states)           increasing facotr for all future scenarios;

$endif

display waterrates, waterusage;
* calculate the price and quantiy by citycounty and sector
       waterdemand(county, 'mun', 'price')   =waterrates(county, 'resi_10kgal')  ;
       waterdemand(county, 'ind', 'price')   =waterrates(county, 'comm_200kgal') ;
       waterdemand(county, 'min', 'price')   =waterrates(county, 'comm_200kgal') ;
       waterdemand(city, 'mun', 'price')    = sum(mapcitytocounty(city, county), waterdemand(county, 'mun', 'price')  );
       waterdemand(county, sector, 'quantity')= sum(source,  waterusage(county, sector, source));
       waterdemand(city, 'mun', 'quantity')= sum(source, citymun(city, source));

display waterdemand;
* add region percentage, because some counties located in the research region partly
* make some adjustment   to webb  as no surface (rio Grande in the region)
         WaterDemand('Webb','mun','quantity')= 206;
         WaterDemand('Webb','min','quantity')= 5995;

         WaterDemand(county,sector,'quantity')= WaterDemand(county,sector,'quantity')* inregion_Pop_per(County);




* calc city demand
         WaterDemand(county,'mun','quantity')= WaterDemand(county,'mun','quantity')
                                                 - sum(mapcitytocounty(city, county),
                                                          WaterDemand(city,'mun','quantity'));

* let's assume part of corpus christ water usage comes from San Pa


display waterdemand;
* fei need update here
* monthly share
monthshare(county, month, 'mun') =Munshares(county, month)  ;
monthshare(county, month, 'ind') =Indshares(county, month)  ;
monthshare(county, month, 'min') =Indshares(county, month)  ;
monthshare(city, month, 'mun')=sum(mapcitytocounty(city, county),  Munshares(county, month) );


* aggreagate the data to DemandData
* Here variable cost for water is assumed to be a half of water price
          Demanddata(citycounty,sector,timing,parameterstructure) =0;
          Demanddata(citycounty,sector,'annual',"quantity")
                   $(waterdemand(citycounty, sector, 'quantity') and   sum(month,monthshare(citycounty, month, sector)))
              =waterdemand(citycounty, sector, 'quantity')  ;

          Demanddata(citycounty,sector,'annual',"quantity")
                   $(Demanddata(citycounty,sector,'annual',"quantity") <1)=0;

monthshare(citycounty, month, sector)$(Demanddata(citycounty,sector,'annual',"quantity")=0)=0;

*          Demanddata (citycounty,sector,month,"quantity")
*                   $(waterdemand(citycounty, sector, 'quantity')   and monthshare(citycounty, month, sector))
*              = waterdemand(citycounty, sector, 'quantity') * monthshare(citycounty, month, sector);

          Demanddata(citycounty,'mun','annual',"elasticity")
                   $Demanddata(citycounty,'mun','annual',"quantity")
              = PriceElasticity('aug');

          Demanddata(citycounty,'ind','annual',"elasticity")
                   $Demanddata(citycounty,'ind','annual',"quantity")
              = IndMinelasticity;

          Demanddata(citycounty,sector,'annual',"price")
                   $Demanddata (citycounty,sector,'annual',"quantity")
              = waterdemand(citycounty, sector, 'price');

* assuming it need to pump at 300ft
*          Demanddata(citycounty,sector,month,"pumpingcost")
*                  $ Demanddata (citycounty,sector,month,"quantity")
*              = 300*pumpcostperfoot;

* put the base pumping cost into other cost
* assume water value is $100
          Demanddata(citycounty,sector,'annual',"treatment")
                  $Demanddata (citycounty,sector,'annual',"quantity")
              = 500;

          Demanddata(citycounty,sector,'annual',"othercost")
                  $Demanddata (citycounty,sector,'annual',"quantity")
              = WaterDemand(Citycounty,sector,'price')
                -Demanddata(citycounty,sector,'annual',"treatment")
                -100;

          Demanddata(citycounty,sector,'annual',"tfac")
                  $Demanddata (citycounty,sector,'annual',"quantity")  =5;

          increasefactor(citycounty, sector, month, states)
                $ Demanddata (citycounty,sector,'annual',"quantity")
               = 1;



display demanddata, monthshare;

