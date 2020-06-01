# Using function from Marc in the box: https://stackoverflow.com/questions/27800307/adding-a-picture-to-plot-in-r
addImg <- function(
  obj, # an image file imported as an array (e.g. png::readPNG, jpeg::readJPEG)
  x = NULL, # mid x coordinate for image
  y = NULL, # mid y coordinate for image
  width = NULL, # width of image (in x coordinate units)
  interpolate = TRUE # (passed to graphics::rasterImage) A logical vector (or scalar) indicating whether to apply linear interpolation to the image when drawing.
){
  if (is.null(x) |
      is.null(y) |
      is.null(width)) {
    stop("Must provide args 'x', 'y', and 'width'")
  }
  USR <-
    par()$usr # A vector of the form c(x1, x2, y1, y2) giving the extremes of the user coordinates of the plotting region
  PIN <-
    par()$pin # The current plot dimensions, (width, height), in inches
  DIM <- dim(obj) # number of x-y pixels for the image
  ARp <- DIM[1] / DIM[2] # pixel aspect ratio (y/x)
  WIDi <-
    width / (USR[2] - USR[1]) * PIN[1] # convert width units to inches
  HEIi <- WIDi * ARp # height in inches
  HEIu <- HEIi / PIN[2] * (USR[4] - USR[3]) # height in units
  rasterImage(image = obj,
              xleft = x - (width / 2),
              xright = x + (width / 2),
              ybottom = y - (HEIu / 2),
              ytop = y + (HEIu / 2),
              interpolate = interpolate)
}
