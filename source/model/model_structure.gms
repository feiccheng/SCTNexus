* convert sos2 to binary variable can speed up the model
* reference : https://www.gams.com/latest/gamslib_ml/libhtml/gamslib_trnspwl.html
* title: trnspwl.gms : A Transportation Problem with discretized economies of scale

$include %whereismodel%model_macros_obj.gms
$include %whereismacros%macros_model_demanddata.gms
$include %whereismodel%model_declaration.gms
$include %whereismodel%model_domain.gms
$include %whereismodel%model_bounds.gms
$include %whereismodel%model_obj.gms


*CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC*
*^^^^[1] Agricultural Land Constraints*^^^^
*CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC*
*^^^^^1.1 Agricultural land balance *^^^^^
AE_AGLANDBal(domain_for_AE_AGLANDBal(county, zones, landirrtype))..

     sum(domain_for_AV_CROPACRES(county,zones,crops,landirrtype)$( not vege_mix(crops) ),
                    AV_CROPACRES(county,zones,crops,landirrtype))

     +sum(domain_for_AV_LIVEPROD(county, livestock),
                     AV_LIVEPROD(county, livestock)
                   *livebudnew(county, livestock, "PastureLand1AU")
                   *Stockingrate(county) ) $sameas(landirrtype,'pasture')

     +sum(domain_for_EV_WS_LAND(power_plant_all,ws_type,county, zones, landirrtype),
                     EV_WS_LAND(power_plant_all,ws_type,county, zones, landirrtype))

     +sum(domain_for_AV_LANDTRANS(county, landirrtype,zones, landirrtype2,zones2) ,
                     AV_LANDTRANS(county, landirrtype,zones, landirrtype2,zones2))

     - sum(domain_for_AV_LANDTRANS(county, landirrtype2, zones2, landirrtype, zones) ,
                      AV_LANDTRANS(county, landirrtype2, zones2, landirrtype, zones))

     - AvailLand(county,zones,landirrtype)
     - sum(domain_for_ART_AE_AGLANDBal(county, zones, landirrtype),
                      ART_AE_AGLANDBal(county, zones, landirrtype))
       =L=0;

*^^^^^1.2 Agricultural land tranfering limits *^^^^^
AE_LandTransferLimit(domain_for_AE_LandTransferLimit(county,irrigstatus))..

    sum((landirrmapping(Irrigstatus, landirrtype), domain_for_AV_LANDTRANS(county, landirrtype,zones, landirrtype2,zones2)),
                        AV_LANDTRANS(county, landirrtype,zones, landirrtype2,zones2))
      =l=
           0.2*   sum((landirrmapping(Irrigstatus, landirrtype), zones),
                                 AvailLand(county,zones,landirrtype));

*CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC*
*^^^^[2] Agricultural production, Deficit Irrigation strategy and hay feeding balance*^^^^
*CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC*

*^^^^^2.1 agricultural Commodity sales balance*^^^^^
AE_AGSALEBAL(domain_for_AE_AGSALEBAL(county,primary, stateofnature) )..

     sum(domain_for_AV_AGSALE(county, primary, stateofnature),
                    AV_AGSALE(county, primary, stateofnature))

     +sum(domain_for_AV_LIVEGRAZING(county,livestock,stateofnature)$sameas(primary,'grazing'),
                     AV_LIVEGRAZING(county,livestock,stateofnature))

     +sum(domain_for_AV_HAYTRANS(county,county1,primary,stateofnature),
                     AV_HAYTRANS(county,county1,primary,stateofnature))

     -sum(domain_for_AV_CROPSTRATEGY(county,zones, crops, landirrtype, stateofnature, allstrat),
                    crop_strat(county, crops, landirrtype, stateofnature, allstrat, primary)
                    *AV_CROPSTRATEGY(county,zones, crops, landirrtype, stateofnature, allstrat))

     -sum(domain_for_AV_LIVEPROD(county, livestock),
                     AV_LIVEPROD(county, livestock)*livebudnew(county, livestock, primary))

         =L=0.1;   ;

*^^^^^2.2 Crop strategy balance *^^^^^
AE_CROPSTRATBALANCE(domain_for_AE_CROPSTRATBALANCE(county,zones,crops,landirrtype, stateofnature))..

  sum(domain_for_AV_CROPSTRATEGY(county,zones, crops, landirrtype, stateofnature, allstrat),
                  AV_CROPSTRATEGY(county,zones, crops, landirrtype, stateofnature, allstrat))
   =E= sum(domain_for_AV_CROPACRES(county,zones, crops,landirrtype),
                  AV_CROPACRES(county,zones, crops,landirrtype));


*^^^^^2.3 Livestock Feeding balance *^^^^^

AE_LIVEFEED_BAL(domain_for_AE_LIVEFEED_BAL(county,livestock,stateofnature) )..

    - sum(domain_for_AV_LIVEGRAZING(county,livestock,stateofnature),
                     AV_LIVEGRAZING(county,livestock,stateofnature))*750/2000

    - sum(domain_for_AV_HAYFEED(county,livestock,primary,stateofnature),
                     AV_HAYFEED(county,livestock,primary,stateofnature))

    + sum(domain_for_AV_LIVEPROD(county, livestock),
                     AV_LIVEPROD(county, livestock)
* extra hay needed if the animals are on pasture
                 *[   Haysupply(county, stateofnature)*livebudnew(county,livestock,'Pastureland1AU')
* hay needed if the animal is on grazing (12 month*750/2000)
                    +12*750/2000*(livebudnew(county,livestock,'can_I_grazing')-livebudnew(county,livestock,'Pastureland1AU')) ]
                 * livebudnew(county,livestock,'AU'))
    =L= 0;


*^^^^^2.4 HAY Trans balance *^^^^^
AE_HAY_BAL(domain_for_AE_HAY_BAL(county,primary,stateofnature))..

       -sum(domain_for_AV_HAYTRANS(county1,county,primary,stateofnature),
                       AV_HAYTRANS(county1,county,primary,stateofnature))
       -sum(domain_for_AV_HAYPURCHASE(county,primary,stateofnature),
                       AV_HAYPURCHASE(county,primary,stateofnature))
       +sum(domain_for_AV_HAYFEED(county,livestock,primary,stateofnature),
                       AV_HAYFEED(county,livestock,primary,stateofnature))
   =L=0;

*CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC*
*^^^^[3] Crop, Vegetable and Livestock Mix balance*^^^^
*CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC*

*^^^^^3.1 Crop Mix Balance*^^^^^
AE_CROPMIXBAL(domain_for_AE_CROPMIXBAL(county,crop_mix,irrigstatus,uplow))..
              sign_uplow(uplow)
               *sum((landirrmapping(Irrigstatus, landirrtype), mapfieldmix(crops,crop_mix), domain_for_AV_CROPACRES(county,zones,crops,landirrtype)) ,
                         AV_CROPACRES(county,zones,crops,landirrtype) )
      =L=
              sign_uplow(uplow)
               *sum(domain_for_AV_CROPMIX(county,irrigstatus,mixesa),
                     AV_CROPMIX(county,irrigstatus,mixesa)
                    *cropmixdatanew(county,crop_mix,irrigstatus,mixesa)
                    *(1+sign_uplow(uplow)*tolerance_uplow )) +0.1;

*^^^^^3.2 Sum up vegetable Balance*^^^^^
AE_VEGE_SUMBAL(domain_for_AE_VEGE_SUMBAL(county,zones,landirrtype))..

               sum(domain_for_AV_CROPACRES(county,zones,vege_mix,landirrtype),
                      AV_CROPACRES(county,zones,vege_mix,landirrtype))
      =E=
               sum(domain_for_AV_CROPACRES(county,zones,'vegetables',landirrtype),
                      AV_CROPACRES(county,zones,'vegetables',landirrtype)) ;

*^^^^^3.3 Vegetable Mix Balance*^^^^^
AE_VEGEMIXBAL(domain_for_AE_VEGEMIXBAL(county,vege_mix,irrigstatus,uplow))..

              sign_uplow(uplow)
               *sum((landirrmapping(Irrigstatus, landirrtype), mapvegemix(crops,vege_mix),  domain_for_AV_CROPACRES(county,zones,crops,landirrtype)) ,
                         AV_CROPACRES(county,zones,crops,landirrtype) )
      =L=
              sign_uplow(uplow)
               *sum(domain_for_AV_VEGMIX(county,irrigstatus,mixesa),
                     AV_VEGMIX(county,irrigstatus,mixesa)
                    *vegemixdatanew(county,vege_mix,irrigstatus,mixesa)
                    *(1+sign_uplow(uplow)*tolerance_uplow )) +0.1;


*^^^^^3.4 crop propertion limits*^^^^^
AE_CROPMIX_PROP2(domain_for_AE_CROPMIX_PROP2(county,zones,crop_mix,landirrtype))..

               sum((domain_for_AV_CROPACRES(county,zones, crops,landirrtype),mapfieldmix(crops,crop_mix)),
                      AV_CROPACRES(county,zones, crops,landirrtype))

      =L=
              tolerance_uplow*
                sum((domain_for_AV_CROPACRES(county,zones, crop,landirrtype)),
                      AV_CROPACRES(county,zones, crop,landirrtype) )
;

*^^^^^3.5 vegetable propertion limits*^^^^^
AE_VEGEMIX_PROP2(domain_for_AE_VEGEMIX_PROP2(county,zones,vege_mix,landirrtype))..

               sum((domain_for_AV_CROPACRES(county,zones, crops,landirrtype),mapvegemix(crops,vege_mix)),
                      AV_CROPACRES(county,zones, crops,landirrtype))

      =L=
               tolerance_uplow*
                sum(domain_for_AV_CROPACRES(county,zones,'vegetables',landirrtype),
                      AV_CROPACRES(county,zones,'vegetables',landirrtype) )
;

*^^^^^3.6 special limits for second year rice*^^^^^
AE_Rice_Bal(domain_for_AE_Rice_Bal(county, zones,landirrtype))..

         sum(domain_for_AV_CROPACRES(county,zones,'ricesecond',landirrtype),
                 AV_CROPACRES(county,zones,'ricesecond',landirrtype))
          =L=
         sum(domain_for_AV_CROPACRES(county,zones,'ricefirst',landirrtype),
                 AV_CROPACRES(county,zones,'ricefirst',landirrtype));


*^^^^^3.7 livestock mix balance*^^^^^
AE_LIVEMIXBAL(domain_for_AE_LIVEMIXBAL(county, livestock_mix, uplow))..

              sign_uplow(uplow)
               *sum((maplivestockmix(livestock, livestock_mix), domain_for_AV_LIVEPROD(county, livestock)),
                     AV_LIVEPROD(county, livestock)
                    *livebudnew(county, livestock,'head') )
      =L=
              sign_uplow(uplow)
               *sum(domain_for_AV_LIVEMIX(county,mixesa)  ,
                               AV_LIVEMIX(county,mixesa)
                             * livemixdatanew(county,livestock_mix,mixesa)
                             *(1+sign_uplow(uplow)*tolerance_uplow )) +0.1;


*^^^^^3.8 livestock propertion limits*^^^^^

AE_LIVEMIX_PROP2(domain_for_AE_LIVEMIX_PROP2(county,livestock_mix))..

               sum((domain_for_AV_LIVEPROD(county, livestock),maplivestockmix(livestock, livestock_mix)),
                               AV_LIVEPROD(county, livestock))
      =L=
               tolerance_uplow*
                sum(domain_for_AV_LIVEPROD(county, livestock2),
                               AV_LIVEPROD(county, livestock2))
;

*ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc*
*^^[4]  Water Use Balance^^
*ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc*

*^^^^^^4.1 agricultural water use balance on crop side ^^^^^^^^*
WE_AGWATERUSE_ZONEBAL(domain_for_WE_AGWATERUSE_ZONEBAL(county,zones,month,stateofnature))..

         sum((domain_for_AV_CROPSTRATEGY(county,zones, crops, landirrtype, stateofnature, allstrat),mapwater(month,watr)),
                         AV_CROPSTRATEGY(county,zones, crops, landirrtype, stateofnature, allstrat)
                         *crop_strat(county, crops, landirrtype, stateofnature, allstrat, watr))

        - sum(domain_for_WV_AGZONEWATERUSE(county, zones, month, RiverAndAquifer, stateofnature),
                         WV_AGZONEWATERUSE(county, zones, month, RiverAndAquifer, stateofnature))
               =E=   0;


