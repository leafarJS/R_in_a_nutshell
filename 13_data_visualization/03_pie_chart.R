#PIE CHARTS
pie(x, labels = names(x), edges = 200, radius = 0.8,
    clockwise = FALSE, init.angle = if(clockwise) 90 else 0,
    density = NULL, angle = 45, col = NULL, border = NULL,
    lty = NULL, main = NULL, ...)
# argumentos, descripción, por defecto 
# página 249


# units are millions of pound of live fish
domestic.catch.2006 <- c(7752,1166,463,108)
names(domestic.catch.2006)<- c("Fresh and frozen", "Reducen to meal, oil, etc.", "Canned", "Cured")
# note: cex.6 setting shrinks text size by 40% so you can see the labels
pie(domestic.catch.2006, init.angle = 100, cex = .6)