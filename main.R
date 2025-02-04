library(caret)
library(pROC)

# Load required scripts
source("scripts/data_preprocessing.R")
source("scripts/logistic_regression_model.R")
source("scripts/evaluation.R")

# Load and preprocess data
data <- load_and_preprocess_data("data/acoustic_features.csv", "data/song_pop.csv")
split_data <- split_data(data, train_ratio = 0.3, valid_ratio = 0.3)

# Logistic Regression
logistic_results <- train_and_evaluate_logistic(split_data, r = 0.4)
summary(logistic_results$model)

# Convert predictions to factor
predicted_classes <- factor(logistic_results$predictions, levels = c(0,1))
actual_classes <- factor(split_data$valid$is_pop, levels = c(0,1))

# Generate confusion matrix
conf_matrix <- confusionMatrix(predicted_classes, actual_classes)
print(conf_matrix)

roc_evaluation <- roc_evaluation(split_data$valid$is_pop, logistic_results$pred_prob)