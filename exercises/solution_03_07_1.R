# Make plot with 10% extrapolation
vis.gam(mod2d, view = c("x", "y"), 
        plot.type = "contour", too.far = 0.1)

# Overlay data
points(meuse)