*^^^^^^4.2 agricultural water use balance on river and aquifer side ^^^^^^^^*

WE_AGWATERUSE_SOURCEBAL(domain_for_WE_AGWATERUSE_SOURCEBAL(county, RiverAndAquifer, month,stateofnature))..

       sum(domain_for_WV_AGZONEWATERUSE(county, zones, month, RiverAndAquifer, stateofnature),
                      WV_AGZONEWATERUSE(county, zones, month, RiverAndAquifer, stateofnature))

     - sum(domain_for_WV_SURFACEDIVERSION(river(riverandAquifer),riverplace,county,'ag',month,stateofnature),
                      WV_SURFACEDIVERSION(river,riverplace,county,'ag',month,stateofnature))

     - sum(domain_for_WV_PUMP_GROUNDWATER(aquifer(riverandAquifer),layer,county,'ag',month,stateofnature),
                      WV_PUMP_GROUNDWATER(aquifer,layer,county,'ag',month,stateofnature) )

     - sum(domain_for_WV_OTHERWATERSOURCE(county, 'ag', month, stateofnature)$sameas(RiverAndAquifer, 'other'),
                      WV_OTHERWATERSOURCE(county, 'ag', month, stateofnature))

      -sum(domain_for_WV_WP_PROJECTWATER(projects,'ag',county,month,stateofnature)$sameas(RiverAndAquifer, 'project'),
                      WV_WP_PROJECTWATER(projects,'ag',county,month,stateofnature))
     =L=0;

*^^^^^^^4.3 water supply balance for mun/ind/min sectors ^^^^^^^*

WE_ADDALLWATERSUPPLY(domain_for_WE_ADDALLWATERSUPPLY(customer,sector,month,stateofnature))..

      sum(domain_for_WV_ADDUPUSERALLWATER(customer,sector,month,stateofnature),
                     WV_ADDUPUSERALLWATER(customer,sector,month,stateofnature))

     + sum(domain_for_WV_WP_ASR_FROMEXTRA(projects,sector,customer,month,stateofnature),
                      WV_WP_ASR_FROMEXTRA(projects,sector,customer,month,stateofnature))

     - sum(domain_for_WV_SURFACEDIVERSION(river,riverplace,customer,sector,month,stateofnature),
                      WV_SURFACEDIVERSION(river,riverplace,customer,sector,month,stateofnature))

     - sum(domain_for_WV_PUMP_GROUNDWATER(aquifer,layer,customer,sector,month,stateofnature),
                      WV_PUMP_GROUNDWATER(aquifer,layer,customer,sector,month,stateofnature) )

     - sum(domain_for_WV_OTHERWATERSOURCE(customer,sector, month, stateofnature),
                      WV_OTHERWATERSOURCE(customer,sector, month, stateofnature))

     - sum(domain_for_WV_WP_PROJECTWATER(projects,sector,customer,month,stateofnature),
                      WV_WP_PROJECTWATER(projects,sector,customer,month,stateofnature))

     - sum(domain_for_ART_WE_ADDALLWATERSUPPLY(customer,sector,month,stateofnature),
                      ART_WE_ADDALLWATERSUPPLY(customer,sector,month,stateofnature))
      =L=0;


*^^^^^ 4.4 water demand balance for mun/ind/min *^^^^^
WE_DEMANDQUANTITY(domain_for_WE_DEMANDQUANTITY(customer,sector,month,stateofnature))..

     - sum(domain_for_WV_ADDUPUSERALLWATER(customer,sector,month,stateofnature),
                      WV_ADDUPUSERALLWATER(customer,sector,month,stateofnature)
                      /increasefactor(customer, sector, month, stateofnature))

     - sum(domain_for_WV_WP_Conservation(customer)$sameas(sector,'mun'),
                      WV_WP_Conservation(customer)/12)

     - sum(domain_for_ART_WE_DEMANDQUANTITY(customer,sector,month,stateofnature),
                      ART_WE_DEMANDQUANTITY(customer,sector,month,stateofnature))

     + sum(domain_for_WV_WATERDEMAND_STEPS(customer,sector,steps),
                     qinc(steps)*Demanddata(customer,sector,'annual',"quantity")
                     *monthshare(customer, month, sector)
                     *WV_WATERDEMAND_STEPS(customer,sector,steps))

     + sum(domain_for_WV_WATERDEMAND(customer,sector),
                      WV_WATERDEMAND(customer,sector)
                     *monthshare(customer, month, sector))
      =E=0;


*^^^^^4.5 Diversion Convexity *^^^^^
WE_DEMANDCONVEX(domain_for_WE_DEMANDCONVEX(customer,sector))..

      sum(domain_for_WV_WATERDEMAND_STEPS(customer,sector,steps),
                     WV_WATERDEMAND_STEPS(customer,sector,steps))
        =L=  1.0;

*^^^^^4.6 Other Water Sources Use Limitation *^^^^^
WE_OTHERWATERSOURCEBAL(domain_for_WE_OTHERWATERSOURCEBAL(county, stateofnature))..

     sum((domain_for_WV_OTHERWATERSOURCE(customer,sector, month, stateofnature),mapcitycountytocounty(customer, county)),
                     WV_OTHERWATERSOURCE(customer,sector, month, stateofnature))
      =L= otheraquifer_source(county);


*CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC*
*^^^^[5] Surface River Flow Constraints*^^^^
*CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC*
*^^^^^5.1 Water Flow Balance: Demand and Supply*^^^^^
WE_FLOWBALANCE(domain_for_WE_FLOWBALANCE(river,riverplace,month,stateofnature))..

* Diversions
     + sum(domain_for_WV_SURFACEDIVERSION(river,riverplace,citycounty,sector,month,stateofnature),
                      WV_SURFACEDIVERSION(river,riverplace,citycounty,sector,month,stateofnature))

     + sum(domain_for_EV_SURFACEDIVERSION_COOL(river,riverplace,county,sector,month,stateofnature),
                      EV_SURFACEDIVERSION_COOL(river,riverplace,county,sector,month,stateofnature))
* water project take away

     + sum(domain_for_WV_WP_SURFACE_ACQUWR (projects,river,riverplace,county,sector,month,stateofnature),
                      WV_WP_SURFACE_ACQUWR (projects,river,riverplace,county,sector,month,stateofnature))
     + sum(domain_for_WV_WP_ASR_FROMSURFACE(projects,river,riverplace,county,sector,month,stateofnature),
                      WV_WP_ASR_FROMSURFACE(projects,river,riverplace,county,sector,month,stateofnature))
     + sum(domain_for_WV_WP_OCR_FROMSURFACE(projects,river,riverplace,county,sector,month,stateofnature),
                      WV_WP_OCR_FROMSURFACE(projects,river,riverplace,county,sector,month,stateofnature))

     + sum(domain_for_WV_WP_SURFACE_NEWWR  (projects,river,riverplace,month,stateofnature),
                      WV_WP_SURFACE_NEWWR  (projects,river,riverplace,month,stateofnature))
     + sum(domain_for_WV_WP_ASR_FROMSURFACE_NEWWR(projects,river,riverplace,month,stateofnature),
                      WV_WP_ASR_FROMSURFACE_NEWWR(projects,river,riverplace,month,stateofnature))
     + sum(domain_for_WV_WP_OCR_FROMSURFACE_NEWWR(projects,river,riverplace,month,stateofnature),
                      WV_WP_OCR_FROMSURFACE_NEWWR(projects,river,riverplace,month,stateofnature))

*flow to downstream
     + sum(domain_for_WV_FLOW(river,riverplace,downriver,month,stateofnature),
                      WV_FLOW(river,riverplace,downriver,month,stateofnature))

     + sum(domain_for_WV_OUTTOBAY(river,riverplace,month,stateofnature),
                      WV_OUTTOBAY(river,riverplace,month,stateofnature) )

*Store in and out of the reservoir
     + sum((domain_for_WV_RESERVOIR_WITHDRAW(reservoir,month,stateofnature), mapreservoir(river, riverplace, reservoir)),
                       WV_RESERVOIR_WITHDRAW(reservoir,month,stateofnature))

     - sum((domain_for_WV_RESERVOIR_RELEASE(reservoir,month,stateofnature), mapreservoir(river, riverplace, reservoir)),
                       WV_RESERVOIR_RELEASE(reservoir,month,stateofnature))

* Net Inflow from riverplace
      - inflow1(river,riverplace,month,stateofnature)
* Flow from upstream
      - sum(domain_for_WV_FLOW(river,upriver,riverplace,month,stateofnature),
                       WV_FLOW(river,upriver,riverplace,month,stateofnature))
* spring flow discharge
      - sum(domain_for_WV_SPRNFLOW(springs(riverplace),stateofnature),
                       WV_SPRNFLOW(Springs,stateofnature)*SpringSeasonal(springs, month) )

* surface water return flow to downstream only, rec/oth
      - sum((domain_for_WV_SURFACEDIVERSION(river,upriver,citycounty,sector,month,stateofnature),riverflowlink(river,upriver,riverplace))$(sameas(sector,'rec') or sameas(sector,'oth')) ,
                       RFpercent(sector) *WV_SURFACEDIVERSION(river,upriver,citycounty,sector,month,stateofnature))

* return flow from other sources by sector , ag/mun/ind/min
      - sum(domain_for_WV_RETURNFLOW(customer,sector,month,stateofnature),
                       WV_RETURNFLOW(customer,sector,month,stateofnature)* RFplace(customer, river, riverplace))

* return flow from cooling
      - sum((domain_for_EV_PP_WATER_DIVERSION(power_plant_all,power_plant_type, power_plant_cooling, month, stateofnature),coolingG(county, aquifer, layer, power_plant_all)) ,
                        EV_PP_WATER_DIVERSION(power_plant_all,power_plant_type, power_plant_cooling, month, stateofnature)
                     * PP_water_returnrate(power_plant_cooling)* RFplace(county, river, riverplace) )

       -sum((domain_for_EV_PP_WATER_SURFACE(river,upriver,county,power_plant_all,power_plant_cooling,sector,month,stateofnature), riverflowlink(river,upriver,riverplace)),
                        EV_PP_WATER_SURFACE(river,upriver,county,power_plant_all,power_plant_cooling,sector,month,stateofnature)
                         *PP_water_returnrate(power_plant_cooling))

      + sum(domain_for_ART_WE_FLOWBALANCE_DEMAND(river,riverplace,month,stateofnature),
                       ART_WE_FLOWBALANCE_DEMAND(river,riverplace,month,stateofnature))
      - sum(domain_for_ART_WE_FLOWBALANCE_SUPPLY(river,riverplace,month,stateofnature),
                       ART_WE_FLOWBALANCE_SUPPLY(river,riverplace,month,stateofnature))
      =E=0.1;

*^^^ 5.2 return flow calculation when there is reuse water ^^^^

* first return + reuse takeout = (total-reuse)*a
* second return = reuse*a
*total return = first return + second return
*   = (total - reuse)*a - takeout + reuse*a  = total*a- takeout
* note here, mining can reuse 50%, but discharge 0% to the river (not reused dispose to deep well)
WE_RETURNFLOWBAL(domain_for_WE_RETURNFLOWBAL(customer,sector,month,stateofnature))..

      sum(domain_for_WV_RETURNFLOW(customer,sector,month,stateofnature),
                     WV_RETURNFLOW(customer,sector,month,stateofnature))


     +sum(domain_for_WV_WP_REUSE_EFFLUENT(customer,sector,month,stateofnature),
                     WV_WP_REUSE_EFFLUENT(customer,sector,month,stateofnature))

    =L=  (RFpercent(sector)$(not sameas(sector,'min')) + RFpercent_reuse(sector)$sameas(sector,'min'))
         * sum(domain_for_WV_ADDUPUSERALLWATER(customer,sector,month,stateofnature),
                          WV_ADDUPUSERALLWATER(customer,sector,month,stateofnature))

        + sum((domain_for_WV_AGZONEWATERUSE(county, zones, month, RiverAndAquifer, stateofnature),mapcitycountytocounty(customer,county))$sameas(sector,'ag'),
                          WV_AGZONEWATERUSE(county, zones, month, RiverAndAquifer, stateofnature)* RFpercent(sector) )

       +0.1 ;



