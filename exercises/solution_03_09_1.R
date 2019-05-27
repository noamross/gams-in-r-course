library(mgcv)
data(meuse, package="sp")

# Fit a model with factor-smooth interaction
mod_fs <- gam(copper ~ s(dist, landuse, bs = "fs"),
              data = meuse, method = "REML")

# Examine the summary
summary(mod_fs)
