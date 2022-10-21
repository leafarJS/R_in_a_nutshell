# Plotting Distributions
# Trazado de Distribuciones
bateo.2008 <- transform(batting.2008, PA = AB+BB+HBP+SF+SH)
View(bateo.2008)
hist(bateo.2008$PA)

hist(bateo.2008[bateo.2008$PA > 25, "PA"],
     breaks = 50,
     cex.main = .8)


plot(density(bateo.2008[bateo.2008$PA > 25, "PA"]))
rug(bateo.2008[bateo.2008$PA > 25, "PA"])

qqnorm(bateo.2008$AB)
