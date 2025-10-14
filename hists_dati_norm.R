d1 = c(5)
d2 = c(2,5,5)
d3 = c(0,1,1,2,2,2,3,3,3,3,4,4,4,4,5,5,5,6,6,7)

library(ggplot2)

# plot 1
x=5

# Base histogram
ggplot(data.frame(x), aes(x)) +
  geom_histogram(binwidth = 1, fill = "grey70", color = "black") +
  scale_x_continuous(breaks = 0:7, limits = c(0, 7.5)) +
  scale_y_continuous(limits = c(0, 10)) +  # adjust ylim here
  labs(
    x = "punteggi possibili al test",
    y = "Numero di osservazioni"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    axis.line = element_line(color = "black", linewidth = 0.6),
    panel.grid = element_blank(),
    panel.border = element_blank(),
    axis.ticks = element_line(color = "black"),
    axis.ticks.length = unit(4, "pt"),
    axis.text = element_text(color = "black"),
    plot.margin = margin(10, 10, 10, 10)
  )


# plot 2
ggplot(data.frame(d2), aes(d2)) +
  geom_histogram(binwidth = 1, fill = "grey70", color = "black") +
  scale_x_continuous(breaks = 0:7, limits = c(0, 7.5)) +
  scale_y_continuous(limits = c(0, 10)) +  # adjust ylim here
  labs(
    x = "punteggi possibili al test",
    y = "Numero di osservazioni"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    axis.line = element_line(color = "black", linewidth = 0.6),
    panel.grid = element_blank(),
    panel.border = element_blank(),
    axis.ticks = element_line(color = "black"),
    axis.ticks.length = unit(4, "pt"),
    axis.text = element_text(color = "black"),
    plot.margin = margin(10, 10, 10, 10)
  )

# plot3
d3 = c(0,1,2,2,3,3,3,4,4,4,5,5,6)

ggplot(data.frame(d3), aes(d3)) +
  geom_histogram(binwidth = 1, fill = "grey70", color = "black") +
  scale_x_continuous(breaks = 0:7, limits = c(0, 7.5)) +
  scale_y_continuous(limits = c(0, 10)) +  # adjust ylim here
  labs(
    x = "punteggi possibili al test",
    y = "Numero di osservazioni"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    axis.line = element_line(color = "black", linewidth = 0.6),
    panel.grid = element_blank(),
    panel.border = element_blank(),
    axis.ticks = element_line(color = "black"),
    axis.ticks.length = unit(4, "pt"),
    axis.text = element_text(color = "black"),
    plot.margin = margin(10, 10, 10, 10)
  )


