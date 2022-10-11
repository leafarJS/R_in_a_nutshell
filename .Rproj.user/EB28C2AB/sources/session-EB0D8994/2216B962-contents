#FORMULAS
# Muy a menudo, necesita expresar una relación entre variables. A veces, desea trazar
# un gráfico que muestre la relación entre las dos variables. Otros tiempos,
# desea desarrollar un modelo matemático. R proporciona una clase de fórmula que
# le permite describir la relación para ambos propósitos.

sample.formula <- as.formula(y~x1+x2+x3)
class(sample.formula)
typeof(sample.formula)

# Nombres de variables
# Representar nombres de variables.
# 
# tilde (~)
# Se utiliza para mostrar la relación entre las variables de respuesta (a la izquierda)
# y las variables de estímulo (a la derecha).
# 
# Signo más (+)
# Se utiliza para expresar una relación lineal entre variables.
# 
# cero (0)
# Cuando se agrega a una fórmula, indica que no se debe incluir ningún término de intercepción.
# Por ejemplo:
# 
#     y~u+w+v+0
# 
# Barra vertical (|)
# Se utiliza para especificar variables condicionantes (en fórmulas reticulares)
# 
# Función de identidad (I())
# Se utiliza para indicar que la expresión adjunta debe interpretarse según su 
# significado aritmético. Por ejemplo:
#   a+b
# significa que tanto a como b deben incluirse en la fórmula. La formula:
#   yo(a+b)
# significa que "a más b" debe incluirse en la fórmula.
# Asterisco (*)
# Se utiliza para indicar interacciones entre variables. Por ejemplo:
#   y~(u+v)*w
# es equivalente a:
#   y~u+v+w+I(u*w)+I(v*w)
# Intercalación (^)
# Se utiliza para indicar el cruce en un grado específico. Por ejemplo:
#   y~(u+w)^2
# es equivalente a:
#   y~(u+w)*(u+w)
# Función de variables
# Indica que la función de las variables especificadas debe interpretarse como una
# variable. Por ejemplo:
#   y~log(u)+sin(v)+w


class(fo <- y ~ x1*x2) # "formula"
fo
typeof(fo)  # R internal : "language"
terms(fo)

environment(fo)
environment(as.formula("y ~ x"))
environment(as.formula("y ~ x", env = new.env()))


## Create a formula for a model with a large number of variables:
xnam <- paste0("x", 1:25)
(fmla <- as.formula(paste("y ~ ", paste(xnam, collapse= "+"))))
