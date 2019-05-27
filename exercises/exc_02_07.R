library(gamair)
data("mpg", package="gamair")

library(mgcv)
# Fit the model
mod <- gam(hw.mpg ~ s(weight) + s(rpm) + s(price) + comp.ratio, 
           data = mpg, method = "REML")

# Plot the weight effect with colored shading
plot(mod, select = 1, ___)

# Make another plot adding the intercept value and uncertainty
plot(mod, select = 1, ___)

