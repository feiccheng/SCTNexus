 endliftsteps(county,aquifer, layer, states, allstepsw) $(not sameas(Aquifer, "Edwards")  and aquiferLayerCountyReg(Aquifer, layer, County))
        =  sum(Regitems,
            AquiferHistdatanew(Aquifer, layer, county, states, Regitems)
             *AquiferCountyReg(Aquifer, layer, county, Regitems))
     - sum(AquiferLayerCounty(Aquifer, layer, County) ,
                  QINCW(allSTEPSw)* pumpbase(Aquifer, layer, county)
                  * AquiferCountyReg(Aquifer, layer,county, "Wells")
                  /(inregion_pop_per(county)  +1$(inregion_pop_per(county)=0))
                 )

                 +IniLift(Aquifer,layer, county)*AquiferCountyReg(Aquifer, layer, county, "LagLift");


endliftsteps('none', "Edwards", layer, states, allstepsw)  $( aquiferLayerCountyReg("Edwards", layer, 'none'))
      =DEM("Edwards",layer)
       - sum(Regitems,
            AquiferHistdatanew("Edwards", layer, 'none', states, Regitems)
             *AquiferCountyReg("Edwards", layer, 'none', Regitems))

       -   QINCW(allSTEPSw)* pumpbase( "Edwards", "J17Head", 'none')
                 *AquiferCountyReg("Edwards", layer,'none', "J17HeadUse")

       -   QINCW(allSTEPSw)* pumpbase( "Edwards", "J27Head", 'none')
                 *AquiferCountyReg("Edwards", layer,'none', "J27HeadUse")


       -((DEM("Edwards","J17Head") - IniLift("Edwards", "J17Head", 'none'))*AquiferCountyReg("Edwards", layer,'none', "J17Head_lag")
         +(DEM("Edwards","J27Head") - IniLift("Edwards", "J27Head", 'none'))*AquiferCountyReg("Edwards", layer,'none', "J27Head_lag")    )     ;
