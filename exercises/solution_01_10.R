library(gamair)
data("mpg", package="gamair")

library(mgcv)

# Examine the data
head(mpg)
str(mpg)

# Fit the model
mod_city <- gam(city.mpg ~ s(weight) + s(length) + s(price), 
                data = mpg, method = "REML")

# Plot the model
plot(mod_city, pages = 1)