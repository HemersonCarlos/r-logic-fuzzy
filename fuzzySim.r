install.packages("fuzzySim")

Installing package into ‘/cloud/lib/x86_64-pc-linux-gnu-library/4.1’
(as ‘lib’ is unspecified)
trying URL 'http://package-proxy/focal/src/contrib/fuzzySim_3.0.tar.gz'
Content type 'application/x-tar' length 253173 bytes (247 KB)
==================================================
downloaded 247 KB

* installing *binary* package ‘fuzzySim’ ...
* DONE (fuzzySim)

The downloaded source packages are in
	‘/tmp/RtmpB69mVV/downloaded_packages’

------------------------------------------------------------------------------

library(fuzzySim)

------------------------------------------------------------------------------

data(rotifers)

------------------------------------------------------------------------------

help(rotifers)

------------------------------------------------------------------------------

head(rotifers, 10)

    TDWG4                          species
1  DEN-OO Brachionus_plicatilis_plicatilis
11 DEN-OO  Keratella_cochlearis_cochlearis
15 DEN-OO      Keratella_quadrata_quadrata
16 DEN-OO             Asplanchna_priodonta
17 DEN-OO   Brachionus_angularis_angularis
19 DEN-OO                Filinia_longiseta
24 DEN-OO          Brachionus_calyciflorus
32 FIN-OO             Asplanchna_priodonta
37 FIN-OO  Keratella_cochlearis_cochlearis
46 FIN-OO          Brachionus_calyciflorus

------------------------------------------------------------------------------

rotifers$spcode <- spCodes(rotifers$species, sep.species = "_", nchar.gen = 1, nchar.sp = 5, nchar.ssp = 0, sep.spcode = "")

------------------------------------------------------------------------------

head(rotifers, 10)

    TDWG4                          species spcode
1  DEN-OO Brachionus_plicatilis_plicatilis Bplica
11 DEN-OO  Keratella_cochlearis_cochlearis Kcochl
15 DEN-OO      Keratella_quadrata_quadrata Kquadr
16 DEN-OO             Asplanchna_priodonta Apriod
17 DEN-OO   Brachionus_angularis_angularis Bangul
19 DEN-OO                Filinia_longiseta Flongi
24 DEN-OO          Brachionus_calyciflorus Bcalyc
32 FIN-OO             Asplanchna_priodonta Apriod
37 FIN-OO  Keratella_cochlearis_cochlearis Kcochl
46 FIN-OO          Brachionus_calyciflorus Bcalyc

------------------------------------------------------------------------------

rotifers.presabs <- splist2presabs(rotifers, sites.col = "TDWG4", sp.col = "spcode", keep.n = FALSE)

------------------------------------------------------------------------------

head(rotifers.presabs)

   TDWG4 Abrigh Afissa Apriod Bangul Bcalyc Bplica Bquadr Burceo Cgibba
1 ABT-OO      0      0      1      1      0      0      0      0      0
2 AFG-OO      1      0      1      1      1      1      1      1      1
3 AGE-BA      1      1      0      1      1      1      1      1      0
4 AGE-CD      0      0      0      1      0      1      1      0      0
5 AGE-CH      0      0      0      1      0      0      1      0      1
6 AGE-CN      0      0      0      0      1      1      1      0      0
  Edilat Flongi Kcochl Kquadr Ktropi Lbulla Lclost Lhamat Lluna Llunar
1      0      1      1      1      0      0      0      0     1      1
2      0      0      1      1      1      1      1      1     1      0
3      1      1      1      1      1      1      1      1     1      1
4      1      1      1      0      0      1      1      0     1      1
5      0      1      0      0      1      1      1      1     0      1
6      1      1      0      1      0      0      0      0     1      0
  Lovali Lpatel Lquadr Mventr Ppatul Pquadr Pvulga Specti Tpatin Tsimil
1      1      0      0      0      1      0      1      1      0      0
2      1      1      1      0      1      1      1      0      1      1
3      1      0      1      1      1      1      1      0      1      0
4      1      0      1      1      0      0      1      0      0      1
5      1      0      1      1      1      1      1      0      0      1
6      1      0      0      1      1      1      1      0      0      1
  Ttetra
1      1
2      0
3      1
4      0
5      1
6      0

------------------------------------------------------------------------------

if (!("rgdal" %in% rownames(installed.packages()))) install.packages("rgdal")

Installing package into ‘/cloud/lib/x86_64-pc-linux-gnu-library/4.1’
(as ‘lib’ is unspecified)
also installing the dependency ‘sp’

trying URL 'http://package-proxy/focal/src/contrib/sp_1.4-5.tar.gz'
Content type 'application/x-tar' length 1869569 bytes (1.8 MB)
==================================================
downloaded 1.8 MB

trying URL 'http://package-proxy/focal/src/contrib/rgdal_1.5-27.tar.gz'
Content type 'application/x-tar' length 5040035 bytes (4.8 MB)
==================================================
downloaded 4.8 MB

* installing *binary* package ‘sp’ ...
* DONE (sp)
* installing *binary* package ‘rgdal’ ...
* DONE (rgdal)

The downloaded source packages are in
	‘/tmp/RtmpB69mVV/downloaded_packages’

------------------------------------------------------------------------------

library(rgdal)

Loading required package: sp
Please note that rgdal will be retired by the end of 2023,
plan transition to sf/stars/terra functions using GDAL and PROJ
at your earliest convenience.

rgdal: version: 1.5-27, (SVN revision 1148)
Geospatial Data Abstraction Library extensions to R successfully loaded
Loaded GDAL runtime: GDAL 3.0.4, released 2020/01/28
Path to GDAL shared files: /usr/share/gdal
GDAL binary built with GEOS: TRUE 
Loaded PROJ runtime: Rel. 6.3.1, February 10th, 2020, [PJ_VERSION: 631]
Path to PROJ shared files: /usr/share/proj
Linking to sp version:1.4-5
To mute warnings of possible GDAL/OSR exportToProj4() degradation,
use options("rgdal_show_exportToProj4_warnings"="none") before loading sp or rgdal.

------------------------------------------------------------------------------

TDWG4shp <- readOGR(dsn = "https://raw.githubusercontent.com/tdwg/wgsrpd/master/geojson/level4.geojson")

OGR data source with driver: GeoJSON 
Source: "https://raw.githubusercontent.com/tdwg/wgsrpd/master/geojson/level4.geojson", layer: "level4"
with 610 features
It has 7 fields

------------------------------------------------------------------------------

TDWG4shp@data <- data.frame(TDWG4shp@data, rotifers.presabs[match(TDWG4shp@data$Level4_cod, rotifers.presabs$TDWG4), ])

------------------------------------------------------------------------------
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

data(rotif.env)

------------------------------------------------------------------------------

head(rotif.env)

   TDWG4   LEVEL_NAME            REGION_NAME        CONTINENT      Area Altitude
1 ABT-OO      Alberta         Western_Canada NORTHERN_AMERICA 663485.40   769.07
2 AFG-OO  Afghanistan           Western_Asia   ASIA-TEMPERATE 641921.77  1797.41
3 AGE-BA Buenos_Aires Southern_South_America SOUTHERN_AMERICA 306187.95    92.66
4 AGE-CH        Chaco Southern_South_America SOUTHERN_AMERICA  99203.11   115.57
5 AGE-CN   Corrientes Southern_South_America SOUTHERN_AMERICA  88614.06    67.60
6 AGE-ER   Entre_Rios Southern_South_America SOUTHERN_AMERICA  78071.93    44.22
  AltitudeRange HabitatDiversity HumanPopulation  Latitude  Longitude Precipitation
1          3346               12         3461492  54.95520 -114.45960        454.96
2          6347               13        32755566  33.78802   65.98809        309.59
3          1092               12        15548773 -36.64692  -60.54985        813.76
4           230                7         1090382 -26.38870  -60.76430        935.89
5           195                9         1029757 -28.75806  -57.78881       1292.63
6           125                9         1296896 -32.03426  -59.20174       1059.91
  PrecipitationSeasonality TemperatureAnnualRange Temperature
1                    52.23                 454.56       0.429
2                    92.11                 403.11      11.728
3                    29.92                 272.70      15.055
4                    57.13                 257.05      21.847
5                    28.18                 236.53      20.720
6                    31.85                 256.20      18.215
  TemperatureSeasonality UrbanArea Abrigh Afissa Apriod Bangul Bcalyc Bplica Bquadr
1               11465.98      1085      0      0      1      1      0      0      0
2                8812.06       790      1      0      1      1      1      1      1
3                5040.31         0      1      1      0      1      1      1      1
4                4147.56         0      0      0      0      1      0      0      1
5                4192.44         0      0      0      0      0      1      1      1
6                4637.56         0      0      0      0      0      1      0      1
  Burceo Cgibba Edilat Flongi Kcochl Kquadr Ktropi Lbulla Lclost Lhamat Lluna
1      0      0      0      1      1      1      0      0      0      0     1
2      1      1      0      0      1      1      1      1      1      1     1
3      1      0      1      1      1      1      1      1      1      1     1
4      0      1      0      1      0      0      1      1      1      1     0
5      0      0      1      1      0      1      0      0      0      0     1
6      0      0      1      1      1      0      1      1      0      0     0
  Llunar Lovali Lpatel Lquadr Mventr Ppatul Pquadr Pvulga Specti Tpatin Tsimil
1      1      1      0      0      0      1      0      1      1      0      0
2      0      1      1      1      0      1      1      1      0      1      1
3      1      1      0      1      1      1      1      1      0      1      0
4      1      1      0      1      1      1      1      1      0      0      1
5      0      1      0      0      1      1      1      1      0      0      1
6      0      0      0      0      0      1      1      0      0      1      0
  Ttetra
1      1
2      0
3      1
4      1
5      0
6      0

------------------------------------------------------------------------------

names(rotif.env)

[1] "TDWG4"                    "LEVEL_NAME"              
[3] "REGION_NAME"              "CONTINENT"               
[5] "Area"                     "Altitude"                
[7] "AltitudeRange"            "HabitatDiversity"        
[9] "HumanPopulation"          "Latitude"                
[11] "Longitude"                "Precipitation"           
[13] "PrecipitationSeasonality" "TemperatureAnnualRange"  
[15] "Temperature"              "TemperatureSeasonality"  
[17] "UrbanArea"                "Abrigh"                  
[19] "Afissa"                   "Apriod"                  
[21] "Bangul"                   "Bcalyc"                  
[23] "Bplica"                   "Bquadr"                  
[25] "Burceo"                   "Cgibba"                  
[27] "Edilat"                   "Flongi"                  
[29] "Kcochl"                   "Kquadr"                  
[31] "Ktropi"                   "Lbulla"                  
[33] "Lclost"                   "Lhamat"                  
[35] "Lluna"                    "Llunar"                  
[37] "Lovali"                   "Lpatel"                  
[39] "Lquadr"                   "Mventr"                  
[41] "Ppatul"                   "Pquadr"                  
[43] "Pvulga"                   "Specti"                  
[45] "Tpatin"                   "Tsimil"                  
[47] "Ttetra"                  

