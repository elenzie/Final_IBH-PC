here::i_am("code/02_make_hist.R")

data <- readRDS(
  file = here::here("outputs/data_tidy.rds")
)

library(knitr)

histogram <-
  hist(
    data$age1,
    main = "Distribution of Age",
    xlab = "Participant Age Range"
)

png(
  here::here("outputs/histogram.png"),
  width = 600,
  height = 350
)

histogram <- hist(
  data$age1,
  main = "Distribution of Age",
  xlab = "Participant Age Range"
)

dev.off()