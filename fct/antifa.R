#' This function takes the antifa logo, edits the color of the flag and includes
#' text. It can save the ong on disk and return the path to be used in the next
#' step, that is creating the hexSticker
source("fct/addImg.R")
source("fct/get_image.R")

# set up a plot with a circle
antifa <- function(x = "R-LADIES+",
                   bg.col = '#a70000',
                   text.size = 3,
                   save = FALSE,
                   path = "./figs/antifa.png") {
  x <- toupper(x)
  # we recommend to keep the black and red color palette for the ANTIFA flag
  # if you change the background, please do not use yellow, don't be an ancap
  if (sum(grep("#", bg.col)) > 0) {
    hex.yellow <- c("#FFFFCC", "#FFFF99", "#FFFF66", #from light yellow1 to dark yellow4
                    "#FFFF33", "#FFFF00", "#CCCC00",
                    "#999900", "#666600", "#333300")
    avoid.yellow <- sum(bg.col %in% hex.yellow)
  } else {
    gold <- grep("gold", bg.col)
    yellow <- grep("yellow", bg.col)
    avoid.yellow <- sum(gold, yellow)
  }
  if (avoid.yellow > 0)
    stop("please don't be an ancap")
  # Executes get_image with the background color
  get_image(bg.col = bg.col)
  # the edited antifa flag:
  img <- png::readPNG("figs/antifa_color.png")
  if (save) png(path, bg = 'transparent', res = 300, width = 480*300/72,
                height = 480*300/72)
  plot(x = 0, y = 0, xlim = c(-2, 2), ylim = c(-2.5, 2.5),
       bty = "n", asp = 1, xaxt = "n", yaxt = "n", xlab = "", ylab = "", col = "white")
  #plotrix::draw.circle(x = 0, y = 0, radius = 1, col = bg.col, border = bg.col)
  addImg(img, x =  0, y = 0, width = 8.7)

  # add text
  plotrix::arctext(x = x, center = c(0, 0), radius = 2.15,
          middle = pi/2, cex = text.size, col = "white")
  plotrix::arctext(x = "ANTIFASCISTAS", center = c(0, 0), radius = 2.15,
          middle = 3*pi/2,
          clockwise = FALSE, cex = text.size, col = "white")
  if (save) {
    dev.off()
    return(path)
    }
  }
