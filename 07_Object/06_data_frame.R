#DATA FRAME

# Marcos de datos
# Los marcos de datos son una forma útil de representar datos tabulares. En contextos 
# científicos, muchos experimentos consisten en observaciones individuales, cada una 
# de las cuales involucra varias mediciones diferentes. A menudo, las medidas tienen
# diferentes dimensiones y, a veces, son cualitativas y no cuantitativas. En contextos
# comerciales, los datos a menudo se guardan en tablas de bases de datos. Cada tabla 
# tiene muchas filas, que pueden consistir en múltiples “columnas” que representan 
# diferentes cantidades y que pueden mantenerse en múltiples formatos. Un marco de 
# datos es una forma natural de representar estos conjuntos de datos en R. Un marco 
# de datos representa una tabla de datos. Cada columna puede ser de un tipo diferente,
# pero cada fila del marco de datos debe tener la misma longitud:

#error
data.frame(a = c(1,2,3,4,5),
           b = c(1,2,3,4))

#correct
top.bacon.searchin.cities <- data.frame(city = c("seatle", "whasingtong", "chicago",
                                                 "new york", "porland", "st. louis",
                                                 "denver", "boston", "minneapolis", 
                                                 "austin", "philadelphia", "san francisco",
                                                 "atlanta","los angeles", "ohio"),
                                        rank = c(100,96,94,93,93,92,90,90,89,87,85,84,82,80,80))
top.bacon.searchin.cities

typeof(top.bacon.searchin.cities)

class(top.bacon.searchin.cities)
