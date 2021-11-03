*Data are updated on 11/30/2017
*Data source: WRAP (Guadalupe-SanAntonio river basin, SanAntonio-Nueces Riverbasin, and Nueces Riverbasin)

set       riverlocation(diverters)            Primary control points on each river
/
CP21_GuadSA    ,      215332_GuadSA  ,      382301_GuadSA  ,      539101_GuadSA  ,      CP01_GuadSA    ,      CP02_GuadSA    ,      CP03_GuadSA
CP04_GuadSA    ,      CP05_GuadSA    ,      CP06_GuadSA    ,      CP08_GuadSA    ,      CP09_GuadSA    ,      CP10_GuadSA    ,      CP11_GuadSA
CP12_GuadSA    ,      CP13_GuadSA    ,      CP14_GuadSA    ,      CP15_GuadSA    ,      CP16_GuadSA    ,      CP17_GuadSA    ,      CP18_GuadSA
CP19_GuadSA    ,      CP20_GuadSA    ,      CP22_GuadSA    ,      CP23_GuadSA    ,      CP241_GuadSA   ,      CP242_GuadSA   ,      CP25_GuadSA
CP261_GuadSA   ,      CP262_GuadSA   ,      CP263_GuadSA   ,      CP27_GuadSA    ,      CP28_GuadSA    ,      CP29_GuadSA    ,      CP30_GuadSA
CP31_GuadSA    ,      CP32_GuadSA    ,      CP33_GuadSA    ,      CP34_GuadSA    ,      CP35_GuadSA    ,      CP36_GuadSA    ,      CP37_GuadSA
CP38_GuadSA    ,      CP71_GuadSA    ,      CP72_GuadSA    ,      CP73_GuadSA    ,      CP74_GuadSA    ,      CP75_GuadSA    ,      CPEST_GuadSA
OUT_GuadSA     ,      CP01_NUECES    ,      CP02_NUECES    ,      CP03_NUECES    ,      CP04_NUECES    ,      CP05_NUECES    ,      CP06_NUECES
CP07_NUECES    ,      CP08_NUECES    ,      CP09_NUECES    ,      CP10_NUECES    ,      CP111_NUECES   ,      CP112_NUECES
CP12_NUECES    ,      CP13_NUECES    ,      CP141_NUECES   ,      CP142_NUECES   ,      CP15_NUECES    ,      CP16_NUECES
CP17_NUECES    ,      CP18_NUECES    ,      CP19_NUECES    ,      CP201_NUECES   ,      CP202_NUECES   ,      CP21_NUECES
CP22_NUECES    ,      CP231_NUECES   ,      CP232_NUECES   ,      CP24_NUECES    ,      CP25_NUECES    ,      CP26_NUECES
CP27_NUECES    ,      CP28_NUECES    ,      CP29_NUECES    ,      CP30_NUECES    ,      CP31_NUECES    ,      CPBAY_NUECES   ,      CPEST_NUECES
OUT_NUECES     ,      A10000_Minor   ,      C10000_Minor   ,      B10000_Minor   ,      E10000_Minor   ,      D10000_Minor   ,      10000_Minor
OUT_Minor
*CP3lakes_Nueces

* CP20_NUECES    , CP11_NUECES    , CP14_NUECES    , CP23_NUECES    ,
 /;

*/CP27_NUECES,CP29_NUECES, CP30_NUECES, CP31_NUECES , CPBAY_NUECES, CPEST_NUECES /

