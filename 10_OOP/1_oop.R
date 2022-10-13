#OBJECT ORIENTED PROGRAMING OOP
# En esencia, R es un lenguaje de programación funcional. Pero el sistema R incluye algunos
# soporte para programación orientada a objetos (POO). OOP se ha convertido en el paradigma
# más popular para organizar software de computadora; se utiliza en la mayoría de los 
# lenguajes de programación modernos (Java, C#, Ruby y Objective C, entre otros) y en bastantes
# algunos viejos (Smalltalk, C++). Muchos paquetes de R se escriben utilizando objetos de R,
# incluido el paquete central de estadísticas, lattice y ggplot2.
# No necesita usar técnicas de programación orientada a objetos para trabajar con R.
# Escribir programas funcionales es una buena práctica. Mucha gente cree que es más fácil
# para escribir programas usando técnicas funcionales, particularmente cuando múltiples
# partes de un programa que se ejecuta simultáneamente; esto ha llevado a un resurgimiento
# de nuevos lenguajes funcionales como Scala y Clojure. Me gustan los programas funcionales
# pero encuentro técnicas orientadas a objetos conveniente para representar objetos 
# complicados (como modelos estadísticos o gráficos). R incluye dos mecanismos diferentes 
# para la programación orientada a objetos. Como recordará, el lenguaje R se deriva del 
# lenguaje S. El sistema de programación orientado a objetos de S evolucionó con el 
# tiempo. Alrededor de 1990, S versión 3 (S3) introdujo atributos de clase que permitían
# métodos de un solo argumento. Muchas funciones de R (como el software de modelado estadístico)
# se implementaron utilizando métodos S3, por lo que los métodos S3 todavía existen en
# la actualidad. En S versión 4 (S4), se introdujeron clases y métodos formales que
# permitían múltiples argumentos, tipos más abstractos y una herencia más sofisticada.
# Muchos paquetes nuevos se implementaron utilizando métodos S4 (y también puede encontrar
# implementaciones S4 de muchos procedimientos estadísticos clave). 
# En particular, las clases formales se utilizan ampliamente en Bioconductor.




# Descripción general de la programación orientada a objetos en R
# La programación orientada a objetos no es lo mismo que la programación con objetos.
# R es un lenguaje muy centrado en objetos; todo en R es un objeto. Sin embargo, hay
# más en OOP que solo objetos. He aquí una breve descripción de lo que está orientado
# a objetos medios de programación. 

#Ideas clave 

# Como ejemplo de cómo se usa la programación orientada a objetos en R, consideraremos
# las series de tiempo. Una serie de tiempo es una secuencia de mediciones de una 
# cantidad a lo largo del tiempo.
# Las medidas se toman a intervalos igualmente espaciados. Las series de tiempo tienen
# algunas propiedades asociados a ellos: una hora de inicio, una hora de finalización,
# un número de mediciones, una frecuencia, etc. En OOP, crearíamos una clase de 
# "serie de tiempo" para capturar información sobre series de tiempo. Una clase es una
# definición formal de un objeto. Cada objeto de serie temporal individual se denomina
# instancia de la clase. Una función que opera en una clase específica de objetos se llama método.
# Como usuario de series temporales, probablemente no le importe demasiado cómo se 
# implementan las series temporales. Lo único que le importa es saber cómo crear un objeto
# de serie temporal y manipular el objeto a través de métodos. La serie temporal podría 
# almacenarse como un marco de datos, un vector o incluso un campo de texto largo. 
# El proceso de separar la interfaz de la implementación se denomina encapsulación.
# Supongamos que quisiéramos hacer un seguimiento del historial de peso de las personas
# a lo largo del tiempo. Para esta aplicación, nos gustaría mantener toda la misma 
# información como una serie de tiempo, además de algunos información adicional sobre
# personas individuales. Sería bueno poder reutilizar el código para nuestra clase de
# serie temporal para objetos en la clase de historial de peso. En OOP, es posible 
# basar una clase en otra y simplemente especificar qué es diferente en la nueva clase.
# Esto se llama herencia. Diríamos que la clase de historial de peso hereda de la 
# clase de serie temporal. También podríamos decir que la clase de serie temporal 
# es una superclase de la clase de historial de peso y que la clase de historial de 
# peso es una subclase de la clase de serie temporal.
# Suponga que desea hacer una pregunta como "¿Cuál es el período de las mediciones
# en la clase?" Idealmente, sería bueno tener un solo nombre de función para encontrar
# esta información, tal vez llamado "punto". En OOP, permitir que se use el mismo nombre
# de método para diferentes objetos se denomina polimorfismo.
# Finalmente, supongamos que implementamos la clase de historial de peso creando 
# clases para cada una de sus partes: series de tiempo, atributos personales, etc. 
# El proceso de crear una nueva clase a partir de un conjunto de otras clases se 
# llama composición. En algunos lenguajes (como R), una clase puede heredar métodos
# de más de otra clase. Este se llama herencia múltiple.

setClass("TimeSeries",
         representation(
          data="numeric",
          start="POSIXct",
          end="POSIXct"
          ))

my.TimeSeries <- new("TimeSeries",
                   data=c(1, 2, 3, 4, 5, 6),
                   start=as.POSIXct("07/01/2009 0:00:00", tz="GMT",
                                       format="%m/%d/%Y %H:%M:%S"),
                   end=as.POSIXct("07/01/2009 0:05:00", tz="GMT",
                                       format="%m/%d/%Y %H:%M:%S")
                    )
my.TimeSeries


setValidity("TimeSeries",
            function(object) {
              object@start <= object@end &&
                length(object$start) == 1 &&
                length(object@end) == 1
            }
)
validObject(my.TimeSeries)


# Clases S3
# Las clases de S3 se implementan a través de atributos de objeto. Un objeto S3 es
# simplemente un objeto R primitivo con atributos adicionales, incluido un nombre 
# de clase. No existe una definición formal para un objeto S3; puede cambiar manualmente
# los atributos, incluida la clase. (Los objetos S3 son muy similares a los objetos 
# en lenguajes basados en prototipos como JavaScript.)
# Arriba, usamos series temporales como ejemplo de una clase S4. Existe una clase S3
# existente para representar series temporales, denominadas objetos "ts". Vamos a crear
# un objeto de serie temporal de muestra y ver cómo se implementa. Específicamente, 
# veremos los atributos del objeto y luego usaremos typeof y unclass para examinar 
# el objeto subyacente:

my.ts <- ts(data=c(1, 2, 3, 4, 5), start=c(2009, 2), frequency=12)
my.ts
attributes(my.ts)
typeof(my.ts)
unclass(my.ts)
plot(my.ts)