------------------------------------------------------------------------------

rotifers.tsa <- multTSA(rotif.env, sp.cols = 18:47, coord.cols = c("Longitude", "Latitude"), id.col = 1, degree = 3, step = TRUE)

Computing TSA 1 of 30 (Abrigh) ...
Computing TSA 2 of 30 (Afissa) ...
Computing TSA 3 of 30 (Apriod) ...
Computing TSA 4 of 30 (Bangul) ...
Computing TSA 5 of 30 (Bcalyc) ...
Computing TSA 6 of 30 (Bplica) ...
Computing TSA 7 of 30 (Bquadr) ...
Computing TSA 8 of 30 (Burceo) ...
Computing TSA 9 of 30 (Cgibba) ...
Computing TSA 10 of 30 (Edilat) ...
Computing TSA 11 of 30 (Flongi) ...
Computing TSA 12 of 30 (Kcochl) ...
Computing TSA 13 of 30 (Kquadr) ...
Computing TSA 14 of 30 (Ktropi) ...
Computing TSA 15 of 30 (Lbulla) ...
Computing TSA 16 of 30 (Lclost) ...
Computing TSA 17 of 30 (Lhamat) ...
Computing TSA 18 of 30 (Lluna) ...
Computing TSA 19 of 30 (Llunar) ...
Computing TSA 20 of 30 (Lovali) ...
Computing TSA 21 of 30 (Lpatel) ...
Computing TSA 22 of 30 (Lquadr) ...
Computing TSA 23 of 30 (Mventr) ...
Computing TSA 24 of 30 (Ppatul) ...
Computing TSA 25 of 30 (Pquadr) ...
Computing TSA 26 of 30 (Pvulga) ...
Computing TSA 27 of 30 (Specti) ...
Computing TSA 28 of 30 (Tpatin) ...
Computing TSA 29 of 30 (Tsimil) ...
Computing TSA 30 of 30 (Ttetra) ...
Finished!
It took 1.6 secs.

------------------------------------------------------------------------------

head(rotifers.tsa)

   TDWG4 Abrigh_TS Afissa_TS  Apriod_TS Bangul_TS Bcalyc_TS Bplica_TS Bquadr_TS
1 ABT-OO 0.1798791 0.1072166 0.56679570 0.1749335 0.2038724 0.1290277 0.1699564
2 AFG-OO 0.4336780 0.4672791 0.41020511 0.6047653 0.6623104 0.4086573 0.5600267
3 AGE-BA 0.2415516 0.1213213 0.06354302 0.1983921 0.5761701 0.2155371 0.4680020
4 AGE-CH 0.3015052 0.1862872 0.06868535 0.2698491 0.5684838 0.2741569 0.4596102
5 AGE-CN 0.2838745 0.1681223 0.07063465 0.2515481 0.5786859 0.2594142 0.4673258
6 AGE-ER 0.2666956 0.1479148 0.06690217 0.2291874 0.5768053 0.2415501 0.4669809
  Burceo_TS Cgibba_TS Edilat_TS Flongi_TS Kcochl_TS Kquadr_TS  Ktropi_TS Lbulla_TS
1 0.1574877 0.4140185 0.4440554 0.4722511 0.8551909 0.5672359 0.01957571 0.4950867
2 0.4654481 0.2779111 0.5078315 0.5350268 0.5613394 0.4210410 0.46405849 0.6196688
3 0.1564815 0.1053790 0.6822418 0.5986828 0.6717552 0.2279913 0.47980394 0.4638878
4 0.1743961 0.2231089 0.5705167 0.5354029 0.5418227 0.1312679 0.41957365 0.4795597
5 0.1700648 0.1952903 0.5944190 0.5475202 0.5737098 0.1432048 0.45544798 0.4750602
6 0.1641862 0.1573235 0.6295697 0.5676605 0.6120463 0.1708383 0.46340796 0.4700831
  Lclost_TS Lhamat_TS  Lluna_TS Llunar_TS Lovali_TS Lpatel_TS Lquadr_TS Mventr_TS
1 0.4556231 0.4450375 0.6246795 0.5884879 0.4633043 0.4688315 0.3237067 0.3965889
2 0.4497303 0.4015735 0.6213630 0.4853297 0.5070240 0.6125707 0.3680691 0.4260237
3 0.4990739 0.3497589 0.4882358 0.5057941 0.3981178 0.4346894 0.3163933 0.1618793
4 0.5281937 0.3808958 0.4709337 0.4324621 0.3156356 0.3869665 0.3279513 0.2724442
5 0.5207866 0.3744399 0.4740762 0.4408444 0.3163688 0.3926168 0.3272247 0.2489416
6 0.5145158 0.3657415 0.4789127 0.4654300 0.3474118 0.4082592 0.3226785 0.2137519
  Ppatul_TS Pquadr_TS Pvulga_TS Specti_TS Tpatin_TS Tsimil_TS Ttetra_TS
1 0.1389705 0.3724424 0.5856284 0.5451701 0.4363001 0.2749726 0.5063451
2 0.3908047 0.4022227 0.4027524 0.2981612 0.5346921 0.3597653 0.3428480
3 0.1802852 0.2806913 0.6115051 0.2956622 0.3627692 0.4232095 0.5351047
4 0.2956318 0.3625527 0.5484746 0.2271415 0.3486275 0.3914804 0.4656046
5 0.2712061 0.3457548 0.5556842 0.2464505 0.3519987 0.3988399 0.4750138
6 0.2339936 0.3209198 0.5775083 0.2637806 0.3555117 0.4073658 0.5008758

------------------------------------------------------------------------------

range(rotifers.tsa[ , -1])

[1] 9.408071e-05 9.996004e-01

------------------------------------------------------------------------------

TDWG4shp@data <- data.frame(TDWG4shp@data, rotifers.tsa[match(TDWG4shp@data$Level4_cod, rotifers.tsa$TDWG4), ]) 

------------------------------------------------------------------------------

print(spplot(TDWG4shp, zcol = "Abrigh_TS", col.regions = rev(heat.colors(256)), main = expression(paste(italic("A. brightwellii"), " TSA"))))

------------------------------------------------------------------------------
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

rotifers.invdist <- distPres(rotif.env, sp.cols = 18:47, coord.cols = c("Longitude", "Latitude"), id.col = 1, p = 1, inv = TRUE, suffix = "_D")

------------------------------------------------------------------------------

head(rotifers.invdist)

   TDWG4  Abrigh_D  Afissa_D  Apriod_D  Bangul_D  Bcalyc_D  Bplica_D Bquadr_D  Burceo_D
1 ABT-OO 0.8199193 0.8178644 1.0000000 1.0000000 0.9049867 0.9152305 0.844641 0.8446410
2 AFG-OO 1.0000000 0.9028041 1.0000000 1.0000000 1.0000000 1.0000000 1.000000 1.0000000
3 AGE-BA 1.0000000 1.0000000 0.8133087 1.0000000 1.0000000 1.0000000 1.000000 1.0000000
4 AGE-CH 0.9610394 0.9610394 0.7779989 1.0000000 0.9719006 0.9719006 1.000000 0.9610394
5 AGE-CN 0.9637866 0.9637866 0.7522927 0.9637866 1.0000000 1.0000000 1.000000 0.9637866
6 AGE-ER 0.9782206 0.9782206 0.7661572 0.9782206 1.0000000 0.9782206 1.000000 0.9782206
   Cgibba_D  Edilat_D  Flongi_D  Kcochl_D  Kquadr_D  Ktropi_D  Lbulla_D  Lclost_D
1 0.9004828 0.9049867 1.0000000 1.0000000 1.0000000 0.8178644 0.9004828 0.9004828
2 1.0000000 0.9028041 0.9028041 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
3 0.9409741 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
4 1.0000000 0.9719006 1.0000000 0.9719006 0.9625672 1.0000000 1.0000000 1.0000000
5 0.9637866 1.0000000 1.0000000 0.9648868 1.0000000 0.9648868 0.9648868 0.9637866
6 0.9782206 1.0000000 1.0000000 1.0000000 0.9648868 1.0000000 1.0000000 0.9782206
   Lhamat_D   Lluna_D  Llunar_D  Lovali_D  Lpatel_D  Lquadr_D  Mventr_D Ppatul_D  Pquadr_D
1 0.9004828 1.0000000 1.0000000 1.0000000 0.9004828 0.9004828 0.9004828        1 0.8719459
2 1.0000000 1.0000000 0.9026880 1.0000000 1.0000000 1.0000000 0.9028041        1 1.0000000
3 1.0000000 1.0000000 1.0000000 1.0000000 0.9409741 1.0000000 1.0000000        1 1.0000000
4 1.0000000 0.9719006 1.0000000 1.0000000 0.9719006 1.0000000 1.0000000        1 1.0000000
5 0.9637866 1.0000000 0.9637866 1.0000000 0.9637866 0.9637866 1.0000000        1 1.0000000
6 0.9782206 0.9782206 0.9782206 0.9782206 0.9782206 0.9782206 0.9782206        1 1.0000000
   Pvulga_D  Specti_D  Tpatin_D  Tsimil_D  Ttetra_D
1 1.0000000 1.0000000 0.9004828 0.8719459 1.0000000
2 1.0000000 0.7618630 1.0000000 1.0000000 0.9028041
3 1.0000000 0.9246786 1.0000000 0.9389474 1.0000000
4 1.0000000 0.9610394 0.9719006 1.0000000 1.0000000
5 1.0000000 0.9449998 0.9648868 1.0000000 0.9637866
6 0.9782206 0.9127539 1.0000000 0.9648868 0.9782206

------------------------------------------------------------------------------

range(rotifers.invdist[ , -1])

[1] 0 1

------------------------------------------------------------------------------

TDWG4shp@data <- data.frame(TDWG4shp@data, rotifers.invdist[match(TDWG4shp@data$Level4_cod, rotifers.invdist$TDWG4), ]) 
print(spplot(TDWG4shp, zcol = "Abrigh_D", col.regions = rev(heat.colors(256)), main = expression(paste(italic("A. brightwellii"), " inverse distance"))))

------------------------------------------------------------------------------
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

rotifers.fav <- multGLM(data = rotif.env, sp.cols = 18:47, var.cols = 5:17, id.col = 1)

