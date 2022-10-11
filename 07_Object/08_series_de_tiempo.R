#TIME SERIES
library(tidyverse)
# Muchos problemas importantes analizan cómo cambia una variable con el tiempo, y 
# R incluye una clase para representar estos datos: objetos de series temporales.
# Las funciones de regresión para series temporales (like ar or arima) utilizan 
# objetos de series temporales. Además, muchas funciones gráficas en R tienen 
# métodos especiales para series de tiempo.


#El argumento de datos especifica la serie de observaciones; los otros argumentos 
#especifican cuándo se tomaron las observaciones. Aquí hay una descripción de los argumentos para ts

ts(data = NA,
   start = 1,
   end = numeric(10),
   frequency = 1,
   deltat = 1,
   ts.eps = getOption("ts.eps"),
   class = c("mts"),
   names = "serie.1")

# El método de impresión para objetos de series temporales puede imprimir buenos 
# resultados cuando se usa con unidades de meses o trimestres (esto está habilitado 
# de forma predeterminada y se controla con el argumento de calendario para imprimir.ts;                                                              consulte el archivo de ayuda para obtener más detalles).
# Como ejemplo, creemos una serie temporal que represente ocho trimestres consecutivos
# entre el segundo trimestre de 2008 y Q1 2010:

ts(1:8, start=c(2008, 2), frequency=4)


data("turkey.price.ts")
turkey.price.ts

#R incluye una variedad de funciones de utilidad para observar objetos de series temporales:
start(turkey.price.ts)

end(turkey.price.ts)

frequency(turkey.price.ts)

deltat(turkey.price.ts)
