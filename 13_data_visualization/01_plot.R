#DATA VISUALIZACIÓN

data <- load('data/toxins.and.cancer.rda')

data.1 <- transform(toxins.and.cancer, NT = new_total * 1)
View(data.1)
str(data.1)


#Scatter Plots

plot(x, y = NULL, type = "p", xlim = NULL, ylim = NULL,
    log = "", main = NULL, sub = NULL, xlab = NULL, ylab = NULL,
    ann = par("ann"), axes = TRUE, frame.plot = axes,
    panel.first = NULL, panel.last = NULL, asp = NA, ...)
# argumentos, descripción, por defecto 
# página 237

attach(data.1)

plot(total_toxic_chemicals/Surface_Area, deaths_total/Population)

plot(air_on_site/Surface_Area, deaths_lung/Population)

locator(1)

# Otra función útil para identificar puntos es identificar. Esta función se puede
# utilizar para etiquetar puntos de forma interactiva en un gráfico. Para usar la
# identificación con los datos anteriores, debe ingresar:

identity(air_on_site/Surface_Area,
         deaths_lung/Population,
         State_Abbrev)

# Mientras se ejecuta este comando, puede hacer clic en puntos individuales en el
# gráfico y R etiquetará esos puntos con nombres de estado.

plot(air_on_site/Surface_Area, deaths_lung/Population,
     xlab = "Air Release Rate of Toxic Chemicals",
     ylab = "Lung Cancer Death Rate")
text(air_on_site/Surface_Area, deaths_lung/Population,
     labels = State_Abbrev,
     cex = 0.5,
     adj = c(0,-1))


# La función de trazado es una buena opción si desea trazar dos columnas de datos
# en un gráfico. Sin embargo, suponga que tiene más columnas de datos para trazar
# , tal vez divididas en diferentes categorías. O suponga que desea graficar todas
# las columnas de una matriz contra todas las columnas de otra matriz. Para trazar
# varios conjuntos de columnas uno contra el otro, puede usar la función matplot:

matplot(x, y, type = "p", lty = 1:5, lwd = 1, pch = NULL,
        col = 1:6, cex = NULL, bg = NA,
        xlab = NULL, ylab = NULL, xlim = NULL, ylim = NULL,
        ..., add = FALSE, verbose = getOption("verbose"))
# argumentos, descripción, por defecto 
# página 240

smoothScatter(x, y = NULL, nbin = 128, bandwidth,
              colramp = colorRampPalette(c("white", blues9)),
              nrpoints = 100, pch = ".", cex = 1, col = "black",
              transformation = function(x) x^.25,
              postPlotHook = box,
              xlab = NULL, ylab = NULL, xlim, ylim,
              xaxs = par("xaxs"), yaxs = par("yaxs"), ...)


nutshell.data <- load('data/batting.2008.rda')
bateo.2008 <- transform(batting.2008, AVG = H/AB)
View(bateo.2008)
str(bateo.2008)

# Si tiene un marco de datos con n variables diferentes y desea generar un diagrama
# de dispersión para cada par de valores en el marco de datos, pruebe la función de
# pairs.

pairs(bateo.2008[bateo.2008$AB > 100, c("H","R","SO","BB","HR")])


#Plotting Time Series

plot(x, y = NULL, plot.type = c("multiple", "single"),
     xy.labels, xy.lines, panel = lines, nc, yax.flip = FALSE,
     mar.multi = c(0, 5.1, 0, if(yax.flip) 5.1 else 2.1),
     oma.multi = c(6, 0, 5, 0), axes = TRUE, ...)

#doble click en el archivo para que se cargue en valores
head(turkey.price.ts)
plot(turkey.price.ts)

# Otra forma de ver los efectos estacionales es con un diagrama de autocorrelación.
# Esta gráfica muestra cuán correlacionados están los puntos entre sí, por diferencia
# en el tiempo. También puede trazar la función de autocorrelación para una serie 
# temporal (que puede ser útil para observar los efectos cíclicos). El gráfico se 
# genera de forma predeterminada cuando llama a acf, que calcula la función de 
# autocorrelación. (Alternativamente, puede generar la función de autocorrelación
# con acf y luego trazarla por separado). Aquí se explica cómo generar el gráfico 
# para los datos del turkey.price:

acf(turkey.price.ts)