*^^^^ 5.2 min requirement for river out to bay

WE_OUTOBAYBAL(domain_for_WE_OUTOBAYBAL(river, stateofnature))
         $sum(out, minouttobay(river, out))..

         sum(domain_for_WV_OUTTOBAY(river,riverplace,month,stateofnature),
                        WV_OUTTOBAY(river,riverplace,month,stateofnature) )

        +sum(domain_for_ART_WE_OUTOBAYBAL(river, stateofnature),
                        ART_WE_OUTOBAYBAL(river, stateofnature))
         =G= sum(out,  minouttobay(river, out));


* add to surface water part
*^^^^^5.3 Maximium diversion allowed at each diverter for all consumption sectors*^^^^^
WE_DIVERSIONQMAX(domain_for_WE_DIVERSIONQMAX(county,sector,river,riverplace,stateofnature))..


     + sum((domain_for_WV_SURFACEDIVERSION(river,riverplace,customer,sector,month,stateofnature),mapcitycountytocounty(customer,county)),
                       WV_SURFACEDIVERSION(river,riverplace,customer,sector,month,stateofnature))

     + sum(domain_for_EV_SURFACEDIVERSION_COOL(river,riverplace,county,sector,month,stateofnature),
                      EV_SURFACEDIVERSION_COOL(river,riverplace,county,sector,month,stateofnature))

     + sum(domain_for_WV_WP_SURFACE_ACQUWR (projects,river,riverplace,county,sector,month,stateofnature),
                      WV_WP_SURFACE_ACQUWR (projects,river,riverplace,county,sector,month,stateofnature))
     + sum(domain_for_WV_WP_ASR_FROMSURFACE(projects,river,riverplace,county,sector,month,stateofnature),
                      WV_WP_ASR_FROMSURFACE(projects,river,riverplace,county,sector,month,stateofnature))
     + sum(domain_for_WV_WP_OCR_FROMSURFACE(projects,river,riverplace,county,sector,month,stateofnature),
                      WV_WP_OCR_FROMSURFACE(projects,river,riverplace,county,sector,month,stateofnature))
     =L=
         upperdiversionQ(county,sector,river,riverplace)
       + sum((riverlocation,county1,sector1),
          + river_traded(river,riverlocation,county1,sector1,riverplace,county,sector)
          - river_traded(river,riverplace,county,sector,riverlocation,county1,sector1) )

       + sum(domain_for_WV_WM_TRADE_RIVER(river,riverlocation,county1,sector1,riverplace   ,county ,sector),
                        WV_WM_TRADE_RIVER(river,riverlocation,county1,sector1,riverplace   ,county ,sector))
       + sum(domain_for_WV_WM_LEASE_RIVER(river,riverlocation,county1,sector1,riverplace   ,county ,sector,stateofnature),
                        WV_WM_LEASE_RIVER(river,riverlocation,county1,sector1,riverplace   ,county ,sector,stateofnature))
       - sum(domain_for_WV_WM_TRADE_RIVER(river,riverplace   ,county ,sector ,riverlocation,county1,sector1),
                        WV_WM_TRADE_RIVER(river,riverplace   ,county ,sector ,riverlocation,county1,sector1))
       - sum(domain_for_WV_WM_LEASE_RIVER(river,riverplace   ,county ,sector ,riverlocation,county1,sector1,stateofnature),
                        WV_WM_LEASE_RIVER(river,riverplace   ,county ,sector ,riverlocation,county1,sector1,stateofnature))
;

*CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC*
*^^^^^^^        [6] Reservoir Constraints        *^^^^
*CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC*

*^^^^^^6.1  Reservoir Capacity for each month*^^^^^

WE_RESERVOIR_CAPACITY_BAL(domain_for_WE_RESERVOIR_CAPACITY_BAL(reservoir, month, stateofnature))..
      sum(domain_for_WV_RESERVIOR_INVENTORY(reservoir, month, stateofnature),
                     WV_RESERVIOR_INVENTORY(reservoir, month, stateofnature) )
   =L=
     sum(mapreservoir(river, riverplace, reservoir), reservoircapacity(river, reservoir, riverplace, 'flood') )  ;

*^^^^^^6.2  Reservoir Initial Capacity*^^^^^

WE_RESERVOIR_CAPACITY_INIBAL(domain_for_WE_RESERVOIR_CAPACITY_INIBAL(reservoir))..
      sum(domain_for_WV_RESERVIOR_INVENTORY_INI(reservoir),
                     WV_RESERVIOR_INVENTORY_INI(reservoir))
   =L=
     sum(mapreservoir(river, riverplace, reservoir), reservoircapacity(river, reservoir, riverplace, 'conservation') )  ;

*^^^^^6.3 reservoir storage balance*^^^^^
WE_RESERVOIR_BALANCE(domain_for_WE_RESERVOIR_BALANCE(reservoir, month,stateofnature))..

     -[sum(domain_for_WV_RESERVIOR_INVENTORY_INI(reservoir)$(sameas(month, "jan")),
                      WV_RESERVIOR_INVENTORY_INI(reservoir))
       +sum(domain_for_WV_RESERVIOR_INVENTORY(reservoir, month-1, stateofnature)$(not sameas(month, "jan")),
                       WV_RESERVIOR_INVENTORY(reservoir, month-1, stateofnature) ) ]
            *( 1 - reservoir_grid(reservoir, 'g3', 'AreaVol')*res_evap_rate(reservoir, month, stateofnature)/12)

     - sum((domain_for_WV_RESERVOIR_WITHDRAW(reservoir,month,stateofnature), mapreservoir(river, riverplace, reservoir)),
                       WV_RESERVOIR_WITHDRAW(reservoir,month,stateofnature))

     + sum((domain_for_WV_RESERVOIR_RELEASE(reservoir,month,stateofnature), mapreservoir(river, riverplace, reservoir)),
                       WV_RESERVOIR_RELEASE(reservoir,month,stateofnature))

     + sum(domain_for_WV_RESERVIOR_INVENTORY(reservoir, month, stateofnature),
                      WV_RESERVIOR_INVENTORY(reservoir, month, stateofnature) )
   =E=  0;


*^^^^^6.4 Jan-Dec storage balance
WE_RESERVOIR_INIBAL(domain_for_WE_RESERVOIR_INIBAL(reservoir))..

      sum(domain_for_WV_RESERVIOR_INVENTORY_INI(reservoir),
                      WV_RESERVIOR_INVENTORY_INI(reservoir))

   -  sum(domain_for_WV_RESERVIOR_INVENTORY(reservoir, 'dec', stateofnature),
                      probability(stateofnature)
                      *WV_RESERVIOR_INVENTORY(reservoir, 'dec', stateofnature) )
   =E= 0;


*^^^^^6.5 maximun of net withdraw
WE_RESERVOIR_MAXWTIHDRAW(domain_for_WE_RESERVOIR_MAXWTIHDRAW(reservoir, month, stateofnature))..

     + sum((domain_for_WV_RESERVOIR_WITHDRAW(reservoir,month,stateofnature), mapreservoir(river, riverplace, reservoir)),
                       WV_RESERVOIR_WITHDRAW(reservoir,month,stateofnature))

     - sum((domain_for_WV_RESERVOIR_RELEASE(reservoir,month,stateofnature), mapreservoir(river, riverplace, reservoir)),
                       WV_RESERVOIR_RELEASE(reservoir,month,stateofnature))

    =L=
      0.2*sum((domain_for_WV_FLOW(river,riverplace,downriver,month,stateofnature),mapreservoir(river, riverplace, reservoir)),
                          WV_FLOW(river,riverplace,downriver,month,stateofnature))          ;


*  CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC *
*  [7] Groundwater Hydrologic Constraints (based on regression
*   analysis of GWSIM-IV Edwards Aquifer Simulation Model)   *
*  CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC *

* ^^^^^^ 7.1 Total county pump from ground water ^^^^^^^
WE_COUNTYPUMPBAL(domain_for_WE_COUNTYPUMPBAL(county, Aquifer, layer, month,stateofnature))..

    - sum(domain_for_WV_TOTALCOUNTYPUMP(county, Aquifer, layer, month, stateofnature),
                     WV_TOTALCOUNTYPUMP(county, Aquifer, layer, month, stateofnature))

    + sum((domain_for_WV_PUMP_GROUNDWATER(aquifer,layer,customer,sector,month,stateofnature),mapcitycountytocounty(customer, county)),
                      WV_PUMP_GROUNDWATER(aquifer,layer,customer,sector,month,stateofnature) )

    + sum(domain_for_WV_WP_USEGROUND(Projects,sector,customer,county,aquifer,layer,month,stateofnature),
                     WV_WP_USEGROUND(Projects,sector,customer,county,aquifer,layer,month,stateofnature))

    + sum(domain_for_WV_WP_ASR_FROMGROUND(projects,county,aquifer,layer,month,stateofnature),
                     WV_WP_ASR_FROMGROUND(projects,county,aquifer,layer,month,stateofnature))
      =L= 0;

* ^^^^^^ 7.2 Total county pump split to steps ^^^^^^
WE_TOTALCOUNTY_PUMPSTEPBAL(domain_for_WE_TOTALCOUNTY_PUMPSTEPBAL(county,Aquifer, layer, stateofnature))..

     + sum(domain_for_WV_TOTALCOUNTYPUMP(county, Aquifer, layer, month, stateofnature)$(not sameas(Aquifer, "Edwards")) ,
                      WV_TOTALCOUNTYPUMP(county, Aquifer, layer, month, stateofnature))

     + sum((domain_for_WV_TOTALCOUNTYPUMP(county1, Aquifer, layer, month, stateofnature), mapEdwardCounty(layer, county1))$(sameas(Aquifer, "Edwards") and sameas(county, 'none')),
                       WV_TOTALCOUNTYPUMP(county1, Aquifer, layer, month, stateofnature))
* Edwards can get water from SanAntonioASR Projects
     - sum(domain_for_WV_WP_RECHARGE_AQUIFER(projects,sector,'SanAntonio',aquifer,layer, month,stateofnature)$(sameas(Aquifer, "Edwards") and sameas(county, 'none')),
                      WV_WP_RECHARGE_AQUIFER(projects,sector,'SanAntonio',aquifer,layer, month,stateofnature))

     =E=
     + sum(domain_for_WV_PUMP_STEP(county,Aquifer,layer,stateofnature,stepw),
                      WV_PUMP_STEP(county,Aquifer,layer,stateofnature,stepw)
                      *QINCW(STEPw)*pumpbase(Aquifer, layer, county));

* ^^^^^^ 7.3 Total county pump convexity balance ^^^^^^
WE_TOTALCOUNTY_PUMP_CONVEXBAL(domain_for_WE_TOTALCOUNTY_PUMP_CONVEXBAL(county,Aquifer, layer, stateofnature))..
       sum(domain_for_WV_PUMP_STEP(county,Aquifer,layer,stateofnature,stepw),
                      WV_PUMP_STEP(county,Aquifer,layer,stateofnature,stepw))=E= 1;

* ^^^^^ 7.4 Set beginning water level equal to average of ending levels*^^^^^
WE_DRAWDOWN_BAL(domain_for_WE_DRAWDOWN_BAL(aquifer,layer,county))..

     + sum(domain_for_WV_PUMP_STEP(county,Aquifer,layer,stateofnature,stepw),
                      WV_PUMP_STEP(county,Aquifer,layer,stateofnature,stepw)
                      *endliftsteps(county,aquifer, layer, stateofnature, stepw)*probability(stateofnature))
     - iniLift0(aquifer,layer, county)
     - sum(domain_for_ART_WE_DRAWDOWN_BAL(aquifer, layer, county),
                      ART_WE_DRAWDOWN_BAL(aquifer, layer, county))

    =L=sum(domain_for_WV_DRAWDOWN(aquifer, layer, county, steps_dd),
                      WV_DRAWDOWN(aquifer, layer, county, steps_dd));

