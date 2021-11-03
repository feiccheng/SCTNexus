set ws_type / landbase, offshore, solar/;
set windtype(ws_type)  types of wind power plant /landbase, offshore/ ;

*wind land
scalar density air density in kg per cubic meter /1.23/
       blade   blade length in m  /52/
       powereff power coefficient /0.59/        ;
*nrel data (yingqian, add data source here)
scalar  land_solar land requirement for solar plant in acre  per MW  /5.8/
scalar  land_wind  land requirement for wind plant in acre per mw (nrel data in hectare) /0.99/  ;


Table newwind(power_plant_all,county, ws_type, pp_alli)          build new wind farm (per wind turbine)
*ATB data assumes wind and solar last for 20 years
                                                 windspeed          capacity_factor        capital_cost           om_cost
wind_Aransas      . Aransas    .   offshore       9.5                    0.48                465341               110000
wind_Atascosa     . Atascosa   .   landbase       6.0                    0.31                137479                51000
wind_Bandera      . Bandera    .   landbase       7.3                    0.41                132381                51000
wind_Bastrop      . Bastrop    .   landbase       7.3                    0.41                132381                51000
wind_Bee          . Bee        .   landbase       7.0                    0.36                134538                51000
wind_Bexar        . Bexar      .   landbase       5.5                    0.25                139945                51000
wind_Caldwell     . Caldwell   .   landbase       6.0                    0.31                137479                51000
wind_Calhoun      . Calhoun    .   landbase       7.0                    0.36                134538                51000
wind_Comal        . Comal      .   landbase       6.0                    0.31                137479                51000
wind_Dewitt       . Dewitt     .   landbase       6.0                    0.31                137479                51000
wind_Dimmit       . Dimmit     .   landbase       6.5                    0.36                137479                51000
wind_Duval        . Duval      .   landbase       7.4                    0.41                132381                51000
wind_Edwards      . Edwards    .   landbase       8.3                    0.45                131042                51000
wind_Fayette      . Fayette    .   landbase       7.1                    0.36                134538                51000
wind_Frio         . Frio       .   landbase       6.0                    0.31                137479                51000
wind_Gillespie    . Gillespie  .   landbase       8.3                    0.45                131042                51000
wind_Goliad       . Goliad     .   landbase       6.5                    0.36                137479                51000
wind_Gonzales     . Gonzales   .   landbase       6.0                    0.31                137479                51000
wind_Guadalupe    . Guadalupe  .   landbase       6.0                    0.31                137479                51000
wind_Hays         . Hays       .   landbase       6.5                    0.36                137479                51000
wind_Jimwells     . Jimwells   .   landbase       7.0                    0.36                134538                51000
wind_Karnes       . Karnes     .   landbase       6.0                    0.31                137479                51000
wind_Kendall      . Kendall    .   landbase       5.5                    0.25                139945                51000
wind_Kerr         . Kerr       .   landbase       7.9                    0.44                131544                51000
wind_Kinney       . Kinney     .   landbase       7.0                    0.36                134538                51000
wind_LaSalle      . LaSalle    .   landbase       6.5                    0.36                137479                51000
wind_Lavaca       . Lavaca     .   landbase       7.0                    0.36                134538                51000
wind_Liveoak      . Liveoak    .   landbase       7.0                    0.36                134538                51000
wind_McMullen     . McMullen   .   landbase       7.6                    0.41                131544                51000
wind_Maverick     . Maverick   .   landbase       6.7                    0.36                134538                51000
wind_Medina       . Medina     .   landbase       5.5                    0.25                139945                51000
wind_Nueces       . Nueces     .   offshore       9.5                    0.48                465341               110000
wind_Real         . Real       .   landbase       8.1                    0.45                131042                51000
wind_Refugio      . Refugio    .   offshore       9.5                    0.48                465341               110000
wind_SanPatricio  . SanPatricio.   offshore       9.5                    0.48                465341               110000
*wind_Travis       . Travis     .   landbase       6.7                    0.36                134538                51000
wind_Uvalde       . Uvalde     .   landbase       6.0                    0.31                139945                51000
wind_Victoria     . Victoria   .   landbase       6.5                    0.36                139945                51000
wind_Webb         . Webb       .   landbase       7.2                    0.36                134538                51000
wind_Wilson       . Wilson     .   landbase       6.0                    0.31                139945                51000
wind_Zavala       . Zavala     .   landbase       6.0                    0.31                139945                51000

;


*source: from energy group
Table newsolar(power_plant_all,county, pp_alli)          build new solar farm
* yingqian, check the capacity factor here, I believe 0.24 is too high

