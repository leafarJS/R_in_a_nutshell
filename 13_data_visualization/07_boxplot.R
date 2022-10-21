#BOX PLOT

boxplot(x, ..., range = 1.5, width = NULL, varwidth = FALSE,
        notch = FALSE, outline = TRUE, names, plot = TRUE,
        border = par("fg"), col = NULL, log = "",
        pars = list(boxwex = 0.8, staplewex = 0.5, outwex = 0.5),
        horizontal = FALSE, add = FALSE, at = NULL)

# And here is the form of boxplot when a formula is specified:

boxplot(formula, data = NULL, ..., subset, na.action = NULL)

# argumentos, descripción, por defecto 
# página 267

bateo.2008 <- transform(batting.2008, OBP = (H+BB+HBP)/(AB+BB+HBP+SF))
attach(bateo.2008)
bateo.2008$PA = AB+BB+HBP+SF+SH
View(bateo.2008)
boxplot(OBP~teamID,
        data=bateo.2008[bateo.2008$PA>100 & bateo.2008$lgID=="AL",],
        cex.axis=.7)


# GRAPHICS DEVICES
par(mfcol = c(3,2))


png("C:/Users/Administrador/Desktop/R_in_a_Nutshell/multiple.fig.pdf",
    width = 4.3,
    height = 6.5,
    units = "in",
    res = 72)
par(mfcol = c(3,2))
pie(c(5,4,3))
plot(x=c(1,2,3,4,5), y=c(1.1,1.9,3,3.9,6))
barplot(c(1,2,3,4,5))
barplot(c(5,4,3,2,1), horiz = TRUE)
pie(c(50,40,30,20,10))
plot(c(1,2,3,4,5,6), c(4,3,6,2,1,1))
dev.off()


# argumentos, descripción, por defecto 
# página 277