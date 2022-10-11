#ATTRIBUTES
# atributo      Descripción
# clasS         La clase del objeto.
# comment       Un comentario sobre el objeto; a menudo una descripción de lo que significa el objeto.
# dim           Dimensiones del objeto.
# dimnames      Nombres asociados con cada dimensión del objeto.
# names         Devuelve el atributo de nombres de un objeto. Los resultados dependen del tipo de objeto; por ejemplo, devuelve el nombre
#               de cada columna de datos en un marco de datos o cada objeto con nombre en una matriz.
# row.names     El nombre de cada fila en un objeto (relacionado con dimnames).
# tsp           Hora de inicio de un objeto. Útil para datos de series de tiempo.
# levels        Niveles de un factor

m <- matrix(data = 1:12,
            nrow = 4,
            ncol = 3,
            dimnames = list(c("r1","r2","r3","r4"),
                            c("c1","c2","c3")))

class(m)

attributes(m)

dim(m)

colnames(m)

rownames(m)

# Es posible transformar esta matriz en otra clase de objeto simplemente cambiando 
# los atributos. Específicamente, podemos eliminar el atributo de dimensión 
# (configurándolo en NULL) y el objeto se transformará en un vector:  

dim(m) <- NULL

m

class(m)

typeof(m)

#------------------------------------------------

a <- array(1:12, dim = c(3,4))
a

b <- 1:12
b

a[2,2]

b[2,2] #Error in b[2, 2] : incorrect number of dimensions

# En este punto, podría preguntarse si R considera que los dos objetos son iguales.
# Esto es lo que sucede cuando los comparas con el operador ==:

a == b # true

all.equal(a, b) # series of data

identical(a, b) # false

dim(b) <- c(3,4)

a[2,2]
b[2,2]

all.equal(a, b) # true

identical(a, b) # true