All 291 observations used for model training;
              none reserved for model testing.


=> Building model 1 of 30 (Abrigh)...

13 input predictor variable(s)

6 variable(s) excluded by 'step' function
 Altitude, Latitude, Longitude, TemperatureAnnualRange, Temperature, UrbanArea 

1 variable(s) excluded by 'modelTrim' function
 AltitudeRange 

6 variable(s) INCLUDED IN THE FINAL MODEL
 HabitatDiversity, TemperatureSeasonality, Area, Precipitation, PrecipitationSeasonality, HumanPopulation



=> Building model 2 of 30 (Afissa)...

13 input predictor variable(s)

3 variable(s) excluded by 'step' function
 Area, AltitudeRange, Precipitation 

4 variable(s) excluded by 'modelTrim' function
 HumanPopulation, HabitatDiversity, Altitude, Temperature 

6 variable(s) INCLUDED IN THE FINAL MODEL
 UrbanArea, TemperatureSeasonality, Longitude, Latitude, TemperatureAnnualRange, PrecipitationSeasonality



=> Building model 3 of 30 (Apriod)...

13 input predictor variable(s)

8 variable(s) excluded by 'step' function
 Altitude, AltitudeRange, HumanPopulation, Precipitation, TemperatureAnnualRange, Temperature, TemperatureSeasonality, UrbanArea 

1 variable(s) excluded by 'modelTrim' function
 HabitatDiversity 

4 variable(s) INCLUDED IN THE FINAL MODEL
 Latitude, Area, PrecipitationSeasonality, Longitude



=> Building model 4 of 30 (Bangul)...

13 input predictor variable(s)

5 variable(s) excluded by 'step' function
 Area, AltitudeRange, HumanPopulation, PrecipitationSeasonality, TemperatureSeasonality 

3 variable(s) excluded by 'modelTrim' function
 Latitude, TemperatureAnnualRange, Altitude 

5 variable(s) INCLUDED IN THE FINAL MODEL
 UrbanArea, Longitude, Temperature, Precipitation, HabitatDiversity



=> Building model 5 of 30 (Bcalyc)...

13 input predictor variable(s)

8 variable(s) excluded by 'step' function
 Area, Altitude, Longitude, Precipitation, PrecipitationSeasonality, TemperatureAnnualRange, Temperature, TemperatureSeasonality 

1 variable(s) excluded by 'modelTrim' function
 AltitudeRange 

4 variable(s) INCLUDED IN THE FINAL MODEL
 HumanPopulation, UrbanArea, Latitude, HabitatDiversity



=> Building model 6 of 30 (Bplica)...

13 input predictor variable(s)

7 variable(s) excluded by 'step' function
 Altitude, AltitudeRange, Latitude, Longitude, PrecipitationSeasonality, Temperature, TemperatureSeasonality 

1 variable(s) excluded by 'modelTrim' function
 HabitatDiversity 

5 variable(s) INCLUDED IN THE FINAL MODEL
 HumanPopulation, Precipitation, TemperatureAnnualRange, UrbanArea, Area



=> Building model 7 of 30 (Bquadr)...

13 input predictor variable(s)

4 variable(s) excluded by 'step' function
 Altitude, AltitudeRange, TemperatureAnnualRange, TemperatureSeasonality 

5 variable(s) excluded by 'modelTrim' function
 HumanPopulation, Latitude, Precipitation, Longitude, PrecipitationSeasonality 

4 variable(s) INCLUDED IN THE FINAL MODEL
 UrbanArea, Area, Temperature, HabitatDiversity



=> Building model 8 of 30 (Burceo)...

13 input predictor variable(s)

5 variable(s) excluded by 'step' function
 Altitude, Latitude, TemperatureAnnualRange, Temperature, UrbanArea 

1 variable(s) excluded by 'modelTrim' function
 AltitudeRange 

7 variable(s) INCLUDED IN THE FINAL MODEL
 HumanPopulation, HabitatDiversity, PrecipitationSeasonality, Area, Longitude, Precipitation, TemperatureSeasonality



=> Building model 9 of 30 (Cgibba)...

13 input predictor variable(s)

5 variable(s) excluded by 'step' function
 AltitudeRange, HabitatDiversity, HumanPopulation, Precipitation, PrecipitationSeasonality 

1 variable(s) excluded by 'modelTrim' function
 UrbanArea 

7 variable(s) INCLUDED IN THE FINAL MODEL
 Area, Altitude, Latitude, Longitude, TemperatureSeasonality, Temperature, TemperatureAnnualRange



=> Building model 10 of 30 (Edilat)...

13 input predictor variable(s)

6 variable(s) excluded by 'step' function
 Altitude, AltitudeRange, HumanPopulation, Longitude, PrecipitationSeasonality, Temperature 

3 variable(s) excluded by 'modelTrim' function
 UrbanArea, Latitude, TemperatureSeasonality 

4 variable(s) INCLUDED IN THE FINAL MODEL
 Area, HabitatDiversity, Precipitation, TemperatureAnnualRange



=> Building model 11 of 30 (Flongi)...

13 input predictor variable(s)

8 variable(s) excluded by 'step' function
 AltitudeRange, HumanPopulation, Longitude, Precipitation, PrecipitationSeasonality, TemperatureAnnualRange, Temperature, TemperatureSeasonality 

3 variable(s) excluded by 'modelTrim' function
 Altitude, Latitude, UrbanArea 

2 variable(s) INCLUDED IN THE FINAL MODEL
 HabitatDiversity, Area



=> Building model 12 of 30 (Kcochl)...

13 input predictor variable(s)

7 variable(s) excluded by 'step' function
 Altitude, HumanPopulation, Longitude, Precipitation, PrecipitationSeasonality, TemperatureAnnualRange, TemperatureSeasonality 

0 variable(s) excluded by 'modelTrim' function
  

6 variable(s) INCLUDED IN THE FINAL MODEL
 HabitatDiversity, UrbanArea, Area, AltitudeRange, Latitude, Temperature



=> Building model 13 of 30 (Kquadr)...

13 input predictor variable(s)

5 variable(s) excluded by 'step' function
 Area, Altitude, AltitudeRange, Latitude, TemperatureSeasonality 

3 variable(s) excluded by 'modelTrim' function
 UrbanArea, TemperatureAnnualRange, Longitude 

5 variable(s) INCLUDED IN THE FINAL MODEL
 Temperature, HabitatDiversity, Precipitation, PrecipitationSeasonality, HumanPopulation



=> Building model 14 of 30 (Ktropi)...

13 input predictor variable(s)

7 variable(s) excluded by 'step' function
 Area, Altitude, AltitudeRange, PrecipitationSeasonality, TemperatureAnnualRange, TemperatureSeasonality, UrbanArea 

0 variable(s) excluded by 'modelTrim' function
  

6 variable(s) INCLUDED IN THE FINAL MODEL
 HumanPopulation, Latitude, Longitude, Precipitation, Temperature, HabitatDiversity



=> Building model 15 of 30 (Lbulla)...

13 input predictor variable(s)

8 variable(s) excluded by 'step' function
 AltitudeRange, Latitude, Longitude, Precipitation, PrecipitationSeasonality, TemperatureAnnualRange, TemperatureSeasonality, UrbanArea 

3 variable(s) excluded by 'modelTrim' function
 HumanPopulation, Area, Altitude 

2 variable(s) INCLUDED IN THE FINAL MODEL
 HabitatDiversity, Temperature



=> Building model 16 of 30 (Lclost)...

13 input predictor variable(s)

8 variable(s) excluded by 'step' function
 HabitatDiversity, Latitude, Longitude, Precipitation, PrecipitationSeasonality, TemperatureAnnualRange, Temperature, TemperatureSeasonality 

3 variable(s) excluded by 'modelTrim' function
 Altitude, UrbanArea, AltitudeRange 

2 variable(s) INCLUDED IN THE FINAL MODEL
 HumanPopulation, Area



=> Building model 17 of 30 (Lhamat)...

13 input predictor variable(s)

9 variable(s) excluded by 'step' function
 AltitudeRange, HabitatDiversity, Latitude, Longitude, Precipitation, PrecipitationSeasonality, TemperatureAnnualRange, Temperature, UrbanArea 

1 variable(s) excluded by 'modelTrim' function
 Altitude 

3 variable(s) INCLUDED IN THE FINAL MODEL
 Area, HumanPopulation, TemperatureSeasonality



=> Building model 18 of 30 (Lluna)...

13 input predictor variable(s)

9 variable(s) excluded by 'step' function
 Altitude, AltitudeRange, HumanPopulation, Latitude, Longitude, Precipitation, PrecipitationSeasonality, TemperatureAnnualRange, Temperature 

3 variable(s) excluded by 'modelTrim' function
 UrbanArea, Area, TemperatureSeasonality 

1 variable(s) INCLUDED IN THE FINAL MODEL
 HabitatDiversity



=> Building model 19 of 30 (Llunar)...

13 input predictor variable(s)

7 variable(s) excluded by 'step' function
 AltitudeRange, Latitude, Longitude, Precipitation, PrecipitationSeasonality, TemperatureSeasonality, UrbanArea 

1 variable(s) excluded by 'modelTrim' function
 HumanPopulation 

5 variable(s) INCLUDED IN THE FINAL MODEL
 Area, Altitude, HabitatDiversity, TemperatureAnnualRange, Temperature



=> Building model 20 of 30 (Lovali)...

13 input predictor variable(s)

10 variable(s) excluded by 'step' function
 Altitude, AltitudeRange, HabitatDiversity, Latitude, Longitude, Precipitation, TemperatureAnnualRange, Temperature, TemperatureSeasonality, UrbanArea 

2 variable(s) excluded by 'modelTrim' function
 HumanPopulation, PrecipitationSeasonality 

1 variable(s) INCLUDED IN THE FINAL MODEL
 Area



=> Building model 21 of 30 (Lpatel)...

13 input predictor variable(s)

9 variable(s) excluded by 'step' function
 Altitude, AltitudeRange, HabitatDiversity, Latitude, Longitude, Precipitation, PrecipitationSeasonality, Temperature, UrbanArea 

0 variable(s) excluded by 'modelTrim' function
  

4 variable(s) INCLUDED IN THE FINAL MODEL
 HumanPopulation, Area, TemperatureAnnualRange, TemperatureSeasonality



=> Building model 22 of 30 (Lquadr)...

13 input predictor variable(s)

9 variable(s) excluded by 'step' function
 Altitude, AltitudeRange, Latitude, Longitude, Precipitation, PrecipitationSeasonality, TemperatureAnnualRange, TemperatureSeasonality, UrbanArea 

