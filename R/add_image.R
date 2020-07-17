#' Adds png image to a plot
#'
#' @description  Function adapted from from Marc in the box to add a png picture to a plot. Original function in: https://stackoverflow.com/questions/27800307/adding-a-picture-to-plot-in-r
#'
#' @param obj an image file imported as an array (e.g. png::readPNG, jpeg::readJPEG)
#' @param x mid x coordinate for image
#' @param y mid y coordinate for image
#' @param width width of image (in x coordinate units)
#' @param interpolate Logical. Passed to graphics::rasterImage. Indicates whether to apply linear interpolation to the image when drawing.
#'
#' @export
#'
#' @importFrom graphics rasterImage
#'
add_image <- function(obj,
                       x = NULL,
                       y = NULL,
                       width = NULL,
                       interpolate = TRUE
) {
  if (is.null(x) |
      is.null(y) |
      is.null(width)) {
    stop("Must provide args 'x', 'y', and 'width'")
  }
  USR <- par()$usr # A vector of the form c(x1, x2, y1, y2) giving the extremes of the user coordinates of the plotting region
  PIN <- par()$pin # The current plot dimensions, (width, height), in inches
  DIM <- dim(obj) # number of x-y pixels for the image
  ARp <- DIM[1] / DIM[2] # pixel aspect ratio (y/x)
  WIDi <- width / (USR[2] - USR[1]) * PIN[1] # convert width units to inches
  HEIi <- WIDi * ARp # height in inches
  HEIu <- HEIi / PIN[2] * (USR[4] - USR[3]) # height in units
  graphics::rasterImage(image = obj,
              xleft = x - (width / 2),
              xright = x + (width / 2),
              ybottom = y - (HEIu / 2),
              ytop = y + (HEIu / 2),
              interpolate = interpolate)
}
