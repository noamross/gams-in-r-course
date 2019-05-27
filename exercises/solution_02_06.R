library(gamair)
data("mpg", package="gamair")

library(mgcv)
# Fit the model
mod <- gam(hw.mpg ~ s(weight) + s(rpm) + s(price) + comp.ratio, 
           data = mpg, method = "REML")

# Plot the price effect
plot(mod, select = 3)

# Plot all effects
plot(mod, pages = 1, all.terms = TRUE)