*source: solar energy potential in kwh per square meter per day provided by energy group  (NREL data)
* per square meter theoretical capacity is 1kw
* we consider the unit of solar panel  as 1000 sq meter
                                   solarpotential          capacity_factor          capital_cost            om_cost
solar_Aransas    .  Aransas           4.836                  0.2                    166354                 13000
solar_Atascosa   .  Atascosa          4.823                  0.2                    166354                 13000
solar_Bandera    .  Bandera           4.756                  0.2                    166354                 13000
solar_Bastrop    .  Bastrop           4.704                  0.2                    166354                 13000
solar_Bee        .  Bee               4.746                  0.2                    166354                 13000
solar_Bexar      .  Bexar             4.746                  0.2                    166354                 13000
solar_Blanco     .  Blanco            4.810                  0.2                    166354                 13000
solar_Caldwell   .  Caldwell          4.724                  0.2                    166354                 13000
solar_Calhoun    .  Calhoun           5.047                  0.2                    166354                 13000
solar_Comal      .  Comal             4.712                  0.2                    166354                 13000
solar_Dewitt     .  Dewitt            4.720                  0.2                    166354                 13000
solar_Dimmit     .  Dimmit            4.999                  0.2                    166354                 13000
solar_Duval      .  Duval             4.919                  0.2                    166354                 13000
solar_Edwards    .  Edwards           4.995                  0.2                    166354                 13000
solar_Fayette    .  Fayette           4.695                  0.2                    166354                 13000
solar_Frio       .  Frio              4.874                  0.2                    166354                 13000
solar_Gillespie  .  Gillespie         4.885                  0.2                    166354                 13000
solar_Goliad     .  Goliad            4.701                  0.2                    166354                 13000
solar_Gonzales   .  Gonzales          4.728                  0.2                    166354                 13000
solar_Guadalupe  .  Guadalupe         4.737                  0.2                    166354                 13000
solar_Hays       .  Hays              4.737                  0.2                    166354                 13000
solar_Jimwells   .  Jimwells          4.821                  0.2                    166354                 13000
solar_Karnes     .  Karnes            4.777                  0.2                    166354                 13000
solar_Kendall    .  Kendall           4.764                  0.2                    166354                 13000
solar_Kerr       .  Kerr              4.853                  0.2                    166354                 13000
solar_Kinney     .  Kinney            4.922                  0.2                    166354                 13000
solar_Lasalle    .  Lasalle           4.940                  0.2                    166354                 13000
solar_Lavaca     .  Lavaca            4.685                  0.2                    166354                 13000
solar_Liveoak    .  Liveoak           4.819                  0.2                    166354                 13000
solar_McMullen   .  McMullen          4.897                  0.2                    166354                 13000
solar_Maverick   .  Maverick          4.994                  0.2                    166354                 13000
solar_Medina     .  Medina            4.779                  0.2                    166354                 13000
solar_Nueces     .  Nueces            4.847                  0.2                    166354                 13000
solar_Real       .  Real              4.875                  0.2                    166354                 13000
solar_Refugio    .  Refugio           4.726                  0.2                    166354                 13000
solar_SanPatricio.  SanPatricio       4.793                  0.2                    166354                 13000
*solar_Travis     .  Travis            4.748                  0.2                    166354                 13000
solar_Uvalde     .  Uvalde            4.852                  0.2                    166354                 13000
solar_Victoria   .  Victoria          4.672                  0.2                    166354                 13000
solar_Webb       .  Webb              5.055                  0.2                    166354                 13000
solar_Wilson     .  Wilson            4.776                  0.2                    166354                 13000
solar_Zavala     .  Zavala            4.937                  0.2                    166354                 13000
;

Table solarradiation(county,month) solar radiation in kwh per m2 per day in each month

                   Jan         Feb         Mar         Apr         May         Jun         Jul         Aug         Sep         Oct         Nov         Dec
