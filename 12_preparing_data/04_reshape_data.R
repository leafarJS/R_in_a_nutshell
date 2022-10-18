#RESHAPING DATA

# Remodelación de datos
# Muy a menudo, se le presentan datos que tienen la "forma" incorrecta. A veces, 
# puede encontrar que una sola observación se almacena en varias líneas en un marco
# de datos. Esto sucede muy a menudo en los almacenes de datos. En estos sistemas, 
# se puede usar una sola tabla para representar muchos "hechos" diferentes. Cada 
# hecho puede estar asociado con un identificador único, una marca de tiempo, un
# concepto y un valor observado. Para crear un modelo estadístico o representar 
# gráficamente los resultados, es posible que deba crear una versión de los datos 
# en la que cada línea contenga un identificador único, una marca de tiempo y una 
# columna para cada concepto. Por lo tanto, es posible que desee transformar este 
# conjunto de datos "estrecho" en un formato "ancho".
# Otras veces, es posible que se le presente un marco de datos escasamente poblado
# que tiene una gran cantidad de columnas. Aunque este formato puede simplificar 
# el análisis, el conjunto de datos también puede ser grande y difícil de almacenar.
# Por lo tanto, es posible que desee transformar este amplio conjunto de datos en 
# uno limitado.

# data <- load('data/batting.2008.rda')
# bateo.2008 <- transform(batting.2008, AVG = H/AB)
# View(bateo.2008)


m <- matrix(1:10, nrow = 5)
m

t(m)

v <- 1:10
v

t(v)

# Sorting

w <- c(5,4,7,2,7,1)
w
sort(w)

sort(w, decreasing = TRUE)

length(w)

length(w) <- 7

w

sort(w)

sort(w, na.last = TRUE)

sort(w, na.last = FALSE)


#ORDER

v <- c(11,12,13,14,15)
order(v)

v[order(v)]


u <- c("pig", "cow", "duck", "horse", "rat")
w <- data.frame(v, u)
w

w[order(w$v),]
