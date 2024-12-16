library(ggplot2)
library(myPackage)

data("unemp")

canton_data <- clean_unemp(unemp,
                           level_of_interest = "Canton",
                           col_of_interest = active_population)

my_plot <- ggplot(canton_data) +
  geom_col(
    aes(
      y = active_population,
      x = year,
      fill = place_name
    )
  ) +
  theme(legend.position = "bottom",
        legend.title = element_blank())

ggsave("/home/rstudio/graphs/my_plot.pdf", my_plot)