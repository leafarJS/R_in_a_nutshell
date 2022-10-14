#IMPORTING DATA FROM EXTERNAL FILES

#variables pag. 199-170
acc.apple = read.table("data/AAPL.csv", 
                       header = TRUE, sep = ",", 
                       quote = "\"")

acc.apple


data.url <- read.table("http://aprender.uib.es/Rdir/pearson.txt", header=TRUE, quote="\"")
data.url
class(data.url)
View(data.url)


#DATABASE CONNECTION PACKAGES

# Paquetes de conexión de base de datos
# Para conectarse directamente a una base de datos desde R, deberá instalar algunos
# paquetes opcionales. Los paquetes que necesita dependen de las bases de datos a las
# que desea conectarse y del método de conexión que desea utilizar.
# Hay dos conjuntos de interfaces de base de datos disponibles en R:
# • RODBC. El paquete RODBC permite a R obtener datos de conexiones ODBC 
# (Open DataBase Connectivity). ODBC proporciona una interfaz estándar para que 
# diferentes programas se conecten a bases de datos.
# • DBI. El paquete DBI permite que R se conecte a bases de datos utilizando 
# controladores de bases de datos nativos o controladores JDBC. Este paquete proporciona
# una abstracción de base de datos común para el software R. Debe instalar paquetes
# adicionales para usar los controladores nativos para cada base de datos.

#install.packages("RODBC")
library(RODBC)

bbdd <- odbcConnect("bbdb")
odbcGetInfo(bbdb)


#completar cuando se maneje SQL nivel intermedio

