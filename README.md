
# A package for antifa programmers

<img src="https://raw.githubusercontent.com/liibre/rladies_antifa/master/vignettes/figures/rladies_antifa_red.png" align="right" alt="" width="120" />

This package depends on the following libraries:

  - **graphics**
  - **magick**
  - **plotrix**

To install the package use:

    remotes::install_github("liibre/rladiesantifa")

In addition, you will have to load these packages:

    # libraries
    library(rladiesantifa)
    library(hexSticker)

Here, we define the dark purple from RLadies

    #colors
    rladies <- "#562457" #rladies purple, for a lighter option use: #88398A both from rladies color palete

For the ANTIFA flag we use the public domain icon from [The Noun
Project](https://thenounproject.com/search/?q=antifa&i=1245689). The
function `antifa()` creates the flag with the desired title.

To create the hexSticker the image should be on disk (`save = TRUE`). We
have seen that the text size is dependent on the OS. If it is too big or
too small, use the argument `text.size` to control it.

    antifa1 <- antifa(save = TRUE, 
                      image_dir = "./figures/", 
                      image_name = "antifa1")

``` 
                  sticker(antifa1,
        package = "",
        asp = 0.85,
        s_x = 1, s_y = 1,
        s_width = 1, s_height = 1,
        p_size = 13,
        h_fill = rladies, #bg color for hexsticker
        h_color = "black",
        filename = "figures/rladies_antifa_red.png")
```

## Other options of hexstickers

![](vignettes/figures/rladies_antifa_red.png)

![](vignettes/figures/rladies_antifa_purple.png)

![](vignettes/figures/rladies_antifa_light_purple.png)
