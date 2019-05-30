#### Exercise 4.2 ####

library(mgcv)
csale <- readRDS(url("https://github.com/noamross/gams-in-r-course/raw/master/csale.rds"))

# Examine the csale data frame
head(csale)
str(csale)

# Fit a logistic model
log_mod <- gam(purchase ~ s(mortgage_age), data = csale,
               family = binomial,
               method = "REML")

# Calculate the probability at the mean
plogis(coef(log_mod)[1])

#### Exercise 4.3 ####

# Fit a logistic model
log_mod2 <- gam(purchase ~ s(n_acts) + s(bal_crdt_ratio) +
                  s(avg_prem_balance) + s(retail_crdt_ratio) +
                  s(avg_fin_balance)  + s(mortgage_age) +
                  s(cred_limit),
                data = csale,
                family = binomial,
                method = "REML")

# View the summary
summary(log_mod2)

#### Exercise 4.5 ####

# Plot on the log-odds scale
plot(log_mod2, pages = 1)

# Plot on the probability scale
plot(log_mod2, pages = 1, trans = plogis)

# Plot with the intercept
plot(log_mod2, pages = 1, trans = plogis,
     shift = coef(log_mod2)[1])

# Plot with intercept uncertainty
plot(log_mod2, pages = 1, trans = plogis,
     shift = coef(log_mod2)[1], seWithMean = TRUE)

#### Exercise 4.10 ####

new_credit_data <- readRDS(url("https://github.com/noamross/gams-in-r-course/raw/master/new_credit_data.rds"))

# Calculate predictions and errors
predictions <- predict(log_mod2, newdata = new_credit_data,
                       type = "link", se.fit = TRUE)

# Inspect the predictions
predictions

# Calculate predictions and errors
predictions <- predict(log_mod2, newdata = new_credit_data,
                       type = "link", se.fit=TRUE)

# Calculate high and low predictions intervals
high_pred <- predictions$fit + 2*predictions$se.fit
low_pred <- predictions$fit - 2*predictions$se.fit

# Convert intervals to probability scale
high_prob <- plogis(high_pred)
low_prob <- plogis(low_pred)

high_prob
low_prob

#### Exercise 4.11 ####

# Predict from the model
prediction_1 <- predict(log_mod2,
                        newdata = new_credit_data[1, ],
                        type = "terms")

# Inspect
prediction_1

