# Predicting Song Popularity with Logistic Regression

## Overview

This project applies logistic regression to predict song popularity based on different song features. The dataset consists of numerical attributes such as danceability, energy, and tempo. The model classifies songs as popular or not based on the song features.

## Project Structure

```         
├── data/                        # Contains CSV files with song features and popularity labels
├── scripts/
│   ├── data_preprocessing.R     # Functions for loading and preprocessing data
│   ├── logistic_regression_model.R  # Training and prediction functions
│   ├── evaluation.R             # Model evaluation function
├── plots/
│   ├── roc.R                    # ROC curve plot
│   main.R                       # Main script to execute the pipeline
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

    -   Evaluate the model using misclassification rate and ROC curves

    -   Print performance metrics

## Model & Evaluation

-   **Algorithm:** Logistic Regression

-   **Evaluation Metrics:**

    -   Misclassification rate

    -   Confusion matrix

    -   ROC curve analysis

## Future Improvements

-   Evaluate the data as it could be biased and unbalanced.

-   Improve model accuracy

-   Consider other less simple ML models such as Neural Networks or Support Vector Machines (SVMs)

## Author

Signe Jörnö Hammarström
