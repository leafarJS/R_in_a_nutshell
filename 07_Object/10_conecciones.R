#CONNECTIONS
# Conexiones
# R incluye un tipo de objeto especial para recibir datos de (o enviar datos a) 
# aplicaciones o archivos fuera del entorno R. (Las conexiones son como punteros 
# de archivos en C o identificadores de archivos en Perl). Puede crear conexiones
# a archivos, URL, archivos comprimidos zip, archivos comprimidos gzip, archivos 
# comprimidos bzip, conductos de Unix, sockets de red y FIFO (primero en entrar, 
# primero en salir) objetos. Incluso puede leer desde el Portapapeles del sistema 
# (para pegar datos en R).
consumption.connection <- gzfile(description="data/consumption.rda", open="r")
consumption.connection

close(consumption.connection)

# La mayoría de las veces, no tiene que abrir conexiones explícitamente. Muchas
# funciones para leer o escribir archivos (como guardar, cargar o leer una tabla) 
# abrirán conexiones implícitamente cuando proporcione un nombre de archivo o URL
# como argumento. Las conexiones pueden ser útiles para leer datos de tipos de 
# archivos no estándar (como archivos comprimidos con bz o conexiones de red).


