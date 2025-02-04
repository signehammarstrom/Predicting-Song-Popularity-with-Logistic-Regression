library(glmnet)

#' Make predictions
#' @param r classification threshold.
#' @param model model used to make prediction.
#' @param newdata the data to make predictions on.
#' @return list containing predicted probabilities, predictions and misclassification rate
#' for the model when predicting on the given newdata.
predict_func <- function(r, model, newdata) {
  pred_prob <- predict(model, newdata = newdata, type = "response")
  predictions <- ifelse(pred_prob > r, 1, 0)
  
  # Compute misclassification rate
  misclass_rate <- misclass(newdata$is_pop, predictions)
  
  return (list(pred_prob = pred_prob, predictions = predictions, misclass_rate = misclass_rate))
}

#' Train and evaluate logistic regression
#' @param data the data set used for the logistic regression.
#' @param r classification threshold.
#' @return list containing the logistic regression model, its predictions and
#' misclassification rate.
train_and_evaluate_logistic <- function(split_data, r) {
  
  # Train logistic regression model
  model <- glm(is_pop ~ ., 
               family = binomial, data = split_data$train)
  
  # Predict on validation and test datasets
  valid_pred <- predict_func(r, model, split_data$valid)
  train_pred <- predict_func(r, model, split_data$train)
  
  # Print misclassification rate
  cat("Logistic Regression Validation Misclassification Rate:", valid_pred$misclass_rate, "\n")
  cat("Logistic Regression Train Misclassification Rate:", train_pred$misclass_rate, "\n")
  
  return(list(model = model, predictions = valid_pred$predictions, pred_prob = valid_pred$pred_prob, 
              misclass_rate = valid_pred$misclass_rate))
}