1 variable(s) excluded by 'modelTrim' function
 HumanPopulation 

3 variable(s) INCLUDED IN THE FINAL MODEL
 Area, Temperature, HabitatDiversity



=> Building model 23 of 30 (Mventr)...

13 input predictor variable(s)

9 variable(s) excluded by 'step' function
 AltitudeRange, HabitatDiversity, Latitude, Longitude, Precipitation, PrecipitationSeasonality, TemperatureAnnualRange, Temperature, UrbanArea 

2 variable(s) excluded by 'modelTrim' function
 Altitude, TemperatureSeasonality 

2 variable(s) INCLUDED IN THE FINAL MODEL
 HumanPopulation, Area



=> Building model 24 of 30 (Ppatul)...

13 input predictor variable(s)

8 variable(s) excluded by 'step' function
 AltitudeRange, HumanPopulation, Latitude, Longitude, Precipitation, PrecipitationSeasonality, TemperatureAnnualRange, TemperatureSeasonality 

1 variable(s) excluded by 'modelTrim' function
 Altitude 

4 variable(s) INCLUDED IN THE FINAL MODEL
 Area, Temperature, UrbanArea, HabitatDiversity



=> Building model 25 of 30 (Pquadr)...

13 input predictor variable(s)

8 variable(s) excluded by 'step' function
 Altitude, AltitudeRange, Latitude, Longitude, Precipitation, TemperatureAnnualRange, TemperatureSeasonality, UrbanArea 

0 variable(s) excluded by 'modelTrim' function
  

5 variable(s) INCLUDED IN THE FINAL MODEL
 HumanPopulation, Area, Temperature, PrecipitationSeasonality, HabitatDiversity



=> Building model 26 of 30 (Pvulga)...

13 input predictor variable(s)

7 variable(s) excluded by 'step' function
 AltitudeRange, HumanPopulation, Precipitation, PrecipitationSeasonality, TemperatureAnnualRange, Temperature, TemperatureSeasonality 

3 variable(s) excluded by 'modelTrim' function
 Altitude, Longitude, Area 

3 variable(s) INCLUDED IN THE FINAL MODEL
 HabitatDiversity, UrbanArea, Latitude



=> Building model 27 of 30 (Specti)...

13 input predictor variable(s)

3 variable(s) excluded by 'step' function
 AltitudeRange, HumanPopulation, UrbanArea 

1 variable(s) excluded by 'modelTrim' function
 Precipitation 

9 variable(s) INCLUDED IN THE FINAL MODEL
 PrecipitationSeasonality, HabitatDiversity, Area, Altitude, Temperature, TemperatureSeasonality, TemperatureAnnualRange, Longitude, Latitude



=> Building model 28 of 30 (Tpatin)...

13 input predictor variable(s)

6 variable(s) excluded by 'step' function
 AltitudeRange, Latitude, Longitude, PrecipitationSeasonality, Temperature, TemperatureSeasonality 

1 variable(s) excluded by 'modelTrim' function
 UrbanArea 

6 variable(s) INCLUDED IN THE FINAL MODEL
 HumanPopulation, Area, Altitude, HabitatDiversity, TemperatureAnnualRange, Precipitation



=> Building model 29 of 30 (Tsimil)...

13 input predictor variable(s)

7 variable(s) excluded by 'step' function
 Altitude, AltitudeRange, Latitude, Longitude, TemperatureAnnualRange, TemperatureSeasonality, UrbanArea 

2 variable(s) excluded by 'modelTrim' function
 HumanPopulation, Precipitation 

4 variable(s) INCLUDED IN THE FINAL MODEL
 Area, PrecipitationSeasonality, Temperature, HabitatDiversity



=> Building model 30 of 30 (Ttetra)...

13 input predictor variable(s)

6 variable(s) excluded by 'step' function
 AltitudeRange, Latitude, Longitude, Precipitation, PrecipitationSeasonality, UrbanArea 

0 variable(s) excluded by 'modelTrim' function
  

7 variable(s) INCLUDED IN THE FINAL MODEL
 Area, HumanPopulation, HabitatDiversity, Altitude, Temperature, TemperatureSeasonality, TemperatureAnnualRange

Finished!
It took 4.5 secs.

------------------------------------------------------------------------------

head(rotifers.fav$predictions)

   TDWG4  Abrigh_P  Afissa_P   Apriod_P  Bangul_P  Bcalyc_P  Bplica_P
1 ABT-OO 0.2882603 0.1138959 0.50361345 0.2468886 0.4472060 0.1951515
2 AFG-OO 0.4906287 0.3722796 0.46087753 0.6977093 0.6956644 0.3701844
3 AGE-BA 0.6119061 0.1219451 0.08208813 0.4312721 0.7377861 0.3220030
4 AGE-CH 0.1376871 0.1565695 0.05817764 0.2925746 0.4468215 0.2508469
5 AGE-CN 0.2667640 0.1489743 0.08835735 0.3142329 0.5320916 0.2031516
6 AGE-ER 0.2662901 0.1337515 0.07444270 0.3060692 0.5446412 0.2238783
   Bquadr_P   Burceo_P  Cgibba_P  Edilat_P  Flongi_P  Kcochl_P   Kquadr_P
1 0.3596388 0.20728200 0.3421701 0.5525130 0.7325116 0.8446163 0.70544804
2 0.5750892 0.55870506 0.1794636 0.6698224 0.7912660 0.6847209 0.59711189
3 0.4657336 0.49949786 0.2152587 0.6099271 0.6635060 0.8898363 0.63541290
4 0.2904811 0.08950173 0.1686463 0.3128215 0.2250847 0.3071935 0.06945265
5 0.3667903 0.18076778 0.1429014 0.3737592 0.3644676 0.5555601 0.18225500
6 0.3269149 0.18778977 0.1621041 0.3898079 0.3622259 0.6041055 0.22765216
   Ktropi_P  Lbulla_P  Lclost_P  Lhamat_P   Lluna_P  Llunar_P  Lovali_P
1 0.0267022 0.4853681 0.5062981 0.3366731 0.6588269 0.4890964 0.4893448
2 0.6494431 0.6510904 0.6030307 0.4724633 0.7121817 0.3292166 0.4846269
3 0.6639190 0.6335924 0.4962627 0.4048278 0.6588269 0.6256421 0.4120404
4 0.3359397 0.4399946 0.4169704 0.3278817 0.3585662 0.2527373 0.3689305
5 0.3678857 0.5350041 0.4152728 0.3245237 0.4785813 0.3975688 0.3667740
6 0.3891151 0.5091042 0.4146846 0.3152943 0.4785813 0.3978259 0.3646324
   Lpatel_P  Lquadr_P  Mventr_P  Ppatul_P  Pquadr_P  Pvulga_P  Specti_P
1 0.3680442 0.2661694 0.3926279 0.2064064 0.3011775 0.5254938 0.4940163
2 0.5016545 0.4340005 0.5690260 0.4171618 0.4495798 0.6129105 0.1491373
3 0.4545489 0.3807837 0.3907512 0.3408706 0.5277305 0.6768051 0.5814083
4 0.3229366 0.2454277 0.2717773 0.2344219 0.2393723 0.3904258 0.1051860
5 0.3738074 0.2999787 0.2696623 0.2802226 0.3837669 0.5031433 0.2043009
6 0.3486860 0.2717634 0.2691759 0.2401257 0.3390416 0.5105883 0.2612454
   Tpatin_P  Tsimil_P  Ttetra_P  Abrigh_F  Afissa_F   Apriod_F  Bangul_F
1 0.3694820 0.3416239 0.4897911 0.3929422 0.1810214 0.64250205 0.2775053
2 0.4497798 0.3877166 0.2277752 0.6062073 0.5049141 0.60228041 0.7300388
3 0.6203481 0.5173189 0.7002499 0.7159009 0.1927824 0.13675334 0.4704701
4 0.2823397 0.2834724 0.2363951 0.2033078 0.2419771 0.09863099 0.3264013
5 0.3515606 0.4270929 0.3114777 0.3676721 0.2313754 0.14653098 0.3493272
6 0.3606957 0.3835013 0.3834825 0.3671088 0.2098083 0.12470828 0.3407048
   Bcalyc_F  Bplica_F  Bquadr_F  Burceo_F  Cgibba_F  Edilat_F  Flongi_F
1 0.3884847 0.3165279 0.3869952 0.3364819 0.4832761 0.5474096 0.6974442
2 0.6422208 0.5288872 0.6033917 0.7105967 0.2822621 0.6652464 0.7613922
3 0.6884266 0.4756496 0.4949229 0.6593428 0.3303072 0.6050105 0.6240353
4 0.3881153 0.3900749 0.3151660 0.1601169 0.2672668 0.3084063 0.1964671
5 0.4717359 0.3274791 0.3943556 0.2996891 0.2306436 0.3689457 0.3255742
6 0.4843355 0.3552356 0.3531548 0.3095849 0.2580866 0.3849147 0.3234499
   Kcochl_F  Kquadr_F   Ktropi_F  Lbulla_F  Lclost_F  Lhamat_F   Lluna_F
1 0.7899483 0.8069472 0.04768717 0.4254929 0.5080160 0.4197052 0.5925210
2 0.6004120 0.7211881 0.77176517 0.5943832 0.6046748 0.5606778 0.6507482
3 0.8482189 0.7525812 0.78287862 0.5758938 0.4979809 0.4921963 0.5925210
4 0.2347568 0.1152490 0.48007850 0.3815666 0.4186421 0.4100860 0.2962402
5 0.4637614 0.2800473 0.51509917 0.4746532 0.4169427 0.4063952 0.4086857
6 0.5135542 0.3396847 0.53759883 0.4488548 0.4163538 0.3962031 0.4086857
   Llunar_F  Lovali_F  Lpatel_F  Lquadr_F  Mventr_F  Ppatul_F  Pquadr_F
1 0.5045634 0.5703429 0.3696441 0.4092559 0.4937295 0.3318962 0.3940066
2 0.3430222 0.5657092 0.5033727 0.5942483 0.6657609 0.5775363 0.5520179
3 0.6400178 0.4925857 0.4562535 0.5401335 0.4917607 0.4969217 0.6276694
4 0.2646008 0.4474621 0.3244412 0.3831864 0.3602157 0.3690241 0.3219274
5 0.4124782 0.4451705 0.3754176 0.4500927 0.3577506 0.4264734 0.4844065
6 0.4127383 0.4428913 0.3502485 0.4161518 0.3571829 0.3763929 0.4362557
   Pvulga_F  Specti_F  Tpatin_F  Tsimil_F  Ttetra_F
