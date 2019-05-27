library(mgcv)
library(gamair)
set.seed(0)
data("mpg", package="gamair", verbose=FALSE)
mod <- mgcv::gam(hw.mpg ~ s(length) + s(width) + s(height) + s(weight), data=mpg, method="REML")

library(mgcv)
# Fit the model
mod <- gam(hw.mpg ~ s(length) + s(width) + s(height) + s(weight), 
           data = mpg, method = "REML")

# Check pairwise concurvity
___

