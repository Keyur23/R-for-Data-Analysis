# Uber Data Analysis 🚗📊

This R project analyzes Uber ride data from New York City to uncover key trends and patterns in ride-hailing behavior. Using data from April to September 2014, it provides insights into trip frequencies, peak hours, popular days, and geographic distributions of Uber rides across NYC.

## Dataset

The project uses the **Uber Dataset from April to September 2014** available on Kaggle:
- **Dataset Link**: [Uber Dataset (April-September 2014)](https://www.kaggle.com/datasets/amirmotefaker/uber-dataset-from-april-to-september-2014?resource=download)
- **Coverage**: 6 months of Uber ride data (April - September 2014)
- **Location**: New York City
- **Data Fields**: Date/Time, Latitude, Longitude, Base (dispatch center)

## What This Project Does

This project performs comprehensive exploratory data analysis on Uber ride data to answer questions like:
- What are the busiest hours of the day for Uber rides?
- Which days of the month see the most trips?
- How do ride patterns vary across different months?
- What are the geographic hotspots for Uber pickups in NYC?
- How do trip frequencies differ by day of the week?

### Key Features

1. **Data Processing**:
   - Combines 6 months of Uber ride data into a single dataset
   - Extracts temporal features (hour, day, month, day of week)
   - Cleans and formats datetime information

2. **Temporal Analysis**:
   - Trips by hour of day
   - Trips by day of the month
   - Trips by month
   - Combined analysis (hour-month, day-month, day of week-month)

3. **Heat Map Visualizations**:
   - Hour vs. Day heat maps
   - Month vs. Day heat maps
   - Day of Week vs. Month heat maps

4. **Geographic Visualization**:
   - NYC map visualization based on ride pickup locations
   - Location-based analysis by dispatch base

## Visualizations

The project generates several insightful visualizations stored in the `Visualizations` directory:
- **Trips Every Hour**: Bar chart showing ride distribution throughout the day
- **Trips Every Day**: Bar chart showing daily ride patterns
- **Trips by Month**: Monthly ride trends across the 6-month period
- **Heat Maps**: Multiple heat maps showing correlations between time dimensions
- **NYC Map**: Geographic visualization of ride pickups across New York City

## Technologies Used

- **R**: Primary programming language
- **ggplot2**: Data visualization and plotting
- **ggthemes**: Additional themes for ggplot2
- **lubridate**: Date and time manipulation
- **dplyr**: Data manipulation and aggregation
- **tidyr**: Data tidying
- **DT**: Interactive data tables
- **scales**: Scale functions for visualization

## How to Run

1. Install required R packages:
```R
install.packages(c("ggplot2", "ggthemes", "lubridate", "dplyr", "tidyr", "DT", "scales"))
```

2. Download the dataset from the [Kaggle link](https://www.kaggle.com/datasets/amirmotefaker/uber-dataset-from-april-to-september-2014?resource=download)

3. Update the file paths in `main.R` to point to your dataset location

4. Open `main.R` in RStudio and run the script

5. View the generated visualizations and interactive data tables

## Insights

The analysis reveals interesting patterns such as:
- Peak ride hours typically occur during rush hours (morning and evening commutes)
- Certain days show higher trip frequencies
- Seasonal variations in ride patterns across the months
- Geographic clustering of rides in specific NYC areas

---

This project demonstrates the power of R for exploratory data analysis and data visualization in the context of real-world ride-sharing data.
