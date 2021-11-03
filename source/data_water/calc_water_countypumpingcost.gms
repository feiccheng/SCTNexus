TotalCountyPumpCost(county,aquifer,layer,states, allstepsw) $(not sameas(Aquifer, "Edwards")  and aquiferLayerCountyReg(Aquifer, layer, County))
     =([  endliftsteps(county,aquifer, layer, states, allstepsw) + INILift(aquifer,layer,county)]/2 + 100)
      *PumpCostPerFoot *QINCW(allSTEPSw)* pumpbase(Aquifer, layer, county)    ;

TotalCountyPumpCost(county,aquifer,layer,states, allstepsw) $(sameas(Aquifer, "Edwards") and aquiferLayerCountyReg(Aquifer, layer, 'none'))

    =  ([ endliftsteps('none',aquifer, layer, states, allstepsw) + INILift(aquifer,layer,'none')]/2 +LiftDiff (layer, county)+ 100)
     *PumpCostPerFoot*QINCW(allSTEPSw)* pumpbase(Aquifer, layer, 'none') ;
