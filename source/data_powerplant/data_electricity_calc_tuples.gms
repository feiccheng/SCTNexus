set coolingtechnology(power_plant_all, power_plant_technology_exist)     cooling water technology in place at model start
    whereexistpowerplant(citycounty,power_plant_all)                     county locations of all power plants
    cooldiverter(citycounty,diverters)                                   set of diverters using cooling water
    locatedivertersandaquifers(citycounty,divertersandaquifers)          county locations of all diverters and aquifers
    possiblepowerdiversion(county,power_plant_all,divertersandaquifers)  potential places where a cooling plant diversion could be
    possible_retrofit            (county,power_plant_all,power_plant_technology_exist, power_plant_technology_retrofit)   plants that can be retrofit
    power_plant_capacity_exist   (county,power_plant_all,power_plant_technology_exist)                                    set where we need existing plant capacity
    power_plant_capacity_retrofit(county,power_plant_all,power_plant_technology_retrofit)                                 set where we need retrofit plant capacity
    power_plant_capacity_new     (county,power_plant_all,power_plant_technology_new)                   set where we need new plant capacity
    power_plant_capacity_all     (county,power_plant_all,power_plant_technology_all)                                      set where we need capacity
    needbalance_fuel(County,fuels_and_ghgs,month) do i need a fuel balance
    groundsurf ground and surface water /ground,surface,set.aquifer/
    needcoolingwater(power_plant_all, power_plant_technology_all,month)  do i need cooling water in this month
    needcoolingwater2(citycounty,groundsurf, month)  do i need cooling water in this month
    watersourcehere                                 water source here
                /ground,surface/
      ;
parameter
   operationcost(county,power_plant_all,power_plant_technology_exist, month)                             operation cost by type of fuel
   coolingwateruseperunitgenerated(power_plant_all, power_plant_technology_exist, wateractivity, month)  water use per unit generated
   cooldiverterdata(citycounty,diverters,*)                                                              data on cooling diverters
   coolwaterpumpcost(county,power_plant_all,watersourcehere,divertersandaquifers)                        pumping costs for cooling water
   monthlyelectricgeneration(month)                                                                      monthly total generation
   annualtotalelectricgeneration                                                                         annual total generation
   monthlyelectricgenerationshare(month)                                                                 Proportional share of each month in annual total generation
   fossilfueluseperunitgenerated(power_plant_all,fuels_and_ghgs,month)                                   fossil fuel use per unit generated
   replaceplant(power_plant_all,power_plant_technology_exist, power_plant_technology_retrofit,allih,timing)        data for plants that can be retrofit;
;

fossilfueluse(power_plant_all, fuels_and_ghgs, month)
      =max(0,fossilfueluse(power_plant_all, fuels_and_ghgs, month));
monthlyelectricgeneration(month)
      = sum (power_plant_all,  electricgeneration (power_plant_all,  month));
annualtotalelectricgeneration
      = sum( month,monthlyelectricgeneration ( month));
monthlyelectricgenerationshare( month)
      = monthlyelectricgeneration( month)/annualtotalelectricgeneration;
fossilfueluseperunitgenerated(power_plant_all,fuels_and_ghgs,month)
         $electricgeneration (power_plant_all,  month)
      = fossilfueluse(power_plant_all, fuels_and_ghgs, month)
       /electricgeneration (power_plant_all,  month);

* convert million gallon to 1000 acft
       coolingwateruse(power_plant_all, power_plant_technology_exist, wateractivity, month) =
            coolingwateruse(power_plant_all, power_plant_technology_exist, wateractivity, month)*3.069/1000;

    option coolingtechnology < coolingwateruse;

coolingwateruseperunitgenerated(power_plant_all, power_plant_technology_exist, wateractivity, month)
                 $electricgeneration (power_plant_all,  month)
         =  coolingwateruse(power_plant_all, power_plant_technology_exist, wateractivity, month)
           /electricgeneration (power_plant_all,  month);
*display coolingwateruseperunitgenerated;

    whereexistpowerplant(county,power_plant_exist)
           $ sum(fuels_and_ghgs,powerplantcap(county,power_plant_exist, fuels_and_ghgs)) =yes;

     operationcost(whereexistpowerplant(county,power_plant_all), power_plant_technology_exist,month)
                  $coolingtechnology(power_plant_all, power_plant_technology_exist)
              = electricityprice(month) -
               sum(fuels_and_ghgs, inputprice (fuels_and_ghgs, month)
                                   *fossilfueluseperunitgenerated(power_plant_all, fuels_and_ghgs, month));
