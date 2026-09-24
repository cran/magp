## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ----benchmark-table----------------------------------------------------------
results <- read.csv(system.file(
  "benchmarks",
  "covariance-engine-results.csv",
  package = "magp"
))
knitr::kable(
  results,
  digits = 4,
  caption = "Median elapsed time per covariance calculation."
)

## ----session-file-------------------------------------------------------------
session_file <- system.file(
  "benchmarks",
  "covariance-engine-session-info.txt",
  package = "magp"
)
cat(paste(readLines(session_file), collapse = "\n"))

