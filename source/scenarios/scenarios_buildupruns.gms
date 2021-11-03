set altrunsall /
base_2020
base_2030
base_2050
base_2070
base_2090

bcc-csm1-1_rcp26_2030
bcc-csm1-1_rcp26_2050
bcc-csm1-1_rcp26_2070
bcc-csm1-1_rcp26_2090
miroc5_rcp26_2030
miroc5_rcp26_2050
miroc5_rcp26_2070
miroc5_rcp26_2090
gfdl-esm2m_rcp26_2030
gfdl-esm2m_rcp26_2050
gfdl-esm2m_rcp26_2070
gfdl-esm2m_rcp26_2090
mri-cgcm3_rcp26_2030
mri-cgcm3_rcp26_2050
mri-cgcm3_rcp26_2070
mri-cgcm3_rcp26_2090
ipsl-cm5a-lr_rcp26_2030
ipsl-cm5a-lr_rcp26_2050
ipsl-cm5a-lr_rcp26_2070
ipsl-cm5a-lr_rcp26_2090
noresm1-m_rcp26_2030
noresm1-m_rcp26_2050
noresm1-m_rcp26_2070
noresm1-m_rcp26_2090

bcc-csm1-1_rcp45_2030
bcc-csm1-1_rcp45_2050
bcc-csm1-1_rcp45_2070
bcc-csm1-1_rcp45_2090
miroc5_rcp45_2030
miroc5_rcp45_2050
miroc5_rcp45_2070
miroc5_rcp45_2090
gfdl-esm2m_rcp45_2030
gfdl-esm2m_rcp45_2050
gfdl-esm2m_rcp45_2070
gfdl-esm2m_rcp45_2090
mri-cgcm3_rcp45_2030
mri-cgcm3_rcp45_2050
mri-cgcm3_rcp45_2070
mri-cgcm3_rcp45_2090
ipsl-cm5a-lr_rcp45_2030
ipsl-cm5a-lr_rcp45_2050
ipsl-cm5a-lr_rcp45_2070
ipsl-cm5a-lr_rcp45_2090
noresm1-m_rcp45_2030
noresm1-m_rcp45_2050
noresm1-m_rcp45_2070
noresm1-m_rcp45_2090

bcc-csm1-1_rcp60_2030
bcc-csm1-1_rcp60_2050
bcc-csm1-1_rcp60_2070
bcc-csm1-1_rcp60_2090
miroc5_rcp60_2030
miroc5_rcp60_2050
miroc5_rcp60_2070
miroc5_rcp60_2090
gfdl-esm2m_rcp60_2030
gfdl-esm2m_rcp60_2050
gfdl-esm2m_rcp60_2070
gfdl-esm2m_rcp60_2090
ipsl-cm5a-lr_rcp60_2030
ipsl-cm5a-lr_rcp60_2050
ipsl-cm5a-lr_rcp60_2070
ipsl-cm5a-lr_rcp60_2090
noresm1-m_rcp60_2030
noresm1-m_rcp60_2050
noresm1-m_rcp60_2070
noresm1-m_rcp60_2090

bcc-csm1-1_rcp85_2030
bcc-csm1-1_rcp85_2050
bcc-csm1-1_rcp85_2070
bcc-csm1-1_rcp85_2090
miroc5_rcp85_2030
miroc5_rcp85_2050
miroc5_rcp85_2070
miroc5_rcp85_2090
gfdl-esm2m_rcp85_2030
gfdl-esm2m_rcp85_2050
gfdl-esm2m_rcp85_2070
gfdl-esm2m_rcp85_2090
mri-cgcm3_rcp85_2030
mri-cgcm3_rcp85_2050
mri-cgcm3_rcp85_2070
mri-cgcm3_rcp85_2090
ipsl-cm5a-lr_rcp85_2030
ipsl-cm5a-lr_rcp85_2050
ipsl-cm5a-lr_rcp85_2070
ipsl-cm5a-lr_rcp85_2090
noresm1-m_rcp85_2030
noresm1-m_rcp85_2050
noresm1-m_rcp85_2070
noresm1-m_rcp85_2090
/;


set linkaltruns(altrunsall,scenarios,decades)
/
base_2020                    .base                     .2020
base_2030                    .base                     .2030
base_2050                    .base                     .2050
base_2070                    .base                     .2070
base_2090                    .base                     .2090