* ^^^^^ 7.5 Springflow balance *^^^^^
WE_SPRINGFLOW_BAL(domain_for_WE_SPRINGFLOW_BAL(Springs,stateofnature))..

       sum(domain_for_WV_SPRNFLOW(springs,stateofnature),
                      WV_SPRNFLOW(Springs,stateofnature))
   =E=
      sum(Regitems,
                   AquiferHistdatanew("Edwards", "J17Head", 'none',stateofnature, Regitems)
                   *SpringReg(Springs, Regitems) )
* total pump
     +sum(domain_for_WV_PUMP_STEP('none',"Edwards", "J17Head",stateofnature,stepw),
                     WV_PUMP_STEP('none',"Edwards", "J17Head",stateofnature,stepw)
                    *QINCW(STEPw)*pumpbase("Edwards", "J17Head",'none')
                    *SpringReg(Springs, "J17HeadUse") )

* lag lift
     + [DEM("Edwards","J17Head") - IniLift("Edwards", "J17Head", 'none')]*SpringReg(Springs, 'J17Head_lag')
* current lift
     + [DEM("Edwards","J17Head")
         - sum(domain_for_WV_PUMP_STEP('none',"Edwards", "J17Head",stateofnature,stepw),
                          WV_PUMP_STEP('none',"Edwards", "J17Head",stateofnature,stepw)
                          *endliftsteps('none',"Edwards", "J17Head",stateofnature, stepw))]
       *SpringReg(Springs, 'J17Head')
;

* ^^^^^ 7.6 EDWARDS Pumping Limits  *^^^^^
WE_EDWARDS_PUMPLIMIT(domain_for_WE_EDWARDS_PUMPLIMIT(county, gsector,stateofnature))..

      + sum((domain_for_WV_PUMP_GROUNDWATER('Edwards',layer,customer,sector1,month,stateofnature),
                       mapcitycountytocounty(customer,county),county_wateruse_map(county, 'Edwards', gsector, sector1)),
                       WV_PUMP_GROUNDWATER('Edwards',layer,customer,sector1,month,stateofnature))

    =L=
       {edwardspermit1(county, gsector, 'All')
      - sum(domain_for_WV_WM_DYO_SUSPEND(county,stateofnature)$sameas(gsector,'ag'),
                       WV_WM_DYO_SUSPEND(county,stateofnature))

      + sum(domain_for_WV_WM_TRADE_AQUIFER('Edwards',county1,gsector1,county,gsector),
                       WV_WM_TRADE_AQUIFER('Edwards',county1,gsector1,county,gsector)*edwards_trade_limit(county1, county))

      + sum(domain_for_WV_WM_LEASE_AQUIFER('Edwards',county1,gsector1,county,gsector,stateofnature),
                       WV_WM_LEASE_AQUIFER('Edwards',county1,gsector1,county,gsector,stateofnature)*edwards_trade_limit(county1, county))

      - sum(domain_for_WV_WM_TRADE_AQUIFER('Edwards',county,gsector,county1,gsector1),
                       WV_WM_TRADE_AQUIFER('Edwards',county,gsector,county1,gsector1))

      - sum(domain_for_WV_WM_LEASE_AQUIFER('Edwards',county,gsector,county1,gsector1,stateofnature),
                       WV_WM_LEASE_AQUIFER('Edwards',county,gsector,county1,gsector1,stateofnature))

       + sum((county1, gsector1),
               + aquifer_traded('Edwards',county1,gsector1, county, gsector)*edwards_trade_limit(county1, county)
               - aquifer_traded('Edwards',county,gsector, county1, gsector1))

     } *(1- sum( mapEdwardCounty(layer, county) , EdwardsCutoff(layer, stateofnature)) )
;

* ^^^^^ 7.7 SWAS EDWARDS Pumping Limits  *^^^^^
WE_SAWSEDWARDS_PUMPLIMIT(domain_for_WE_SAWSEDWARDS_PUMPLIMIT(stateofnature))..
         + sum(domain_for_WV_PUMP_GROUNDWATER('Edwards','J17Head','SanAntonio','mun',month,stateofnature),
                           WV_PUMP_GROUNDWATER('Edwards','J17Head','SanAntonio','mun',month,stateofnature))
      =L= SAWSEdwardsProp(stateofnature)
         * sum(domain_for_WV_ADDUPUSERALLWATER('SanAntonio','mun',month,stateofnature),
                          WV_ADDUPUSERALLWATER('SanAntonio','mun',month,stateofnature))   ;

* ^^^^^ 7.8 SWAS EDWARDS Pumping Limits  *^^^^^
WE_AQUIFER_PUMPLIMIT_EXIST(domain_for_WE_AQUIFER_PUMPLIMIT_EXIST(aquifer,county,stateofnature))..

      sum((domain_for_WV_PUMP_GROUNDWATER(aquifer,layer,customer,sector,month,stateofnature),mapcitycountytocounty(customer, county)),
                      WV_PUMP_GROUNDWATER(aquifer,layer,customer,sector,month,stateofnature))

      =L= exist_supply(aquifer,county);

WE_AQUIFER_PUMPLIMIT_MAG(domain_for_WE_AQUIFER_PUMPLIMIT_MAG(aquifer,county))..

         sum(domain_for_WV_TOTALCOUNTYPUMP(county, Aquifer, layer, month, stateofnature),
                        WV_TOTALCOUNTYPUMP(county, Aquifer, layer, month, stateofnature)
                        *probability(stateofnature) )
      =L= MAG(county,aquifer);


*ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc*
*^^[8]  Water SORUCE MIX ^^
*ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc*
* ^^^^^ 8.1 the mix of ground water sources  *^^^^^

WE_MIX_GRDPUMPBal(domain_for_WE_MIX_GRDPUMPBal(county,aquifer,layer,stateofnature,uplow))..
       sign_uplow(uplow)
      *sum(domain_for_WV_TOTALCOUNTYPUMP(county, Aquifer, layer, month, stateofnature),
                      WV_TOTALCOUNTYPUMP(county, Aquifer, layer, month, stateofnature))
      =L= 0.1+
       sign_uplow(uplow)
      *sum(domain_for_WV_MIX_GRDPUMP(county,years,stateofnature) ,
                      WV_MIX_GRDPUMP(county,years,stateofnature)
                    * (-AquiferHistdata(Aquifer, layer, county,years, 'Wells'))
                    *(1+sign_uplow(uplow)*tolerance_uplow*2 ));


*^^^^^ 8.2 surface and groundwater mix limits*^^^^^

WE_MIX_SURGRDBal(domain_for_WE_MIX_SURGRDBal(county, gsector,source, stateofnature,uplow))..
       sign_uplow(uplow)
      * sum((domain_for_WV_PUMP_GROUNDWATER(aquifer,layer,citycounty,gsector,month,stateofnature),mapcitycountytocounty(citycounty, county))$sameas(source, 'ground'),
                        WV_PUMP_GROUNDWATER(aquifer,layer,citycounty,gsector,month,stateofnature))

     + sign_uplow(uplow)
      *sum((domain_for_WV_SURFACEDIVERSION(river,riverplace,citycounty,gsector,month,stateofnature),mapcitycountytocounty(citycounty,county))$sameas(source, 'surface'),
                       WV_SURFACEDIVERSION(river,riverplace,citycounty,gsector,month,stateofnature))

      =L=  0.1+
       sign_uplow(uplow)
      *sum(domain_for_WV_MIX_SURGRD(county,gsector,mixesa,stateofnature) ,
                      WV_MIX_SURGRD(county,gsector,mixesa,stateofnature)
                    * hist_sur_groud (county,gsector,source,mixesa)
                    *(1+sign_uplow(uplow)*tolerance_uplow*2 ));

*^^^ 8.3 saline water blend upper bound ^^^

WE_MIX_SALINEBLENDBAL(domain_for_WE_MIX_SALINEBLENDBAL(citycounty,gsector,month,stateofnature))..

        sum(domain_for_WV_PUMP_GROUNDWATER(salinelayer(aquifer,layer),citycounty,gsector,month,stateofnature),
                        WV_PUMP_GROUNDWATER(aquifer,layer,citycounty,gsector,month,stateofnature))
  =L=  0.1+
       0.05* sum(domain_for_WV_ADDUPUSERALLWATER(citycounty,gsector,month,stateofnature),
                            WV_ADDUPUSERALLWATER(citycounty,gsector,month,stateofnature))   ;


*ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc*
*^^[9]  Water Project Part ^^
*ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc*

*^^^^^ 9.1 water projects capacity *^^^^^
WE_WP_CAPACITYBAL(domain_for_WE_WP_CAPACITYBAL(projects,month,stateofnature))..

     + sum(domain_for_WV_WP_USEGROUND(Projects,sector,customer,county,aquifer,layer,month,stateofnature),
                      WV_WP_USEGROUND(Projects,sector,customer,county,aquifer,layer,month,stateofnature))
     + sum(domain_for_WV_WP_USEASR(projects,sector,customer,month,stateofnature),
                      WV_WP_USEASR(projects,sector,customer,month,stateofnature))
     + sum(domain_for_WV_WP_USESURFACE(projects,sector,customer,sourceriver,riverplace,month,stateofnature),
                      WV_WP_USESURFACE(projects,sector,customer,sourceriver,riverplace,month,stateofnature))
     + sum(domain_for_WV_WP_USEOCR(projects,sector,customer,OCR,month,stateofnature),
                      WV_WP_USEOCR(projects,sector,customer,OCR,month,stateofnature))
     + sum(domain_for_WV_WP_USEOUTSIDE(projects,sector,customer,month,stateofnature),
                      WV_WP_USEOUTSIDE(projects,sector,customer,month,stateofnature))
     + sum(domain_for_WV_WP_USESEAWATER(projects,sector,customer,month,stateofnature),
                      WV_WP_USESEAWATER(projects,sector,customer,month,stateofnature))
     + sum(domain_for_WV_WP_USEREUSE(projects,sector,customer,sector1,citycounty,month,stateofnature),
                      WV_WP_USEREUSE(projects,sector,customer,sector1,citycounty,month,stateofnature))
    =L=
       sum(domain_for_WV_WP_DO_I_OPRT_WATER(Projects),
                      WV_WP_DO_I_OPRT_WATER(Projects)*investmentcost(projects,'ProjectYield')/12);


*^^^^^ 9.2  Water Project Operation Balance *^^^^^
WE_WP_OPERATINGBAL(domain_for_WE_WP_OPERATINGBAL(projects))..

       sum(domain_for_WV_WP_DO_I_OPRT_WATER(Projects),
                      WV_WP_DO_I_OPRT_WATER(Projects))
    =L=
       sum(domain_for_WV_WP_DO_I_BUILD_WATER(Projects),
                      WV_WP_DO_I_BUILD_WATER(Projects))
      + 1$exist_projects (projects) ;

*^^^^^ 9.3  ADD up the water supply to customer  *^^^^^
WE_WP_SUPPLYBAL(domain_for_WE_WP_SUPPLYBAL(projects,sector,customer,month,stateofnature))..

       sum(domain_for_WV_WP_PROJECTWATER(projects,sector,customer,month,stateofnature),
                      WV_WP_PROJECTWATER(projects,sector,customer,month,stateofnature))
     + sum(domain_for_WV_WP_RECHARGE_AQUIFER(projects,sector,customer,aquifer,layer, month,stateofnature),
                      WV_WP_RECHARGE_AQUIFER(projects,sector,customer,aquifer,layer, month,stateofnature))
 =L=
     + sum(domain_for_WV_WP_USEGROUND(Projects,sector,customer,county,aquifer,layer,month,stateofnature),
                      WV_WP_USEGROUND(Projects,sector,customer,county,aquifer,layer,month,stateofnature))
     + sum(domain_for_WV_WP_USEASR(projects,sector,customer,month,stateofnature),
                      WV_WP_USEASR(projects,sector,customer,month,stateofnature))
     + sum(domain_for_WV_WP_USESURFACE(projects,sector,customer,sourceriver,riverplace,month,stateofnature),
                      WV_WP_USESURFACE(projects,sector,customer,sourceriver,riverplace,month,stateofnature))
     + sum(domain_for_WV_WP_USEOCR(projects,sector,customer,OCR,month,stateofnature),
                      WV_WP_USEOCR(projects,sector,customer,OCR,month,stateofnature))
     + sum(domain_for_WV_WP_USEOUTSIDE(projects,sector,customer,month,stateofnature),
                      WV_WP_USEOUTSIDE(projects,sector,customer,month,stateofnature))
     + sum(domain_for_WV_WP_USESEAWATER(projects,sector,customer,month,stateofnature),
                      WV_WP_USESEAWATER(projects,sector,customer,month,stateofnature))
     + sum(domain_for_WV_WP_USEREUSE(projects,sector,customer,sector1,citycounty,month,stateofnature),
                      WV_WP_USEREUSE(projects,sector,customer,sector1,citycounty,month,stateofnature)) +0.1;