1 0.4997199 0.6509386 0.4070839 0.4426253 0.5742388
2 0.5881636 0.2508132 0.4892131 0.4921585 0.2929895
3 0.6538360 0.7262463 0.6568825 0.6212495 0.7664720
4 0.3661645 0.1833547 0.3155110 0.3771295 0.3031087
5 0.4773627 0.3290414 0.3884623 0.5329098 0.3885973
6 0.4847985 0.4031391 0.3979678 0.4877121 0.4663547

------------------------------------------------------------------------------

names(rotifers.fav$predictions)

[1] "TDWG4"    "Abrigh_P" "Afissa_P" "Apriod_P" "Bangul_P" "Bcalyc_P"
[7] "Bplica_P" "Bquadr_P" "Burceo_P" "Cgibba_P" "Edilat_P" "Flongi_P"
[13] "Kcochl_P" "Kquadr_P" "Ktropi_P" "Lbulla_P" "Lclost_P" "Lhamat_P"
[19] "Lluna_P"  "Llunar_P" "Lovali_P" "Lpatel_P" "Lquadr_P" "Mventr_P"
[25] "Ppatul_P" "Pquadr_P" "Pvulga_P" "Specti_P" "Tpatin_P" "Tsimil_P"
[31] "Ttetra_P" "Abrigh_F" "Afissa_F" "Apriod_F" "Bangul_F" "Bcalyc_F"
[37] "Bplica_F" "Bquadr_F" "Burceo_F" "Cgibba_F" "Edilat_F" "Flongi_F"
[43] "Kcochl_F" "Kquadr_F" "Ktropi_F" "Lbulla_F" "Lclost_F" "Lhamat_F"
[49] "Lluna_F"  "Llunar_F" "Lovali_F" "Lpatel_F" "Lquadr_F" "Mventr_F"
[55] "Ppatul_F" "Pquadr_F" "Pvulga_F" "Specti_F" "Tpatin_F" "Tsimil_F"
[61] "Ttetra_F"

------------------------------------------------------------------------------

TDWG4shp@data <- data.frame(TDWG4shp@data, rotifers.fav$predictions[match(TDWG4shp@data$Level4_cod, rotifers.fav$predictions$TDWG4), ]) 
print(spplot(TDWG4shp, zcol = "Abrigh_F", col.regions = rev(heat.colors(256)), main = expression(paste(italic("A. brightwellii"), " favourability"))))

------------------------------------------------------------------------------
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

fuz.sim.mat <- simMat(rotifers.fav$predictions[ , 32:61], method = "Jaccard")

Calculating 435 pair-wise similarities...
25% done...
50% done...
75% done...
Finished!
It took 0 secs.

------------------------------------------------------------------------------

head(fuz.sim.mat)

          Abrigh_F  Afissa_F  Apriod_F  Bangul_F  Bcalyc_F  Bplica_F
Abrigh_F 1.0000000 0.6885032 0.5695485 0.7434100 0.7730733 0.7547438
Afissa_F 0.6885032 1.0000000 0.6264172 0.7531596 0.7369473 0.6874820
Apriod_F 0.5695485 0.6264172 1.0000000 0.5810247 0.5769797 0.5461345
Bangul_F 0.7434100 0.7531596 0.5810247 1.0000000 0.8050393 0.7812502
Bcalyc_F 0.7730733 0.7369473 0.5769797 0.8050393 1.0000000 0.7550428
Bplica_F 0.7547438 0.6874820 0.5461345 0.7812502 0.7550428 1.0000000
          Bquadr_F  Burceo_F  Cgibba_F  Edilat_F  Flongi_F  Kcochl_F
Abrigh_F 0.7699855 0.8071252 0.6467572 0.8382622 0.7976029 0.6876936
Afissa_F 0.7578220 0.6943048 0.7112354 0.6798026 0.6726187 0.6179437
Apriod_F 0.5856199 0.6304195 0.6937945 0.6088664 0.6580670 0.6478990
Bangul_F 0.8213386 0.7429234 0.6694654 0.7681282 0.7328144 0.6632172
Bcalyc_F 0.8167354 0.7572393 0.6467867 0.7630700 0.7536400 0.7051751
Bplica_F 0.7420208 0.7345908 0.6496413 0.7818441 0.6860334 0.6323739
          Kquadr_F  Ktropi_F  Lbulla_F  Lclost_F  Lhamat_F   Lluna_F
Abrigh_F 0.5771902 0.6061760 0.7877640 0.7651796 0.7724919 0.7845104
Afissa_F 0.5267707 0.5372624 0.7344145 0.7367502 0.7168065 0.7092101
Apriod_F 0.6906086 0.3846896 0.5735953 0.6363962 0.5781050 0.6491776
Bangul_F 0.5558265 0.6578135 0.7807259 0.7765725 0.7506223 0.7453482
Bcalyc_F 0.5724123 0.6485038 0.7861056 0.8051571 0.7768210 0.7820106
Bplica_F 0.5510987 0.6115445 0.7120938 0.7704562 0.7743338 0.6939060
          Llunar_F  Lovali_F  Lpatel_F  Lquadr_F  Mventr_F  Ppatul_F
Abrigh_F 0.7808545 0.7419325 0.7597933 0.7885556 0.7488693 0.7600375
Afissa_F 0.6823918 0.7075857 0.7172600 0.7166390 0.7118972 0.7142111
Apriod_F 0.6383935 0.6442864 0.6072355 0.5609833 0.6258756 0.5377853
Bangul_F 0.6910413 0.7388344 0.7284901 0.7818688 0.7654429 0.7775781
Bcalyc_F 0.7189121 0.7478242 0.7632908 0.7718501 0.8086024 0.7494744
Bplica_F 0.6878962 0.7422409 0.7604410 0.7301912 0.7598389 0.7317468
          Pquadr_F  Pvulga_F  Specti_F  Tpatin_F  Tsimil_F  Ttetra_F
Abrigh_F 0.8280828 0.7855441 0.6504099 0.8076532 0.8037092 0.7558690
Afissa_F 0.7343623 0.7376729 0.6219141 0.6895287 0.7219462 0.6732718
Apriod_F 0.6092096 0.6191958 0.7038572 0.5862773 0.6240024 0.6207379
Bangul_F 0.7618938 0.7808401 0.5928557 0.7660893 0.7365902 0.6771185
Bcalyc_F 0.7892297 0.8605739 0.6292223 0.7734078 0.7527101 0.7537241
Bplica_F 0.7303069 0.7282325 0.5747519 0.7836638 0.7126154 0.6872516

------------------------------------------------------------------------------

image(x = 1:ncol(fuz.sim.mat), y = 1:nrow(fuz.sim.mat), z = fuz.sim.mat, col = rev(heat.colors(256)), xlab = "", ylab = "", axes = FALSE, main = "Fuzzy Jaccard similarity")
axis(side = 1, at = 1:ncol(fuz.sim.mat), tick = FALSE, labels = colnames(fuz.sim.mat), las = 2, cex.axis = 0.8)
axis(side = 2, at = 1:nrow(fuz.sim.mat), tick = FALSE, labels = rownames(fuz.sim.mat), las = 2, cex.axis = 0.8)

------------------------------------------------------------------------------
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

fuz.dendro <- hclust(as.dist(1 - fuz.sim.mat), method = "average")
plot(fuz.dendro, main = "Fuzzy dendrogram", xlab = "", ylab = "", sub = "Fuzzy Jaccard index\nUPGMA clustering")

------------------------------------------------------------------------------
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

names(rotif.env)

[1] "TDWG4"                    "LEVEL_NAME"               "REGION_NAME"             
[4] "CONTINENT"                "Area"                     "Altitude"                
[7] "AltitudeRange"            "HabitatDiversity"         "HumanPopulation"         
[10] "Latitude"                 "Longitude"                "Precipitation"           
[13] "PrecipitationSeasonality" "TemperatureAnnualRange"   "Temperature"             
[16] "TemperatureSeasonality"   "UrbanArea"                "Abrigh"                  
[19] "Afissa"                   "Apriod"                   "Bangul"                  
[22] "Bcalyc"                   "Bplica"                   "Bquadr"                  
[25] "Burceo"                   "Cgibba"                   "Edilat"                  
[28] "Flongi"                   "Kcochl"                   "Kquadr"                  
[31] "Ktropi"                   "Lbulla"                   "Lclost"                  
[34] "Lhamat"                   "Lluna"                    "Llunar"                  
[37] "Lovali"                   "Lpatel"                   "Lquadr"                  
[40] "Mventr"                   "Ppatul"                   "Pquadr"                  
[43] "Pvulga"                   "Specti"                   "Tpatin"                  
[46] "Tsimil"                   "Ttetra" 

------------------------------------------------------------------------------

bin.sim.mat <- simMat(rotif.env[ , 18:47], method = "Jaccard")

Calculating 435 pair-wise similarities...
25% done...
50% done...
75% done...
Finished!
It took 0 secs.

------------------------------------------------------------------------------

if (!("vegan" %in% rownames(installed.packages()))) install.packages("vegan")

Installing package into ‘/cloud/lib/x86_64-pc-linux-gnu-library/4.1’
(as ‘lib’ is unspecified)
also installing the dependency ‘permute’

trying URL 'http://package-proxy/focal/src/contrib/permute_0.9-5.tar.gz'
Content type 'application/x-tar' length 499323 bytes (487 KB)
==================================================
downloaded 487 KB

trying URL 'http://package-proxy/focal/src/contrib/vegan_2.5-7.tar.gz'
Content type 'application/x-tar' length 3666644 bytes (3.5 MB)
==================================================
downloaded 3.5 MB

* installing *binary* package ‘permute’ ...
* DONE (permute)
* installing *binary* package ‘vegan’ ...
* DONE (vegan)

The downloaded source packages are in
	‘/tmp/RtmpB69mVV/downloaded_packages’

------------------------------------------------------------------------------

library(vegan) 

Loading required package: permute
Loading required package: lattice
This is vegan 2.5-7

------------------------------------------------------------------------------

mantel(bin.sim.mat, fuz.sim.mat, method = "spearman")

Mantel statistic based on Spearman's rank correlation rho 

Call:
mantel(xdis = bin.sim.mat, ydis = fuz.sim.mat, method = "spearman") 

Mantel statistic r: 0.6778 
      Significance: 0.001 

Upper quantiles of permutations (null model):
  90%   95% 97.5%   99% 
0.171 0.232 0.270 0.297 
Permutation: free
Number of permutations: 999

------------------------------------------------------------------------------
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@


names(rotif.env) 
bin.reg <- transpose(rotif.env, sp.cols = 18:47, reg.names = 1) 
names(rotifers.fav$predictions) 
fuz.reg <- transpose(rotifers.fav$predictions, sp.cols = 32:61, reg.names = 1) 

