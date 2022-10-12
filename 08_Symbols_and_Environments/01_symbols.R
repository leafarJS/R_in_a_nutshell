#SYMBOLS
# Hasta ahora, hemos bailado alrededor del concepto de entornos sin definirlos 
# explícitamente. Cada símbolo en R se define dentro de un entorno específico. 
# Un entorno es un objeto R que contiene el conjunto de símbolos disponibles en 
# un contexto dado, los objetos asociados con esos símbolos y un puntero a un 
# entorno principal. Los símbolos y los objetos asociados se denominan marco.
# Cada contexto de evaluación en R está asociado con un entorno. Cuando R intenta
# resolver un símbolo, comienza mirando el entorno actual. Si no hay ninguna 
# coincidencia en el entorno local, entonces R buscará recursivamente a través de
# los entornos principales en busca de una coincidencia.

x <- 1

y <- 2

z <- 3

v <- c(x, y, z)
v

# has already defined, so chaging x does not change v
x <- 10

v

# Es posible retrasar la evaluación de una expresión para que los símbolos no se 
# evalúen inmediatamente:

x <- 4

y <- 5

z <- 7

v <- quote(c(x, y, z))
v

eval(v)

x <- 8

eval(v)

# También es posible crear un objeto de promesa en R para retrasar la evaluación 
# de una variable hasta que se necesite (por primera vez). Puede crear un objeto 
# de promesa a través de la función delayAssign:

x <- 10

y <- 11

z <- 12

delayedAssign("v", c(x, y, z))

x <- 0     

v
