$ontext
*the integral below has several steps
1.  curve  is P=a*Q**(1/E)
         where p and q is known price quantity point and macros above call price_d and quantity_d
               E is elasticity and macro calls elasticity_d
2.  solve for intercept that passes the curve through known point PB QB
          a=PB*QB**(-1/E)
3.  integrate the curve
         integral =1/(1/E + 1))a*Q**(1/E + 1)
4.  simplify (1/E + 1) to (1+E)/E
5.  reexpress integral as  E/(1+E) a Q**((1+E)/E)
6.  pull out Q
       integral as  E/(1+E)* a * Q * Q**(1/E)
7   substitute in intecept
       integral as  E/(1+E)* PB*QB**(-1/E) * Q * Q**(1/E)
8.  rearrange
       integral as  E/(1+E)* PB* Q * (Q/QB)**(1/E)
9   note with steps
       Q=QB*step
10.  substitute the above for Q in integral
       integral as  E/(1+E)* PB* QB * step * (QB*step/QB)**(1/E)
11.  simplify
       integral as  E/(1+E)* PB* QB * step * (step)**(1/E)
12.   consider lower limit of integral is QB/trunc where in above step is 1/tunc
       lower integral as  E/(1+E)* PB* QB 1/trunc * (1/trunc)**(1/E)
13.   subtrace lower limit from integral in #11 above
        integral as        E/(1+E)* PB* QB * step *  (step)**(1/E)
        lower integral as -E/(1+E)* PB* QB * (1/trunc) * (1/trunc)**(1/E)
14.  figure price at truncation
      Plower  = a*(QB/trunc)**(1/E)
15.  plug in for a
      Plower  = PB*QB**(-1/E)*(QB/trunc)**(1/E)
16    Pull out QB
      Plower  = PB*QB**(-1/E)*(QB)**(1/E)*(1/trunc)**(1/E)
17    simplify
      Plower  = PB*(1/trunc)**(1/E)
18    multiply by Q at truncation factor to get total revenus
      Revenuelower  = PB*(1/trunc)**(1/E)*QB/trunc
19.  rearrange
      Revenuelower  = PB*QB/trunc*(1/trunc)**(1/E)
20.  form final integrat
      result from #13 - result from #19
         E/(1+E)* PB* QB *  step     * (step)**(1/E)
        -E/(1+E)* PB* QB * (1/trunc) * (1/trunc)**(1/E)
        +PB*QB/trunc*(1/trunc)**(1/E)
$offtext
$macro m_elasticity_wd                                                        \
         Demanddata(citycounty,sector,'annual',"elasticity")

*step size for separable
$macro m_stepsize_wd                                                          \
         qinc(steps)

*price adjusted for time
$macro m_price_wd                                                             \
         Demanddata(citycounty,sector,'annual',"price")

*where do we truncate the curve
$macro m_truncation_wd                                                        \
         Demanddata(citycounty,sector,'annual',"tfac")

*quantity adjusted for time
$macro m_quantity_wd                                                          \
         Demanddata(citycounty,sector,'annual',"quantity")

$macro m_domain_for_v_demandsteps_wd                                                     \
         domain_for_WV_WATERDEMAND_STEPS(citycounty,sector,steps)

$macro m_v_demandsteps_wd                                                                \
         WV_WATERDEMAND_STEPS(citycounty,sector,steps)

$macro m_domain_for_v_demand_wd                                                          \
         domain_for_WV_WATERDEMAND(citycounty,sector)

$macro m_v_demand_wd                                                                     \
         WV_WATERDEMAND(citycounty,sector)


$macro m_vdemandstep_coef(price,quantity,elasticity,truncation,stepsize)                                                                         \
*                  integral to quantity at this step from first line of #20                                                                      \
                   (    elasticity/(1+elasticity) * price * quantity *  stepsize     * ( stepsize **(1/elasticity))                              \
*                   subtract integral to lower limit which is truncation factor from secnd line of #20 only for demand curve                     \
* in case quantity/truncation reaches first                                                                                                      \
                     - (elasticity/(1+elasticity) * price * quantity * (1/truncation) * ( 1/truncation)**(1/elasticity))                         \
                        $((elasticity <-0.05)   and ((1/truncation)**(1/elasticity)< truncation))                                                \
* in case price*truncation reaches first                                                                                                         \
                     - (elasticity/(1+elasticity) * price * quantity * (( truncation)**(1.0+elasticity)) )                                       \
                        $((elasticity <-0.05)   and ((1/truncation)**(1/elasticity)>= truncation))                                               \
*                  add in price times quantity up to truncation factor only for demand curve                                                     \
* in case quantity/truncation reaches first                                                                                                      \
                      + (price * quantity/truncation * (1.0/truncation)**(1.0/elasticity))                                                       \
                         $((elasticity <-0.05)   and ((1/truncation)**(1/elasticity)< truncation))                                               \
* in case price*truncation reaches first                                                                                                         \
                      + (price * quantity* (truncation)**(1.0+ elasticity))                                                                      \
                         $((elasticity <-0.05)   and ((1/truncation)**(1/elasticity)>= truncation))                                              \
                    )


$macro integralceS(domain_for_V_DEMANDSTEPS,V_DEMANDSTEPS,domain_for_V_DEMAND,V_DEMAND,m_vdemandstep_coef,price,elasticity)                      \
      sum(domain_for_V_DEMANDSTEPS $(abs(elasticity) >0.05)  ,                                                                                   \
                     m_vdemandstep_coef *V_DEMANDSTEPS)                                                                                          \
                                                                                                                                                 \
*             add in price times quantity for things with small elasticity                                                                       \
     +sum(domain_for_V_DEMAND $(abs(elasticity)<=0.05)  ,                                                                                        \
                             (price * V_DEMAND) $(price      gt 0 ))




*CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
*    Energy Integral
*CCCCCCCCCCCCCCCCCCCCCCCCCCCCCC

$macro m_elasticity_pp                                                        \
         Demanddata_pp("elasticity")

*step size for separable
$macro m_stepsize_pp                                                          \
         qinc(steps)

*price adjusted for time
$macro m_price_pp                                                             \
         Demanddata_pp("price")

*where do we truncate the curve
$macro m_truncation_pp                                                        \
         Demanddata_pp("tfac")

*quantity adjusted for time
$macro m_quantity_pp                                                          \
         Demanddata_pp("quantity")

$macro m_domain_for_v_demandsteps_pp                                                     \
         domain_for_EV_DEMAND_STEPS(steps)

$macro m_v_demandsteps_pp                                                                \
         EV_DEMAND_STEPS(steps)


$macro integralceS_PP(domain_for_V_DEMANDSTEPS,V_DEMANDSTEPS,m_vdemandstep_coef,elasticity)                  \
      sum(domain_for_V_DEMANDSTEPS $(abs(elasticity) >0.05)  ,                                               \
                  m_vdemandstep_coef*V_DEMANDSTEPS)
