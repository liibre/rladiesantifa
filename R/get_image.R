#' Reads antifa flag image and edits pallete of antifascist flag
#'
#' @description This function was originally written by Danielle Navarro for package rainbowr
#' it takes a template .svg and edits its palette. In this case the template is
#' the antifascist logo with a white background. The color of the flag is red by
#'  default but can be editted (bg.col). The function writes png and svg to disk
#'  and returns an svg
#'
#' @param logo_width Numeric. Width (in pixels) of the image
#' @param bg_col Color of background
#'
#' @importFrom magick image_read_svg image_write
#' @importFrom grDevices col2rgb
#' @export
#'
get_image <- function(logo_width = 480,
                      bg_col = NULL) {
  # Path to logo inside package
  logo_path <- system.file("extdata", "logo_template.svg", package = "rladiesantifa")

  # Editing color in svg
  bg <- grDevices::col2rgb(bg_col)
  bg <- apply(bg, 2, function(x) { paste0("rgb(", paste0(x, collapse = ", "), ")")})
  # edit the svg template to use appropriate palette
  txt <- readLines(logo_path)
  if (!is.null(bg_col)) {
    txt <- gsub("red", bg, txt)
  }
  # Writing the modified svg in a temporary file
  logo_tmp <- paste0(tempfile(), ".svg")
  con <- file(logo_tmp)
  writeLines(txt, con)
  close(con)

  # Reads image and rewrites it as a png
  img <-  magick::image_read_svg(path = logo_tmp)

  # if (write) {
  #   if (!dir.exists(image_dir)) dir.create(image_dir)
  #   magick::image_write(img,
  #                       path = paste0(image_dir,
  #                                     "/",
  #                                     image_name,
  #                                     ".png"),
  #                       format = "png")
  # } else {
  magick::image_write(img,
                      path = paste0(tempfile(),
                                    "antifa.png"),
                      format = "png")
  return(img)

}
