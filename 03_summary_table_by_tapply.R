#SUMMARIZING FUNCTION

# Resumen de funciones
# A menudo, se le proporcionan datos demasiado detallados para su análisis. Por 
# ejemplo, podría estar analizando datos sobre un sitio web. Suponga que desea conocer
# el número promedio de páginas entregadas a cada usuario. Para encontrar la respuesta,
# es posible que deba mirar cada transacción HTTP (cada solicitud de contenido), agrupar
# juntas las solicitudes en sesiones y contando el número de solicitudes. R proporciona
# una serie de funciones diferentes para resumir datos, agregando registros para 
# construir un conjunto de datos más pequeño.

#tapply(x, INDEX, FUN = ..., simplify =)
data <- load('data/batting.2008.rda')
bateo.2008 <- transform(batting.2008, AVG = H/AB)
View(bateo.2008)
bateo.nombre.2008 <- bateo.2008[bateo.2008$yearID == 2008,]

tapply(bateo.2008$HR, INDEX = list(bateo.2008$teamID), FUN = sum)

tapply((bateo.2008$H/bateo.2008$AB), INDEX = list(bateo.2008$lgID), FUN = fivenum)

tapply(bateo.2008$HR, INDEX = list(bateo.nombre.2008$lgID, bateo.nombre.2008$bats), FUN = mean)


#BY

# Una función estrechamente relacionada con tapply es by. La función by funciona de
# la misma manera que tapply, excepto que funciona en marcos de datos. El argumento
# ÍNDICE se reemplaza por un argumento ÍNDICES. Aquí hay un ejemplo:


by(bateo.2008[, c("H","BB", "X2B", "X3B","HR")],
   INDICES = list(bateo.nombre.2008$lgID, bateo.nombre.2008$bats), FUN = sum)

#AGGREGATE

#aggregate(x, nfrequency = 1, FUN = sum, ndeltat = 1, ts.eps = getOption("ts.eps"), ...)
str(bateo.2008)
aggregate(bateo.2008[, c("AB", "H","BB", "X2B", "X3B","HR")], 
          by = list(bateo.2008$teamID), FUN = sum)


#Aggregating Tables with rowsum

# Agregación de tablas con suma de filas
# A veces, simplemente le gustaría calcular la suma de ciertas variables en un objeto,
# agrupadas por una variable de agrupación. Para hacer esto en R, use rowsum

rowsum(bateo.2008[, c("AB", "H","BB", "X2B", "X3B","HR")],
       group = bateo.2008$teamID)


#COUUNTIN VALUES
# Valores de conteo
# A menudo, puede ser útil contar el número de observaciones que toman cada valor 
# posible de una variable. R proporciona varias funciones para hacer esto.
# La función más simple para contar el número de observaciones que toman un valor
# es la función tabular. Esta función cuenta el número de elementos en un vector que
# toman cada valor entero y devuelve un vector con los recuentos

HR.count <- tabulate(bateo.nombre.2008$HR)
HR.count
# tabulate doesn't label results, so let's add names:
names(HR.count) <- 0:(length(HR.count)-1)
HR.count

table(bateo.nombre.2008$bats)

# Para hacer esto un poco más interesante, podríamos hacer de esto una tabla 
# bidimensional que muestre la cantidad de jugadores que batearon y lanzaron con cada mano:
table(bateo.2008[, c("bats", "throws")])



# La función xtabs funciona igual que la tabla, pero le permite especificar las agrupaciones
# especificando una fórmula y un marco de datos. En muchos casos, esto puede ahorrarle algo de tipeo.
xtabs(~bats+lgID, bateo.2008)



# first, add batting average to the data frame:
bateo.w.names.2008 <- transform(bateo.2008, AVG = H/AB)
#now, select a subset of players with over 100 AB (for some statistical significate)
bateo.2008.over100AB <- subset(bateo.2008, subset = (AB > 100 ))
#Finally, split the results into 10 bins
bateo.2008.bins <- cut(bateo.2008.over100AB$AVG, breaks = 10)

table(bateo.2008.bins)
