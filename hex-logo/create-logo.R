library(tidyverse)
library(here)
library(hexSticker)
library(png)
library(grid)
library(magick)


# Create initial logo ----------------------------------------------------------
theme_hex <- theme_void() + theme_transparent() +
  theme(axis.ticks.length = unit(0, "mm"))

l <- 1
hex <- tibble(
  x = 1.35 * l * c(-sqrt(3) / 2, 0, rep(sqrt(3) / 2, 2), 0,
                   rep(-sqrt(3) / 2, 2)),
  y = 1.35 * l * c(0.5, 1, 0.5, -0.5, -1, -0.5, 0.5)
)


img<-image_read(here("hex-logo","stonks2.png"))

logo <- ggplot() +
  geom_polygon(data = hex, aes(x, y), color = "#000000", size = 14, alpha = 1,
               fill = "blue2") +
  annotate(geom = "text", label = "Bolagsanalyser", x = 0, y = -0.5,
           family = "Rockwell", color = "#FFFFFF", fontface = "bold",
           size = 38) +
  coord_equal(xlim = range(hex$x), ylim = range(hex$y), expand = TRUE) +
  theme_hex + annotation_raster(img, -0.8, 0.8, -0.35, 0.8)


png(here("man", "figures", "jakobjohannesson-large.png"), width = 181 * 6,
    height = 210 * 6, bg = "transparent")
print(logo)
dev.off()
# Tidy up logo -----------------------------------------------------------------
image_read(here("man", "figures", "jakobjohannesson-large.png")) %>%
  image_trim() %>%
  image_scale("905x1050!") %>%
  image_write(here("man", "figures", "jakobjohannesson-large.png"))

# do edits in PowerPoint to add nodes and edges


# Resize and save logo ---------------------------------------------------------
img <- image_read(here("man", "figures", "jakobjohannesson-large.png")) %>%
  image_trim()

sq_img <- image_blank(1000, 1000, "hotpink") %>%
  image_composite(image_scale(img, "x1000"), offset = "+68+0") %>%
  image_transparent("hotpink", fuzz = 15)

img %>%
  image_scale("181x210!") %>%
  image_write(here("man", "figures", "jakobjohannesson.png"))

img %>%
  image_scale("905x1050!") %>%
  image_write(here("man", "figures", "jakobjohannesson-large.png"))

sq_img %>%
  image_scale("32x32!") %>%
  image_write(here("man", "figures", "icon.png"))

sq_img %>%
  image_scale("192x192!") %>%
  image_write(here("man", "figures", "icon-192.png"))
