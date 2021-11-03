$ifthen not declared c_ET0
PARAMETER
    temp_ET0(county, month, states)                                                                  Blaney criddle reference evaporation rate
    temp_ROOTWATER(county,MONTH,states)                                                              CROP ROOTZONE WATER AVAILABILITY
    temp_WaterNeeds(crops, county, month, stage, states)                                             total water needed by crops
    temp_IrrigNeeds(Crops, county, month, stage, states)                                             net irrigation water needs by crops
    c_crop_strat_bc(county, crops, landirrtype, states, BCstrategy, alli, scenarios, decades_sim) crop yield and waetr usage changes using BC method     ;
set link_scenario_decades(scenarios, decades_sim)                                                 link the scenarios and decades which have the climate data ;
parameter temp_cropwateruse(county, crops,BCstrategy, timing, states)                              temperary water usage  for climate change
          temp_crop_strat_bc(county, crops, landirrtype, states, BCstrategy, alli)                temp crop_strat_bc for cliamte change
          temp_climateS(county,month, states,climate)                                             temp climate variables  ;
$endif

   link_scenario_decades(scenarios, decades_sim)
      $sum((county,month, state),climateS_scenario(county,month, state,scenarios, decades_sim,'tmean'))=yes;


loop(link_scenario_decades(scenarios, decades_sim),
     temp_climateS(county,month, states,climate)                                 =0;
     temp_ET0(county, month, states)                                             =0;
     temp_ROOTWATER(county,MONTH,states)                                         =0;
     temp_WaterNeeds(crops, county, month, stage, states)                        =0;
     temp_IrrigNeeds(Crops, county, month, stage, states)                        =0;
     temp_cropwateruse(county, crops,BCstrategy, month, states)                  =0;
     temp_crop_strat_bc(county, crops, landirrtype, states, BCstrategy, alli)    =0;

    temp_climateS(county,month, state,climate)= climateS_scenario(county,month, state,scenarios, decades_sim,climate);

    temp_ET0(county, month,state)
          =m_ET0( temp_climateS(county,month, state,'tmean'));

    temp_WaterNeeds(crops, county, month,stage, state)
         =m_WaterNeeds(temp_ET0(county, month, state));

    temp_ROOTWATER(county,MONTH,state)
         = m_RootWater(temp_climateS(county,month, state, 'ppt'))   ;

    temp_IrrigNeeds(Crops, county, month, stage, state)
          = m_IrrigNeeds(temp_WaterNeeds(crops, county, month,stage, state), temp_RootWater(county,MONTH,state)) ;


* water usage after adjusting efficiency and deficit irrigation strategies
    temp_cropwateruse(county, crops, BCstrategy, month, state)
           $( cropresponse (crops) and waterEfficiency(BCstrategy))
           = m_WaterUse(temp_WaterNeeds(crops, county, month,stage, state),temp_ROOTWATER(county,MONTH,state),BCstrategy );

* crop yields varying by strategies
    temp_crop_strat_bc(county, crops, landirrtype, state, BCstrategy, primary)
          $(cropbud(county, crops, 'irrigated',  primary) and cropresponse (crops))
         = m_BC_cropyield_irrigbud(county,crops,landirrtype, state, BCstrategy,primary  )   ;


    temp_crop_strat_bc(county, crops, landirrtype,  state, BCstrategy, watr)
               $( sum( primary, cropbud(county, crops, 'irrigated', primary))
              and cropresponse (crops))
            =sum((mapwater(timing,watr),strat_irr(BCstrategy, landirrtype) ),
                   temp_cropwateruse(county, crops, BCstrategy , timing, state));

    temp_crop_strat_bc(county, crops, landirrtype,  state, BCstrategy, "WaterUse_AF")
               $ sum( primary, cropbud(county, crops, 'irrigated',  primary))
           =  sum( watr, temp_crop_strat_bc(county, crops, landirrtype,  state, BCstrategy, watr) );

    temp_crop_strat_bc(county, crops, landirrtype,  state, BCstrategy, alli)
            $( cropbudgetnew(county, crops, landirrtype, 'cropland')=0)=0;

* make the crops only have dryland options

    temp_crop_strat_bc(county, crops, 'dryland', state, 'noirrig', primary)
          $(cropbud(county, crops, 'dryland',  primary) and cropresponse (crops)
            and ( cropbud(county, crops, 'irrigated',  primary)=0)   )
         =m_BC_cropyield_drybud(temp_ROOTWATER, temp_WaterNeeds,'normal')    ;

    c_crop_strat_bc(county, crops, landirrtype, state, BCstrategy, alli, scenarios, decades_sim)
                 $temp_crop_strat_bc(county, crops, landirrtype,state, BCstrategy, alli)
         = temp_crop_strat_bc(county, crops, landirrtype,  state, BCstrategy, alli);

);
