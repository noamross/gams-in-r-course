library(mgcv)
data(meuse, package="sp")

# Fit the model
mod2d <- gam(cadmium ~ ___, data = meuse, method = "REML")

# Inspect the model
---
---