* ^^^^^ 9.4 ground water projects pumping limitation ^^^^^^^
WE_WP_GROUND_PUMPLIMIT(domain_for_WE_WP_GROUND_PUMPLIMIT(projects,county,aquifer,groundwatertype,month,stateofnature))..

      sum((domain_for_WV_WP_USEGROUND(Projects,sector,customer,county,aquifer,layer,month,stateofnature),
                     mapgroundproject(projects,sector,customer,county,aquifer,layer,groundwatertype)),
                      WV_WP_USEGROUND(Projects,sector,customer,county,aquifer,layer,month,stateofnature))
     =L= groundprojects_limit(projects,county,aquifer, groundwatertype,'pumplimit')/12
       *  sum(domain_for_WV_WP_DO_I_OPRT_WATER(Projects),
                         WV_WP_DO_I_OPRT_WATER(Projects));


* ^^^^^ 9.5 surface water project diversion balances^^^^^^^
WE_WP_SURFACE_DIVBAL(domain_for_WE_WP_SURFACE_DIVBAL(projects,sourceriver,riverplace,month,stateofnature))..

     + sum(domain_for_WV_WP_USESURFACE(projects,sector,customer,sourceriver,riverplace,month,stateofnature),
                      WV_WP_USESURFACE(projects,sector,customer,sourceriver,riverplace,month,stateofnature))

     - sum(domain_for_WV_WP_SURFACE_ACQUWR(projects,sourceriver,riverplace,county,sector1,month,stateofnature),
                      WV_WP_SURFACE_ACQUWR(projects,sourceriver,riverplace,county,sector1,month,stateofnature))

     - sum(domain_for_WV_WP_SURFACE_NEWWR(projects,sourceriver,riverplace,month,stateofnature),
                      WV_WP_SURFACE_NEWWR(projects,sourceriver,riverplace,month,stateofnature))
     =L=0;

* ^^^^^ 9.6 ASR/OCR projects storage balance ^^^^^^^
WE_WP_ASROCR_BALANCE(domain_for_WE_WP_ASROCR_BALANCE(projects, month,stateofnature))..

* last  period inventory
     - sum(domain_for_WV_WP_ASROCR_INVENTORY_INI(projects)$(sameas(month, "jan")),
                      WV_WP_ASROCR_INVENTORY_INI(projects))
     - sum(domain_for_WV_WP_ASROCR_INVENTORY(projects, month-1, stateofnature)$(not sameas(month, "jan")),
                      WV_WP_ASROCR_INVENTORY(projects, month-1, stateofnature) )

* take in from other sources  to OCR/ASR

     - sum(domain_for_WV_WP_ASR_FROMGROUND(projects,sourcecounty,sourceaquifer,layer,month,stateofnature),
                      WV_WP_ASR_FROMGROUND(projects,sourcecounty,sourceaquifer,layer,month,stateofnature))
     - sum(domain_for_WV_WP_ASR_FROMSURFACE(projects,sourceriver,riverplace,county,sector,month,stateofnature),
                      WV_WP_ASR_FROMSURFACE(projects,sourceriver,riverplace,county,sector,month,stateofnature))
     - sum(domain_for_WV_WP_ASR_FROMSURFACE_NEWWR(projects,sourceriver,riverplace,month,stateofnature),
                      WV_WP_ASR_FROMSURFACE_NEWWR(projects,sourceriver,riverplace,month,stateofnature))
     - sum(domain_for_WV_WP_ASR_FROMREUSE(projects,sector,citycounty,month,stateofnature),
                      WV_WP_ASR_FROMREUSE(projects,sector,citycounty,month,stateofnature))
     - sum(domain_for_WV_WP_ASR_FROMEXTRA(projects,sector,citycounty,month,stateofnature),
                      WV_WP_ASR_FROMEXTRA(projects,sector,citycounty,month,stateofnature))

     - sum(domain_for_WV_WP_OCR_FROMSURFACE(projects,sourceriver,riverplace,county,sector,month,stateofnature),
                      WV_WP_OCR_FROMSURFACE(projects,sourceriver,riverplace,county,sector,month,stateofnature))
     - sum(domain_for_WV_WP_OCR_FROMSURFACE_NEWWR(projects,sourceriver,riverplace,month,stateofnature),
                      WV_WP_OCR_FROMSURFACE_NEWWR(projects,sourceriver,riverplace,month,stateofnature))
* take out from OCR/ASR
     + sum(domain_for_WV_WP_USEOCR(projects,sector,customer,OCR,month,stateofnature),
                      WV_WP_USEOCR(projects,sector,customer,OCR,month,stateofnature))
     + sum(domain_for_WV_WP_USEASR(projects,sector,customer,month,stateofnature),
                      WV_WP_USEASR(projects,sector,customer,month,stateofnature))

* carrying over to the next period
     + sum(domain_for_WV_WP_ASROCR_INVENTORY(projects, month, stateofnature),
                      WV_WP_ASROCR_INVENTORY(projects, month, stateofnature))
   =L=  0;

*^^^^^^9.7 ASR/OCR Capacity for each month*^^^^^

WE_WP_ASROCR_CAPACITY_BAL(domain_for_WE_WP_ASROCR_CAPACITY_BAL(projects, month, stateofnature))..
       sum(domain_for_WV_WP_ASROCR_INVENTORY(projects, month, stateofnature),
                      WV_WP_ASROCR_INVENTORY(projects, month, stateofnature))
   =L= sum(domain_for_WV_WP_DO_I_OPRT_WATER(Projects),
                      WV_WP_DO_I_OPRT_WATER(Projects))
       *(reservoirproject_storage(projects) +ASRPara(projects,'Maxstorage')) ;


*^^^^^^ 9.8 ASR/OCR Jan-Dec storage balance
WE_WP_ASROCR_INIBAL(domain_for_WE_WP_ASROCR_INIBAL(projects))..

       sum(domain_for_WV_WP_ASROCR_INVENTORY_INI(projects),
                      WV_WP_ASROCR_INVENTORY_INI(projects))
     - sum(domain_for_WV_WP_ASROCR_INVENTORY(projects,'dec', stateofnature),
                      probability(stateofnature)
                      *WV_WP_ASROCR_INVENTORY(projects,'dec', stateofnature))
   =E= 0;

*^^^^^^ 9.9 ASR injection rate limits
WE_WP_ASR_INJECT_LIMIT(domain_for_WE_WP_ASR_INJECT_LIMIT(projects,month,stateofnature))..

      sum(domain_for_WV_WP_ASR_FROMGROUND(projects,sourcecounty,sourceaquifer,layer,month,stateofnature),
                     WV_WP_ASR_FROMGROUND(projects,sourcecounty,sourceaquifer,layer,month,stateofnature))
    + sum(domain_for_WV_WP_ASR_FROMSURFACE(projects,sourceriver,riverplace,county,sector,month,stateofnature),
                     WV_WP_ASR_FROMSURFACE(projects,sourceriver,riverplace,county,sector,month,stateofnature))
    + sum(domain_for_WV_WP_ASR_FROMSURFACE_NEWWR(projects,sourceriver,riverplace,month,stateofnature),
                     WV_WP_ASR_FROMSURFACE_NEWWR(projects,sourceriver,riverplace,month,stateofnature))
    + sum(domain_for_WV_WP_ASR_FROMREUSE(projects,sector,citycounty,month,stateofnature),
                     WV_WP_ASR_FROMREUSE(projects,sector,citycounty,month,stateofnature))
    + sum(domain_for_WV_WP_ASR_FROMEXTRA(projects,sector,citycounty,month,stateofnature),
                     WV_WP_ASR_FROMEXTRA(projects,sector,citycounty,month,stateofnature))

     =L=   sum(domain_for_WV_WP_DO_I_OPRT_WATER(Projects),
                          WV_WP_DO_I_OPRT_WATER(Projects))
                          *ASRPara(projects,'MaxDiversionToASR')/12;


*^^^^^^ 9.10 ASR recovery rate limits
WE_WP_ASR_RECOVERY_LIMIT(domain_for_WE_WP_ASR_RECOVERY_LIMIT(projects,month,stateofnature))..

     + sum(domain_for_WV_WP_USEASR(projects,sector,customer,month,stateofnature),
                      WV_WP_USEASR(projects,sector,customer,month,stateofnature))
     =L=   sum(domain_for_WV_WP_DO_I_OPRT_WATER(Projects),
                      WV_WP_DO_I_OPRT_WATER(Projects))
                     *ASRPara(projects,'maxrecovery')/12;


* ^^^^^ 9.11 water diversion limits of acquisited current water rights^^^^^^^
WE_WP_CURRENTWR_LIMIT(domain_for_WE_WP_CURRENTWR_LIMIT(projects,sourceriver,riverplace,county,sector,stateofnature))..

       sum(domain_for_WV_WP_SURFACE_ACQUWR(projects,sourceriver,riverplace,county,sector,month,stateofnature),
                      WV_WP_SURFACE_ACQUWR(projects,sourceriver,riverplace,county,sector,month,stateofnature))

     + sum(domain_for_WV_WP_ASR_FROMSURFACE(projects,sourceriver,riverplace,county,sector,month,stateofnature),
                      WV_WP_ASR_FROMSURFACE(projects,sourceriver,riverplace,county,sector,month,stateofnature))

     + sum(domain_for_WV_WP_OCR_FROMSURFACE(projects,sourceriver,riverplace,county,sector,month,stateofnature),
                      WV_WP_OCR_FROMSURFACE(projects,sourceriver,riverplace,county,sector,month,stateofnature))

  =L=  sum(domain_for_WV_WP_DO_I_OPRT_WATER(Projects),
                      WV_WP_DO_I_OPRT_WATER(Projects))
                      *WaterRightTakeout(projects,sourceriver,riverplace,county,sector) ;

* ^^^^^ 9.12 water diversion limits of new water rights^^^^^^^
WE_WP_NEWWR_LIMIT(domain_for_WE_WP_NEWWR_LIMIT(projects,sourceriver,riverplace,stateofnature))..

       sum(domain_for_WV_WP_SURFACE_NEWWR(projects,sourceriver,riverplace,month,stateofnature),
                      WV_WP_SURFACE_NEWWR(projects,sourceriver,riverplace,month,stateofnature))
     + sum(domain_for_WV_WP_ASR_FROMSURFACE_NEWWR(projects,sourceriver,riverplace,month,stateofnature),
                      WV_WP_ASR_FROMSURFACE_NEWWR(projects,sourceriver,riverplace,month,stateofnature))
     + sum(domain_for_WV_WP_OCR_FROMSURFACE_NEWWR(projects,sourceriver,riverplace,month,stateofnature),
                      WV_WP_OCR_FROMSURFACE_NEWWR(projects,sourceriver,riverplace,month,stateofnature))

  =L=  sum(domain_for_WV_WP_DO_I_OPRT_WATER(Projects),
                      WV_WP_DO_I_OPRT_WATER(Projects))
                    *NewWaterRights(projects,sourceriver,riverplace) ;

*^^^ 9.13 mutual exclusive control *^^^^
WE_WP_Mutual_Exclusive_Bal(domain_for_WE_WP_Mutual_Exclusive_Bal(mutual))..

         sum(mutual_excl(mutual, projects),
                     (sum(domain_for_WV_WP_DO_I_BUILD_WATER(Projects),
                                     WV_WP_DO_I_BUILD_WATER(Projects))
                     + 1$exist_projects (projects))) =L=1 ;

