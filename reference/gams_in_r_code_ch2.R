#### Exercise 2.2 ####

library(gamair)
data("mpg", package="gamair")

library(mgcv)
# Fit and summarize the mod_city4 model,
mod_city4 <- gam(city.mpg ~ s(weight) + s(length) + s(price) + s(rpm) + s(width),
                 data = mpg, method = "REML")

# View the summary
summary(mod_city4)

#### Exercise 2.4 ####

# Fit the model
mod <- gam(accel ~ s(times), data = mcycle, method = "REML")

# Make the plot with residuals
plot(mod, residuals = TRUE)

# Change shape of residuals
plot(mod, residuals = TRUE, pch = 1, cex = 1)

#### Exercise 2.5 ####

# Fit the model
mod <- gam(hw.mpg ~ s(weight) + s(rpm) + s(price) + comp.ratio,
           data = mpg, method = "REML")

# Plot the price effect
plot(mod, select = 3)

# Plot all effects
plot(mod, pages = 1, all.terms = TRUE)

#### Exercise 2.6 ####

# Plot the weight effect in pink
plot(mod, select = 1, shade = TRUE, shade.col = "hotpink")

# Make another plot adding the intercept value and uncertainty
plot(mod, select = 1, shade = TRUE, shade.col = "hotpink",
     shift = coef(mod)[1], seWithMean = TRUE)

#### Exercise 2.8 ####

set.seed(0)
dat <- gamSim(1,n=200)

# Fit the model
mod <- gam(y ~ s(x0, k = 5) + s(x1, k = 5) + s(x2, k = 5) + s(x3, k = 5),
           data = dat, method = "REML")

# Run the check function
gam.check(mod)

#### Exercise 2.9 ####

set.seed(0)
dat <- mgcv::gamSim(1,n=600, scale=0.6, verbose=FALSE)

# Fit the model
mod <- gam(y ~ s(x0, k = 3) + s(x1, k = 3) + s(x2, k = 3) + s(x3, k = 3),
           data = dat, method = "REML")

# Check the diagnostics
gam.check(mod)

# Refit to fix issues
mod2 <- gam(y ~ s(x0, k = 3) + s(x1, k = 3) + s(x2, k = 10) + s(x3, k = 3),
            data = dat, method = "REML")

# Check the new model
gam.check(mod2)

#### Exercise 2.11 ####

# Fit the model
mod <- gam(hw.mpg ~ s(length) + s(width) + s(height) + s(weight),
           data = mpg, method = "REML")

# Check overall concurvity
concurvity(mod, full = TRUE)

#### Exercise 2.12 ####

# Check overall concurvity
concurvity(mod, full = FALSE)

