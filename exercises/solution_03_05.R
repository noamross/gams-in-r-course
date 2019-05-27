library(mgcv)
data(meuse, package="sp")
mod2da <- gam(cadmium ~ s(x, y) + s(dist) + s(elev),
              data = meuse, method = "REML")

# Contour plot
plot(mod2da, pages = 1)
