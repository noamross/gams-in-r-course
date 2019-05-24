library(gamair)
data("mpg", package="gamair")

library(mgcv)

# Examine the data
___
___

# Fit the model
mod_city <- gam(city.mpg ~ ___, 
                data = mpg, method = "REML")

# Plot the model
plot(mod_city, pages = 1)