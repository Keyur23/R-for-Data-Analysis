install.packages("tidyverse")

library(tidyverse)

ev_data <- read.csv("EV_Population.csv")

str(ev_data)
summarize_all(ev_data, ~sum(is.na(.)))

print(ev_data)

ev_data <- distinct(ev_data)

colnames(ev_data) <- c(
  "state",
  "model_year",
  "make",
  "electric_vehicle_type",
  "electric_range",
  "base_msrp",
  "legislative_district",
  "cafv_eligibility"
)

ev_data$state <- as.factor(ev_data$state)
ev_data$make  <- as.factor(ev_data$make)
ev_data$electric_vehicle_type <- as.factor(ev_data$electric_vehicle_type)

summary(ev_data)

grouped_summary <- ev_data %>%
  group_by(state)%>%
  summarise(
    avg_range = mean(electric_range,na.rm = TRUE),
    avg_msrp = mean(base_msrp,na.rm = TRUE),
    total_vehicles = n()
  )

print(grouped_summary)


ggplot(ev_data, aes(x=electric_range)) + geom_histogram(binwidth = 20,fill = "blue", color = "black")+
  theme_minimal() + 
  labs(title = "Distribution of Electric Range", x= "Electric Range(miles)",y = "Count")

ggplot(ev_data, aes(x = state)) +
  geom_bar(fill = "orange", color = "black") +
  theme_minimal() +
  labs(title = "Electric Vehicle Count by State", x = "State", y = "Count") +
  coord_flip()

ggplot(ev_data, aes(x = electric_range, y = base_msrp)) +
  geom_point(alpha = 0.5, color = "purple") +
  theme_minimal() +
  scale_y_continuous(labels = scales::comma) +
  labs(title = "Electric Range vs Base MSRP", x = "Electric Range (miles)", y = "Base MSRP ($)")

ggplot(ev_data, aes(x = electric_vehicle_type, y = electric_range)) +
  geom_boxplot(fill = "lightgreen", color = "darkgreen") +
  theme_minimal() +
  labs(title = "Average Electric Range by Vehicle Type", x = "Electric Vehicle Type", y = "Electric Range (miles)")

ggplot(ev_data, aes(x = model_year)) +
  geom_bar(fill = "skyblue", color = "black") +
  theme_minimal() +
  labs(title = "Number of Vehicles by Model Year", x = "Model Year", y = "Count")