*^^^ 9.14 joint projects *^^^^
WE_WP_JOINT_CONTROL_BAL(domain_for_WE_WP_JOINT_CONTROL_BAL(jointpair,projects))..

    sum(domain_for_WV_WP_DO_I_BUILD_WATER(Projects),
                   WV_WP_DO_I_BUILD_WATER(Projects))
   +   1$exist_projects(projects)

   =E=
     SUM(domain_for_WV_WP_DO_I_JOINTBULTDWP(jointpair),
                    WV_WP_DO_I_JOINTBULTDWP(jointpair)) ;

*ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc*
*^^[10]  Water Reuse ^^
*ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc*
*^^^ 10.1 reuse water supply balance ^^^^

* we allow once reuse within the same location
* reuse takeout <= first return =a(total-reuse)
WE_WP_REUSE_SUPPLYBAL(domain_for_WE_WP_REUSE_SUPPLYBAL(customer,sector,month,stateofnature))..

    + sum(domain_for_WV_WP_REUSE_EFFLUENT(customer,sector,month,stateofnature),
                     WV_WP_REUSE_EFFLUENT(customer,sector,month,stateofnature))
   =L=
       RFpercent_reuse(sector)
     *(sum(domain_for_WV_ADDUPUSERALLWATER(customer,sector,month,stateofnature),
                      WV_ADDUPUSERALLWATER(customer,sector,month,stateofnature))
      -sum(domain_for_WV_WP_USEREUSE(projects,sector,customer,sector1,citycounty,month,stateofnature),
                      WV_WP_USEREUSE(projects,sector,customer,sector1,citycounty,month,stateofnature))
     - sum(domain_for_WV_WP_ASR_FROMREUSE(projects,sector1,citycounty,month,stateofnature),
                      WV_WP_ASR_FROMREUSE(projects,sector1,citycounty,month,stateofnature))
        )
       ;


*^^^^ 10.2 reuse flow
WE_WP_REUSE_BAL(domain_for_WE_WP_REUSE_BAL(citycounty,sector1,month,stateofnature))..

    + sum(domain_for_WV_WP_USEREUSE(projects,sector,customer,sector1,citycounty,month,stateofnature),
                     WV_WP_USEREUSE(projects,sector,customer,sector1,citycounty,month,stateofnature))
    + sum(domain_for_WV_WP_ASR_FROMREUSE(projects,sector1,citycounty,month,stateofnature),
                     WV_WP_ASR_FROMREUSE(projects,sector1,citycounty,month,stateofnature))

   =L=(1-reuse_disposal)
     *sum(domain_for_WV_WP_REUSE_EFFLUENT(citycounty,sector1,month,stateofnature),
                     WV_WP_REUSE_EFFLUENT(citycounty,sector1,month,stateofnature))
     +0.1 ;
*ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc*
*^^[11]  Water Market and Dry year option Part  ^^
*ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc*
*there is upper bound of total enrollment limit
*The enrollment goal is 41,795 acre-feet of irrigation water and both base and unrestricted water qualify.
* ^^^^^^ 11.1  Dry year option total amount limits ^^^^^^^^^^
WE_WM_DYO_TOTALLIMIT$do_i_want_wp..
      sum(domain_for_WV_WM_DYO_ENROLL(county, permittype),
                     WV_WM_DYO_ENROLL(county, permittype)) =L= 41795;

* ^^^^^^ 11.2  Dry year option amount limits by counties ^^^^^^^^^^
WE_WM_DYO_COUNTYLIMIT(domain_for_WE_WM_DYO_COUNTYLIMIT(county,permittype))..
      sum(domain_for_WV_WM_DYO_ENROLL(county, permittype),
                     WV_WM_DYO_ENROLL(county, permittype))
    =L=   edwardspermit1(county, 'ag', permittype)    ;

* ^^^^^^ 11.3  Dry year option suspend limits ^^^^^^^^^^
* dry year option suspended is less than or equal to enrolled
WE_WM_DYO_SUSPENDLIMIT(domain_for_WE_WM_DYO_SUSPENDLIMIT(county, stateofnature))..

      sum(domain_for_WV_WM_DYO_SUSPEND(county,stateofnature) ,
                     WV_WM_DYO_SUSPEND(county,stateofnature))
   =L=sum(domain_for_WV_WM_DYO_ENROLL(county, permittype),
                     WV_WM_DYO_ENROLL(county, permittype)*DYOprob(stateofnature));

* ^^^^^^ 11.4 river trading limits ^^^^^^^^^^
WE_WM_TRADE_RIVERLIMIT(domain_for_WE_WM_TRADE_RIVERLIMIT(river,riverplace,county,conssector, stateofnature))..

         sum(( riverlocation,county1,conssector1),
                 + river_traded(river, riverplace   ,county,  conssector, riverlocation,county1, conssector1)
                 - river_traded(river, riverlocation,county1, conssector1, riverplace  ,county , conssector))

       + sum(domain_for_WV_WM_TRADE_RIVER(river,riverplace,county,conssector,riverlocation,county1, conssector1),
                        WV_WM_TRADE_RIVER(river,riverplace,county,conssector,riverlocation,county1, conssector1))
       + sum(domain_for_WV_WM_LEASE_RIVER(river,riverplace,county,conssector,riverlocation,county1, conssector1,stateofnature),
                        WV_WM_LEASE_RIVER(river,riverplace,county,conssector,riverlocation,county1, conssector1,stateofnature))
    =L= upperdiversionQ(county,conssector,river,riverplace)   ;

* ^^^^^^ 11.5 Edwards trading limits ^^^^^^^^^^
WE_WM_TRADE_EDWARDSLIMIT(domain_for_WE_WM_TRADE_EDWARDSLIMIT(county, gsector, stateofnature))..

      + sum(domain_for_WV_WM_TRADE_AQUIFER('Edwards',county,gsector, county1, gsector1),
                       WV_WM_TRADE_AQUIFER('Edwards',county,gsector, county1, gsector1))
      + sum(domain_for_WV_WM_LEASE_AQUIFER('Edwards',county,gsector, county1, gsector1,stateofnature),
                       WV_WM_LEASE_AQUIFER('Edwards',county,gsector, county1, gsector1,stateofnature))
      + sum(domain_for_WV_WM_DYO_ENROLL(county,'unrest'),
                       WV_WM_DYO_ENROLL(county,'unrest'))

   =L=  edwardspermit1(county, gsector, 'unrest')
       + sum((county1, gsector1),
               + edwards_trade_limit(county, county1)*aquifer_traded('Edwards',county1,gsector1, county, gsector)
               - aquifer_traded('Edwards',county,gsector, county1, gsector1))
;

* ^^^^^^ 11.6 Edwards AG trading limits ^^^^^^^^^^
* EAA Act      SECTION 1.34 TRANSFER OF RIGHTS. (
*(d) Except as otherwise provided by this section, a permit holder may lease permitted
*water rights, but a holder of a permit for irrigation use may not lease more than 50 percent of the
*irrigation rights initially permitted. The user’s remaining irrigation water rights must be used in
*accordance with the original permit and must pass with transfer of the irrigated land.
WE_WM_TRADE_EDWARDS_AGLIMIT(domain_for_WE_WM_TRADE_EDWARDS_AGLIMIT(county, stateofnature))..

        sum(domain_for_WV_WM_TRADE_AQUIFER('Edwards',county,'ag', county1, gsector1),
                       WV_WM_TRADE_AQUIFER('Edwards',county,'ag', county1, gsector1))
      + sum(domain_for_WV_WM_LEASE_AQUIFER('Edwards',county,'ag', county1, gsector1,stateofnature),
                       WV_WM_LEASE_AQUIFER('Edwards',county,'ag', county1, gsector1,stateofnature))

           =L=  edwardspermit1(county, 'ag', 'unrest') /2;

*ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc*
*^^[12]  NEW Conventional /Existing Power Plants Part  ^^
*ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc*

* ^^^^12.1^^^^ power plant operation balance
EE_PP_OPERATE(domain_for_EE_PP_OPERATE(POWER_PLANT_ALL,POWER_PLANT_TYPE, POWER_PLANT_COOLING))..

          sum(domain_for_EV_PP_DO_I_OPER_POWERPLANT(power_plant_all,power_plant_type, power_plant_cooling),
                         EV_PP_DO_I_OPER_POWERPLANT(power_plant_all,power_plant_type, power_plant_cooling))
          =L=
* exist powerplant
         + sum( power_plant_exist(power_plant_all, power_plant_type, power_plant_cooling),      1)
* build new NGCC power plants
         + sum(domain_for_EV_PP_DO_I_BUILD_NEW_NGPP(POWER_PLANT_ALL, POWER_PLANT_TYPE, POWER_PLANT_COOLING),
                          EV_PP_DO_I_BUILD_NEW_NGPP(POWER_PLANT_ALL, POWER_PLANT_TYPE, POWER_PLANT_COOLING)  )
* retrofit the existing power plant cooling system
         + sum(domain_for_EV_PP_DO_I_RETROFIT_COOLING(POWER_PLANT_ALL, POWER_PLANT_TYPE, POWER_PLANT_COOLING0, POWER_PLANT_COOLING),
                          EV_PP_DO_I_RETROFIT_COOLING(power_plant_all, power_plant_type, power_plant_cooling0, power_plant_cooling)  )
         - sum(domain_for_EV_PP_DO_I_RETROFIT_COOLING(POWER_PLANT_ALL, POWER_PLANT_TYPE, POWER_PLANT_COOLING, POWER_PLANT_COOLING_Retrofit),
                          EV_PP_DO_I_RETROFIT_COOLING(power_plant_all, power_plant_type, power_plant_cooling, power_plant_cooling_retrofit))
* retrofit the existing power plant heating system
         + sum(domain_for_EV_PP_DO_I_RETROFIT_BOILER(POWER_PLANT_ALL, POWER_PLANT_TYPE0, POWER_PLANT_TYPE, POWER_PLANT_COOLING),
                          EV_PP_DO_I_RETROFIT_BOILER(power_plant_all, power_plant_type0, power_plant_type, power_plant_cooling))
         - sum(domain_for_EV_PP_DO_I_RETROFIT_BOILER(POWER_PLANT_ALL, POWER_PLANT_TYPE, POWER_PLANT_TYPE_retrofit, POWER_PLANT_COOLING),
                          EV_PP_DO_I_RETROFIT_BOILER(power_plant_all, power_plant_type, power_plant_type_retrofit, power_plant_cooling))
  ;

* ^^^^ 12.2^^^^ power plant could retrofit either broiler or cooling
EE_PP_RETROFIT_LIMIT(domain_for_EE_PP_RETROFIT_LIMIT(POWER_PLANT_ALL))..

         + sum(domain_for_EV_PP_DO_I_RETROFIT_COOLING(POWER_PLANT_ALL, POWER_PLANT_TYPE, POWER_PLANT_COOLING0, POWER_PLANT_COOLING),
                          EV_PP_DO_I_RETROFIT_COOLING(power_plant_all, power_plant_type, power_plant_cooling0, power_plant_cooling)  )
         + sum(domain_for_EV_PP_DO_I_RETROFIT_BOILER(POWER_PLANT_ALL, POWER_PLANT_TYPE0, POWER_PLANT_TYPE, POWER_PLANT_COOLING),
                          EV_PP_DO_I_RETROFIT_BOILER(power_plant_all, power_plant_type0, power_plant_type, power_plant_cooling))
           =L=1;

* ^^^^ 12.3 ^^^^ power plant capacity  balance
EE_PP_CAPACITYBAL(domain_for_EE_PP_CAPACITYBAL(POWER_PLANT_ALL,POWER_PLANT_TYPE, POWER_PLANT_COOLING, MONTH%ADDHOUR%, STATEOFNATURE))..

      sum(domain_for_EV_PP_GENERATION(power_plant_all,power_plant_type, power_plant_cooling, month%addhour%, stateofnature)  ,
                     EV_PP_GENERATION(power_plant_all,power_plant_type, power_plant_cooling, month%addhour%, stateofnature) )
   =L=
      sum(domain_for_ART_EE_PP_CAPACITYBAL(POWER_PLANT_ALL,POWER_PLANT_TYPE, POWER_PLANT_COOLING, MONTH%ADDHOUR%, STATEOFNATURE),
                     ART_EE_PP_CAPACITYBAL(POWER_PLANT_ALL,POWER_PLANT_TYPE, POWER_PLANT_COOLING, MONTH%ADDHOUR%, STATEOFNATURE))
    + sum(domain_for_EV_PP_DO_I_OPER_POWERPLANT(POWER_PLANT_ALL,POWER_PLANT_TYPE, POWER_PLANT_COOLING),
                     EV_PP_DO_I_OPER_POWERPLANT(POWER_PLANT_ALL,POWER_PLANT_TYPE, POWER_PLANT_COOLING)
                    *pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling, 'capacity')
*                    *min(1, pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling, 'capacity_factor')+0.2)
                    *Days(month)
                    *gen_adj(power_plant_type%addhour%)
                    *sum(hour, 1$map_agg_hour(hour%addhour%)))
