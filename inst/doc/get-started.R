## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width = 6,
  fig.height = 5
)

## ----load-data----------------------------------------------------------------
library(magp)

train <- read.table(
  system.file("extdata", "example_train.txt", package = "magp"),
  header = TRUE
)
test <- read.table(
  system.file("extdata", "example_test.txt", package = "magp"),
  header = TRUE
)

train[1:3, ]

## ----fit-model----------------------------------------------------------------
fit <- magp2d_fit(
  train,
  seed = 1,
  maxeval = 100
)
fit

## ----multistart-example, eval=FALSE-------------------------------------------
# fit <- magp2d_fit(
#   train,
#   seed = 1,
#   n_starts = 8,
#   workers = 2
# )

## ----predict------------------------------------------------------------------
prediction <- predict(
  fit,
  test,
  se.fit = TRUE,
  type = "response"
)

comparison <- data.frame(
  observed = test$y,
  predicted = prediction$fit,
  standard_error = prediction$se.fit
)
head(comparison)
magp2d_rmse(comparison$predicted, comparison$observed)

## ----prediction-plot----------------------------------------------------------
plot(
  comparison$observed,
  comparison$predicted,
  xlab = "Observed response",
  ylab = "Predicted response",
  pch = 19,
  col = "#2c7fb8"
)
abline(0, 1, lty = 2, col = "#555555")

## ----full-model, eval=FALSE---------------------------------------------------
# fit_full <- magpfull_fit(train, seed = 1)
# predict(fit_full, test, se.fit = TRUE, type = "response")

## ----citation-----------------------------------------------------------------
citation("magp")

