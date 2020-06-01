# set up a plot with a circle
antifa <- function(x = "RLADIES+", bg.col = '#a70000', size = 3) {
# we recommend to keep the black and red color palette for the ANTIFA flag
  # if you change the background, please do not use yellow
  hex.yellow <- c("#FFFFCC", "#FFFF99", "#FFFF66", #from light yellow1 to dark yellow4
                  "#FFFF33", "#FFFF00", "#CCCC00",
                  "#999900", "#666600", "#333300")
  names.yellow <- grep("[goldyellow]", bg.col)
  if (bg.col %in% hex.yellow | names.yellow > 0) {
    stop("it is not a acceptable to use any type of yellow in an antifa flag")
  }
  plot(x = 0, y = 0, xlim = c(-2, 2), ylim = c(-2, 2),
       bty = "n", xaxt = "n", yaxt = "n", xlab = "", ylab = "", col = "white")
  draw.circle(x = 0, y = 0, radius = 1, col = bg.col, border = bg.col)
  addImg(img, 0.01, 0.01, width = 8.7)

  # add text
  arctext(x = x, center = c(0, 0), radius = 1.1,
          middle = pi/2, cex = size, col = "white")
  arctext(x = "ANTIFA", center = c(0, 0), radius = 1.1,
          middle = 3*pi/2,
          clockwise = FALSE, cex = size, col = "white")
}