;

* ^^^^12.4^^^^ power plant generation Upper bound
EE_PP_TOTALGEN_LIMIT(domain_for_EE_PP_TOTALGEN_LIMIT(POWER_PLANT_ALL,POWER_PLANT_TYPE,POWER_PLANT_COOLING, STATEOFNATURE))..

      sum(domain_for_EV_PP_GENERATION(power_plant_all,power_plant_type, power_plant_cooling, month%addhour%, stateofnature)  ,
                     EV_PP_GENERATION(power_plant_all,power_plant_type, power_plant_cooling, month%addhour%, stateofnature) )
  =L=
      sum(domain_for_EV_PP_DO_I_OPER_POWERPLANT(POWER_PLANT_ALL,POWER_PLANT_TYPE,POWER_PLANT_COOLING),
                     EV_PP_DO_I_OPER_POWERPLANT(POWER_PLANT_ALL,POWER_PLANT_TYPE,POWER_PLANT_COOLING)
                    *pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling, 'capacity_factor')
                    *pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling, 'capacity')
                    *365*24  )
;

* ^^^^ 12.5 hydroelectric power plant generation ^^^^
*Power = Head x Flow x Gravity x efficiency
*where power is measured in kWatts, head in metres, flow in m3 per second, and acceleration due to gravity in metres per second per second.
EE_PP_HYDRO_GENEBAL(domain_for_EE_PP_HYDRO_GENEBAL(power_plant_all,month%addhour%, stateofnature))..

     sum(domain_for_EV_PP_GENERATION(power_plant_all,'hydro', 'none', month%addhour%, stateofnature) ,
                    EV_PP_GENERATION(power_plant_all,'hydro', 'none', month%addhour%, stateofnature) )
   =L=
      sum((hydrodiverter(river, riverplace, county, power_plant_all) , domain_for_WV_FLOW(river,riverplace,downriver,month,stateofnature)),
             hydrohead(power_plant_all)*0.3048  *9.8
              *WV_FLOW(river,riverplace,downriver,month,stateofnature)/2131.97 /1000 *Days(month)*0.6 * sum(hour, 1$map_agg_hour( hour%addhour%)))  ;


* ^^^^ 12.6 Limit one new ngcc power plant per time ^^^^

*could only build one new ngcc power plant in one period per county
EE_PP_NEWNGCC_LIMIT(domain_for_EE_PP_NEWNGCC_LIMIT(county,power_plant_cooling))..

         + sum((domain_for_EV_PP_DO_I_BUILD_NEW_NGPP(POWER_PLANT_ALL,'ngcc', POWER_PLANT_COOLING),pp_location(county,POWER_PLANT_ALL) ),
                           EV_PP_DO_I_BUILD_NEW_NGPP(POWER_PLANT_ALL,'ngcc', POWER_PLANT_COOLING)  )
   =L=  2
         + sum(domain_for_ART_EE_PP_NEWNGCC_LIMIT(county,power_plant_cooling),
                          ART_EE_PP_NEWNGCC_LIMIT(county,power_plant_cooling));



* ^^^^ 12.7 power plant capacity requirement ^^^^
* the generation for the peak hour should be greater than the peak demand (MW*31days*1hour)
EE_PP_PEAKCAPCITY_REQ(domain_for_EE_PP_PEAKCAPCITY_REQ(stateofnature))..
        sum(domain_for_EV_PP_DO_I_OPER_POWERPLANT(POWER_PLANT_ALL,POWER_PLANT_TYPE,POWER_PLANT_COOLING),
                       EV_PP_DO_I_OPER_POWERPLANT(POWER_PLANT_ALL,POWER_PLANT_TYPE,POWER_PLANT_COOLING)
                      *pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling, 'capacity')
                      *pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling, 'capacity_factor')
                      *31 )
*new wind and solar is not reliable, we just use the average in the peak
     + sum((domain_for_EV_WS_OPERATION(power_plant_all,ws_type)%addhour%,mapwindsolar(power_plant_all, county,ws_type)),
                       EV_WS_OPERATION(power_plant_all,ws_type)
                        *smin(states, windsolar_generation(power_plant_all, county, ws_type, 'Aug'%addhour%, states) /24  ))
     + sum(domain_for_ART_EE_PP_PEAKCAPCITY_REQ(stateofnature),
                      ART_EE_PP_PEAKCAPCITY_REQ(stateofnature))

   =G=  sum(domain_for_EV_DEMAND_PERCAP('Aug'%addhour%, stateofnature),
                       EV_DEMAND_PERCAP('Aug'%addhour%, stateofnature)
                       *totalpop/elec_climate_adjust('Aug'))
                      *smax(hour, elec_hourly_share(hour, 'aug'))/100 ;


* ^^^^ 12.8 power plant capacity lower bound ^^^^
* narrow the feasible region to speed up
EE_PP_CAPACITYLIMIT(uplow)$do_i_want_pp..
        sign_uplow(uplow) *
     [ sum(domain_for_EV_PP_DO_I_OPER_POWERPLANT(POWER_PLANT_ALL,POWER_PLANT_TYPE,POWER_PLANT_COOLING),
                      EV_PP_DO_I_OPER_POWERPLANT(POWER_PLANT_ALL,POWER_PLANT_TYPE,POWER_PLANT_COOLING)
                      *pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling, 'capacity')
                      *pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling, 'capacity_factor')
                      *31 )
     + sum((domain_for_EV_WS_OPERATION(power_plant_all,ws_type)%addhour%,mapwindsolar(power_plant_all, county,ws_type)),
                       EV_WS_OPERATION(power_plant_all,ws_type)
                        *smin(states, windsolar_generation(power_plant_all, county, ws_type, 'Aug'%addhour%, states) /24  ))]
         =L=
       ART_EE_PP_CAPACITYLIMIT(uplow)$(do_i_want_pp and useart)

       +  sign_uplow(uplow)*(1+sign_uplow(uplow)*pp_bound(uplow)  ) *[
$ifthen.b setglobal hourly
             sum(agg_hour, demanddata_pp('quantity')*monthshare_pp('Aug'%addhour%))
$else.b
             demanddata_pp('quantity')*monthshare_pp('aug')
$endif.b
              *smax(hour, elec_hourly_share(hour, 'aug'))/100]
;

* ^^^^ 12.9 ^^^^ power plant fuel usage
EE_PP_FUEL_BAL(domain_for_EE_PP_FUEL_BAL(fuel, month, stateofnature))..

      sum(domain_for_EV_PP_GENERATION(power_plant_all,power_plant_type, power_plant_cooling, month%addhour%, stateofnature)
                           $sum(link_boiler_fuel(power_plant_type, fuel) , fuel_para (fuel, 'fuelheat' )  )  ,
                     EV_PP_GENERATION(power_plant_all,power_plant_type, power_plant_cooling, month%addhour%, stateofnature)
                    *pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling, 'heatrate')
                    /sum(link_boiler_fuel(power_plant_type, fuel) , fuel_para (fuel, 'fuelheat' )  )  )
    =L=
        sum(domain_for_EV_PP_FUEL(fuel, month, stateofnature),
                       EV_PP_FUEL(fuel, month, stateofnature))
      ;


*ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc*
*^^[13]  Power Plant Water Usage Part  ^^
*ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc*
* ^^^^ 13.1 ^^^^ power plant water division balance
* consumption + inventory(t-1) + evap = inv(t) + diversion
* assume evap rate is 2%
EE_PP_WATER_DIVISIONBAL(domain_for_EE_PP_WATER_DIVISIONBAL(power_plant_all, power_plant_type, power_plant_cooling, month, stateofnature)) ..

      sum(domain_for_EV_PP_GENERATION(power_plant_all,power_plant_type, power_plant_cooling, month%addhour%, stateofnature),
                     EV_PP_GENERATION(power_plant_all,power_plant_type, power_plant_cooling, month%addhour%, stateofnature)
                    /PP_water_consdiv_rate(power_plant_cooling)
                    *pp_waterusage(power_plant_all, power_plant_type, power_plant_cooling) )
*pond storage
    + sum(domain_for_EV_PP_WATER_POND(power_plant_all,power_plant_type, power_plant_cooling, month, stateofnature),
                     EV_PP_WATER_POND(power_plant_all,power_plant_type, power_plant_cooling, month, stateofnature) )

    - sum(domain_for_EV_PP_WATER_POND(power_plant_all,power_plant_type, power_plant_cooling, month-1, stateofnature)$(not sameas(month, 'jan')),
                     EV_PP_WATER_POND(power_plant_all,power_plant_type, power_plant_cooling, month-1, stateofnature))*0.98

    - sum(domain_for_EV_PP_WATER_POND_Ini(power_plant_all,power_plant_type, power_plant_cooling)$sameas(month, 'jan'),
                     EV_PP_WATER_POND_Ini(power_plant_all,power_plant_type, power_plant_cooling))  *0.98

    - sum(domain_for_EV_PP_WATER_DIVERSION(power_plant_all,power_plant_type, power_plant_cooling, month, stateofnature) ,
                     EV_PP_WATER_DIVERSION(power_plant_all,power_plant_type, power_plant_cooling, month, stateofnature) )
   =L=0      ;

* ^^^^13.2^^^^ power plant water pond initial balance
EE_PP_WATER_POND_INITBal(domain_for_EE_PP_WATER_POND_INITBal(power_plant_all, power_plant_type, power_plant_cooling))..

      sum(domain_for_EV_PP_WATER_POND_Ini(power_plant_all,power_plant_type, power_plant_cooling),
                     EV_PP_WATER_POND_Ini(power_plant_all,power_plant_type, power_plant_cooling))
  =L= sum(domain_for_EV_PP_WATER_POND(power_plant_all,power_plant_type, power_plant_cooling,'dec', stateofnature),
                     EV_PP_WATER_POND(power_plant_all,power_plant_type, power_plant_cooling,'dec', stateofnature)
                    *probability(stateofnature))
;
* ^^^^ 13.3 ^^^^ power plant groundwater source division balance

EE_PP_WATER_GROUND_DIVBAL(domain_for_EE_PP_Water_GROUND_DIVBAL(Aquifer,layer, county,  month, stateofnature))..

       sum((domain_for_EV_PP_WATER_DIVERSION(power_plant_all,power_plant_type, power_plant_cooling, month, stateofnature), coolingG(county, aquifer, layer, power_plant_all))  ,
                       EV_PP_WATER_DIVERSION(power_plant_all,power_plant_type, power_plant_cooling, month, stateofnature))
  =L=
       sum(domain_for_WV_PUMP_GROUNDWATER(aquifer,layer,county,'cool',month,stateofnature),
                      WV_PUMP_GROUNDWATER(aquifer,layer,county,'cool',month,stateofnature) )
;

* ^^^^ 13.4 ^^^^ power plant surfacewater source division balance
* cooling diverter could use water from sectors other than cool
EE_PP_WATER_SURFACE_DIVBAL1(domain_for_EE_PP_WATER_SURFACE_DIVBAL1(river,riverplace,county,power_plant_all,power_plant_cooling,month, stateofnature))..

       sum((domain_for_EV_PP_WATER_DIVERSION(power_plant_all,power_plant_type, power_plant_cooling, month, stateofnature),coolingdiverter(river, riverplace, county, power_plant_all, sector)),
                       EV_PP_WATER_DIVERSION(power_plant_all,power_plant_type, power_plant_cooling, month, stateofnature))
   =E=
      sum(domain_for_EV_PP_WATER_SURFACE(river,riverplace,county,power_plant_all,power_plant_cooling,sector,month,stateofnature),
                     EV_PP_WATER_SURFACE(river,riverplace,county,power_plant_all,power_plant_cooling,sector,month,stateofnature));

