sreport_crop_strat(altrunhere,county,crops, landirrtype, stateofnature, allstrat, alli)
         = crop_strat(county,crops, landirrtype, stateofnature, allstrat, alli) ;

sreport_inflow1(altrunhere,river,riverlocation,month,stateofnature)
         =inflow1(river,riverlocation,month,stateofnature)  ;

sreport_AquiferHistdatanew(altrunhere,Aquifer, layer,county, stateofnature, Regitems)
         =AquiferHistdatanew(Aquifer, layer,county, stateofnature, Regitems)  ;

sreport_TotalCountyPumpCost(altrunhere,county,aquifer,layer,stateofnature, allstepsw)
         =TotalCountyPumpCost(county,aquifer,layer,stateofnature, allstepsw)  ;

sreport_endliftsteps(altrunhere,county,aquifer, layer, stateofnature, allstepsw)
         = endliftsteps(county,aquifer, layer, stateofnature, allstepsw) ;

sreport_Demanddata_pp(altrunhere,parameterstructure)
         =demanddata_pp(parameterstructure) ;

sreport_Demanddata(altrunhere,citycounty,sector,timing,parameterstructure)
         =Demanddata(citycounty,sector,timing,parameterstructure)   ;
