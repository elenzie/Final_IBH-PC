here::i_am("code/03_make_bar.R")

data <- readRDS(
  file = here::here("outputs/data_tidy.rds")
)

library(ggplot2)
library(tidyverse)
library(dplyr)

dep_long <- data |> 
  pivot_longer(
    cols = c(depressed1, depressed2, depressed3),
    names_to = "Time",
    values_to = "Depressed"
  ) |> 
  mutate(
    Time = factor(Time,
                  levels = c("depressed1", "depressed2", "depressed3"),
                  labels = c("Baseline", "Midpoint", "Follow-Up"))
  )

data_summary <- dep_long |> 
  filter(!is.na(Depressed), !is.na(Condition)) |> 
  group_by(Condition, Time) |> 
  summarise(
    n = n(),
    prop_depressed = mean(Depressed == "Yes"),
    .groups = "drop"
  )

stacked_bar <-
  ggplot(data_summary, aes(x = Time, y = prop_depressed, fill = Condition)) +
    geom_col(position = position_dodge(width = 0.6), width = 0.5) +
    labs(
      title = "Participants with Depression in Treatment vs. Control Groups Over Time",
      x = NULL, 
      y = "Participants with Depression", 
      fill = NULL)

ggsave(
  here::here("outputs/stacked_bar.png"),
  plot = stacked_bar,
  device = "png",
  width = 7,
  height = 5,
  units = "in"
)