library(dplyr)
library(caret)
library(ggplot2)


# Load your data
data <- read.csv('C:\\Users\\Lenovo\\OneDrive - Southern Alberta Institute of Technology\\Desktop\\DataAnalytics\\CAPSTONE_PROJECT\\OnlineRetail.csv')

# Create Sales column
data <- data %>%
  mutate(Sales = Quantity * Price)

# Aggregate data by Stockcode
product_data <- data %>%
  group_by(StockCode) %>%
  summarise(TotalSales = sum(Sales),
            TotalQuantity = sum(Quantity),
            AveragePrice = mean(Price))



# Set seed for reproducibility
set.seed(42)

# Create training and testing sets
trainIndex <- createDataPartition(product_data$TotalSales, p = .8, 
                                  list = FALSE, 
                                  times = 1)
trainData <- product_data[ trainIndex, ]
testData  <- product_data[-trainIndex, ]




# Linear Regression Model
model <- lm(TotalSales ~ TotalQuantity + AveragePrice, data = trainData)

# Summary of the model
summary(model)




# Predict on test set
predictions <- predict(model, newdata = testData)

# Calculate Mean Squared Error
mse <- mean((testData$TotalSales - predictions)^2)
print(paste("Mean Squared Error:", mse))





# Create a range of price points
price_range <- data.frame(
  AveragePrice = seq(1, 100, by = 1),
  TotalQuantity = median(product_data$TotalQuantity) 
)

# Predict revenue for each price point
predicted_sales <- predict(model, newdata = price_range)


# Find the optimal price point
optimal_price <- price_range$AveragePrice[which.max(predicted_sales)]
print(paste("Optimal Price Point:", optimal_price))








# Create a dataframe for plotting
plot_data <- data.frame(Price = price_range$AveragePrice, Revenue = predicted_sales)

# Plot
ggplot(plot_data, aes(x = Price, y = Revenue)) +
  geom_line() +
  ggtitle("Sales Prediction vs. Price Point") +
  xlab("Price Point") +
  ylab("Predicted Sales") +
  theme_minimal()


