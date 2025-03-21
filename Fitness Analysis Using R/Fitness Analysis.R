library(tidyverse)
library(lubridate)
library(dplyr)
library(ggplot2)


setwd("E:\\DATA ANALYST\\R\\Fitness Analysis")
# Read the data files
daily_activity <- read.csv("dailyActivity_merged.csv")
sleep_data <- read.csv("sleepDay_merged.csv")
heart_rate <- read.csv("heartrate_seconds_merged.csv")

# Data Cleaning
daily_activity <- daily_activity %>%
  mutate(ActivityDate = mdy(ActivityDate))

sleep_data <- sleep_data %>%
  mutate(SleepDay = mdy_hms(SleepDay))

heart_rate <- heart_rate %>%
  mutate(Time = mdy_hms(Time))

sleep_data <- distinct(sleep_data)
# Summarize heart rate data to daily averages
daily_heart_rate <- heart_rate %>%
  group_by(Id, Date = as_date(Time)) %>%
  summarize(AverageHR = mean(Value))

# Merge datasets
combined_data <- daily_activity %>%
  left_join(sleep_data, by = c("Id" = "Id", "ActivityDate" = "SleepDay")) %>%
  left_join(daily_heart_rate, by = c("Id" = "Id", "ActivityDate" = "Date"))

#Visualization 1: Daily Steps Distribution

ggplot(combined_data, aes(x = TotalSteps)) +
  geom_histogram(binwidth = 1000, fill = "blue", color = "black") +
  labs(title = "Distribution of Daily Steps", x = "Total Steps", y = "Frequency")

#Visualization 2: Relationship Between Total Steps and Calories Burned

ggplot(combined_data, aes(x = TotalSteps, y = Calories)) +
  geom_point(color = "red") +
  geom_smooth(method = "lm", se = FALSE, color = "black") +
  labs(title = "Total Steps vs. Calories Burned", x = "Total Steps", y = "Calories Burned")

#Visualization 3: Sleep Duration Over Time

ggplot(combined_data, aes(x = ActivityDate, y = TotalMinutesAsleep)) +
  geom_line(color = "green") +
  labs(title = "Sleep Duration Over Time", x = "Date", y = "Total Minutes Asleep")


#Visualization 4: Average Heart Rate Over Time

ggplot(combined_data, aes(x = ActivityDate, y = AverageHR)) +
  geom_line(color = "purple") +
  labs(title = "Average Heart Rate Over Time", x = "Date", y = "Average Heart Rate (bpm)")


#Visualization 5: Correlation Between Sleep and Sedentary Time

ggplot(combined_data, aes(x = TotalMinutesAsleep, y = SedentaryMinutes)) +
  geom_point(color = "orange") +
  geom_smooth(method = "lm", se = FALSE, color = "black") +
  labs(title = "Sleep Duration vs. Sedentary Time", x = "Total Minutes Asleep", y = "Sedentary Minutes")

