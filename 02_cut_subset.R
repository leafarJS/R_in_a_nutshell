#CUT
# La función cut es útil para tomar una variable continua y dividirla en partes 
# discretas. Esta es la forma predeterminada de corte para usar con vectores 
# numéricos:

# Argumento                  Descripción                                                                      Predeterminado
# x                  Un vector numérico (para convertirlo en un factor).
# breaks             Un valor entero único que especifica el número de puntos de ruptura o un vector numérico
#                    especificando el conjunto de puntos de ruptura.
# etiquetas          Etiquetas para los niveles en el factor de salida.                                             NULO
# include.lowest     Un valor lógico que indica si un valor es igual al punto más bajo en el rango
#                    (si right=TRUE) en un rango debe incluirse en un depósito determinado. Si es correcto = FALSO
#                    indica si se debe incluir un valor igual al punto más alto del rango.                          FALSO
# right              Un valor lógico que especifica si los intervalos deben cerrarse a la derecha y abrirse
#                    a la izquierda. (Para right=FALSE, los intervalos estarán abiertos a la derecha y cerrados
#                    a la izquierda).                                                                               CIERTO
# dig.lab            Número de dígitos utilizados al generar etiquetas (si las etiquetas no se  
#                    especifican explícitamente). 
# ordered_result     Un valor lógico que indica si el resultado debe ser un factor ordenado.                        FALSO


data <- load('data/batting.2008.rda')
# first, add batting average to the data frame:
batting.2008.AB <- transform(batting.2008, AVG = H/AB)
View(batting.2008.AB)
str(batting.2008.AB)
# now, select a subset of players with over 100 AB (for some
# statistical significance):
batting.2008.over100AB <- subset(batting.2008.AB, subset=(AB > 100))
# finally, split the results into 10 bins:
battingavg.2008.bins <- cut(batting.2008.over100AB$AVG, breaks = 10)

table(battingavg.2008.bins)


# Combinar objetos con una variable de agrupación
# A veces le gustaría combinar un conjunto de objetos similares (ya sean vectores 
# o marcos de datos) en un solo marco de datos, con una columna que etiquete la 
# fuente. Puedes hacerlocon la función make.groups en el paquete lattice:


library(lattice)


hat.sizes <- seq(from = 6.25, to = 7.75, by = .25)
length(hat.sizes)
pants.sizes <- c(30,31,32,33,34,36,38,40)
length(pants.sizes)
shoe.sizes = seq(from = 7, to = 12)
length(shoe.sizes)

make.groups(hat.sizes, pants.sizes, shoe.sizes)



data <- load('data/batting.2008.rda')
bateo.2008 <- transform(batting.2008, AVG = H/AB)
str(bateo.2008)

#SUBSET
#BRACKET NOTATION

bateo.nombre.2008 <- bateo.2008[bateo.2008$yearID == 2008,]
summary(bateo.nombre.2008)
summary(bateo.nombre.2008$yearID)


bateo.name.2008.short <- bateo.2008[bateo.2008$yearID == 2008, c("nameFirst", "nameLast", "AB", "H", "BB")]
bateo.name.2008.short


#SUBSET FUNCTION

#subset(x, subset, select, drop = FALSE, ...)


bateo.w.names.2008 <- subset(bateo.2008, yearID == 2008)
bateo.w.names.2008
bateo.name.2008.short <-subset(bateo.2008, yearID == 2008, c("nameFirst", "AB", "H"))
bateo.name.2008.short


#RANDOM SAMPLING

# A menudo, es deseable tomar una muestra aleatoria de un conjunto de datos. A veces,
# es posible que tenga demasiados datos (por razones estadísticas o de rendimiento).
# Otras veces, simplemente desea dividir sus datos en diferentes partes para el modelado 
# (generalmente en subconjuntos de capacitación, prueba y validación).
# Una de las formas más sencillas de extraer una muestra aleatoria es con la function sample.
# La función muestra devuelve una muestra aleatoria de los elementos de un vector:

#sample(x, size, replace = FALSE, prob = NULL)

bateo.2008[sample(1:nrow(bateo.2008), 5), ]


bateo.2008$teamID <- as.factor(bateo.2008$teamID)
levels(bateo.2008$teamID)

sample(levels(bateo.2008$teamID), 5)

bateo.2008.3teams <- bateo.2008[is.element(bateo.2008$teamID, sample(levels(bateo.2008$teamID),3)), ]
bateo.2008.3teams


summary(bateo.2008.3teams$teamID)


