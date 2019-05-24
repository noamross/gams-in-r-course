library(mgcv)
data(meuse, package="sp")

# Fit the model
mod2da <- gam(cadmium ~ s(x, y) ___, 
              data = meuse, method = "REML")

# Inspect the model
summary(mod2da)
