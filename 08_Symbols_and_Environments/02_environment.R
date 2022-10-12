#Manipulating environment objects
#Manipulación de objetos del entorno

# assing
# get
# exists
# objects
# remove
# search()
# searchpaths()
# attach()
# detach
# emptyenv()
# parent.env()
# baseenv()
# globalenv()
# environment()
# new.env()


x <- c(1,2,3)
y <- c(4,5,6)
z <- c(7,8,9)

objects()
rm(x)
objects()


# THE GLOBAL ENVIRONMENT

# El entorno global
# Cuando un usuario inicia una nueva sesión en R, el sistema R crea un nuevo 
# entorno para los objetos creados durante esa sesión. Este entorno se denomina 
# entorno global. El entorno global no es en realidad la raíz del árbol de los entornos.
# En realidad, es el último entorno de la cadena de entornos en la ruta de búsqueda.
# Aquí está la lista de entornos principales para el entorno global en mi instalación de R:

x <-.GlobalEnv
while (environmentName(x) != environmentName(emptyenv())) {
 print(environmentName(parent.env(x))); x <- parent.env(x)} 

#Todo entorno tiene un entorno padre excepto uno: el entorno vacío. Todos los 
#entornos se encadenan al entorno vacío.

env.demo <- function(a, b, c, d) {
  print(objects())
}
env.demo(1, "truck", c(1,2,3,4,5), pi)

# Observe que la función de objetos devuelve solo los objetos del entorno actual,
# por lo que la función env.demo solo imprime los argumentos definidos en ese entorno.
# Todos los demás objetos existen en el entorno principal, no en el entorno local.
# El entorno principal de una función es el entorno en el que se creó la función.
# Si se creó una función en el entorno de ejecución (por ejemplo, en el entorno global),
# el entorno en el que se llamó a la función será el mismo que el entorno en el que se
# creó la función. Sin embargo, si el se creó en otro entorno (como un paquete), 
# entonces el entorno principal no será el mismo que el entorno de llamada.


#WORKING WITH THE CALL STACK
# Trabajar con la pila de llamadas
# Aunque el entorno principal de una función no siempre es el entorno en el que se
# llamó a la función, es posible acceder al entorno en el que se llamó a la función.
# Como muchos otros lenguajes, R mantiene una pila de entornos de llamadas. (Una pila
# es una estructura de datos en la que los objetos se pueden agregar o quitar de un 
# solo extremo. Piense en una pila de bandejas en una cafetería; solo puede agregar 
# una bandeja en la parte superior o quitar una bandeja de la parte superior. Agregar
# Un objeto a una pila se llama "empujar" el objeto a la pila. Sacar un objeto de 
# la pila se llama "sacar" el objeto de la pila.) Cada vez que se llama a una nueva
# función, se empuja un nuevo entorno en la pila de llamadas. Cuando R termina de 
# evaluar una función, el entorno se elimina de la pila de llamadas.

sys.call()
sys.frame()
sys.nframe()
sys.function()
sys.parent()
sys.calls()
sys.frames()
sys.parents()
sys.on.exit()
sys.status()
parent.frame()


time.this <- function(...){
  start.time <- Sys.time();
  eval(..., sys.frame(sys.parent()));
  end.time <- Sys.time();
  print(end.time - start.time)
}
time.this(10000)




create.vector.of.ones <- function(n){
  return.vector <- NA;
  #start.time <- Sys.time();
  for (i in 1:n) {
    return.vector[i] <- 1;
  }
  end.time <- Sys.time();
  #print(end.time - start.time)
  return.vector
}

time.this(returned.vector <- create.vector.of.ones((10000)))
length(returned.vector)


create.vector.of.ones.b <- function(n){
  return.vector <- NA;
  #start.time <- Sys.time();
  length(return.vector) <- n
  for (i in 1:n) {
    return.vector[i] <- 1;
  }
  end.time <- Sys.time();
  #print(end.time - start.time)
  return.vector
}
time.this(returned.vector <- create.vector.of.ones.b((10000)))
length(returned.vector)


time.this.b <- function(...){
  start.time <- Sys.time();
  eval.parent(...);
  end.time <- Sys.time()
  print(end.time  - start.time)
}
time.this.b(10000)


data <- list(a = c(1,2,3,4), b = TRUE, c ="hello world")
with(data, a)
within(data, b)



#ADDING OBJECTS TO AN ENVIRONMENT
# Adición de objetos a un entorno
# R proporciona una abreviatura para agregar objetos al entorno actual: adjuntar. 
# Si ha guardado un conjunto de objetos en un archivo de datos con guardar, puede
# cargar los objetos en el entorno actual con adjuntar. Además, puede usar adjuntar
# para cargar todos los elementos especificados dentro de un marco de datos o una 
# lista en el entorno actual. A menudo, los operadores como $ son convenientes para
# acceder a objetos dentro de una lista o marco de datos, pero a veces puede ser 
# engorroso hacerlo:

data <- iris
attach(data, pos = 2, name = deparse(substitute(data)),
       warn.conflicts = TRUE)

Petal.Length

detach(data, pos = 2, unload = FALSE)

Petal.length #Error: object 'Petal.length' not found


#EXCEPTIONS
# Al igual que otros lenguajes de programación modernos, R incluye la capacidad de
# señalar excepciones cuando ocurren eventos inusuales y detectar excepciones cuando
# ocurren. Si está escribiendo sus propios programas R, generalmente es una buena 
# idea detener la ejecución cuando ocurre un error y alertar al usuario (o a la
# función que llama). Del mismo modo, suele ser una buena idea detectar excepciones 
# de funciones que se llaman dentro de sus programas.
# Puede parecer extraño hablar sobre el manejo de excepciones en el contexto de los 
# entornos, pero el manejo de excepciones y los entornos están estrechamente 
# relacionados. Cuando ocurre una excepción, el intérprete de R puede necesitar 
# abandonar la función actual y señalar la excepción en el entorno de llamada.

12 /"hot" #Error in 12/"hot" : non-numeric argument to binary operator

if(c(TRUE, FALSE)) TRUE else FALSE #Error in if (c(TRUE, FALSE)) TRUE else FALSE : The condition has length > 1



#ERRORES DE SEÑALIZACIÓN

do.work <- function(filename){
  if(file.exists(filename)){
    read.delim(filename)
  }else{
    stop("Could not open the file:", filename)
  }
}
do.work("notice.txt")
#Error in do.work("notice.txt") : Could not open the file:notice.txt

do.work <- function(filename){
  if(file.exists(filename)){
    "la la la la"
  }else{
    stop("Could not open the file:", filename)
  }
}
do.work(".gitignore")



do.nothing <- function(x){
  
#CATCHING ERRORS
  
response <- try({x <- 1}, silent = TRUE)
response
response <- try({open("file that doesn't exist")}, silent = TRUE)
response


#ryCatch(expression, handler1, handler2, ..., finally=finalexpr)