set    riverflowlink(river,riverlocation,riverlocation) river flowlinks between primary locations in each riverbasin
/
GuadSA    .(  CP21_GuadSA    .CP23_GuadSA    ,      215332_GuadSA  .CP18_GuadSA
*,      382301_GuadSA  .CP05_GuadSA
              539101_GuadSA  .CP29_GuadSA    ,      CP01_GuadSA    .CP02_GuadSA    ,      CP02_GuadSA     .CP03_GuadSA
              CP03_GuadSA    .CP04_GuadSA    ,      CP04_GuadSA    .CP06_GuadSA    ,      CP05_GuadSA    .CP06_GuadSA
              CP06_GuadSA    .CP14_GuadSA    ,      CP08_GuadSA    .CP09_GuadSA    ,      CP09_GuadSA    .CP10_GuadSA
              CP10_GuadSA    .CP14_GuadSA    ,      CP11_GuadSA    .CP14_GuadSA    ,      CP12_GuadSA    .CP14_GuadSA
              CP13_GuadSA    .CP14_GuadSA    ,      CP14_GuadSA    .CP15_GuadSA    ,      CP15_GuadSA    .CP38_GuadSA
              CP16_GuadSA    .CP38_GuadSA    ,      CP17_GuadSA    .215332_GuadSA  ,      CP18_GuadSA    .539101_GuadSA
              CP19_GuadSA    .CP20_GuadSA    ,      CP20_GuadSA    .CP29_GuadSA    ,      CP22_GuadSA    .CP23_GuadSA
              CP23_GuadSA    .CP27_GuadSA    ,      CP241_GuadSA   .CP27_GuadSA    ,      CP242_GuadSA   .CP27_GuadSA
              CP25_GuadSA    .CP27_GuadSA    ,      CP261_GuadSA   .CP28_GuadSA    ,      CP262_GuadSA   .CP28_GuadSA
              CP263_GuadSA   .CP28_GuadSA    ,      CP27_GuadSA    .CP28_GuadSA    ,      CP28_GuadSA    .CP29_GuadSA
              CP29_GuadSA    .CP32_GuadSA    ,      CP30_GuadSA    .CP29_GuadSA    ,      CP31_GuadSA    .CP32_GuadSA
              CP32_GuadSA    .CP37_GuadSA    ,      CP33_GuadSA    .CP34_GuadSA    ,      CP34_GuadSA    .CP35_GuadSA
              CP35_GuadSA    .CP37_GuadSA    ,      CP36_GuadSA    .CP37_GuadSA    ,      CP37_GuadSA    .CP38_GuadSA
              CP38_GuadSA    .CPEST_GuadSA   ,      CP71_GuadSA    .CP10_GuadSA    ,      CP72_GuadSA    .CP10_GuadSA
              CP73_GuadSA    .CP10_GuadSA    ,      CP74_GuadSA    .CP06_GuadSA    ,      CP75_GuadSA    .CP10_GuadSA
              CPEST_GuadSA   .OUT_GuadSA     )

Nueces    .(  CP01_NUECES    .CP03_NUECES    ,      CP02_NUECES    .CP03_NUECES    ,      CP03_NUECES    .CP04_NUECES
              CP04_NUECES    .CP05_NUECES    ,      CP05_NUECES    .CP06_NUECES    ,      CP06_NUECES    .CP29_NUECES
              CP07_NUECES    .CP09_NUECES    ,      CP08_NUECES    .CP09_NUECES    ,      CP09_NUECES    .CP25_NUECES
              CP10_NUECES    .CP24_NUECES    ,      CP111_NUECES   .CP25_NUECES
              CP112_NUECES   .CP25_NUECES    ,      CP12_NUECES    .CP13_NUECES    ,      CP13_NUECES    .CP25_NUECES
              CP141_NUECES   .CP25_NUECES    ,      CP142_NUECES   .CP25_NUECES
              CP15_NUECES    .CP25_NUECES    ,      CP16_NUECES    .CP17_NUECES    ,      CP17_NUECES    .CP25_NUECES
              CP18_NUECES    .CP19_NUECES    ,      CP19_NUECES    .CP25_NUECES
              CP201_NUECES   .CP25_NUECES    ,      CP202_NUECES   .CP25_NUECES    ,      CP21_NUECES    .CP22_NUECES
              CP22_NUECES    .CP25_NUECES    ,      CP231_NUECES   .CP25_NUECES
              CP232_NUECES   .CP25_NUECES    ,      CP24_NUECES    .CP25_NUECES    ,      CP25_NUECES    .CP27_NUECES
              CP26_NUECES    .CP27_NUECES    ,      CP27_NUECES    .CP29_NUECES    ,      CP28_NUECES    .CP29_NUECES
              CP29_NUECES    .CP30_NUECES    ,      CP30_NUECES    .CP31_NUECES    ,      CP31_NUECES    .CPBAY_NUECES
              CPBAY_NUECES   .CPEST_NUECES   ,      CPEST_NUECES   .OUT_NUECES

  )

Minor     .(  A10000_Minor   .10000_Minor    ,      C10000_Minor   .10000_Minor    ,      B10000_Minor   .C10000_Minor
              E10000_Minor   .10000_Minor    ,      D10000_Minor   .10000_Minor    ,      10000_Minor    .OUT_Minor      )

/;


