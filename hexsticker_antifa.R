#-------------------------------------------
# Script to create rladies antifa hexsticker
#-------------------------------------------

# libraries
library(hexSticker)
library(png)
library(grid)
library(plotrix)

# helper functions
source("fct/addImg.R")
source("fct/antifa.R")

#colors
rladies <- "#562457" #rladies purple

#antifa image
img <- readPNG("figs/noun_Antifa_1245689.png")
g <- rasterGrob(img, interpolate = TRUE)

# preview of plot
antifa(x = "RLADIES", bg.col = rladies)

sticker(~ antifa(bg.col = rladies), # bg color for antifa logo
        package = "",
        s_x = .7, s_y = .7,
        s_width = 3.5, s_height = 3.5,
        p_size = 13,
        h_fill = rladies, #bg color for hexsticker
        h_color = "black",
        filename = "hexsticker/rladies_antifa.png")