aransas            4.01        4.79        5.40        5.79        6.49        6.79        6.68        6.72        5.95        5.74        4.72        3.83
atascosa           4.26        5.12        5.35        5.80        6.04        6.74        6.69        6.80        5.93        5.62        4.33        3.89
bandera            4.17        4.95        5.23        5.91        5.76        6.70        6.77        6.72        5.78        5.45        4.47        3.95
bastrop            3.94        4.79        5.04        5.84        6.06        6.57        6.57        6.59        5.75        5.38        4.25        3.58
bee                4.05        4.69        5.35        5.79        6.25        6.49        6.47        6.66        5.75        5.48        4.54        3.93
bexar              4.18        5.03        5.31        5.81        6.11        6.59        6.77        6.69        6.05        5.60        4.31        3.99
blanco             4.17        4.81        5.52        6.17        6.16        6.62        6.76        6.72        5.88        5.50        4.57        3.91
caldwell           4.08        4.53        5.17        6.04        6.11        6.64        6.68        6.77        6.18        5.32        4.36        3.61
calhoun            4.04        4.57        5.14        5.51        6.03        6.48        6.64        6.51        6.12        5.52        4.49        3.55
comal              4.11        4.80        5.24        5.78        5.95        6.52        6.69        6.70        6.01        5.37        4.26        3.90
dewitt             4.21        4.35        5.08        5.73        6.27        6.63        6.52        6.50        6.21        5.60        4.73        3.78
dimmit             4.49        5.24        5.74        6.29        6.36        6.77        6.89        7.02        6.28        5.64        4.64        4.10
duval              4.30        4.35        5.30        5.92        6.32        6.63        6.59        6.82        5.97        5.70        4.50        4.10
edwards            4.82        5.36        6.00        6.42        6.48        6.79        6.88        6.58        6.17        5.39        4.92        4.25
fayette            4.15        4.79        5.32        5.64        6.14        6.51        6.56        6.58        5.84        5.46        4.41        3.63
Frio               4.28        5.10        5.54        6.23        6.40        6.67        6.82        6.93        5.99        5.68        4.77        4.13
Gillespie          4.44        4.95        5.71        6.48        6.27        6.76        6.76        6.76        6.32        5.50        4.79        4.10
Goliad             4.07        4.64        5.25        5.65        6.21        6.50        6.55        6.50        5.84        5.52        4.47        3.80
Gonzales           4.02        4.97        5.19        5.82        6.33        6.69        6.61        6.66        5.90        5.54        4.30        3.72
Guadalupe          4.02        4.32        5.16        5.62        6.22        6.52        6.57        6.52        5.76        5.62        4.59        3.92
Hays               4.37        4.88        5.16        5.84        6.06        6.48        6.66        6.72        5.88        5.37        4.68        3.75
Jimwells           4.33        5.01        5.73        5.86        6.40        6.70        6.60        6.68        5.80        5.72        4.74        4.07
Karnes             3.96        4.30        5.24        6.06        6.27        6.77        6.91        6.69        6.21        5.24        4.30        3.76
Kendall            4.25        5.06        5.40        5.81        6.12        6.58        6.67        6.80        5.93        5.57        4.55        3.87
Kerr               4.35        4.91        5.37        6.14        6.10        6.67        6.79        6.77        6.06        5.43        4.38        3.82
Kinney             4.61        5.23        5.81        6.21        6.15        6.71        6.85        6.79        5.97        5.24        4.48        4.24
Lasalle            4.07        4.47        5.12        5.76        6.41        6.52        6.56        6.44        5.84        5.86        4.51        3.89
Lavaca             4.02        4.23        5.02        5.67        6.00        6.53        6.52        6.51        5.94        5.21        4.38        3.75
Liveoak            4.13        4.81        5.30        5.82        6.02        6.62        6.73        6.79        6.06        5.45        4.43        3.91
McMullen           4.23        4.98        5.55        5.81        6.40        6.61        6.67        6.83        6.33        5.56        4.57        4.18
Maverick           4.78        5.23        6.26        6.85        6.73        7.03        7.12        6.89        6.43        5.51        4.98        4.28
Medina             4.40        5.08        5.37        6.06        5.88        6.60        6.63        6.70        6.00        5.49        4.22        4.00
Nueces             4.04        4.73        5.35        5.95        6.32        6.60        6.72        6.74        5.96        5.65        4.57        3.98
Real               4.61        4.97        5.48        6.03        6.09        6.49        6.83        6.63        5.87        5.45        4.67        3.98
Refugio            3.97        4.47        5.13        5.68        6.21        6.44        6.53        6.45        5.74        5.65        4.48        3.78
SanPatricio        4.06        4.71        5.55        5.97        6.28        6.54        6.47        6.48        5.79        5.68        4.69        3.88
*Travis             4.18        4.66        5.23        6.05        6.16        6.71        6.79        6.68        6.13        5.19        4.58        3.81
Uvalde             4.58        5.21        5.53        6.04        6.18        6.54        6.68        6.71        6.05        5.54        4.71        4.06
Victoria           4.08        4.66        5.13        5.61        6.41        6.51        6.60        6.49        5.83        5.50        4.56        3.77
Webb               4.58        5.24        5.64        6.33        6.35        6.68        6.75        6.98        6.04        5.61        4.68        4.42
Wilson             4.80        5.59        6.35        7.24        7.31        7.30        7.30        7.09        6.33        5.77        5.06        4.24
Zavala             4.40        5.31        5.79        6.18        6.38        6.70        7.05        6.99        6.24        5.57        4.73        4.21
;