* ^^^^ 13.5 ^^^^ power plant surfacewater source division balance
* cooling diverter could use water from sectors other than cool
EE_PP_WATER_SURFACE_DIVBAL2(domain_for_EE_PP_WATER_SURFACE_DIVBAL2(river,riverplace,county,sector,month, stateofnature))..

       sum(domain_for_EV_PP_WATER_SURFACE(river,riverplace,county,power_plant_all,power_plant_cooling,sector,month,stateofnature),
                      EV_PP_WATER_SURFACE(river,riverplace,county,power_plant_all,power_plant_cooling,sector,month,stateofnature))
   =L=
       sum(domain_for_EV_SURFACEDIVERSION_COOL(river,riverplace,county,sector,month,stateofnature),
                      EV_SURFACEDIVERSION_COOL(river,riverplace,county,sector,month,stateofnature))

      +sum(domain_for_EV_PP_WP_COOLWATER(projects,river,riverplace,county,sector,month,stateofnature),
                      EV_PP_WP_COOLWATER(projects,river,riverplace,county,sector,month,stateofnature))

     + sum(domain_for_Art_EE_PP_WATER_SURFACE_DIVBAL2(river,riverplace,county,sector,month,stateofnature),
                      Art_EE_PP_WATER_SURFACE_DIVBAL2(river,riverplace,county,sector,month,stateofnature))
 ;

* ^^^^ 13.6 ^^^^ power plant surfacewater source division balance
* cooling diverter could use water from sectors other than cool
EE_PP_WP_WATER_BAL(domain_for_EE_PP_WP_WATER_BAL(projects,county,month,stateofnature))..


      +sum(domain_for_EV_PP_WP_COOLWATER(projects,river,riverplace,county,sector,month,stateofnature),
                      EV_PP_WP_COOLWATER(projects,river,riverplace,county,sector,month,stateofnature))
   =L=
      +sum(domain_for_WV_WP_PROJECTWATER(projects,'cool',county,month,stateofnature),
                      WV_WP_PROJECTWATER(projects,'cool',county,month,stateofnature)) ;



*ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc*
*^^[14]  Renewable Power Plants Part  ^^
*ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc*
* ^^^^ 14.1 ^^^^ Wind Solar operation balance
EE_WS_NEWBUILD_BAL(domain_for_EE_WS_NEWBUILD_BAL(power_plant_all, ws_type))..

        sum(domain_for_EV_WS_OPERATION(power_plant_all,ws_type),
                       EV_WS_OPERATION(power_plant_all,ws_type))
   =L=
        sum(domain_for_EV_WS_NEWBUILD(power_plant_all,ws_type),
                       EV_WS_NEWBUILD(power_plant_all,ws_type))
     +  WindSolar_NEWexist(power_plant_all,ws_type) ;

* ^^^^ 14.2 ^^^ renewable power plant generation upper limit ^^^^
EE_WS_CAPACITY_LIMIT $ (do_i_want_pp=1) ..

* assuming wind+solar<= 0.25 total => wind+solar <=1/3 other
        sum((domain_for_EV_WS_OPERATION(power_plant_all,ws_type),mapwindsolar(power_plant_all, county,ws_type)),
                        EV_WS_OPERATION(power_plant_all,ws_type)
                     * windsolar_all(power_plant_all,county,ws_type,'capacity'))
     +   sum((power_plant_all, power_plant_cooling), pp_potential_all(power_plant_all,'solar', power_plant_cooling, 'capacity'))
     +   sum((power_plant_all, power_plant_cooling), pp_potential_all(power_plant_all,'wind',  power_plant_cooling, 'capacity'))
 =L=  0.1+
     1/3*sum(domain_for_EV_PP_DO_I_OPER_POWERPLANT(POWER_PLANT_ALL,POWER_PLANT_TYPE,POWER_PLANT_COOLING)
                  $((not sameas(power_plant_type, 'solar')) and (not sameas(power_plant_type, 'wind'))),
                        EV_PP_DO_I_OPER_POWERPLANT(POWER_PLANT_ALL,POWER_PLANT_TYPE,POWER_PLANT_COOLING)
                       *pp_potential_all(power_plant_all, power_plant_type, power_plant_cooling, 'capacity'))
     +  ART_EE_WS_CAPACITY_LIMIT$useart
;

* ^^^^ 14.3 land use balance of wind and solar power plant ^^^^

* the land usage of wind and solar
EE_WS_LANDBAL(domain_for_EE_WS_LANDBAL(power_plant_all,county,ws_type))..

       sum((domain_for_EV_WS_NEWBUILD(power_plant_all,ws_type),mapwindsolar(power_plant_all, county,ws_type)),
                       EV_WS_NEWBUILD(power_plant_all,ws_type)
                      *windsolar_all(power_plant_all,county, ws_type, 'landuse') )
   =L=
        sum(domain_for_EV_WS_LAND(power_plant_all,ws_type,county,zones,landirrtype)  ,
                       EV_WS_LAND(power_plant_all,ws_type,county,zones,landirrtype))
       ;


* ^^^^ 14.4 wind and solar power plant land usage limit1^^^^

* county level wind and solar land usage cannot over 10% of
EE_WS_LAND_LIMIT(domain_for_EE_WS_LAND_LIMIT(county,zones,landirrtype))..

        sum(domain_for_EV_WS_LAND(power_plant_all,ws_type,county,zones,landirrtype)  ,
                       EV_WS_LAND(power_plant_all,ws_type,county,zones,landirrtype))
      + sum(mapwindsolar(power_plant_all, county, ws_type),
                  + WindSolar_LANDexist(power_plant_all,ws_type,county, zones, landirrtype) )
  =L=
      0.1*[AvailLand(county,zones,landirrtype)
          + sum(domain_for_AV_LANDTRANS(county, landirrtype2, zones2, landirrtype,  zones) ,
                           AV_LANDTRANS(county, landirrtype2, zones2, landirrtype,  zones))
          - sum(domain_for_AV_LANDTRANS(county, landirrtype,  zones,  landirrtype2, zones2) ,
                           AV_LANDTRANS(county, landirrtype,  zones,  landirrtype2, zones2))
          + sum(mapwindsolar(power_plant_all, county, ws_type),
                    WindSolar_LANDexist(power_plant_all,ws_type,county, zones, landirrtype) )  ]  ;

*ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc*
*^^[15]  Energy Supply Demand Part  ^^
*ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc*
* ^^^^ 15.1^^^^ electricity demand balance
EE_DEMAND_QUANTITYBAL(domain_for_EE_DEMAND_QUANTITYBAL(month%addhour%,stateofnature))..

       sum(domain_for_EV_DEMAND_STEPS(steps),
                      EV_DEMAND_STEPS(steps)
                     *qinc(steps)*demanddata_pp('quantity')*monthshare_pp(month%addhour%))

   =L= sum(domain_for_EV_DEMAND_PERCAP(month%addhour%, stateofnature),
                      EV_DEMAND_PERCAP(month%addhour%, stateofnature)
                     *totalpop/elec_climate_adjust(month)) ;

* ^^^^ 15.2 ^^^^ electricity diversion convexity
EE_DEMAND_CONVEXITY$do_I_want_pp..

       sum(domain_for_EV_DEMAND_STEPS(steps),
                      EV_DEMAND_STEPS(steps))=L=1;


* ^^^^ 15.3 ^^^^ electricity supply demand balance
EE_DEMAND_COUNTYBAL(domain_for_EE_DEMAND_COUNTYBAL(county, month%addhour%, stateofnature))..

       sum(domain_for_EV_DEMAND_PERCAP(month%addhour%, stateofnature),
                      EV_DEMAND_PERCAP(month%addhour%, stateofnature))
                      *population(county)/elec_climate_adjust(month)

      +sum(domain_for_EV_DEMAND_WP(county, month, stateofnature),
                      EV_DEMAND_WP(county, month, stateofnature))
                      *sum(hour, 1$map_agg_hour(hour%addhour%)) /24
     =L=  0.1
      + sum(domain_for_ART_EE_DEMAND_COUNTYBAL(county, month%addhour%, stateofnature),
                       ART_EE_DEMAND_COUNTYBAL(county, month%addhour%, stateofnature))

      + sum(domain_for_EV_DEMAND_TRANS(county1,county,month%addhour%, stateofnature),
                       EV_DEMAND_TRANS(county1,county,month%addhour%, stateofnature)
                      *[1-transloss(county1,county)])
;

* ^^^^ 15.4 ^^^^  county level electricity transmission supply balance

EE_DEMAND_TRANSBAL(domain_for_EE_DEMAND_TRANSBAL(county,month%addhour%,stateofnature))..

      + sum(domain_for_EV_DEMAND_TRANS(county,county1,month%addhour%, stateofnature),
                       EV_DEMAND_TRANS(county,county1,month%addhour%, stateofnature))

    =L= sum(domain_for_ART_EE_DEMAND_TRANSBAL(county,month%addhour%, stateofnature),
                       ART_EE_DEMAND_TRANSBAL(county,month%addhour%, stateofnature))

      + sum((domain_for_EV_PP_GENERATION(power_plant_all,power_plant_type, power_plant_cooling, month%addhour%, stateofnature),pp_location(county,power_plant_all))  ,
                        EV_PP_GENERATION(power_plant_all,power_plant_type, power_plant_cooling, month%addhour%, stateofnature) )

      + sum((domain_for_EV_WS_OPERATION(power_plant_all,ws_type),mapwindsolar(power_plant_all, county,ws_type)),
                        EV_WS_OPERATION(power_plant_all,ws_type)
                        *windsolar_generation(power_plant_all, county, ws_type, month%addhour%, stateofnature))
      +0.1
 ;

* ^^^^ 15.5 ^^^^ water projects electricity supply demand balance
EE_DEMAND_WPBAL(domain_for_EE_DEMAND_WPBAL(county, month, stateofnature))..

     sum(domain_for_EV_DEMAND_WP(county, month, stateofnature),
                    EV_DEMAND_WP(county, month, stateofnature))
     =G=
    sum(mapcitycountytocounty(customer, county),
     + sum(domain_for_WV_WP_USEGROUND(Projects,sector,customer,sourcecounty,aquifer,layer,month,stateofnature),
                      WV_WP_USEGROUND(Projects,sector,customer,sourcecounty,aquifer,layer,month,stateofnature)* investmentcost(projects, 'energyperunit'))
     + sum(domain_for_WV_WP_USEASR(projects,sector,customer,month,stateofnature),
                      WV_WP_USEASR(projects,sector,customer,month,stateofnature)* investmentcost(projects, 'energyperunit'))
     + sum(domain_for_WV_WP_USESURFACE(projects,sector,customer,sourceriver,riverplace,month,stateofnature),
                      WV_WP_USESURFACE(projects,sector,customer,sourceriver,riverplace,month,stateofnature)* investmentcost(projects, 'energyperunit'))
     + sum(domain_for_WV_WP_USEOCR(projects,sector,customer,OCR,month,stateofnature),
                      WV_WP_USEOCR(projects,sector,customer,OCR,month,stateofnature)* investmentcost(projects, 'energyperunit'))
     + sum(domain_for_WV_WP_USEOUTSIDE(projects,sector,customer,month,stateofnature),
                      WV_WP_USEOUTSIDE(projects,sector,customer,month,stateofnature)* investmentcost(projects, 'energyperunit'))
     + sum(domain_for_WV_WP_USESEAWATER(projects,sector,customer,month,stateofnature),
                      WV_WP_USESEAWATER(projects,sector,customer,month,stateofnature)* investmentcost(projects, 'energyperunit'))
     + sum(domain_for_WV_WP_USEREUSE(projects,sector,customer,sector1,citycounty,month,stateofnature),
                      WV_WP_USEREUSE(projects,sector,customer,sector1,citycounty,month,stateofnature)* investmentcost(projects, 'energyperunit'))
         )/1000;
model INFEWS /all/;

model INFEWS_base /all/;

