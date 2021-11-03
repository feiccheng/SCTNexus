$ifthen not declared haysupply
Parameter Haysupply(county, states)  extra hay supply per AU year varying by state of nature and it could be substituded by grazing
           ;

$endif

*An AUM is equal to 750 lb of forage (25 lb/day x 30 days/month)
*1 AUM year is 750*12/2000 ton of hay

Haysupply(county, state)
    $crop_strat(county, 'hay', 'Dryland', 'Normal', 'noirrig', 'grazing')
     = max(0, 1- crop_strat(county, 'hay', 'Dryland', state, 'noirrig', 'grazing')
                 /crop_strat(county, 'hay', 'Dryland', 'Normal', 'noirrig', 'grazing') )
       *750*12/2000;

Haysupply(county, state)
      $((sum(states,Haysupply(county, states))=0)
         and crop_strat(county, 'pasture', 'Dryland', 'Normal', 'noirrig', 'grazing'))
     = max(0, 1- crop_strat(county, 'pasture', 'Dryland', state, 'noirrig', 'grazing')
                 /crop_strat(county, 'pasture', 'Dryland', 'Normal', 'noirrig', 'grazing') )
       *750*12/2000;

Haysupply('GILLESPIE', state)  =Haysupply('kerr', state)  ;


$ifthen not declared missedhay
set missedhay(county)        the counties that doesn't have the pasture yield change measure;
display Haysupply ;
missedhay(county)=yes;
missedhay(county)$sum(states,Haysupply(county, states))=no;

display missedhay;
$endif