[1] "TDWG4"    "Abrigh_P" "Afissa_P" "Apriod_P" "Bangul_P" "Bcalyc_P" "Bplica_P" "Bquadr_P"
[9] "Burceo_P" "Cgibba_P" "Edilat_P" "Flongi_P" "Kcochl_P" "Kquadr_P" "Ktropi_P" "Lbulla_P"
[17] "Lclost_P" "Lhamat_P" "Lluna_P"  "Llunar_P" "Lovali_P" "Lpatel_P" "Lquadr_P" "Mventr_P"
[25] "Ppatul_P" "Pquadr_P" "Pvulga_P" "Specti_P" "Tpatin_P" "Tsimil_P" "Ttetra_P" "Abrigh_F"
[33] "Afissa_F" "Apriod_F" "Bangul_F" "Bcalyc_F" "Bplica_F" "Bquadr_F" "Burceo_F" "Cgibba_F"
[41] "Edilat_F" "Flongi_F" "Kcochl_F" "Kquadr_F" "Ktropi_F" "Lbulla_F" "Lclost_F" "Lhamat_F"
[49] "Lluna_F"  "Llunar_F" "Lovali_F" "Lpatel_F" "Lquadr_F" "Mventr_F" "Ppatul_F" "Pquadr_F"
[57] "Pvulga_F" "Specti_F" "Tpatin_F" "Tsimil_F" "Ttetra_F"
> fuz.reg <- transpose(rotifers.fav$predictions, sp.cols = 32:61, reg.names = 1)

------------------------------------------------------------------------------

head(bin.reg)

       ABT-OO AFG-OO AGE-BA AGE-CH AGE-CN AGE-ER AGE-SF AGS-CB AGS-NE AGS-RN AGS-SC AGS-TF
Abrigh      0      1      1      0      0      0      1      1      0      0      1      1
Afissa      0      0      1      0      0      0      1      0      0      0      0      0
Apriod      1      1      0      0      0      0      0      0      0      0      0      1
       AGW-CA AGW-JU AGW-LR AGW-ME AGW-SA AGW-SE AGW-SJ AGW-SL AGW-TU ALG-OO ARI-OO ARK-OO
Abrigh      0      0      0      0      0      0      0      0      0      1      1      0
Afissa      0      0      0      0      0      0      0      0      1      0      1      0
Apriod      0      0      0      0      0      0      0      0      0      1      0      0
       ARU-OO ASK-OO ASS-AS ASS-MA ASS-ME ASS-MI ASS-NA ASS-TR ATP-OO AUT-AU AZO-OO BAH-OO
Abrigh      1      0      0      0      0      0      0      0      0      1      1      0
Afissa      0      0      0      0      0      0      0      0      0      1      1      1
Apriod      0      1      0      0      0      0      0      0      0      1      0      0
       BGM-BE BLR-OO BLT-ES BLT-KA BLT-LI BOL-OO BOR-KA BRC-OO BRY-OO BUL-OO BZC-MS BZC-MT
Abrigh      1      0      1      0      0      1      1      0      0      0      0      1
Afissa      1      0      1      0      0      0      1      0      0      0      0      1
Apriod      1      0      1      0      1      0      1      1      1      1      0      0
       BZE-MA BZE-PE BZL-ES BZL-MG BZL-RJ BZL-SP BZN-AM BZN-PA BZN-RM BZN-RO BZS-PR CAL-OO
Abrigh      0      1      0      0      0      0      1      1      1      0      0      1
Afissa      0      0      0      0      0      0      1      1      0      0      0      1
Apriod      0      1      0      0      0      0      1      1      0      0      0      1
       CAY-OO CBD-OO CHA-OO CHC-YN CHM-HJ CHN-SD CHQ-OO CHS-HE CHS-HN CLC-BI CLC-LA CLC-MA
Abrigh      0      0      1      0      0      0      1      0      0      0      0      0
Afissa      0      0      1      0      0      0      0      0      0      0      0      0
Apriod      0      0      0      0      1      0      0      0      0      0      0      0
       CLC-OH CLM-OO CLS-LL CMN-OO CNT-OO COL-OO COM-CO COS-OO CPP-EC CPP-NC CPP-WC CPV-OO
Abrigh      1      1      0      0      0      1      0      1      0      0      0      0
Afissa      0      0      1      1      0      0      0      0      0      0      0      1
Apriod      0      0      0      0      1      1      0      0      0      0      0      0
       CTM-OO CUB-OO CZE-CZ CZE-SL DEN-OO DOM-OO ECU-OO EGY-OO EHM-AP ELS-OO ETH-OO FIN-OO
Abrigh      0      1      1      1      0      0      0      0      0      1      1      1
Afissa      0      0      1      1      0      0      1      1      0      0      1      1
Apriod      0      0      1      1      1      0      0      0      0      0      1      1
       FLA-OO FRA-FR GAM-OO GEO-OO GER-OO GHA-OO GNL-OO GRB-OO GRC-OO GUA-OO GUI-OO GUY-OO
Abrigh      1      1      0      0      1      0      0      1      0      1      0      0
Afissa      1      1      0      1      1      0      0      1      1      0      1      0
Apriod      0      1      0      0      1      0      0      1      1      0      0      0
       HAW-HI HON-OO HUN-OO ICE-OO IDA-OO ILL-OO IND-AP IND-DE IND-GU IND-HA IND-JK IND-KE
Abrigh      0      1      1      1      0      1      1      0      0      0      0      0
Afissa      0      0      1      0      0      1      0      1      1      0      1      1
Apriod      0      0      1      1      1      1      0      1      1      0      0      0
       IND-KT IND-MP IND-MR IND-OR IND-PU IND-RA IND-TN IND-UP IND-WB INI-OO IOW-OO IRE-IR
Abrigh      0      0      0      0      1      0      0      1      1      1      0      0
Afissa      0      0      0      0      1      1      0      1      1      0      0      0
Apriod      0      0      0      0      0      0      0      1      1      1      0      0
       IRK-OO IRN-OO ITA-IT IVO-OO JAM-OO JAP-HK JAP-HN JAP-KY JAW-OO JNF-OO KAM-OO KAZ-OO
Abrigh      0      0      1      1      0      0      1      0      1      0      0      0
Afissa      0      0      1      1      0      1      1      1      1      0      0      0
Apriod      1      0      1      1      0      1      1      1      0      0      1      1
       KEG-OO KEN-OO KOR-SK KRA-OO KTY-OO LAB-OO LAO-OO LBS-SY LEE-AB LEE-AG LEE-GU LEE-MO
Abrigh      0      1      0      0      1      0      0      1      0      0      0      0
Afissa      0      1      0      0      1      0      0      0      0      0      1      0
Apriod      0      0      0      0      1      1      0      0      0      0      0      0
       LEE-NL LEE-SM LEE-VI LOU-OO LSI-BA LSI-LS MAI-OO MAS-OO MDG-OO MIC-OO MIN-OO MLI-OO
Abrigh      0      0      0      0      0      0      0      0      0      1      1      1
Afissa      0      0      0      0      1      0      0      0      1      1      1      1
Apriod      0      0      0      0      0      0      0      0      0      1      0      1
       MLW-OO MLY-PM MLY-SI MON-OO MOR-MO MOZ-OO MRY-OO MSO-OO MTN-OO MXC-DF MXC-ME MXE-GU
Abrigh      1      1      1      1      1      0      0      0      0      1      1      0
Afissa      0      1      1      0      0      0      0      1      1      0      1      0
Apriod      0      1      0      0      0      0      0      0      0      0      0      0
       MYA-OO NAT-OO NBR-OO NCA-OO NCS-DA NCS-KC NCS-KR NDA-OO NEB-OO NEP-OO NET-OO NEV-OO
Abrigh      0      1      0      0      1      0      1      0      0      0      1      0
Afissa      1      0      0      0      0      0      0      0      0      0      1      0
Apriod      0      0      1      1      1      0      0      0      0      0      1      0
       NFL-NE NGA-OO NIC-OO NLA-BO NLA-CU NNS-OO NOR-OO NSC-OO NSW-NS NTA-OO NUN-OO NWG-PN
Abrigh      0      1      1      0      0      1      0      0      1      1      0      0
Afissa      0      1      1      0      0      1      1      1      1      0      0      0
Apriod      1      1      1      0      0      0      1      1      1      0      0      0
       NWH-OO NWJ-OO NWT-OO NWY-OO NZN-OO NZS-OO OFS-OO OHI-OO OMA-OO ONT-OO ORE-OO PAL-IS
Abrigh      0      1      0      0      0      1      0      0      0      1      0      1
Afissa      0      0      0      1      1      1      0      0      0      1      0      0
Apriod      1      0      1      0      1      1      0      0      0      1      0      1
       PAN-OO PAR-OO PEN-OO PER-OO PHI-OO POL-OO POR-OO PUE-OO QLD-QU QUE-OO REU-OO ROM-OO
Abrigh      1      1      0      1      0      1      0      0      1      1      0      1
Afissa      1      1      0      1      1      1      0      0      0      0      0      1
Apriod      1      0      1      0      0      1      1      0      1      1      0      1
       RUC-OO RUE-OO RUN-OO RUS-OO RUW-OO RWA-OO SAS-OO SCA-OO SEN-OO SEY-OO SIE-OO SOA-OO
Abrigh      0      0      1      1      0      1      0      0      1      0      0      1
Afissa      1      0      1      1      1      0      0      0      1      0      0      1
Apriod      1      0      1      1      1      0      0      0      1      0      0      1
       SPA-AN SPA-SP SRL-OO SUD-OO SUM-OO SUR-OO SWE-OO SWI-OO TAI-OO TAN-OO TAS-OO TCS-AR
Abrigh      0      1      1      1      0      0      1      0      1      0      0      0
Afissa      0      1      1      1      0      1      1      1      1      1      1      0
Apriod      1      1      1      1      0      1      1      1      1      0      0      1
       TCS-GR TEN-OO TEX-OO THA-OO TRT-OO TUE-OO TUN-OO TUR-OO TVL-GA TVL-MP TVL-NP TVL-NW
Abrigh      1      1      0      1      0      1      0      1      0      1      0      0
Afissa      0      0      1      1      0      0      0      1      0      0      0      0
Apriod      0      0      0      1      0      0      0      1      0      0      0      0
       UGA-OO UKR-UK URU-OO UZB-OO VEN-OO VER-OO VIC-OO VNA-OO VRG-OO WAS-OO WAU-WA WHM-JK
