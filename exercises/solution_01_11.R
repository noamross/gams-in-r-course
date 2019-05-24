library(gamair)
data("mpg", package="gamair")

library(mgcv)

# Fit the model
mod_city2 <- gam(city.mpg ~ s(weight) + s(length) + s(price) + fuel + drive + style,
                 data = mpg, method = "REML")

# Plot the model
plot(mod_city2, all.terms = TRUE, pages = 1)