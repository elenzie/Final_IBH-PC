here::i_am("code/01_make_table1.R")

data <- readRDS(
  file = here::here("outputs/data_tidy.rds")
)

library(gtsummary)

table_one <- data |>
  select(sex, depressed1) |>
  tbl_summary(by = depressed1) |>
  modify_spanning_header(c("stat_1", "stat_2") ~ "**IBH-PC Baseline Depression by Sex**") |>
  add_overall() |>
  add_p()

saveRDS(
  table_one,
  file = here::here("outputs/table_one.rds")
)