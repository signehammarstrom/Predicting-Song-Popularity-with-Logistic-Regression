# Predicting Song Popularity with Logistic Regression

## Overview

What makes a song go viral? In this project, I analyze audio features (e.g., danceability, energy, tempo) and predict whether a song will be popular or not using logistic regression. This project demonstrates my ability to apply machine learning in the music domain.

## Project Structure

```         
├── data/                        # Contains CSV files with song features and popularity labels
│   ├── acoustic_features.csv    # Raw song feature data
│   ├── song_pop.csv             # Popularity labels (1 = popular, 0 = not popular)
├── scripts/
│   ├── data_preprocessing.R     # Loads and preprocesses data
│   ├── logistic_regression_model.R  # Trains and tests logistic regression model
│   ├── evaluation.R             # Generates confusion matrix, accuracy, and ROC curves
├── plots/
│   ├── roc.R                    # ROC curve plot to evaluate model performance
│   main.R                       # Main pipeline: loads data, trains the model, and evaluates results
└── README.md                    # Project documentation
```

## Installation & Dependencies

Ensure you have R installed along with the following packages:

```         
install.packages(c("dplyr", "caret", "pROC", "glmnet"))
```

## How to Run

1.  Place the dataset files (`acoustic_features.csv` and `song_pop.csv`) in the `data/` folder.

2.  Run the main script:

    ```         
    source("main.R")
    ```

3.  The script will:

    -   Load and preprocess the data

    -   Split it into training, validation, and test sets

    -   Train a logistic regression model

    -   Evaluate the model using misclassification rate, confusion matrix and ROC curves

## Model & Evaluation

-   **Algorithm:** Logistic Regression

-   **Evaluation Metrics:**

    -   Misclassification rate

    -   Confusion matrix

    -   ROC curve analysis

## Future Improvements

-    Improve Model Differentiation: The logistic regression model struggles to distinguish between popular and unpopular songs, as shown by the high number of false positives and false negatives from the confusion matrix and by the high misclassification rates. Addressing this issue could improve predictive accuracy.

-    Increase ROC Curve Performance: The current ROC curve suggests that the model is not performing much better than random guessing. To improve this, more advanced models need to be considered.

-    Explore More Complex Models: Implement more advanced models such as neural networks or support vector machines (SVMs) to better capture nonlinear relationships in the data.

-    Investigate More Features: Investigate additional features beyond audio attributes, such as artist popularity or release year to enhance model performance.

-    Basis Function Expansion: Utilize polynomial methods to extend logistic regression's capacity for capturing complex patterns in the data.

## Author

Signe Jörnö Hammarström
