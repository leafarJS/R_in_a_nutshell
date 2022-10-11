#CLASS
# El objeto clase se implementa como un atributo. Para objetos simples, la
# clase y el tipo suelen estar estrechamente relacionados. Sin embargo, para objetos
# compuestos, los dos pueden ser diferentes.
# A veces, e objeto clase se enumera con atributos. Sin embargo, para ciertas
# clases (como matrices y arreglos), la clase está implícita. Para determinar la clase
# de un objeto, puede utilizar la función de clase. Puede determinar el tipo de objeto 
# subyacente utilizando la función typeof.

x <- c(1,2,3,4,5)

typeof(x)

class(x)


v <- as.integer(c(1,1,1,2,1,2,2,3,1))
levels(v) <- c("what", "who", "why")
class(v) <- "factor"

v

# Para algunos objetos, debe citarlos para evitar que se evalúen cuando se llama a
# la función de clase o tipo. Por ejemplo, suponga que desea determinar el tipo del
# símbolo x y no el objeto al que se refiere. Podrías hacerlo así:

class(quote(x))

typeof(quote(x))
