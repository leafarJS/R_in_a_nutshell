# Three-Dimensional Data

persp(x = seq(0, 1, length.out = nrow(z)),
      y = seq(0, 1, length.out = ncol(z)),
      z, xlim = range(x), ylim = range(y),
      zlim = range(z, na.rm = TRUE),
      xlab = NULL, ylab = NULL, zlab = NULL,
      main = NULL, sub = NULL,
      theta = 0, phi = 15, r = sqrt(3), d = 1,
      scale = TRUE, expand = 1,
      col = "white", border = NULL, ltheta = -135, lphi = 0,
      shade = NA, box = TRUE, axes = TRUE, nticks = 5,
      ticktype = "simple", ...)
# argumentos, descripción, por defecto 
# página 257
data<- load('data/yosemite.rda')
yosemite <- transform(yosemite, x = V1 *1)
dim(yosemite)

yosemite.flipped <- yosemite[, seq(from=253, to= 1)]

str(yosemite.flipped)
head(yosemite.flipped,3)
View(yosemite.flipped)

yosemite.rightmost <- yosemite[nrow(yosemite) - ncol(yosemite) + 1,]

#create halfdome subset in one expression:

halfdome <- yosemite[(nrow(yosemite) - ncol(yosemite) + 1):562,
                     seq(from=253, to=1)]  
persp(halfdome,
      col = "green",
      border = NA,
      expand = .15,
      theta = 225,
      phi = 20,
      ltheta = 45,
      lphi = 20, 
      shade = .75)


image(x, y, z, zlim, xlim, ylim, col = heat.colors(12),
      add = FALSE, xaxs = "i", yaxs = "i", xlab, ylab,
      breaks, oldstyle = FALSE, ...)
# argumentos, descripción, por defecto 
# página 259

image(yosemite, 
      asp=253/562,
      ylim = c(1,0),
      col = sapply((0:32)/32, gray))


heatmap(x, Rowv=NULL, Colv=if(symm)"Rowv" else NULL,
        distfun = dist, hclustfun = hclust,
        reorderfun = function(d,w) reorder(d,w),
        add.expr, symm = FALSE, revC = identical(Colv, "Rowv"),
        scale=c("row", "column", "none"), na.rm = TRUE,
        margins = c(5, 5), ColSideColors, RowSideColors,
        cexRow = 0.2 + 1/log10(nr), cexCol = 0.2 + 1/log10(nc),
        labRow = NULL, labCol = NULL, main = NULL,
        xlab = NULL, ylab = NULL,
        keep.dendro = FALSE, verbose = getOption("verbose"), ...)


contour(x = seq(0, 1, length.out = nrow(z)),
        y = seq(0, 1, length.out = ncol(z)),
        z,
        nlevels = 10, levels = pretty(zlim, nlevels),
        labels = NULL,
        xlim = range(x, finite = TRUE),
        ylim = range(y, finite = TRUE),
        zlim = range(z, finite = TRUE),
        labcex = 0.6, drawlabels = TRUE, method = "flattest",
        vfont, axes = TRUE, frame.plot = axes,
        col = par("fg"), lty = par("lty"), lwd = par("lwd"),
        add = FALSE, ...)
# argumentos, descripción, por defecto 
# página 261

contour(yosemite,
        asp=253/562,
        ylim = c(1,0))
