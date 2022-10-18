#Plotting Categorical Data
# Trazado de datos categoricos

cdplot(x, y,
       plot = TRUE, tol.ylab = 0.05, ylevels = NULL,
       bw = "nrd0", n = 512, from = NULL, to = NULL,
       col = NULL, border = 1, main = "", xlab = NULL, ylab = NULL,
       yaxlabels = NULL, xlim = NULL, ylim = c(0, 1), ...)

#Here is the form of cdplot when called with a formula:

cdplot(formula, data = list(),
         plot = TRUE, tol.ylab = 0.05, ylevels = NULL,
         bw = "nrd0", n = 512, from = NULL, to = NULL,
         col = NULL, border = 1, main = "", xlab = NULL, ylab = NULL,
         yaxlabels = NULL, xlim = NULL, ylim = c(0, 1), ...,
         subset = NULL)

# argumentos, descripción, por defecto 
# página 250

bateo.names.2008 <- transform(batting.2008,
                              AVG = H/AB,
                              bats = as.factor(bats),
                              throws = as.factor(throws))
cdplot(bats~AVG,
       bateo.names.2008,
       subset = (bateo.names.2008$AB > 100))


mosaicplot(x, main = deparse(substitute(x)),
           sub = NULL, xlab = NULL, ylab = NULL
           sort = NULL, off = NULL, dir = NULL,
           color = NULL, shade = FALSE, margin = NULL,
           cex.axis = 0.66, las = par("las"),
           type = c("pearson", "deviance", "FT"), ...)


mosaicplot(formula, data = NULL, ...,
           main = deparse(substitute(data)), subset,
           na.action = stats::na.omit)

# argumentos, descripción, por defecto 
# página 252


mosaicplot(bats~throws,
           bateo.names.2008,
           color = TRUE)
dev.off()

spineplot(bats~throws,
          bateo.names.2008)

assocplot(table(bateo.names.2008$bats, bateo.names.2008$throws),
          xlab = "Throws",
          ylab = "Bats")
