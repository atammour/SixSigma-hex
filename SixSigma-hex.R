# SixSigma hex sticker
# Author: Abdullah Tammour
# Generates a PNG hex sticker for the SixSigma R package.

library(hexSticker)
library(ggplot2)
library(showtext)

# Font used for the package title.
font_add_google("Montserrat", "montserrat")
showtext_auto()

# Output directory
dir.create("output", showWarnings = FALSE)

# Color palette
background_color <- "#203D4F"
border_color <- "#1B5B82"
primary_color <- "#C9EAFF"
accent_color <- "#8EC5E8"

# Generate normal distribution data.
curve_data <- data.frame(
  x = seq(-3.5, 3.5, length.out = 400)
)

curve_data$y <- dnorm(curve_data$x)

# Shade the central ±1σ region to suggest a centered, low-variation process.
center_region <- subset(curve_data, x >= -1 & x <= 1)

# Build the normal curve graphic.
normal_curve_plot <- ggplot(curve_data, aes(x, y)) +
  geom_area(fill = primary_color, alpha = 0.18) +
  geom_area(
    data = center_region,
    aes(x, y),
    fill = accent_color,
    alpha = 0.07
  ) +
  geom_line(linewidth = 0.8, color = primary_color) +
  geom_segment(
    aes(x = 0, xend = 0, y = 0, yend = 0.385),
    linewidth = 0.8,
    color = accent_color,
    alpha = 0.5,
    inherit.aes = FALSE
  ) +
  annotate(
    "text",
    x = 0,
    y = -0.045,
    label = "\u03bc",
    parse = FALSE,
    color = accent_color,
    size = 16,
    fontface = "italic",
    family = "serif"
  ) +
  coord_cartesian(
    xlim = c(-3.4, 3.4),
    ylim = c(-0.09, 0.43),
    clip = "off"
  ) +
  theme_void()

# Export sticker.
sticker(
  subplot = normal_curve_plot,
  package = "SixSigma",
  p_family = "montserrat",
  p_size = 16,
  p_fontface = "bold",
  p_color = primary_color,
  p_y = 1.49,
  s_x = 1,
  s_y = 0.88,
  s_width = 1.28,
  s_height = 1.00,
  h_fill = background_color,
  h_color = border_color,
  h_size = 2,
  filename = "output/SixSigma_hex.png",
  dpi = 300
)
