#FUNCTIONS


#The function keyword

x <- 10
y <- 20
a <- 30
b <- 40

f <- function(arg1, arg2) {
  arg1 + arg2
}
f.1 <- function(arg1, arg2) {
  arg1 * arg2
}

f(x, y)
f.1(a, b)

#arguments 

f.2 <- function(arg1, arg2 = 100) {
  arg1 / arg2
}

f.2(25200)
f.2(25200,25200)
f.1(3) #Error in f.1(3) : argument "arg2" is missing, with no default



v <- c(sqrt(1:100))
v

f.3 <- function(x,...) {
  print(x);
  summary(...)
}

f.3("Here is the summary for v: ", v, digits = 2)



f.4 <- function(arg1, arg2) {
  args <- as.list(match.call())
  if(is.null(args$arg2)){
    arg2 <- 10
  }
  arg1 + arg2
}
f.4(2,2)
f.4("hola") #Error in arg1 + arg2 : non-numeric argument to binary operator
f.4(10)
f.4(2)


f.5 <- function(arg,...) {
  args <- list(...)
  for (i in args) {
    arg <- arg + i
    }
  arg
}
f.5(1,1)
f.5(1,2,3,4,5)


#RETURN VALUES
#En una función R, puede usar la función de devolución para especificar el valor
#devuelto por la función.

f.6 <- function(x) {
  return(x^2 + 3) 
}
f.6(30)

#Sin embargo, R simplemente devolverá la última expresión evaluada como resultado
#de una función. Por lo tanto, es común omitir la declaración de devolución:

f.7 <- function(x) {
  x^2 + 3
}
f.7(30)



#FUNCTION AS ARGUMENTS
# Funciones como argumentos
# Muchas funciones en R pueden tomar otras funciones como argumentos. Por ejemplo,
# muchas funciones de modelado aceptan un argumento opcional que especifica cómo
# manejar los valores faltantes; este argumento suele ser una función para procesar 
# los datos de entrada.
# Como ejemplo de una función que toma otra función como argumento, veamos sapply.
# La función sapply itera a través de cada elemento en un vector, aplicando otra 
# función a cada elemento en el vector y devolviendo los resultados.

x <- 1:10
sapply(x, sqrt)


#ANONYMOUNS FUNCTIONS
# Funciones anónimas
# Hasta ahora, hemos visto principalmente funciones con nombre en R. Sin embargo,
# debido a que las funciones son solo objetos en R, es posible crear funciones que
# no tengan nombres. Estos son llamadas funciones anónimas. Las funciones anónimas
# generalmente se pasan como argumentos a otras funciones. Si eres nuevo en los 
# lenguajes funcionales, este concepto puede parecerte extraño.

apply.to.three <- function(f){f(3)}
apply.to.three(function(x){x ^ 7})


x <- c(1,2,3,4,5,6,7,8,9,10)
sapply(x, function(x){x + 1})

v <- 1:20
w <- NULL
for (i in 1:length(v)) {
  w[i] <- v[i]^2
}
w

v <- 1:20
w <- sapply(v, function(i){i^2})
w


(function(x){sqrt(x) + exp(2) - 1})(100)

#PROPERTIES OF FUNCTIONS
# Propiedades de las funciones
# R incluye un conjunto de funciones para obtener más información sobre los objetos
# de función.
# Para ver el conjunto de argumentos aceptados por una función, use la función args.
# La función args devuelve un objeto de función con NULL como cuerpo.

args(sin)
args('?')
args(args)  
args(lm)


f.8 <- function(x, y=1, z=2) {x + y +z}
f.formals <- formals(f.8)
f.formals


f.formals$x <- 1000
formals(f.8) <- f.formals
args(f.8)


f.9 <- function(x = 100, y = 200, z = 300){
  return(x + y + z)
}
f.9

body(f.9)

body(f.9) <- expression({ x * y * z})
f.9


#ARGUMENT ORDER AND NAMED ARGUMENTS
# When you specify a function in R, you assign a name to each argument in the function.
# Inside the body of the function, you can access the arguments by name. For example,
# consider the following function definition:

add.the.log <- function(first, second){
  first + log(second)
}


add.the.log(second = sqrt(10), first = exp(10))
add.the.log(s = sqrt(10), f = exp(10))
add.the.log(exp(10), sqrt(10))


f.10 <- function(arg1=10, arg2=20){
  print(paste("arg1:", arg1))
  print(paste("arg2:", arg2))
}

f.10(arg1 = 1000)
f.10(arg1 = 2000, arg2 = 3000)
f.10()

#CHANGES TO OTHER ENVIRONMENTS

x #Error: object 'X' not found
doesnt.assing.x <-function(i){x <- i}
doesnt.assing.x(4)

assigns.x <-function(i){x <<- i}
assigns.x(1000)
x
  
