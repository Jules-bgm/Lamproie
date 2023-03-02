
###############################################################################

# récupérer un objet postgres -----------------------------------------------------

library("RPostgres")
library("DBI")
con <- dbConnect(Postgres(), 		
    dbname="eda2.3", 		
    host="localhost",
    port=5432, 		
    user= "postgres", 		
    password= "postgres")


rn <- dbGetQuery(con,"SELECT * FROM  france.rn")
str(rn)


#Pour avoir le schema
table_id2<-DBI::Id(
    schema=user_schema,
    table="releve_sonde"
)

# récupérer un objet postgis ----------------------------------------------------

library("sf")
library("maptools")
library("ggmap")
library("RPostgres")
con=dbConnect(Postgres(),
    dbname="eda2.3",
    host="localhost",
    port=5432,
    user= userlocal,
    password= passwordlocal)


rn <- sf::st_read(con,query=paste("select rn.idsegment, distanceseam, strahler, emu, geom 
from
 france.rna r
join france.rn on r.idsegment =rn.idsegment 
where (emu='FR_Bret' OR emu='FR_Loir') "))
plot(rn)