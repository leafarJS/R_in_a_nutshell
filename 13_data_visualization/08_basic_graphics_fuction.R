# BASIC GRAPHICS FUNCTIONS 

# High-level function low-level function 
# página 275 282
points(x, y = NULL, type = "p", ...)

matpoints(x, y, type = "p", lty = 1:5, lwd = 1, pch = NULL,
          col = 1:6, ...)

lines(x, y = NULL, type = "l", ...)

curve(expr, from = NULL, to = NULL, n = 101, add = FALSE,
      type = "l", ylab = NULL, log = NULL, xlim = NULL, ...)

text (x, y = NULL, labels = seq_along(x), adj = NULL,
      pos = NULL, offset = 0.5, vfont = NULL,
      cex = 1, col = NULL, font = NULL, ...)

abline(a = NULL, b = NULL, h = NULL, v = NULL, reg = NULL,
       coef = NULL, untf = FALSE, ...)

#draw a simple plot as a background
plot(x=c(0,10), y=c(0,10))
# plot a horizontal line at y = 4
abline(h=4)
# plot a vertical line at x = 3
abline(v = 3)
# plot a line with a y-intercept of 1 and slope of 1
abline(a=1, b=1)
#plot a line with a y-intecept of 10 and slope of -1
#but this time, use the coef argument:
abline(coef = c(10,-1))
#plot a grid of lines between 1 to 10:
abline(h=1:10, v=1:10)


#poligon

polygon(x, y = NULL, density = NULL, angle = 45,
        border = NULL, col = NA, lty = par("lty"), ...)

polygon(x = c(2,2,4,4), y=c(2,4,4,2))

rect(xleft, ybottom, xright, ytop, density = NULL, angle = 45,
     col = NA, border = NULL, lty = par("lty"), lwd = par("lwd"),
     ...)

#segments

segments(x0, y0, x1, y1,
         col = par("fg"), lty = par("lty"), lwd = par("lwd"),
         ...)

#legend 
legend(x, y = NULL, legend, fill = NULL, col = par("col"),
       lty, lwd, pch,
       angle = 45, density = NULL, bty = "o", bg = par("bg"),
       box.lwd = par("lwd"), box.lty = par("lty"), box.col = par("fg"),
       pt.bg = NA, cex = 1, pt.cex = cex, pt.lwd = lwd,
       xjust = 0, yjust = 1, x.intersp = 1, y.intersp = 1,
       adj = c(0, 0.5), text.width = NULL, text.col = par("col"),
       merge = do.lines && has.pch, trace = FALSE,
       plot = TRUE, ncol = 1, horiz = FALSE, title = NULL,
       inset = 0, xpd, title.col = text.col)

# argumentos, descripción, por defecto 
# página 284


#title
title(main = NULL, sub = NULL, xlab = NULL, ylab = NULL,
      line = NA, outer = FALSE, ...)

#axis
xis(side, at = NULL, labels = TRUE, tick = TRUE, line = NA,
    pos = NA, outer = FALSE, font = NA, lty = "solid",
    lwd = 1, lwd.ticks = lwd, col = NULL, col.ticks = NULL,
    hadj = NA, padj = NA, ...)
# argumentos, descripción, por defecto 
# página 286

#box
box(which = "plot", lty = "solid", ...)

#mtext
mtext(text, side = 3, line = 0, outer = FALSE, at = NA,
      adj = NA, padj = NA, cex = NA, col = NA, font = NA, ...)

#trans3d
trans3d(x,y,z, pmat)

# This function takes vectors of points x, y, and z and translates them into the correct
# screen position. The argument pmat is a perspective matrix that is used for translation.
# The persp function will return an appropriate perspective matrix object for use by
# trans3d.