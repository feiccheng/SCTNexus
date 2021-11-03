
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* Rebalance the total cost
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* recalculate the profit for crops
* water cost uses surface water cost 10.6 per acft
cropbudgetnew(county, crops, landirrtype, "profit") =0;
cropbudgetnew(county, crops, landirrtype, "profit")
    $cropbudgetnew(county, crops, landirrtype, 'cropland')
     = sum((primary,state, baseline_strat(allstrat, landirrtype)),
                 commodprice(county, primary )*probability(State)*crop_strat(county, crops,  landirrtype, state, allstrat, primary)  )
      - sum( landirrmapping(Irrigstatus, landirrtype), landrent(county, irrigstatus))
      - 10.6*cropbudgetnew(county, crops, landirrtype, 'WaterUse_AF')
      - sum(aginput,  cropbudgetnew(county, crops, landirrtype,aginput));

cropbudexist(county, crops, landirrtype)  =no;
cropbudexist(county, crops, landirrtype)
         $cropbudgetnew(county, crops, landirrtype, 'cropland')  =yes;


* livestock  profit calculation
* assuming grazing acres are decided based on Normal son. the extra hay is needed when son changes
livestockbud(county, livestock, FeedingMethod, 'profit')   =0;
livestockbud(county, livestock, FeedingMethod, 'profit')
      $(livestockbud(county, livestock, FeedingMethod, 'PastureLand1AU')
       +livestockbud(county, livestock, FeedingMethod, 'GrazingAUM') )
     = sum(primary,  commodprice(county, primary )*livestockbud(county, livestock, FeedingMethod, primary))
      - landrent(county, 'pasture')* livestockbud(county, livestock, FeedingMethod, 'PastureLand1AU')
      - landrent(county, 'pasture')* livestockbud(county, livestock, FeedingMethod, 'GrazingAUM')/12
      - sum(aginput, livestockbud(county, livestock, FeedingMethod, aginput))
      - sum(state,  probability(State)*Haysupply(county, state)* commodprice(county, 'hay' ))
       *(livestockbud(county, livestock, FeedingMethod, 'PastureLand1AU')
         + livestockbud(county, livestock, FeedingMethod, 'GrazingAUM')/12  );

display livestockbud;

