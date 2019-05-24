library(mgcv)
# Fit the model
mod_city4 <- gam(city.mpg ~ s(weight) + s(length) + s(price) + s(rpm) + s(width),
                 data = mpg, method = "REML")

# View the summary
summary(mod_city4)