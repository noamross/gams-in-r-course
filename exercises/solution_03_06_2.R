data(meuse, package="sp")
library(mgcv)
mod2d <- gam(cadmium ~ s(x,y), data=meuse, method = "REML")

# Rotate the same plot
vis.gam(mod2d, view = c("x", "y"),
        plot.type = "persp", se = 2, theta = 135)
