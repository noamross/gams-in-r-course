data(meuse, package="sp")
library(mgcv)
mod_sep <- gam(copper ~ s(dist, by=landuse), data=meuse, method = "REML")
mod_fs <- gam(copper ~ s(dist, landuse, bs="fs"), data=meuse, method = "REML")

# Plot both the models with vis.gam()
___(mod_sep, view = c("dist", "landuse"), plot.type = ___)
___(mod_fs, view = c("dist", "landuse"), plot.type = ___)