option operationcost:4:3:1;
display operationcost;
*mccarl i cant find any cooling users
cooldiverter(citycounty,diverters)$(    typeofdiverter(diverters,"cool")
                                    and mapdiverterstocounty(diverters, citycounty))=yes;

cooldiverterdata(cooldiverter(citycounty,diverters),"divertq")
    =smax(years,sum(month,wateruseyear(diverters,years,month)));
*display cooldiverter,cooldiverterdata;


    locatedivertersandaquifers(citycounty,divertersandaquifers)
         $sum(sameas(divertersandaquifers,diverters)$mapdiverterstocounty(diverters, citycounty),1)=yes;
    locatedivertersandaquifers(county,divertersandaquifers)
         $sum(sameas(divertersandaquifers,aquifer)$sum(layer$AquiferLayerCounty(Aquifer, layer, County),1),1)=yes;


    loop((county,power_plant_exist)
        $sum(fuels_and_ghgs$powerplantcap (county,power_plant_exist, fuels_and_ghgs),1),
         possiblepowerdiversion(county,power_plant_all,divertersandaquifers)
             $locatedivertersandaquifers(county,divertersandaquifers)=yes;);
*    display possiblepowerdiversion;
$ontext
    file possiblepower ;
    put  possiblepower;
    scalar iter /0/;
    loop((county,power_plant_all)$sum(fuels_and_ghgs$power_plant_allcap (county,power_plant_all, fuels_and_ghgs),1),
           iter=0;
            put @10 'none';
           loop(possiblepowerdiversion(county,power_plant_all,divertersandaquifers),
                if( iter>0,put '*');
                put @10 power_plant_all.tl:15 '.' county.tl:15 '.' divertersandaquifers.tl:15 /;
                iter=iter+1;);
            if(iter=0, put /);
           );
$offtext

*dummy in some data for now
loop(( whereexistpowerplant(county,power_plant_all),
                  diversionforpower_plant_all(county,power_plant_all,diverters)),
       coolwaterpumpcost(county,power_plant_all,"surface",diverters)=1;)
loop(( whereexistpowerplant(county,power_plant_all),
                  AquiferLayerCounty(Aquifer, layer, County)),
       coolwaterpumpcost(county,power_plant_all,"ground",aquifer)=1;)





