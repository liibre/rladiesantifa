#' This function was originally written by Danielle Navarro for package rainbowr
#' it takes a template .svg and edits its palette. In this case the template is
#' the antifascist logo with a white background. The color of the flag is red by
#'  default but can be editted (bg.col). The function writes png and svg to disk
#'  and returns an svg

get_image <- function(logo_width = 480,
                      bg.col = "#562457"
                      ) {
  logo_path <- "figs/logo_template.svg"
  bg <- grDevices::col2rgb(bg.col)
  bg <- apply(bg, 2, function(x) { paste0("rgb(", paste0(x, collapse = ", "), ")")})
  # edit the svg template to use appropriate palette
  txt <- readLines(logo_path)
  txt <- gsub("red", bg, txt)

  # write the modified svg
  logo_new <- paste0("figs/antifa_color.svg")
  con <- file(logo_new)
  writeLines(txt, con)
  close(con)

  # reads images and rewrites it as a png
  img <-  magick::image_read_svg(path = "figs/antifa_color.svg")
  magick::image_write(img, path = "figs/antifa_color.png",
                      format = "png")
  return(img)
}

