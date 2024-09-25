# Retail Sales Prediction and Time Series Forecasting: A Data-Driven Approach Using R
---

This project demonstrates my proficiency in data manipulation, machine learning, time series forecasting, and data visualization using R. The goal is to predict sales based on historical retail transaction data and visualize key insights. Below are two R scripts used in this project:

### 1. **Product Sales Prediction with Linear Regression (Sales Prediction vs price point.R)** 
In this script, I utilize linear regression to model product sales based on quantity sold and average price. The key steps include:
- Loading and cleaning the dataset.
- Aggregating data by product (`StockCode`) to calculate total sales, total quantity sold, and average price.
- Splitting the data into training and testing sets.
- Building a linear regression model to predict total sales using quantity and price as predictors.
- Evaluating model performance using Mean Squared Error (MSE).
- Exploring optimal pricing by predicting sales across a range of price points.
- Visualizing the relationship between price and predicted sales using `ggplot2`.

### 2. **Time Series Forecasting with ARIMA (forecasting.R)**
This script focuses on time series forecasting for monthly retail sales using ARIMA models. Key highlights:
- Reading and preparing data from an Excel file.
- Handling missing values in the dataset.
- Converting sales data into a time series format suitable for forecasting.
- Fitting an ARIMA model to the monthly sales data.
- Forecasting sales for the next six months.
- Customizing and visualizing the forecast using `ggplot2`, with attention to time-based trends.

### Tools & Libraries Used:
- `dplyr` for data manipulation and aggregation.
- `ggplot2` for advanced data visualization.
- `forecast` and `tseries` for time series forecasting and analysis.
- `openxlsx` and `readxl` for reading Excel files.
- `zoo` for handling time series data.
