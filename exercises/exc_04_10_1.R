# Calculate predictions and errors
predictions <- predict(log_mod2, newdata = new_credit_data, 
                       type = "link", se.fit = TRUE)

# Calculate high and low prediction intervals
high_pred <- ___
low_pred <- ___
