$ifthen not declared PP_WaterUsage

set cooling_id /1*4/;
* data from eia in (Plantinfo.xlsx) temperature difference of 4.86 is proxied by the average
table coolingwater(power_plant_all, power_plant_cooling, cooling_id , pp_alli)
* unit of water flow is acft per hour, the tempdiff unit is C

                                        waterflow      tempdiff
NuecesBay       .  ON   .  1            77.36139212
*Victoria        .  ON   .  1            12.8099104
Victoria        .  Rc   .  2            0.330577478   4.466859974
OWSommers       .  RC   .  1            44.71071985   2.83625731
OWSommers       .  RC   .  2            44.71071985   2.822822823
VHBraunig       .  RC   .  1            37.60328567   3.279569892
VHBraunig       .  RC   .  2            37.60328567   4.005167959
VHBraunig       .  RC   .  3            43.05782878   3.918128655
Barney          .  OC   .  1            21.57023749
Barney          .  OC   .  2            21.57023749
ColetoCreek     .  RC   .  1            68.59500521   7.891414141
JTDeely         .  RC   .  1            44.21485363   3.188888889
JTDeely         .  RC   .  2            44.21485363   3.188888889
SanMiguel       .  RI   .  1            0.920664499   4.466859974
JKSpruce        .  RC   .  1            66.19831297   5.113378685
JKSpruce        .  RC   .  2            88.34706105   5.299145299
ArthurVon       .  RC   .  1            36.8594845    4.527186761
Formosa         .  Rc   .  1            0.09206645    4.869976359
Formosa         .  Rc   .  2            0.082859805   4.894636015
Gregory         .  Rc   .  1            10.33057379   4.466859974
RioNogales      .  RI   .  1            0.486777416   4.466859974
GuadalupeGS     .  RI   .  1            0.460608449   7.326388889
GuadalupeGS     .  RI   .  2            0.460608449   7.326388889
CorpusChristiEC .  Rc   .  1            0.595866953   4.466859974
Ingleside       .  Rc   .  1            0.413223688   4.466859974
CFBPowerPlant   .  Rc   .  1            0.361983185   4.158249158
CFBPowerPlant   .  Rc   .  2            0.361983185   4.149659864


 ;


parameter PP_WaterUsage(power_plant_all, power_plant_type, power_plant_cooling) power plant unit water usage
*basegeneration(power_plant_all, power_plant_type, power_plant_cooling,month)      base generation of power plants
*PP_Waterusage_ONOC(power_plant_all, power_plant_type, power_plant_cooling)   the per unit water flow of on(oc) power plant

coef(power_plant_type)
/
 coal   0.00061
 ngcc   0.00055
 nggt   0.00055
 ngst   0.00055

/

;

$endif

* get estimation for oncethrough water usage.
PP_WaterUsage(power_plant_all, power_plant_type, power_plant_cooling)
             $(sum((pp_potential_exist(county,power_plant_all, power_plant_type, power_plant_cooling) , cooling_id ),
             coolingwater(power_plant_all, power_plant_cooling, cooling_id,  'waterflow'))
       and sum((pp_potential_exist(county,power_plant_all, power_plant_type, power_plant_cooling) , cooling_id ),
             coolingwater(power_plant_all, power_plant_cooling, cooling_id,  'tempdiff')) =0)
     =sum((pp_potential_exist(county,power_plant_all, power_plant_type, power_plant_cooling) , cooling_id),
               coolingwater(power_plant_all, power_plant_cooling, cooling_id , 'waterflow')
              /(pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling, 'capacity')
               *pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling, 'capacity_factor') ) )
            ;

PP_WaterUsage(power_plant_all, power_plant_type, power_plant_cooling)
        $ ((sameas(power_plant_cooling, 'ri') or sameas(power_plant_cooling, 'rc'))
           and sum(county, pp_potential_exist(county,power_plant_all, power_plant_type, power_plant_cooling))   )
       =    coef(power_plant_type) ;

PP_WaterUsage(power_plant_all, power_plant_type, power_plant_cooling)
        $ ((sameas(power_plant_cooling, 'ri') or sameas(power_plant_cooling, 'rc'))
           and sum(county, pp_potential_exist(county,power_plant_all, power_plant_type, power_plant_cooling))
           and PP_WaterUsage(power_plant_all, power_plant_type, power_plant_cooling) =0  )

       = 0.00055;
