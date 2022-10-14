# Entering Data Within R
# Entering Data Using R Commands
# 
# Introducción de datos dentro de R
# Introducción de datos mediante comandos R

salarios = c(15000,18000,20000,12000,45200)
posicion = c("Q4", "Q3", "Q2", "Q1", "Q5")
equipo = c("colts", "patriots", "panthers", "bengals", "giants")
nombre = c("jorge", "rafael", "miguel", "angel", "luis")
apellido = c("callejo", "flores", "guisbert", "tarqui", "linares")

top.5.salarios <- data.frame(nombre, apellido, equipo, posicion, salarios)
top.5.salarios

top.5.salarios <- edit(top.5.salarios)

fix(top.5.salarios)

View(top.5.salarios)

save(top.5.salarios, file = "~/top.5.salarios.RData")

save(top.5.salarios, 
     file = "C:/Users/Administrador/Desktop/R_in_a_Nutshell/top.5.salarios_1.RData"
     )
load("~/top.5.salarios.RData")



# APPLYING A FUNCTION TO EACH ELEMENT OF AN OBJECT
# Aplicar una función a cada elemento de un objeto
# Al transformar datos, una operación común es aplicar una función a un conjunto de
# objetos (o cada parte de un objeto compuesto) y devolver un nuevo conjunto de objetos
# (o un nuevo objeto compuesto). La biblioteca base R incluye un conjunto de diferentes
# funciones para hacer esto. 

x <- 1:20
dim(x) <- c(5,4)
x

#cols
apply(x, 1, FUN = max)
apply(x, 1, FUN = min)

#rows
apply(x, 2, FUN = min)
apply(X=x, MARGIN = 2, FUN = max)


x <- 1:27
dim(x)<- c(3,3,3)
x

apply(x, 1, FUN = paste, collapse = ",")
apply(x, 2, FUN = paste, collapse = ",")
apply(x, 3, FUN = paste, collapse = ",")

apply(x, 1, FUN = paste, collapse = "0")
apply(x, 2, FUN = paste, collapse = "0")
apply(x, 3, FUN = paste, collapse = "0")


apply(x, c(1,2), FUN = paste, collapse = ",")


#APPLYING A FUNCTION TO LIST OR VECTOR 

x <- as.list(1:5)
x
lapply(x, function(x){2^x})
lapply(x, function(x){return(exp(x))})


y <- data.frame(x=1:5, y= 6:10)
y
lapply(y, function(y){sqrt(y)})
lapply(y, function(y){range(y)})
lapply(y, function(y){return(2^y)})


mapply(paste, c(1,2,3,4,5),
              c(11,22,33,44,55),
              c(111,222,333,444,555),
       MoreArgs = list(sep="|"))

# la biblioteca plyr
# En este punto, probablemente esté confundido por todas las diferentes funciones
# de aplicación. Todos aceptan diferentes argumentos, se nombran de manera inconsistente
# y funcionan de manera diferente.
# Afortunadamente, no tiene que recordar ninguno de los detalles de estas funciones
# si usa el paquete plyr.
# El paquete plyr contiene un conjunto de 12 funciones con nombres lógicos para 
# aplicar otra función a un objeto de datos R y devolver los resultados. Cada una
# de estas funciones toma una matriz, un marco de datos o una lista como entrada y
# devuelve una matriz, un marco de datos, una lista o nada como salida. (Puede optar
# por descartar los resultados). 

title <- c("INPUT","ARRAY OUTPUT", "DATAFRAME OUTPUT", "LIST OUTPUT", "DISCARD OUTPUT")
arr <- c("Array","aaply", "adply", "alply", "a_ply")
dat.fra <- c("Data Frame", "daply", "ddply", "dlply", "d_ply")
lista <- c("List", "laply", "ldply", "llply", "d_ply")

tabla_plyr <- data.frame(title, arr, dat.fra, lista)
tabla_plyr

library(plyr)

x <- c(2,4,6,8,10)
lapply(x, function(x){x+1})
#equivalente is llply
llply(.data =x, .fun = function(x)x+1)

x <- 1:12
dim(x) <- c(3,4)
apply(x, 1, FUN = paste, collapse = ",")
#equivalente aaply
aaply(.data = x, .margins = 1, .fun = paste, collapse = ",")

#data frame  in, matrix out
t(sapply(x, function(x){2^x}))

#equivalent (but note the additional labels)
aaply(x, function(x){x-x}, .margins = 2)


#BINNING DATA
# Clasificación de datos
# Otra transformación de datos común es agrupar un conjunto de observaciones en 
# contenedores según el valor de una variable específica. Por ejemplo, suponga que
# tiene algunos datos de series temporales en los que el tiempo se mide en días,
# pero desea resumir los datos por mes. Hay varias funciones disponibles para agrupar
# datos numéricos en R.

x <- c(1,1,1,2,2,2,2,2,3,3,3,3,3,3,3,4,5)
x

library(lattice)

shingle(x, intervals = sort(unique(x)))

equal.count(x, intervals = sort(unique(x)))
