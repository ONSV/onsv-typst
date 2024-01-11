library(ggplot2)
library(camcorder)
library(onsvplot)
library(gt)

gg_record(device = "png", dpi = 300, width = 6, height = 3.7)

p1 <- ggplot(iris, aes(x = Sepal.Length, y = Petal.Length, color = Species)) +
  geom_point() +
  theme_onsv() +
  scale_discrete_onsv()

ggsave(
  filename = "img/img-test.svg",
  plot = p1, 
  width = 6, 
  height = 3.7, 
  dpi = 300,
  device = "svg"
)

mpg |> 
  head(5) |>
  gt() |> 
  gtsave(filename = "img/tbl-test.png")
