data(meuse, package="sp")
library(mgcv)
mod_sep <- gam(copper ~ s(dist, by=landuse), data=meuse, method = "REML")
mod_fs <- gam(copper ~ s(dist, landuse, bs="fs"), data=meuse, method = "REML")

# Plot both the models with plot()
___
___

