#' Compute misclassification rate
#' @param true The true value.
#' @param predicted The predicted value.
#' @return misclassification rate as numeric value.
misclass <- function(true, predicted) {
  n <- length(true)
  return(1 - sum(diag(table(true, predicted))) / n)
}

roc_evaluation <- function(actual, predicted) {
  png("plots/roc_curve.png")
  
  # Calculate ROC curve
  roc_curve <- roc(split_data$valid$is_pop, logistic_results$pred_prob)
  
  # Plot ROC curve
  plot(roc_curve, main = "ROC Curve", col = "blue")
  abline(a = 0, b = 1, lty = 2, col = "red")  # Add diagonal line
  
  dev.off()
}