# set up a plot with a circle
antifa <- function(x = "RLADIES", bg.col = '#a70000') {
plot(x = 0, y = 0, xlim = c(-2, 2), ylim = c(-2, 2),
     bty = "n", xaxt = "n", yaxt = "n", xlab = "", ylab = "", col = "white")
draw.circle(x = 0, y = 0, radius = 1, col = bg.col, border = bg.col)
addImg(img, 0.01, 0.01, width = 8.7)

# add text
arctext(x = x, center = c(0, 0), radius = 1.1,
        middle = pi/2, cex = 2, col = "white")
arctext(x = "ANTIFA", center = c(0, 0), radius = 1.1,
        middle = 3*pi/2,
        clockwise = FALSE, cex = 2, col = "white")
}
