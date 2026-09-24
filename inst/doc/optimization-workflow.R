## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ----objective----------------------------------------------------------------
library(magp)

objective <- function(quantity_1, quantity_2, quantity_3,
                      sequence_1, sequence_2, sequence_3) {
  quantity <- c(quantity_1, quantity_2, quantity_3)
  sequence <- c(sequence_1, sequence_2, sequence_3)

  -sum((quantity - c(0.2, 0.6, 0.8))^2) -
    0.01 * sum((sequence - c(1, 3, 2))^2)
}

## ----complete-workflow, eval=FALSE--------------------------------------------
# result <- magp_bayes_optimize_from_scratch(
#   FUN = objective,
#   n_initial = 8,
#   q = 3,
#   model = "2d",
#   direction = "maximize",
#   n_iter = 3,
#   seed = 4,
#   design_control = list(
#     sequence_method = "sfta",
#     sequence_maxit = 500,
#     quantity_maxit = 500,
#     alignment_maxit = 500
#   ),
#   fit_control = list(
#     n_starts = 4,
#     workers = 2
#   ),
#   acquisition_control = list(
#     n_starts = 5,
#     workers = 2
#   ),
#   verbose = FALSE
# )
# 
# result$initial_design$design
# result$initial_response
# result$best_point
# result$best_value
# result$history

## ----compare-sequence-methods, eval=FALSE-------------------------------------
# random_design <- magp_initial_design(
#   n = 12,
#   q = 4,
#   sequence_method = "random",
#   seed = 4
# )
# 
# sfta_design <- magp_initial_design(
#   n = 12,
#   q = 4,
#   sequence_method = "sfta",
#   seed = 4,
#   sfta_control = list(nstarts = 5, ncalibrate = 200)
# )
# 
# rbind(random = random_design$criteria, sfta = sfta_design$criteria)
# sfta_design$sequence_search$sfta

## ----continue-existing, eval=FALSE--------------------------------------------
# design <- magp_initial_design(n = 8, q = 3, seed = 4)
# X_initial <- design$design
# y_initial <- apply(X_initial, 1L, function(row) {
#   do.call(objective, as.list(row))
# })
# 
# result <- magp_bayes_optimize(
#   FUN = objective,
#   X = X_initial,
#   y = y_initial,
#   direction = "maximize",
#   n_iter = 3,
#   seed = 4,
#   verbose = FALSE
# )
# 
# result$best_point
# result$best_value
# result$history

