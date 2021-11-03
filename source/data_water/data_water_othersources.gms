
* some counties pump from minor aquifers
parameter otheraquifer_source(county);

 otheraquifer_source(county)
          $sum((sector, years), 1$histpump (county,  'other', 'none', sector, years))
            =sum((sector,years),  histpump (county,  'other', 'none', sector, years))
             / sum(( years), 1$sum(sector, histpump (county,  'other', 'none', sector, years)))   ;

parameter otherMAG(county) the other MAG
/
Atascosa               5290
Caldwell               307
Frio                   7804
Gonzales               13334
Karnes                 2059
McMullen               446
Refugio                5526
Wilson                 3243
LaSalle                985
Bastrop                18433
Fayette                14801
Gillespie              8045
Kendall                214
Uvalde                 13078
/;

 otheraquifer_source(county)
         =max( otheraquifer_source(county) ,  otherMAG(county) )*inregion_Pop_per(County);