Abrigh      1      0      0      0      1      0      1      0      0      0      1      1
Afissa      1      1      0      0      1      0      1      0      0      0      0      1
Apriod      0      1      0      0      1      0      1      0      0      0      0      1
       WIN-BA WIN-DO WIN-GR WIN-MA WIS-OO WSB-OO YAK-OO YUG-CR YUG-MA YUG-SE YUG-SL YUK-OO
Abrigh      0      0      0      1      1      0      0      0      0      1      1      0
Afissa      0      0      0      0      1      0      0      0      1      1      1      0
Apriod      0      0      0      0      1      1      1      1      1      1      1      1
       ZAI-OO ZAM-OO ZIM-OO
Abrigh      1      1      1
Afissa      1      0      1
Apriod      1      0      1
 [ reached 'max' / getOption("max.print") -- omitted 3 rows ]


head(fuz.reg)

            ABT-OO    AFG-OO    AGE-BA     AGE-CH    AGE-CN    AGE-ER    AGE-SF     AGS-CB
Abrigh_F 0.3929422 0.6062073 0.7159009 0.20330778 0.3676721 0.3671088 0.3532417 0.73590992
Afissa_F 0.1810214 0.5049141 0.1927824 0.24197709 0.2313754 0.2098083 0.2089038 0.12380621
Apriod_F 0.6425020 0.6022804 0.1367533 0.09863099 0.1465310 0.1247083 0.1056811 0.09125579
             AGS-NE    AGS-RN     AGS-SC     AGS-TF     AGW-CA     AGW-JU     AGW-LR
Abrigh_F 0.64166047 0.7208807 0.70895281 0.57428450 0.54114216 0.53576540 0.49095818
Afissa_F 0.14962878 0.1744879 0.10063827 0.09646211 0.18073781 0.23803705 0.15220590
Apriod_F 0.07085704 0.1102531 0.09557697 0.07496765 0.05569156 0.03914702 0.05684545
             AGW-ME    AGW-SA     AGW-SE     AGW-SJ     AGW-SL     AGW-TU    ALG-OO    ARI-OO
Abrigh_F 0.58308871 0.5752421 0.39313118 0.58785345 0.23948517 0.37141131 0.8728946 0.5832924
Afissa_F 0.20788534 0.1935184 0.20810625 0.19698096 0.18290384 0.15518119 0.4717417 0.4276896
Apriod_F 0.09131274 0.0565383 0.07368547 0.07606153 0.06721442 0.05874088 0.8682851 0.4136428
            ARK-OO    ARU-OO     ASK-OO    ASS-AS    ASS-MA     ASS-ME     ASS-MI    ASS-NA
Abrigh_F 0.2303895 0.2291658 0.41254834 0.4730496 0.3140882 0.05288786 0.05822236 0.1217299
Afissa_F 0.4046447 0.2914816 0.05400156 0.5651592 0.6215122 0.51049988 0.63369271 0.5852724
Apriod_F 0.5497504 0.2148663 0.79383222 0.4922297 0.4609506 0.40481355 0.44603414 0.4775223
            ASS-TR    ATP-OO    AUT-AU    AZO-OO    BAH-OO    BGM-BE    BLR-OO    BLT-ES
Abrigh_F 0.1162797 0.4969319 0.5363531 0.5879157 0.6707902 0.6019869 0.3422968 0.4033008
Afissa_F 0.6489621 0.4969309 0.5297972 0.4176920 0.3063115 0.6055179 0.4547758 0.3725715
Apriod_F 0.4551547 0.3375057 0.7385971 0.5594584 0.3111824 0.7951398 0.8036960 0.8044027
            BLT-KA    BLT-LI    BOL-OO    BOR-KA    BRC-OO    BRY-OO    BUL-OO    BZC-MS
Abrigh_F 0.3357196 0.3462812 0.7832893 0.6241398 0.6909945 0.1885879 0.5058087 0.4428122
Afissa_F 0.3865717 0.4033872 0.3703918 0.7918103 0.2969775 0.2095936 0.5745125 0.3431524
Apriod_F 0.7794375 0.7944405 0.2148041 0.6914291 0.7543158 0.7383609 0.7556341 0.1608042
            BZC-MT    BZE-MA    BZE-PE    BZL-ES    BZL-MG    BZL-RJ    BZL-SP    BZN-AM
Abrigh_F 0.5521956 0.5168455 0.5649556 0.3554426 0.4850824 0.5058106 0.7465585 0.5987181
Afissa_F 0.5603653 0.4618306 0.3120043 0.3435996 0.3536982 0.2905561 0.2955413 0.4955609
Apriod_F 0.2198412 0.1638692 0.1350716 0.1334829 0.1414135 0.1148234 0.1263375 0.5520221
            BZN-PA    BZN-RM    BZN-RO    BZS-PR    CAL-OO    CAY-OO    CBD-OO    CHA-OO
Abrigh_F 0.6273864 0.4150843 0.2349445 0.5327826 0.6540357 0.3273427 0.5236494 0.5152632
Afissa_F 0.5088422 0.4562337 0.5572805 0.3461145 0.9228416 0.3541667 0.7577818 0.5107282
Apriod_F 0.3868866 0.2292342 0.1451896 0.1856104 0.3620816 0.2642922 0.4519164 0.3238491
            CHC-YN    CHM-HJ    CHN-SD    CHQ-OO    CHS-HE    CHS-HN     CLC-BI     CLC-LA
Abrigh_F 0.7210745 0.2294449 0.2999473 0.4491471 0.5715615 0.6322440 0.49494837 0.50722147
Afissa_F 0.5974869 0.1871003 0.2562580 0.4698520 0.3580411 0.3711375 0.13313038 0.15218733
Apriod_F 0.5611632 0.7231136 0.5440803 0.6459861 0.6300887 0.7067535 0.04460128 0.05337986
             CLC-MA     CLC-OH    CLM-OO     CLS-LL    CMN-OO    CNT-OO    COL-OO    COM-CO
Abrigh_F 0.49432110 0.49409186 0.8161622 0.52929833 0.6338516 0.2176368 0.5266688 0.1832486
Afissa_F 0.12267940 0.10468583 0.4774039 0.11223017 0.6361118 0.3977107 0.5152615 0.4033376
Apriod_F 0.03908131 0.03491436 0.4810177 0.06697312 0.3422136 0.6480073 0.4885579 0.2428734
            COS-OO    CPP-EC    CPP-NC    CPP-WC    CPV-OO     CTM-OO    CUB-OO    CZE-CZ
Abrigh_F 0.5658257 0.6574693 0.4215050 0.6709337 0.1514529 0.05757219 0.7532384 0.4853069
Afissa_F 0.4632557 0.4614130 0.4099738 0.4548363 0.5208300 0.04617889 0.4790297 0.5252753
Apriod_F 0.2134120 0.1826243 0.1732183 0.1746352 0.0836138 0.04654374 0.2930233 0.7321038
            CZE-SL    DEN-OO    DOM-OO    ECU-OO    EGY-OO    EHM-AP    ELS-OO    ETH-OO
Abrigh_F 0.3549188 0.4675049 0.7311962 0.7020341 0.7646596 0.3304903 0.4559959 0.8775747
Afissa_F 0.4834472 0.5546825 0.5817098 0.4154157 0.6880282 0.5560156 0.5018959 0.7608396
Apriod_F 0.7394655 0.7961566 0.3350907 0.2180586 0.7524192 0.4800124 0.1351999 0.4821450
            FIN-OO    FLA-OO    FRA-FR    GAM-OO    GEO-OO    GER-OO    GHA-OO    GNL-OO
Abrigh_F 0.5123352 0.6776575 0.8385320 0.1427800 0.3736541 0.7739855 0.6660334 0.3458346
Afissa_F 0.4387420 0.7190788 0.8905828 0.5948956 0.6585095 0.9923525 0.5733313 0.2122930
Apriod_F 0.8643347 0.4073897 0.8368807 0.1019000 0.5366624 0.8269973 0.3049086 0.9748567
            GRB-OO    GRC-OO    GUA-OO    GUI-OO    GUY-OO     HAW-HI    HON-OO    HUN-OO
Abrigh_F 0.7625386 0.4755488 0.6789226 0.4437715 0.4004273 0.04231733 0.6436099 0.3969155
Afissa_F 0.9975990 0.4822145 0.4349494 0.7197461 0.4419775 0.32988228 0.4674602 0.6322318
Apriod_F 0.8146703 0.6416560 0.2160480 0.2155765 0.2643717 0.25129771 0.2417997 0.7555740
            ICE-OO    IDA-OO    ILL-OO    IND-AP     IND-DE    IND-GU    IND-HA    IND-JK
Abrigh_F 0.5082779 0.5552689 0.2670469 0.7071323 0.09047579 0.3583146 0.2183575 0.2017269
Afissa_F 0.5414959 0.4756392 0.6350709 0.6777516 0.40347055 0.5864957 0.4736372 0.6197222
Apriod_F 0.8304656 0.5537844 0.5662594 0.3755234 0.23868536 0.1993569 0.2927731 0.3258174
            IND-KE    IND-KT    IND-MP    IND-MR    IND-OR    IND-PU    IND-RA    IND-TN
Abrigh_F 0.2281858 0.5549016 0.4249350 0.6594027 0.4324526 0.2240404 0.3599343 0.7415639
Afissa_F 0.5733388 0.7193898 0.6206976 0.7459425 0.6428687 0.4845615 0.4959668 0.6455729
Apriod_F 0.3107917 0.3361804 0.2739452 0.3113191 0.3514911 0.3392127 0.2794376 0.3830099
            IND-UP    IND-WB    INI-OO    IOW-OO    IRE-IR    IRK-OO    IRN-OO    ITA-IT
Abrigh_F 0.7213968 0.6915779 0.3451160 0.1316999 0.6286821 0.2758484 0.8510148 0.7294979
Afissa_F 0.5560274 0.6964883 0.4151191 0.2059193 0.6192469 0.3050655 0.5650778 0.5898506
Apriod_F 0.3116592 0.3870620 0.5787877 0.4804288 0.7717936 0.8827615 0.7972514 0.7507631
            IVO-OO    JAM-OO    JAP-HK    JAP-HN    JAP-KY    JAW-OO     JNF-OO    KAM-OO
Abrigh_F 0.6688213 0.5652839 0.3542238 0.5283328 0.3301475 0.8163576 0.18228161 0.5139274
Afissa_F 0.6060732 0.3937481 0.5170370 0.8720265 0.5146050 0.9009810 0.11974266 0.4605354
Apriod_F 0.3207514 0.2970998 0.8529413 0.8254714 0.7039349 0.4006163 0.06168377 0.9356935
            KAZ-OO     KEG-OO    KEN-OO    KOR-SK    KRA-OO    KTY-OO    LAB-OO    LAO-OO