bcc-csm1-1_rcp26_2030        .bcc-csm1-1_rcp26         .2030
bcc-csm1-1_rcp26_2050        .bcc-csm1-1_rcp26         .2050
bcc-csm1-1_rcp26_2070        .bcc-csm1-1_rcp26         .2070
bcc-csm1-1_rcp26_2090        .bcc-csm1-1_rcp26         .2090
miroc5_rcp26_2030            .miroc5_rcp26             .2030
miroc5_rcp26_2050            .miroc5_rcp26             .2050
miroc5_rcp26_2070            .miroc5_rcp26             .2070
miroc5_rcp26_2090            .miroc5_rcp26             .2090
gfdl-esm2m_rcp26_2030        .gfdl-esm2m_rcp26         .2030
gfdl-esm2m_rcp26_2050        .gfdl-esm2m_rcp26         .2050
gfdl-esm2m_rcp26_2070        .gfdl-esm2m_rcp26         .2070
gfdl-esm2m_rcp26_2090        .gfdl-esm2m_rcp26         .2090
mri-cgcm3_rcp26_2030         .mri-cgcm3_rcp26          .2030
mri-cgcm3_rcp26_2050         .mri-cgcm3_rcp26          .2050
mri-cgcm3_rcp26_2070         .mri-cgcm3_rcp26          .2070
mri-cgcm3_rcp26_2090         .mri-cgcm3_rcp26          .2090
ipsl-cm5a-lr_rcp26_2030      .ipsl-cm5a-lr_rcp26       .2030
ipsl-cm5a-lr_rcp26_2050      .ipsl-cm5a-lr_rcp26       .2050
ipsl-cm5a-lr_rcp26_2070      .ipsl-cm5a-lr_rcp26       .2070
ipsl-cm5a-lr_rcp26_2090      .ipsl-cm5a-lr_rcp26       .2090
noresm1-m_rcp26_2030         .noresm1-m_rcp26          .2030
noresm1-m_rcp26_2050         .noresm1-m_rcp26          .2050
noresm1-m_rcp26_2070         .noresm1-m_rcp26          .2070
noresm1-m_rcp26_2090         .noresm1-m_rcp26          .2090

bcc-csm1-1_rcp45_2030        .bcc-csm1-1_rcp45         .2030
bcc-csm1-1_rcp45_2050        .bcc-csm1-1_rcp45         .2050
bcc-csm1-1_rcp45_2070        .bcc-csm1-1_rcp45         .2070
bcc-csm1-1_rcp45_2090        .bcc-csm1-1_rcp45         .2090
miroc5_rcp45_2030            .miroc5_rcp45             .2030
miroc5_rcp45_2050            .miroc5_rcp45             .2050
miroc5_rcp45_2070            .miroc5_rcp45             .2070
miroc5_rcp45_2090            .miroc5_rcp45             .2090
gfdl-esm2m_rcp45_2030        .gfdl-esm2m_rcp45         .2030
gfdl-esm2m_rcp45_2050        .gfdl-esm2m_rcp45         .2050
gfdl-esm2m_rcp45_2070        .gfdl-esm2m_rcp45         .2070
gfdl-esm2m_rcp45_2090        .gfdl-esm2m_rcp45         .2090
mri-cgcm3_rcp45_2030         .mri-cgcm3_rcp45          .2030
mri-cgcm3_rcp45_2050         .mri-cgcm3_rcp45          .2050
mri-cgcm3_rcp45_2070         .mri-cgcm3_rcp45          .2070
mri-cgcm3_rcp45_2090         .mri-cgcm3_rcp45          .2090
ipsl-cm5a-lr_rcp45_2030      .ipsl-cm5a-lr_rcp45       .2030
ipsl-cm5a-lr_rcp45_2050      .ipsl-cm5a-lr_rcp45       .2050
ipsl-cm5a-lr_rcp45_2070      .ipsl-cm5a-lr_rcp45       .2070
ipsl-cm5a-lr_rcp45_2090      .ipsl-cm5a-lr_rcp45       .2090
noresm1-m_rcp45_2030         .noresm1-m_rcp45          .2030
noresm1-m_rcp45_2050         .noresm1-m_rcp45          .2050
noresm1-m_rcp45_2070         .noresm1-m_rcp45          .2070
noresm1-m_rcp45_2090         .noresm1-m_rcp45          .2090

