#to read excel into R
install.packages("openxlsx")
library(openxlsx)

#For data manipulation and aggregation.
install.packages("dplyr")
library(dplyr)
library(lubridate)

# For time series forecasting, including ARIMA models.
install.packages("forecast")
library(forecast)

#For additional time series analysis tools.
install.packages("tseries")
library(tseries)

#For advanced visualization
install.packages("ggplot2")
library(ggplot2)

# Install the package
install.packages("zoo")  
# Load the package
library(zoo)             

# Load data set 
sale <- readxl::read_excel("C:\\Users\\shevi\\Downloads\\online retail 1.xlsx")

# Preview the first few rows
head(data)
head(sale, 10)

#check if there is any null values in the data set 
missing_values <- any(is.na(sale))
missing_values

#how many columns with null values
missing_values <- sum(is.na(sale))
missing_values


#which columns has null values
missing_values <- colSums(is.na(sale))
missing_values 

# Converting to time series object
monthly_sales_ts <- ts(sale_monthly$Monthly_Sales, frequency = 12, 
                       start = c(year(min(sale_monthly$Month)), month(min(sale_monthly$Month))))

# Fit the ARIMA model
fit <- auto.arima(monthly_sales_ts)

# Forecast for the next 6 months
forecast_sales <- forecast(fit, h = 6)

# Plot the forecast
plot(forecast_sales, main="Monthly Sales Forecast for the Next 6 Months")

# Plot the forecast without x-axis labels
plot(forecast_sales, xaxt="n", main="Monthly Sales Forecast for the Next 6 Months")

# Customize the x-axis to show whole years
axis(1, at=seq(from=floor(min(time(monthly_sales_ts))), to=ceiling(max(time(forecast_sales$mean))), by=1), 
     labels=seq(from=floor(min(time(monthly_sales_ts))), to=ceiling(max(time(forecast_sales$mean))), by=1))



