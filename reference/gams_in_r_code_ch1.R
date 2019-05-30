#### Exercise 1.2  ####

mcycle <- MASS::mcycle

# Examine the mcycle data frame
head(mcycle)
plot(mcycle)

# Fit a linear model
lm_mod <- lm(accel ~ times, data = mcycle)

# Visualize the model
termplot(lm_mod, partial.resid = TRUE, se = TRUE)

#### Exercise 1.3 ####

# Fit the GAM model
gam_mod <- gam(accel ~ s(times), data = mcycle)

# Plot the results
plot(gam_mod, residuals = TRUE, pch = 1)

#### Exercise 1.4 ####

# Extract the model coefficients
coef(gam_mod)

#### Exercise 1.6 ####

# Fit a GAM with 3 basis functions
gam_mod_k3 <- gam(accel ~ s(times, k = 3), data = mcycle)

# Fit with 20 basis functions
gam_mod_k20 <- gam(accel ~ s(times, k = 20), data = mcycle)

# Visualize the GAMs
par(mfrow = c(1, 2))
plot(gam_mod_k3, residuals = TRUE, pch = 1)
plot(gam_mod_k20, residuals = TRUE, pch = 1)

#### Exercise 1.7 ####

# Extract the orginal model smoothing parameter
gam_mod$sp

# Fix the smoothing parameter at 0.1
gam_mod_s1 <- gam(accel ~ s(times), data = mcycle, sp = 0.1)

# Fix the smoothing parameter at 0.0001
gam_mod_s2 <- gam(accel ~ s(times), data = mcycle, sp = 0.0001)

# Plot both models
par(mfrow = c(2, 1))
plot(gam_mod_s1, residuals = TRUE, pch = 1)
plot(gam_mod_s2, residuals = TRUE, pch = 1)

#### Exercise 1.8 ####

# Fit the GAM with 50 basis functions and a smoothing parameter of 0.0001.
gam_mod_sk <- gam(accel ~ s(times, k = 50), data = mcycle, sp = 0.0001)

# Visualize the model
plot(gam_mod_sk, residuals = TRUE, pch = 1)

#### Exercise 1.10 ####

library(gamair)
data("mpg", package="gamair")

# Examine the data
head(mpg)
str(mpg)

# Fit a GAM to these data to predict city.mpg as the sum of smooth functions of weight, length, and price.
mod_city <- gam(city.mpg ~ s(weight) + s(length) + s(price),
                data = mpg, method = "REML")

#### Exercise 1.11 ####

# Fit a GAM to the mpg data, modeling city.mpg as a sum of smooth functions of weight, length, and price,
# and also include the categorical terms fuel, drive, and style.
mod_city2 <- gam(city.mpg ~ s(weight) + s(length) + s(price) + fuel + drive + style,
                 data = mpg, method = "REML")

# Plot the model
plot(mod_city2, all.terms = TRUE, pages = 1)

#### Exercise 1.12 ####

# Fit a model to predict city fuel efficiency (city.mpg) with smooth terms of weight, length, and price,
# but make each of these smooth terms depend on the drive categorical variable using by= in the smooth terms.
mod_city3 <- gam(city.mpg ~ s(weight, by = drive) + s(length, by = drive) + s(price, by = drive) + drive,
                 data = mpg, method = "REML")

# Plot the model
plot(mod_city3, pages = 1)

