## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  out.width = "100%",
  dpi = 300
)

## ----setup, include = FALSE---------------------------------------------------
library(heumilkr)
library(ggplot2)
library(ggExtra)

result <- readRDS("perf.rds")

rho_mean <- round(100 * mean(result$clarke_wright_perf_rho), 1)
xi_mean <- round(100 * mean(result$clarke_wright_perf_xi), 1)

description <-
  data.frame(
    group = c("A", "B", "E", "F", "tai"),
    group_desc = c(
      "Augerat A, 1995", "Augerat B, 1995",
      "Christofides and Eilon, 1969", "Fisher, 1994",
      "Rochatand Taillard, 1995"
    )
  )

## ----perf_scale_based_graph, echo=FALSE---------------------------------------
ggMarginal(
  merge(
    result,
    description,
    by = "group"
  ) |>
    ggplot(aes(x = n_site, y = clarke_wright_perf_xi,
               color = group_desc)) +
    geom_point(alpha = 0.6, size = 3) +
    scale_y_continuous(
      name = "Optimality vs. triviality",
      labels = scales::label_percent(),
      position = "left"
    ) +
    scale_x_continuous(
      name = "Number of demanding sites",
      position = "bottom"
    ) +
    scale_colour_discrete(name = "CVRPLIB data set") +
    theme_bw() +
    theme(legend.position = "bottom") +
    guides(color = guide_legend(nrow = 2)),
  type = "boxplot",
  margins = "y",
  list(alpha = 0.6),
  groupFill = TRUE
)


## ----perf_rel_graph, echo = FALSE---------------------------------------------
ggMarginal(
  merge(
    result,
    description,
    by = "group"
  ) |>
    ggplot(aes(x = n_site, y = clarke_wright_perf_rho, color = group_desc)) +
    geom_point(alpha = 0.6, size = 3) +
    scale_y_continuous(
      name = "Relative loss of savings",
      labels = scales::label_percent()
    ) +
    scale_x_continuous(
      name = "Number of demanding sites",
      position = "bottom"
    ) +
    scale_colour_discrete(name = "CVRPLIB data set") +
    theme_bw() +
    theme(legend.position = "bottom") +
    guides(color = guide_legend(nrow = 2)),
  type = "boxplot",
  margins = "y",
  list(alpha = 0.6),
  groupFill = TRUE
)

