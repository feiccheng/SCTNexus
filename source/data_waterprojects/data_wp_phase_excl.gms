set mutual/ mut1*mut7/;
set mutual_excl(mutual, projects)
/
mut1.    SanPatricioReuse6
mut1.    SanPatricioReuse4

mut2.    CorpusASRphase1low
mut2.    CorpusASRphase1high

mut3.    CorpusASRphase2low
mut3.    CorpusASRphase2high

mut4.    EvangelineGroundwater1
mut4.    EvangelineGroundwater20501
mut4.    EvangelineGroundwater2
mut4.    EvangelineGroundwater3
mut4.    EvangelineBrackishGroundwater1
mut4.    EvangelineBrackishGroundwater20501
mut4.    EvangelineBrackishGroundwater2
mut4.    EvangelineBrackishGroundwater3

mut5.    SeaDesalinCorpusInnerHarbor10
mut5.    SeaDesalinCorpusInnerHarbor30

mut6.    SeaDesalinCorpusLaQuinta20
mut6.    SeaDesalinCorpusLaQuinta40

mut7.    SeaDesalinPoseidonIngleside50
mut7.    SeaDesalinPoseidonIngleside100


/;

set linkphases(projects, projects) the projects must build on the previous phase

/

CorpusASRphase1low       .  CorpusASRphase2low
CorpusASRphase1high      .  CorpusASRphase2low
CorpusASRphase1low       .  CorpusASRphase2high
CorpusASRphase1high      .  CorpusASRphase2high

TrinityNBU               .  ExpandedTrinityNBU
CzoSSLGC                 .  ExpandedCzoSSLGC

CRWAWellsRanch_II          .  CRWAWellsRanch_III
CzoSAWS                  .  ExpandedCzoSAWS_I
ExpandedCzoSAWS_I        .  ExpandedCzoSAWS_II
ExpandedCzoSAWS_II       .  ExpandedCzoSAWS_III

CzoSSLGC                 .  ExpandedBWSSLGC

ExpandedBWSAWS_II        .  ExpandedBWSAWS_III
ExpandedBWSAWS_III       .  ExpandedBWSAWS_IV
ExpandedBWSAWS_IV        .  ExpandedBWSAWS_V

GBRAMidBasin             .  GBRA_MidBasin_II

ARWA_GBRA_I_ARWA         .  ARWA_II
ARWA_II                  .  ARWA_III

CLSUDTrinity_I           .  CLSUDTrinity_II

CLSUD_Brackish_Edwards_I .  CLSUD_Brackish_Edwards_II
CLSUD_Brackish_Edwards_II.  CLSUD_Brackish_Edwards_III



/
jointpair the pair of joint projects /pair1*pair3/
linkjointproj(jointpair, projects) link the projects must be built together e.g. sharing pipelines
/
pair1.  ExpandedCzoSSLGC
pair1.  CVLGCCzo

pair2.  GBRANewAppropriation
pair2.  VictoriaSE

pair3.  ARWA_GBRA_I_ARWA
pair3.  ARWA_GBRA_I_GBRA
*pair3.  ARWA_GBRA_I_SanMarcos


/;
linkphases(projects, project) $exist_projects (projects) =no;
