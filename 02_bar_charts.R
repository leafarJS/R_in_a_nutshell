# BAR CHARTS
data <-load('data/doctorates.rda')


doc.degrees.m <- as.matrix(doctorates[2:7])
rownames(doc.degrees.m) <- doctorates[,1]
doc.degrees.m

barplot(doc.degrees.m[1,])

barplot(doc.degrees.m,
        beside = TRUE, 
        horiz = TRUE,
        legend = FALSE,#true
        cex.names = .75)

barplot(t(doc.degrees.m),
        legend = FALSE, #true
        ylim = c(0,66000))


barplot(height, width = 1, space = NULL,
        names.arg = NULL, legend.text = NULL, beside = FALSE,
        horiz = FALSE, density = NULL, angle = 45,
        col = NULL, border = par("fg"),
        main = NULL, sub = NULL, xlab = NULL, ylab = NULL,
        xlim = NULL, ylim = NULL, xpd = TRUE, log = "",
        axes = TRUE, axisnames = TRUE,
        cex.axis = par("cex.axis"), cex.names = par("cex.axis"),
        inside = TRUE, plot = TRUE, axis.lty = 0, offset = 0,
        add = FALSE, args.legend = NULL, ...)
# argumentos, descripción, por defecto 
# página 247