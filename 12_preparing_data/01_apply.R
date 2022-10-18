# COMBINING DATA SETS
# En mi primer año de universidad, planeaba ser bioquímico. Pasé horas y horas en
# el laboratorio: mezclando químicos en tubos de ensayo, poniendo muestras en 
# diferentes máquinas y analizando los resultados. Con el tiempo, me sentí frustrado
# porque pasaba semanas en el laboratorio haciendo trabajo manual y solo unos minutos
# planificando experimentos o analizando resultados. Después de un año, renuncié a
# la química y me convertí en informático, pensando que dedicaría menos tiempo a 
# la preparación y las pruebas y más tiempo en el análisis.
# Desafortunadamente para mí, elegí hacer el trabajo de minería de datos de manera 
# profesional. A todos les encanta construir modelos, dibujar gráficos y jugar con
# algoritmos geniales. Desafortunadamente, la mayor parte del tiempo que dedica a los
# proyectos de análisis de datos se dedica a preparar los datos para el análisis. 
# Calculo que el 80 % del esfuerzo en un proyecto típico se gasta en encontrar, 
# limpiar y preparar datos para el análisis. Menos del 5% del esfuerzo se dedica al
# análisis. (El resto del tiempo se dedica a escribir lo que hizo).
# Si es nuevo en el análisis de datos, probablemente se esté preguntando cuál es el
# problema con la preparación de datos. Suponga que obtiene algunos datos de los 
# servidores web de su empresa, de una base de datos financiera o de registros 
# electrónicos de pacientes. Todo vino de las computadoras, así que es perfecto, 
# ¿verdad? En la práctica, los datos casi nunca se almacenan en la forma adecuada
# para su análisis. Incluso cuando los datos están en la forma correcta, a menudo 
# hay sorpresas en los datos. Se necesita mucho trabajo para reunir un conjunto de
# datos utilizable. En este capítulo se explica cómo preparar datos para el análisis con R.



# Combining Data Sets
# Comencemos con uno de los obstáculos más comunes para el análisis de datos: trabajar
# con datos almacenados en dos lugares diferentes. Por ejemplo, suponga que desea ver
# las estadísticas de bateo de los jugadores de béisbol por edad. En la mayoría de las
# fuentes de datos de béisbol (como los datos del Baseball Databank), la información de
# los jugadores (como las edades) se guarda en diferentes archivos de datos de rendimiento
# (como estadísticas de bateo). Por lo tanto, necesitaría combinar dos archivos para 
# realizar este análisis. Esta sección analiza varias herramientas en R utilizadas para
# combinar conjuntos de datos.

# Pasting Together Data Structures
# R proporciona varias funciones que le permiten pegar varias estructuras de datos 
# en una sola estructura.

# Paste
# La más simple de estas funciones es pegar. La función de pegar le permite concatenar
# varios vectores de caracteres en un solo vector. (Si puede usar otro tipo, primero 
# será forzado a un vector de caracteres).

x <- c("a", "b", "c", "d", "e")
y <- c("A", "B", "C", "D", "E")

paste(x, y)
paste(x, y , sep = "-")
paste(x,y, sep = "-", collapse = "#")



year <- c(2008,2008,2008,2008,2022)
rank <- c(1,2,3,4,5)

more.cols <- data.frame(year, rank)

cbind(top.5.salarios, more.cols)

# si en caso de que no se tenga la misma longitud no se podria hacer un match con
#los datos de ambos dataframes