Abrigh_F 0.8152019 0.07620891 0.7959855 0.2622837 0.5902481 0.2995012 0.3895046 0.4700089
Afissa_F 0.7716535 0.28303297 0.6956445 0.4409247 0.3196730 0.4069061 0.2301191 0.6992091
Apriod_F 0.9810188 0.21017237 0.3259201 0.6564795 0.9843478 0.5911503 0.7488772 0.4435825
            LBS-SY    LEE-AB    LEE-AG    LEE-GU    LEE-MO    LEE-NL    LEE-SM    LEE-VI
Abrigh_F 0.4979249 0.6277572 0.2994253 0.3119152 0.2131706 0.4442821 0.4535721 0.5145783
Afissa_F 0.4054957 0.3795397 0.3778452 0.4450934 0.4407219 0.3746285 0.3759431 0.4080574
Apriod_F 0.5002859 0.3706464 0.3811121 0.3522934 0.3851401 0.3694040 0.3751105 0.3524587
            LOU-OO    LSI-BA    LSI-LS    MAI-OO    MAS-OO    MDG-OO    MIC-OO    MIN-OO
Abrigh_F 0.5203438 0.3454386 0.3640904 0.1782182 0.2881102 0.4809250 0.4669845 0.2148972
Afissa_F 0.4544596 0.7100190 0.6951940 0.3198140 0.5279397 0.4083453 0.6128532 0.2330461
Apriod_F 0.5235839 0.3497663 0.3349146 0.6660247 0.6504566 0.1847402 0.6373145 0.5033303
            MLI-OO    MLW-OO    MLY-PM    MLY-SI    MON-OO    MOR-MO    MOZ-OO    MRY-OO
Abrigh_F 0.4162121 0.4893887 0.5003532 0.2544910 0.3998779 0.7137933 0.6538056 0.4852094
Afissa_F 0.4542052 0.3845628 0.8102109 0.7837755 0.1757810 0.5881887 0.4142073 0.4538152
Apriod_F 0.3395425 0.1190786 0.5618955 0.5636386 0.8501748 0.5383460 0.2146896 0.6082349
            MSO-OO    MTN-OO    MXC-DF    MXC-ME    MXE-GU    MYA-OO    NAT-OO    NBR-OO
Abrigh_F 0.1975781 0.2468420 0.4538909 0.7246753 0.6269990 0.7041168 0.5096014 0.2383562
Afissa_F 0.4504874 0.4178378 0.6581235 0.6151664 0.5703875 0.7670028 0.4319427 0.2858306
Apriod_F 0.5433581 0.3569461 0.1436251 0.1482058 0.1489520 0.5655227 0.1511966 0.6864773
            NCA-OO    NCS-DA    NCS-KC    NCS-KR    NDA-OO    NEB-OO    NEP-OO    NET-OO
Abrigh_F 0.5277519 0.4753627 0.4936604 0.5232976 0.2019981 0.2735461 0.5475922 0.7022682
Afissa_F 0.5975812 0.3703775 0.5323061 0.6713364 0.1280752 0.2518558 0.5020603 0.6800975
Apriod_F 0.5822268 0.7172700 0.6987167 0.7863041 0.4444462 0.4219897 0.4354641 0.7908127
            NEV-OO    NFL-NE    NGA-OO    NIC-OO    NLA-BO    NLA-CU    NNS-OO    NOR-OO
Abrigh_F 0.6341582 0.4892685 0.8878246 0.5639519 0.4519461 0.4461997 0.3895479 0.4874712
Afissa_F 0.5072586 0.3488948 0.6435198 0.4161453 0.2379221 0.2738720 0.5885145 0.6023230
Apriod_F 0.5520578 0.7160025 0.3510100 0.2143750 0.2003591 0.2167183 0.7495619 0.8600996
            NSC-OO    NSW-NS    NTA-OO     NUN-OO    NWG-PN    NWH-OO    NWJ-OO     NWT-OO
Abrigh_F 0.3569326 0.7178132 0.6591614 0.13094424 0.5333315 0.1873015 0.4720882 0.08989520
Afissa_F 0.3004185 0.7615348 0.5665040 0.04119803 0.8152817 0.3519125 0.5994269 0.02775371
Apriod_F 0.6592119 0.5687225 0.5035127 0.84882799 0.6375836 0.6497905 0.6202030 0.77972613
            NWY-OO    NZN-OO    NZS-OO    OFS-OO    OHI-OO    OMA-OO    ONT-OO    ORE-OO
Abrigh_F 0.2455578 0.5760599 0.5550568 0.3445975 0.4750394 0.3993250 0.4663669 0.5703004
Afissa_F 0.7096619 0.6933667 0.5850689 0.4228462 0.7040061 0.4893215 0.2980460 0.5413205
Apriod_F 0.6513949 0.4276370 0.4061748 0.1459565 0.5988546 0.3901573 0.7981523 0.4802005
            PAL-IS    PAN-OO    PAR-OO    PEN-OO    PER-OO    PHI-OO    POL-OO    POR-OO
Abrigh_F 0.2664529 0.6288858 0.5569527 0.2479297 0.8647864 0.7402182 0.6573028 0.5156629
Afissa_F 0.4141319 0.4089365 0.2779871 0.7093521 0.4807697 0.8048162 0.6343933 0.4770954
Apriod_F 0.3390450 0.2082891 0.1733399 0.6264581 0.3569566 0.6258738 0.7956943 0.5478199
            PUE-OO    QLD-QU    QUE-OO    REU-OO    ROM-OO    RUC-OO    RUE-OO    RUN-OO
Abrigh_F 0.5881384 0.7404934 0.5371371 0.4407360 0.5080556 0.6396376 0.4706649 0.7157785
Afissa_F 0.5520572 0.6332952 0.1838210 0.2873899 0.6945021 0.9994888 0.8724690 0.5760118
Apriod_F 0.3482749 0.6416652 0.8805908 0.2204986 0.7559639 0.8993790 0.9021571 0.9580000
            RUS-OO    RUW-OO    RWA-OO     SAS-OO    SCA-OO    SEN-OO    SEY-OO    SIE-OO
Abrigh_F 0.4909011 0.3931816 0.5474083 0.30831846 0.4258288 0.3043117 0.2679383 0.2725395
Afissa_F 0.7624683 0.5004809 0.7228078 0.09151508 0.4877235 0.5647889 0.4139035 0.5877666
Apriod_F 0.8583793 0.8298414 0.3077211 0.64340455 0.5369778 0.1242290 0.3322590 0.2212452
            SOA-OO    SPA-AN    SPA-SP    SRL-OO    SUD-OO    SUM-OO    SUR-OO    SWE-OO
Abrigh_F 0.7544019 0.1983949 0.7588486 0.5607888 0.8601617 0.7237991 0.4445562 0.5989613
Afissa_F 0.6564155 0.4842932 0.6049085 0.6201364 0.6425454 0.8447060 0.4599236 0.8151953
Apriod_F 0.5767652 0.7365437 0.7265972 0.4035501 0.6795586 0.6290428 0.2595616 0.8689250
            SWI-OO    TAI-OO    TAN-OO    TAS-OO    TCS-AR    TCS-GR    TEN-OO    TEX-OO
Abrigh_F 0.5661709 0.4898011 0.7858681 0.4331678 0.3899058 0.5011921 0.3043816 0.6688966
Afissa_F 0.4937579 0.5503115 0.5500333 0.5272960 0.5156088 0.5783281 0.5300245 0.8468296
Apriod_F 0.7566222 0.5657367 0.3406981 0.3215322 0.6651299 0.7258715 0.5730651 0.5363576
            THA-OO    TRT-OO    TUE-OO    TUN-OO    TUR-OO    TVL-GA    TVL-MP    TVL-NP
Abrigh_F 0.7200981 0.2300860 0.4766112 0.6118614 0.7379706 0.2656759 0.4410453 0.4445877
Afissa_F 0.8528335 0.4694674 0.4648808 0.4913789 0.5482972 0.4506198 0.4028998 0.3892580
Apriod_F 0.5420799 0.2808068 0.6717096 0.5600384 0.7667519 0.1204702 0.1313755 0.1244802
            TVL-NW    UGA-OO    UKR-UK    URU-OO    UZB-OO    VEN-OO    VER-OO    VIC-OO
Abrigh_F 0.5000329 0.7021399 0.6696102 0.5205871 0.3083359 0.7955156 0.1729678 0.6653755
Afissa_F 0.4064120 0.7559385 0.9997511 0.2418432 0.5961421 0.4986398 0.2910946 0.7637511
Apriod_F 0.1264855 0.4004566 0.8483458 0.1792449 0.7286073 0.3844950 0.6322253 0.3911673
            VNA-OO    VRG-OO    WAS-OO    WAU-WA    WHM-JK    WIN-BA    WIN-DO    WIN-GR
Abrigh_F 0.5691532 0.5284953 0.5025620 0.8507443 0.5945836 0.2999713 0.1824561 0.2441810
Afissa_F 0.3720367 0.5589524 0.4780264 0.5861129 0.4024827 0.4612537 0.4578696 0.4551919
Apriod_F 0.2354415 0.6115999 0.4776618 0.7848268 0.6861904 0.2917870 0.3589572 0.3038064
            WIN-MA    WIS-OO    WSB-OO     YAK-OO    YUG-CR    YUG-MA    YUG-SE    YUG-SL
Abrigh_F 0.2633188 0.2682845 0.7374311 0.54914609 0.5431441 0.4977407 0.4148920 0.4177762
Afissa_F 0.4002050 0.3150725 0.8982963 0.07620134 0.4774969 0.5394832 0.5777423 0.4759230
Apriod_F 0.3267969 0.5401611 0.9811901 0.99148312 0.7452419 0.7335721 0.7606646 0.7491211
             YUK-OO    ZAI-OO    ZAM-OO    ZIM-OO
Abrigh_F 0.42336096 0.9379793 0.4816155 0.2917677
Afissa_F 0.04733246 0.7342134 0.5803402 0.4771997
Apriod_F 0.86196063 0.7986208 0.1816706 0.1267285
 [ reached 'max' / getOption("max.print") -- omitted 3 rows ]

------------------------------------------------------------------------------

bin.reg.sim.mat <- simMat(bin.reg, method = "Jaccard") 

Calculating 42195 pair-wise similarities...
25% done...
50% done...
75% done...
Finished!
It took 2.2 secs.


fuz.reg.sim.mat <- simMat(fuz.reg, method = "Jaccard")

Calculating 42195 pair-wise similarities...
25% done...
50% done...
75% done...
Finished!
It took 2.3 secs.