
# Code to create rladies antifa hexsticker

You will need to have installed and loaded the following libraries:

``` r
# libraries
library(hexSticker)
library(png)
library(grid)
library(plotrix)
```

In addition, load these functions

``` r
# helper functions
source("fct/addImg.R")
source("fct/antifa.R")
```

Here, we define the dark purple from RLadies

``` r
#colors
rladies <- "#562457" #rladies purple, for a lighter option use: #88398A
```

Here we load the ANTIFA image. Public domain icon from [The Noun
Project](https://thenounproject.com/search/?q=antifa&i=1245689).

``` r
#antifa image
img <- readPNG("figs/noun_Antifa_1245689.png")
```

Finally, we create the hexSticker:

``` r
sticker(~ antifa(), # bg color for antifa logo
        package = "",
        s_x = .7, s_y = .7,
        s_width = 3.5, s_height = 3.5,
        p_size = 13,
        h_fill = rladies, #bg color for hexsticker
        h_color = "black",
        filename = "hexsticker/rladies_antifa_red.png")
```

![](hexsticker/rladies_antifa_red.png)
