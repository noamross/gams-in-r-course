library(mgcv)
csale <- readRDS("csale.rds")
new_credit_data <- readRDS("new_credit_data.rds")
log_mod2 <- gam(purchase ~ s(n_acts) + s(bal_crdt_ratio) +
                  s(avg_prem_balance) + s(retail_crdt_ratio) +
                  s(avg_fin_balance)  + s(mortgage_age) + s(cred_limit),
                data = csale,
                family = binomial,
                method = "REML")

# Calculate predictions and errors
predictions <- predict(log_mod2, newdata = new_credit_data,
                       type = "link", se.fit = TRUE)

# Calculate high and low predictions intervals
high_pred <- predictions$fit + 2*predictions$se.fit
low_pred <- predictions$fit - 2*predictions$se.fit

# Convert intervals to probability scale
high_prob <- ___
low_prob <- ___

# Inspect
high_prob
low_prob
