# Load libraries
library(tidyverse)
library(ggplot2)
library(dplyr)
library(caret)

# Set working directory and load data
setwd("/Users/cdmstudent/Documents/House Sales Analysis Using R")
house_data <- read.csv("kc_house_data.csv")

# Explore data
str(house_data)
summary(house_data)

# Clean data
house_data <- house_data %>% select(-id, -date) %>% filter(price < 5000000)

# EDA
ggplot(house_data, aes(x = price)) +
  geom_histogram(fill = "blue", bins = 50) +
  labs(title = "Distribution of House Prices") +
  theme_minimal()

ggplot(house_data, aes(x = sqft_living, y = price)) +
  geom_point(alpha = 0.5, color = "green") +
  labs(title = "Price vs. Square Footage") +
  theme_minimal()

cor_data <- house_data %>% select(price, sqft_living, bedrooms, bathrooms, condition, yr_built)
cor(cor_data)

# Modeling
set.seed(123)
train_index <- createDataPartition(house_data$price, p = 0.8, list = FALSE)
train_data <- house_data[train_index, ]
test_data <- house_data[-train_index, ]

model <- lm(price ~ sqft_living + bedrooms + bathrooms, data = train_data)
summary(model)

# Predictions
predictions <- predict(model, newdata = test_data)
results <- data.frame(Actual = test_data$price, Predicted = predictions)

# Visualize results
ggplot(results, aes(x = Actual, y = Predicted)) +
  geom_point(alpha = 0.5, color = "purple") +
  geom_abline(slope = 1, intercept = 0, color = "red") +
  labs(title = "Actual vs. Predicted House Prices") +
  theme_minimal()

rmse <- sqrt(mean((test_data$price - predictions)^2))
print(paste("RMSE:", round(rmse, 2)))