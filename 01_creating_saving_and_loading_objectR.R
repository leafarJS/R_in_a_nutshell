# Entering Data Within R
# Entering Data Using R Commands
# 
# Introducción de datos dentro de R
# Introducción de datos mediante comandos R

salarios = c(15000,18000,20000,12000,45200)
posicion = c("Q4", "Q3", "Q2", "Q1", "Q5")
equipo = c("colts", "patriots", "panthers", "bengals", "giants")
nombre = c("jorge", "rafael", "miguel", "angel", "luis")
apellido = c("callejo", "flores", "guisbert", "tarqui", "linares")

top.5.salarios <- data.frame(nombre, apellido, equipo, posicion, salarios)
top.5.salarios

top.5.salarios <- edit(top.5.salarios)

fix(top.5.salarios)

View(top.5.salarios)

save(top.5.salarios, file = "~/top.5.salarios.RData")

save(top.5.salarios, 
     file = "C:/Users/Administrador/Desktop/R_in_a_Nutshell/top.5.salarios_1.RData"
     )
load("~/top.5.salarios.RData")



