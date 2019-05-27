library(mgcv)
# Fit the model
mod <- gam(hw.mpg ~ s(length) + s(width) + s(height) + s(weight), 
           data = mpg, method = "REML")

# Check overall concurvity
___

