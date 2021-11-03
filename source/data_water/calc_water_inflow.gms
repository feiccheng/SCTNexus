      inflow1(river,riverlocation,month,states)
               $(sum(riverflowlink(river,upriver,riverlocation),1)=0)
          = inflow(river,riverlocation,month, states) ;

      inflow1(river,riverlocation,month,states)
               $(sum(riverflowlink(river,upriver,riverlocation),1))
          =max(0, inflow(river,riverlocation,month, states)
                   - sum(riverflowlink(river,upriver,riverlocation),
                          inflow(river,upriver,month, states) ));

* set the outtobay flow to 0
          inflow1(river,out,month,states)=0;

*San Macros Spring and Comal Spring are endogenous, so set to 0;
          inflow1(river,springs,month,states)=0;
