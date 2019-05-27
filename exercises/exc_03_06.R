data(meuse, package="sp")
library(mgcv)
mod2d <- gam(cadmium ~ s(x,y), data=meuse, method = "REML")

# Make the perspective plot with error surfaces
vis.gam(mod2d, view = c("x", "y"), 
        ___)

