library(dplyr)

#' Load and preprocess data
#' @param path1 path to the first dataset.
#' @param path2 path to the second dataset.
#' @return merged dataframe with 'is_pop' as numeric values. 
load_and_preprocess_data <- function(path1, path2) {
  df1 <- read.csv(path1, sep = ";")
  df2 <- read.csv(path2, sep = "")
  data <- merge(df1, df2, by = "song_id", all = FALSE)
  selected_columns <- c("danceability", "energy", "liveness", 
                        "loudness", "speechiness", "valence", "tempo", "is_pop")
  data <- data[selected_columns]
  
  # Convert target to binary numeric
  data$is_pop <- as.numeric(data$is_pop == "True")
  
  return (data)
}

#' Split data into train/validation/test sets
#' @param data the data set to be split.
#' @param train_ratio proportion for training data set.
#' @param valid_ratio proportion for validation data set.
#' @return list containing training, validation and test data splitted in
#' given ratios.
split_data <- function(data, train_ratio = 0.3, valid_ratio = 0.3) {
  set.seed(12345)
  n <- nrow(data)
  train_ids <- sample(1:n, size = floor(n * train_ratio))
  valid_ids <- sample(setdiff(1:n, train_ids), size = floor(n * valid_ratio))
  test_ids <- setdiff(1:n, c(train_ids, valid_ids))
  
  return (list(
    train = data[train_ids, ],
    valid = data[valid_ids, ],
    test = data[test_ids, ]
  ))
}