bcc-csm1-1_rcp60_2030        .bcc-csm1-1_rcp60         .2030
bcc-csm1-1_rcp60_2050        .bcc-csm1-1_rcp60         .2050
bcc-csm1-1_rcp60_2070        .bcc-csm1-1_rcp60         .2070
bcc-csm1-1_rcp60_2090        .bcc-csm1-1_rcp60         .2090
miroc5_rcp60_2030            .miroc5_rcp60             .2030
miroc5_rcp60_2050            .miroc5_rcp60             .2050
miroc5_rcp60_2070            .miroc5_rcp60             .2070
miroc5_rcp60_2090            .miroc5_rcp60             .2090
gfdl-esm2m_rcp60_2030        .gfdl-esm2m_rcp60         .2030
gfdl-esm2m_rcp60_2050        .gfdl-esm2m_rcp60         .2050
gfdl-esm2m_rcp60_2070        .gfdl-esm2m_rcp60         .2070
gfdl-esm2m_rcp60_2090        .gfdl-esm2m_rcp60         .2090
ipsl-cm5a-lr_rcp60_2030      .ipsl-cm5a-lr_rcp60       .2030
ipsl-cm5a-lr_rcp60_2050      .ipsl-cm5a-lr_rcp60       .2050
ipsl-cm5a-lr_rcp60_2070      .ipsl-cm5a-lr_rcp60       .2070
ipsl-cm5a-lr_rcp60_2090      .ipsl-cm5a-lr_rcp60       .2090
noresm1-m_rcp60_2030         .noresm1-m_rcp60          .2030
noresm1-m_rcp60_2050         .noresm1-m_rcp60          .2050
noresm1-m_rcp60_2070         .noresm1-m_rcp60          .2070
noresm1-m_rcp60_2090         .noresm1-m_rcp60          .2090

bcc-csm1-1_rcp85_2030        .bcc-csm1-1_rcp85         .2030
bcc-csm1-1_rcp85_2050        .bcc-csm1-1_rcp85         .2050
bcc-csm1-1_rcp85_2070        .bcc-csm1-1_rcp85         .2070
bcc-csm1-1_rcp85_2090        .bcc-csm1-1_rcp85         .2090
miroc5_rcp85_2030            .miroc5_rcp85             .2030
miroc5_rcp85_2050            .miroc5_rcp85             .2050
miroc5_rcp85_2070            .miroc5_rcp85             .2070
miroc5_rcp85_2090            .miroc5_rcp85             .2090
gfdl-esm2m_rcp85_2030        .gfdl-esm2m_rcp85         .2030
gfdl-esm2m_rcp85_2050        .gfdl-esm2m_rcp85         .2050
gfdl-esm2m_rcp85_2070        .gfdl-esm2m_rcp85         .2070
gfdl-esm2m_rcp85_2090        .gfdl-esm2m_rcp85         .2090
mri-cgcm3_rcp85_2030         .mri-cgcm3_rcp85          .2030
mri-cgcm3_rcp85_2050         .mri-cgcm3_rcp85          .2050
mri-cgcm3_rcp85_2070         .mri-cgcm3_rcp85          .2070
mri-cgcm3_rcp85_2090         .mri-cgcm3_rcp85          .2090
ipsl-cm5a-lr_rcp85_2030      .ipsl-cm5a-lr_rcp85       .2030
ipsl-cm5a-lr_rcp85_2050      .ipsl-cm5a-lr_rcp85       .2050
ipsl-cm5a-lr_rcp85_2070      .ipsl-cm5a-lr_rcp85       .2070
ipsl-cm5a-lr_rcp85_2090      .ipsl-cm5a-lr_rcp85       .2090
noresm1-m_rcp85_2030         .noresm1-m_rcp85          .2030
noresm1-m_rcp85_2050         .noresm1-m_rcp85          .2050
noresm1-m_rcp85_2070         .noresm1-m_rcp85          .2070
noresm1-m_rcp85_2090         .noresm1-m_rcp85          .2090

/;
set link_decades(decades, decades)
/ 2015.2030
  2030.2050
  2050.2070
  2070.2090/;
alias (decades, odecades), (altrunsall, oaltrunsall), (linkaltruns, olinkaltruns);

set link_lastperiod(altrunsall, altrunsall)          link the altrunsall with the last period;



singleton set   scenariohere(scenarios)             the scenario for here
                decadehere(decades)                 the decade here
                altrunhere(altrunsall)              the altruns here
                altrunlast(altrunsall)              the previous scenario  ;


loop(linkaltruns(altrunsall,scenarios,decades)$(not sameas(altrunsall, 'base_2020')),
          scenariohere(scenarios) =yes;
          decadehere(decades)     =yes;
          if((not sameas(decadehere, '2030')),
          link_lastperiod(altrunsall, oaltrunsall)
                 $sum(link_decades(odecades,decadehere),linkaltruns(oaltrunsall,scenariohere,odecades))=yes;  );

          if(sameas(decadehere, '2030'),
          link_lastperiod(altrunsall, 'base_2020')= yes;);
);

option link_lastperiod:0:0:2;
display   link_lastperiod;