*build up retrofit data
loop((whereexistpowerplant(county,power_plant_all),power_plant_technology_retrofit)
*                   make sure this plant is eligable for this retrofit
            $plant_retrofit_elig(power_plant_all,power_plant_technology_retrofit,"iseligable"),

      loop((power_fuel_sources,power_plant_technology_exist)
*                   make sure this plant uses the replaced type of fuel
              $(    powerplantcap (county,power_plant_all, power_fuel_sources)
*                   make sure this plant uses the technology to be retrofit
                and sum(month
                          $coolingwateruse(power_plant_all, power_plant_technology_exist,"withdrawal", month),1)
*                   make sure the retrofit has the data
                and sum((allih,timing)
                        $retrofit_powerplant(power_fuel_sources,power_plant_technology_exist, power_plant_technology_retrofit,allih,timing),1)),

*           fix up the water
            replaceplant(power_plant_all,power_plant_technology_exist, power_plant_technology_retrofit,"water",month)
                    =coolingwateruseperunitgenerated(power_plant_all, power_plant_technology_exist,"Consumption", month);
*           change by proportion
            if(retrofit_powerplant(power_fuel_sources,power_plant_technology_exist, power_plant_technology_retrofit,"water","reduceproportion"),
               replaceplant(power_plant_all,power_plant_technology_exist, power_plant_technology_retrofit,"water",month)
                       =coolingwateruseperunitgenerated(power_plant_all, power_plant_technology_exist,"Consumption", month)
                        *(1-( retrofit_powerplant(power_fuel_sources,power_plant_technology_exist, power_plant_technology_retrofit,"water","allmonths")
                             +retrofit_powerplant(power_fuel_sources,power_plant_technology_exist, power_plant_technology_retrofit,"water",month))););
*           change by a 1000 acre foot amount
            if(retrofit_powerplant(power_fuel_sources,power_plant_technology_exist, power_plant_technology_retrofit,"water","reduceamount"),
               replaceplant(power_plant_all,power_plant_technology_exist, power_plant_technology_retrofit,"water",month)
                       =coolingwateruseperunitgenerated(power_plant_all, power_plant_technology_exist,"Consumption", month)
                           -( retrofit_powerplant(power_fuel_sources,power_plant_technology_exist, power_plant_technology_retrofit,"water","allmonths")
                             +retrofit_powerplant(power_fuel_sources,power_plant_technology_exist, power_plant_technology_retrofit,"water",month)););
*           replace with a 1000 acre foot amount
            if(retrofit_powerplant(power_fuel_sources,power_plant_technology_exist, power_plant_technology_retrofit,"water","replaceamount"),
               replaceplant(power_plant_all,power_plant_technology_exist, power_plant_technology_retrofit,"water",month)
                       =( retrofit_powerplant(power_fuel_sources,power_plant_technology_exist, power_plant_technology_retrofit,"water","allmonths")
                         +retrofit_powerplant(power_fuel_sources,power_plant_technology_exist, power_plant_technology_retrofit,"water",month)););
*            factor in extra proportional increase in  specific to thie plant
            if(plant_retrofit_elig(power_plant_all,power_plant_technology_retrofit,"extrawater"),
               replaceplant(power_plant_all,power_plant_technology_exist, power_plant_technology_retrofit,"water",month)
                   =replaceplant(power_plant_all,power_plant_technology_exist, power_plant_technology_retrofit,"water",month)
                    *plant_retrofit_elig(power_plant_all,power_plant_technology_retrofit,"extrawater"););

*           fix up the amounts of fuel used and ghgs
            replaceplant(power_plant_all,power_plant_technology_exist, power_plant_technology_retrofit,fuels_and_ghgs,month)
                    =fossilfueluseperunitgenerated(power_plant_all,fuels_and_ghgs,month);
            loop(fuels_and_ghgs,
*                change by proportion
                 if(retrofit_powerplant(power_fuel_sources,power_plant_technology_exist, power_plant_technology_retrofit,fuels_and_ghgs,"reduceproportion"),
                    replaceplant(power_plant_all,power_plant_technology_exist, power_plant_technology_retrofit,fuels_and_ghgs,month)
                            =fossilfueluseperunitgenerated(power_plant_all,fuels_and_ghgs,month)
                             *(1-( retrofit_powerplant(power_fuel_sources,power_plant_technology_exist, power_plant_technology_retrofit,fuels_and_ghgs,"allmonths")
                                  +retrofit_powerplant(power_fuel_sources,power_plant_technology_exist, power_plant_technology_retrofit,fuels_and_ghgs,month))););
*               change by an amount of fuel in fuel unts (ie tons coal)
                 if(retrofit_powerplant(power_fuel_sources,power_plant_technology_exist, power_plant_technology_retrofit,fuels_and_ghgs,"reduceamount"),
                    replaceplant(power_plant_all,power_plant_technology_exist, power_plant_technology_retrofit,fuels_and_ghgs,month)
                            =fossilfueluseperunitgenerated(power_plant_all,fuels_and_ghgs,month)
                                -( retrofit_powerplant(power_fuel_sources,power_plant_technology_exist, power_plant_technology_retrofit,fuels_and_ghgs,"allmonths")
                                  +retrofit_powerplant(power_fuel_sources,power_plant_technology_exist, power_plant_technology_retrofit,fuels_and_ghgs,month)););
*                replace with a given amount of fuel
                 if(retrofit_powerplant(power_fuel_sources,power_plant_technology_exist, power_plant_technology_retrofit,fuels_and_ghgs,"replaceamount"),
                    replaceplant(power_plant_all,power_plant_technology_exist, power_plant_technology_retrofit,fuels_and_ghgs,month)
                            =( retrofit_powerplant(power_fuel_sources,power_plant_technology_exist, power_plant_technology_retrofit,fuels_and_ghgs,"allmonths")
                              +retrofit_powerplant(power_fuel_sources,power_plant_technology_exist, power_plant_technology_retrofit,fuels_and_ghgs,month)););
                );
*            factor in extra proportional increase in power use specific to thie plant

            if(plant_retrofit_elig(power_plant_all,power_plant_technology_retrofit,"extrapower"),
               replaceplant(power_plant_all,power_plant_technology_exist, power_plant_technology_retrofit,fuels_and_ghgs,month)
                   = replaceplant(power_plant_all,power_plant_technology_exist, power_plant_technology_retrofit,fuels_and_ghgs,month)
                    *plant_retrofit_elig(power_plant_all,power_plant_technology_retrofit,"extrapower"););

*fix up operating cost
            replaceplant(power_plant_all,power_plant_technology_exist, power_plant_technology_retrofit,"operatingcost",month)
                    =operationcost(county,power_plant_all,power_plant_technology_exist,month);
*           change by proportion
            if(retrofit_powerplant(power_fuel_sources,power_plant_technology_exist, power_plant_technology_retrofit,"operatingcost","reduceproportion"),
               replaceplant(power_plant_all,power_plant_technology_exist, power_plant_technology_retrofit,"operatingcost",month)
                       =operationcost(county,power_plant_all,power_plant_technology_exist,month)
                        *(1-( retrofit_powerplant(power_fuel_sources,power_plant_technology_exist, power_plant_technology_retrofit,"operatingcost","allmonths")
                             +retrofit_powerplant(power_fuel_sources,power_plant_technology_exist, power_plant_technology_retrofit,"operatingcost",month))););
*           change by a fixed dollar amount
            if(retrofit_powerplant(power_fuel_sources,power_plant_technology_exist, power_plant_technology_retrofit,"operatingcost","reduceamount"),
               replaceplant(power_plant_all,power_plant_technology_exist, power_plant_technology_retrofit,"operatingcost",month)
                       =operationcost(county,power_plant_all,power_plant_technology_exist,month)
                           -( retrofit_powerplant(power_fuel_sources,power_plant_technology_exist, power_plant_technology_retrofit,"operatingcost","allmonths")
                             +retrofit_powerplant(power_fuel_sources,power_plant_technology_exist, power_plant_technology_retrofit,"operatingcost",month)););
*           replace with a fixed dollar amount
            if(retrofit_powerplant(power_fuel_sources,power_plant_technology_exist, power_plant_technology_retrofit,"operatingcost","replaceamount"),
               replaceplant(power_plant_all,power_plant_technology_exist, power_plant_technology_retrofit,"operatingcost",month)
                       =( retrofit_powerplant(power_fuel_sources,power_plant_technology_exist, power_plant_technology_retrofit,"operatingcost","allmonths")
                         +retrofit_powerplant(power_fuel_sources,power_plant_technology_exist, power_plant_technology_retrofit,"operatingcost",month)););
*            factor in extra proportional increase in cost specific to thie plant
            if(plant_retrofit_elig(power_plant_all,power_plant_technology_retrofit,"extraopercost"),
               replaceplant(power_plant_all,power_plant_technology_exist, power_plant_technology_retrofit,"operatingcost",month)
                   = replaceplant(power_plant_all,power_plant_technology_exist, power_plant_technology_retrofit,"operatingcost",month)
                    *plant_retrofit_elig(power_plant_all,power_plant_technology_retrofit,"extraopercost"););

*           put in fixed cost of retrofit
            replaceplant(power_plant_all,power_plant_technology_exist, power_plant_technology_retrofit,"annualfixedcost","annual")
                    = retrofit_powerplant(power_fuel_sources,power_plant_technology_exist, power_plant_technology_retrofit,"annualfixedcost","annual")
*                    add in plant specific fixed cost of retrofit
                     +plant_retrofit_elig(power_plant_all,power_plant_technology_retrofit,"extrafixedcost");
*put in amount old capacity will be increased by retrofit
            replaceplant(power_plant_all,power_plant_technology_exist, power_plant_technology_retrofit,"added_new_capacity","annual")
                    =retrofit_powerplant(power_fuel_sources,power_plant_technology_exist, power_plant_technology_retrofit,"added_new_capacity","annual");
  ));

