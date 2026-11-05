library(here)
library(readr)

here::i_am("code/00_tidy_data.R")
data <- readRDS(
  file = here::here("clean_data/IBHPC_clean.rds")
)

library(labelled)
library(gtsummary)

data$sex <- ifelse(
  data$sex == 1,
  "Male",
  "Female"
)

data$ok <- ifelse(
  data$ok == 1,
  "Eligible",
  "Not Eligible"
)

data$exp_cond <- ifelse(
  data$exp_cond == 1,
  "Active",
  "Control"
)

data$depressed1 <- ifelse(
  data$depressed1 == 1,
  "Yes",
  "No"
)

data$depressed2 <- ifelse(
  data$depressed2 == 1,
  "Yes",
  "No"
)

data$depressed3 <- ifelse(
  data$depressed3 == 1,
  "Yes",
  "No"
)

data <- data |> 
  mutate(Condition = exp_cond)

var_label(data) <- list(
  depressed1 = "Baseline Depression",
  sex = "Sex"
)

saveRDS(
  data,
  file = here::here("outputs/data_tidy.rds")
)