* SAWS wants to reduce the reliance on Edwarads water because it could be cut off in the dry years.
* source: SAWS 2017 Water Management Plan
* http://www.saws.org/wp-content/uploads/2019/02/20171107_SAWS-2017-Water-Management-Plan.pdf
* on page 83, in dry year the goal is no more than 42% currently and no more than 31% by 2070
* in average year, the goal is no more than 60% now and no more than 52% by 2070
* we linearlize the process

Table SAWSLimit(states, decades) the saws limits of water from edwards by decades
                2015      2030     2050    2070    2090
Hdry            0.42      0.38     0.34    0.31    0.31
Mdry            0.42      0.38     0.34    0.31    0.31
Dry             0.42      0.38     0.34    0.31    0.31
Dnormal         0.6       0.57     0.54    0.52    0.52
Normal          0.6       0.57     0.54    0.52    0.52
Wnormal         0.6       0.57     0.54    0.52    0.52
Wet             0.6       0.57     0.54    0.52    0.52
Mwet            0.6       0.57     0.54    0.52    0.52
Hwet            0.6       0.57     0.54    0.52    0.52

parameter SAWSEdwardsProp(states) the limits in the model     ;

SAWSEdwardsProp(states)= SAWSLimit(states, '2015');