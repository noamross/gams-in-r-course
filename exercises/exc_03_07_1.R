data(meuse, package="sp")
library(mgcv)
mod2d <- gam(cadmium ~ s(x,y), data=meuse, method = "REML")

# Make plot with 10% extrapolation
vis.gam(mod2d, view = c("x", "y"), ___, ___)

# Overlay data
points(meuse)
