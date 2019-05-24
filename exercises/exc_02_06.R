library(gamair)
data("mpg", package="gamair")

library(mgcv)
# Fit the model
mod <- gam(hw.mpg ~ s(weight) + s(rpm) + s(price) + comp.ratio, 
           data = mpg, method = "REML")

# Plot the price effect
___

# Plot all effects
___