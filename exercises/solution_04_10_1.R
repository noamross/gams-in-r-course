# Calculate predictions and errors
predictions <- predict(log_mod2, newdata = new_credit_data, 
                       type = "link", se.fit=TRUE)

# Calculate high and low predictions intervals
high_pred <- predictions$fit + 2*predictions$se.fit
low_pred <- predictions$fit - 2*predictions$se.fit
