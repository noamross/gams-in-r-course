library(mgcv)
data(meuse, package="sp")

# Fit the model
mod2d <- gam(cadmium ~ s(x, y), data = meuse, method = "REML")

# Inspect the model
summary(mod2d)
coef(mod2d)