loop((whereexistpowerplant(county,power_plant_exist),power_plant_technology_exist, power_plant_technology_retrofit,allih,timing)$
       replaceplant(power_plant_exist,power_plant_technology_exist, power_plant_technology_retrofit,allih,timing),
          possible_retrofit(county,power_plant_exist,power_plant_technology_exist, power_plant_technology_retrofit) =yes;
          power_plant_capacity_retrofit(county,power_plant_exist,power_plant_technology_retrofit)=yes;);

loop((whereexistpowerplant(county,power_plant_exist),power_plant_technology_exist, month)
         $coolingwateruseperunitgenerated(power_plant_exist, power_plant_technology_exist,"Consumption", month)
         ,power_plant_capacity_exist(county,power_plant_exist,power_plant_technology_exist)=yes;);

loop((county,power_plant_new,divertersandaquifers,power_fuel_sources, power_plant_technology_new,allih,timing)
      $newpowerplant(county,power_plant_new,divertersandaquifers,power_plant_technology_new,allih,timing),
          power_plant_capacity_new(county,power_plant_new,power_plant_technology_new)=yes;);

power_plant_capacity_all(county,power_plant_exist,power_plant_technology_exist)
     $power_plant_capacity_exist(county,power_plant_exist,power_plant_technology_exist)
           =yes;
