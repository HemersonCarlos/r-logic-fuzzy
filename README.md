Lógica Fuzzy

Passos para executar a lógica fuzzy com a linguagem de dados R.

No link -> https://www.rstudio.com/products/cloud/ se cria o projeto para começar a analise de dados.

1º - Instalar a biblioteca

- install.packages("fuzzySim")

- library(fuzzySim)

2º - Carregar os dados da biblioteca que foi instalado

- data(rotifers)

- help(rotifers)

3º - Listar os 10 primeiros dados do rotifers

- head(rotifers, 10)

4º - Busca do código das espécies 

- rotifers$spcode <- spCodes(rotifers$species, sep.species = "_", nchar.gen = 1, nchar.sp = 5, nchar.ssp = 0, sep.spcode = "")

5º - Dividindo as espécies em grupos e mostrando os grupos como dados

- rotifers.presabs <- splist2presabs(rotifers, sites.col = "TDWG4", sp.col = "spcode", keep.n = FALSE)

- head(rotifers.presabs)

6º - Criação das regras que já estão definidas na biblioteca 

- if (!("rgdal" %in% rownames(installed.packages()))) install.packages("rgdal")

- library(rgdal)

- TDWG4shp <- readOGR(dsn = "https://raw.githubusercontent.com/tdwg/wgsrpd/master/geojson/level4.geojson")

- TDWG4shp@data <- data.frame(TDWG4shp@data, rotifers.presabs[match(TDWG4shp@data$Level4_cod, rotifers.presabs$TDWG4), ])

Após isso ele vai gerar o gráfico apresentando os dados conforme as regras definidas, abaixo contém alguns exemplos:


Gráficos gerados

![image](https://user-images.githubusercontent.com/53834009/137819716-381ea518-e27a-4ffb-bd9b-d38f892d6e12.png)

![image](https://user-images.githubusercontent.com/53834009/137819770-e4795019-aa2c-4835-abe4-ae700e495fc6.png)

![image](https://user-images.githubusercontent.com/53834009/137819793-1c5116d8-32d3-40a9-aa89-e31d33fea5bf.png)

![image](https://user-images.githubusercontent.com/53834009/137819819-f67739d6-f1ed-4e79-875b-7e4331056f6a.png)

![image](https://user-images.githubusercontent.com/53834009/137819850-7dcb3082-56ae-4155-836c-abc05cd9287b.png)

![image](https://user-images.githubusercontent.com/53834009/137819868-46200482-0acf-44fc-82fb-3fca4b132cc1.png)
