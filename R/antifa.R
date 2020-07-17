#' Creates antifa logo

#' @description This function takes the antifa logo, edits the color of the flag and includes
#' text. It can save the png on disk and return the path to be used in the next
#' step, that is creating the hexSticker
#'
#' @param x Character. Name of the group identity
#' @param bg_col Background color for the flag
#' @param text_size Numeric. Text size for the image
#' @param save Logical
#' @param image_dir Character. Path to sabe image
#' @param image_name Character. Image file name without extension
#'
#' @export
#'
#' @importFrom plotrix arctext
#' @importFrom png readPNG
#' @importFrom grDevices dev.off png
#' @importFrom graphics par
#'
antifa <- function(x = "r-ladies+",
                   bg_col = '#a70000',
                   text_size = 3,
                   save = FALSE,
                   image_dir = NULL,
                   image_name = NULL) {
  # basic check
  if (save) {
    if(is.null(image_dir) | is.null(image_name)) {
      stop("You must provide image_dir and image_name")
    }
    if(!dir.exists(image_dir)) dir.create(image_dir)
  }
  x <- toupper(x)
  # we recommend to keep the black and red color palette for the ANTIFA flag
  # if you change the background, please do not use yellow, don't be an ancap
  if (sum(grep("#", bg_col)) > 0) {
    hex.yellow <- c("#FFFFCC", "#FFFF99", "#FFFF66", #from light yellow1 to dark yellow4
                    "#FFFF33", "#FFFF00", "#CCCC00",
                    "#999900", "#666600", "#333300")
    avoid.yellow <- sum(bg_col %in% hex.yellow)
  } else {
    gold <- grep("gold", bg_col)
    yellow <- grep("yellow", bg_col)
    avoid.yellow <- sum(gold, yellow)
  }
  if (avoid.yellow > 0)
    stop("please don't be an ancap, it is not acceptable to use yellow in an antifa flag")
  # Executes get_image with the background color

  # the edited antifa flag:
    res <- get_image(bg_col = bg_col)
    img <- png::readPNG(list.files(tempdir(), pattern = "antifa.png", full.names = TRUE))
    if (save) {
      image_path <- paste0(image_dir, "/", image_name, ".png")
      png(image_path, bg = 'transparent', res = 300, width = 480*300/72,
          height = 480*300/72)
    }
    par(mar = c(0,0,0,0))
    plot(x = 0, y = 0, xlim = c(-2, 2), ylim = c(-2.5, 2.5),
         bty = "n", asp = 1, xaxt = "n", yaxt = "n", xlab = "", ylab = "", col = "white")
    add_image(img, x =  0, y = 0, width = 8.7)
    # add text
    plotrix::arctext(x = x, center = c(0, 0), radius = 2.15,
                     middle = pi/2, cex = text_size, col = "white")
    plotrix::arctext(x = "ANTIFA", center = c(0, 0), radius = 2.15,
                     middle = 3*pi/2,
                     clockwise = FALSE, cex = text_size, col = "white")
    if (save) {
      dev.off()
      return(image_path)
    }

}