power_plant_capacity_all(county,power_plant_exist,power_plant_technology_retrofit)
     $power_plant_capacity_retrofit(county,power_plant_exist,power_plant_technology_retrofit)
           =yes;
power_plant_capacity_all(county,power_plant_new,power_plant_technology_new)
     $power_plant_capacity_new(county,power_plant_new,power_plant_technology_new)
           =yes;
display power_plant_capacity_exist;
display power_plant_capacity_retrofit;
display power_plant_capacity_new;
display power_plant_capacity_all;
*add power
* plant water investments
*add ghgs?
*add in pumping electricity use
* add in seasonal electricity consumption for not pumping water
*add retrofit investment cost
*add capacity of new plants anad drop old
*add in new electricity adjustment

*add something for fracking
*buy fossill fuel
*limit retrofits to one if there are multiple

needbalance_fuel(County,fuels_and_ghgs,month) $
      ( sum(power_plant_capacity_exist(county,power_plant_exist,power_plant_technology_exist),
             fossilfueluseperunitgenerated(power_plant_exist,fuels_and_ghgs,month))
*fuel use and emissions  from a retrofit
      +sum(possible_retrofit(county,power_plant_exist,power_plant_technology_exist, power_plant_technology_retrofit)
           ,  +replaceplant(power_plant_exist,power_plant_technology_exist, power_plant_technology_retrofit,fuels_and_ghgs,month))
*capacity from a new plant
      +sum(power_plant_capacity_new(county,power_plant_new(power_plant_all),
                                       power_plant_technology_new(power_plant_technology_all)),
             smax(divertersandaquifers,
                newpowerplant(county,power_plant_new,divertersandaquifers,power_plant_technology_new,fuels_and_ghgs,"annual")
               +newpowerplant(county,power_plant_new,divertersandaquifers,power_plant_technology_new,fuels_and_ghgs,month)))
        )=yes;
;
   needcoolingwater(power_plant_all, power_plant_technology_exist,month)
         $coolingwateruseperunitgenerated(power_plant_all, power_plant_technology_exist, "consumption", month)
         =yes;
   needcoolingwater(power_plant_exist, power_plant_technology_retrofit,month)
         $sum(power_plant_technology_exist$
              replaceplant(power_plant_exist,power_plant_technology_exist, power_plant_technology_retrofit,"water",month),1)
         =yes;
   needcoolingwater(power_plant_new, power_plant_technology_new,month)
         $sum((whereexistpowerplant(county,power_plant_new),divertersandaquifers)
                  $newpowerplant(county,power_plant_new,divertersandaquifers,power_plant_technology_new,"water",month),1)
         =yes;
loop((needcoolingwater(power_plant_all, power_plant_technology_all,month)
      ,diversionforpower_plant_all(customer,power_plant_all,diverters)
      ,diversionlocation(sourceriver, diverters, riverlocation)),
       needcoolingwater2(customer,"surface",month)=yes;
       useexists(customer,"cool",sourceriver,riverlocation)=yes;
       );
loop((needcoolingwater(power_plant_all, power_plant_technology_all,month)
      ,diversionforpower_plant_all(citycounty,power_plant_all,aquifer)),
       needcoolingwater2(county,"ground",month)=yes;
       loop(sameas(aquifer,groundsurf),needcoolingwater2(county,groundsurf,month)=yes;);
       );
diversionforpower_plant_all(whereexistpowerplant(county,power_plant_exist),divertersandaquifers)$
      ( locatedivertersandaquifers(county,divertersandaquifers)
       and sum((power_plant_technology_exist, power_plant_technology_retrofit,month)
       $replaceplant(power_plant_exist,power_plant_technology_exist, power_plant_technology_retrofit,"water",month),1))=yes;
diversionforpower_plant_all(whereexistpowerplant(county,power_plant_new),divertersandaquifers)$(
           locatedivertersandaquifers(county,divertersandaquifers)
       and sum((power_plant_technology_new,month)
                $newpowerplant(county,power_plant_new,divertersandaquifers,power_plant_technology_new,"water",month),1))=yes;
