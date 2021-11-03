set gcms /'bcc-csm1-1','gfdl-esm2m','ipsl-cm5a-lr','miroc5', 'mri-cgcm3','noresm1-m', none/
    rcps /rcp26, rcp45, rcp60, rcp85, none, historical/
    scenarios
 /   base
bcc-csm1-1_rcp26       ,        bcc-csm1-1_rcp45        ,        bcc-csm1-1_rcp60        ,        bcc-csm1-1_rcp85
miroc5_rcp26           ,        miroc5_rcp45            ,        miroc5_rcp60            ,        miroc5_rcp85
gfdl-esm2m_rcp26       ,        gfdl-esm2m_rcp45        ,        gfdl-esm2m_rcp60        ,        gfdl-esm2m_rcp85
mri-cgcm3_rcp26        ,        mri-cgcm3_rcp45         ,                                         mri-cgcm3_rcp85
ipsl-cm5a-lr_rcp26     ,        ipsl-cm5a-lr_rcp45      ,        ipsl-cm5a-lr_rcp60      ,        ipsl-cm5a-lr_rcp85
noresm1-m_rcp26        ,        noresm1-m_rcp45         ,        noresm1-m_rcp60         ,        noresm1-m_rcp85

               /   ;


Set climate_scenarios(gcms, rcps,  scenarios)  map scenarios
/
none            . none    .base
bcc-csm1-1      . rcp26   .bcc-csm1-1_rcp26
bcc-csm1-1      . rcp45   .bcc-csm1-1_rcp45
bcc-csm1-1      . rcp60   .bcc-csm1-1_rcp60
bcc-csm1-1      . rcp85   .bcc-csm1-1_rcp85
gfdl-esm2m      . rcp26   .gfdl-esm2m_rcp26
gfdl-esm2m      . rcp45   .gfdl-esm2m_rcp45
gfdl-esm2m      . rcp60   .gfdl-esm2m_rcp60
gfdl-esm2m      . rcp85   .gfdl-esm2m_rcp85
ipsl-cm5a-lr    . rcp26   .ipsl-cm5a-lr_rcp26
ipsl-cm5a-lr    . rcp45   .ipsl-cm5a-lr_rcp45
ipsl-cm5a-lr    . rcp60   .ipsl-cm5a-lr_rcp60
ipsl-cm5a-lr    . rcp85   .ipsl-cm5a-lr_rcp85
miroc5          . rcp26   .miroc5_rcp26
miroc5          . rcp45   .miroc5_rcp45
miroc5          . rcp60   .miroc5_rcp60
miroc5          . rcp85   .miroc5_rcp85
mri-cgcm3       . rcp26   .mri-cgcm3_rcp26
mri-cgcm3       . rcp45   .mri-cgcm3_rcp45
mri-cgcm3       . rcp85   .mri-cgcm3_rcp85
noresm1-m       . rcp26   .noresm1-m_rcp26
noresm1-m       . rcp45   .noresm1-m_rcp45
noresm1-m       . rcp60   .noresm1-m_rcp60
noresm1-m       . rcp85   .noresm1-m_rcp85
/;
