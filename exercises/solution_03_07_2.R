# Make plot with 25% extrapolation
vis.gam(mod2d, view = c("x", "y"), 
        plot.type = "contour", too.far = 0.25)

# Overlay data
points(meuse)
