library(hexSticker)
library(ggplot2)
library(showtext)

font_add_google("Montserrat", "montserrat")
showtext_auto()

curve_data <- data.frame(
  x = seq(-3.5, 3.5, length.out = 400)
)

curve_data$y <- dnorm(curve_data$x)

center_fill <- subset(curve_data, x >= -1 & x <= 1)

spec_segments <- data.frame(
  x = c(-3, 3),
  label = c("LSL", "USL")
)

p <- ggplot(curve_data, aes(x, y)) +
  geom_area(fill = "white", alpha = 0.18) +
  geom_area(
    data = center_fill,
    aes(x, y),
    fill = "#00BFA5",
    alpha = 0.55
  ) +
  geom_line(linewidth = 1.0, color = "white") +

  geom_segment(
    data = spec_segments,
    aes(x = x, xend = x, y = 0.01, yend = 0.36),
    linetype = "dashed",
    linewidth = 1,
    color = "red",
    inherit.aes = FALSE
  ) +

  geom_segment(
    aes(x = 0, xend = 0, y = 0, yend = 0.40),
    linewidth = 1.2,
    color = "#00d084a3",
    alpha = 0.75,
    inherit.aes = FALSE
  ) +

  geom_text(
    data = spec_segments,
    aes(x = x, y = 0.4, label = label),
    color = "white",
    size = 6,
    fontface = "bold",
    family = "montserrat",
    inherit.aes = FALSE
  ) +

  annotate(
    "text",
    x = 0,
    y = -0.045,
    label = "mu",
    parse = TRUE,
    color = "white",
    size = 10,
    fontface = "bold",
    family = "montserrat"
  ) +

  coord_cartesian(
    xlim = c(-3.4, 3.4),
    ylim = c(-0.09, 0.43),
    clip = "off"
  ) +
  theme_void()

sticker(
  subplot = p,
  package = "Six Sigma",
  p_family = "montserrat",
  p_size = 16,
  p_fontface = "bold",
  p_color = "white",
  p_y = 1.52,
  s_x = 1,
  s_y = 0.88,
  s_width = 1.28,
  s_height = 1.00,
  h_fill = "#21669B",
  h_color = "#FF9800",
  h_size = 2,
  filename = "output/SixSigma_hex.png"
)

sticker(
  subplot = p,
  package = "Six Sigma",
  p_family = "montserrat",
  p_size = 16,
  p_fontface = "bold",
  p_color = "white",
  p_y = 1.52,
  s_x = 1,
  s_y = 0.88,
  s_width = 1.28,
  s_height = 1.00,
  h_fill = "#21669B",
  h_color = "#FF9800",
  h_size = 2,
  filename = "output/SixSigma_hex.svg"
)
