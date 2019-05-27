library(gamair)
data("mpg", package="gamair")

library(mgcv)

# Fit the model
mod_city3 <- gam(city.mpg ~ s(weight, by = drive) + s(length, by = drive) + s(price, by = drive) + drive,
                 data = mpg, method = "REML")

# Plot the model
plot(mod_city3, pages = 1)
