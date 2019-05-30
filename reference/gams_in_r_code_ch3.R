#### Exercise 3.2 ####

library(mgcv)
data(meuse, package="sp")

# Inspect the data
head(meuse)
str(meuse)

# Fit the model
mod2d <- gam(cadmium ~ s(x, y), data = meuse, method = "REML")

# Inspect the model
summary(mod2d)
coef(mod2d)

#### Exercise 3.3 ####

# Fit the model
mod2da <- gam(cadmium ~ s(x, y) + s(dist) + s(elev),
              data = meuse, method = "REML")

# Inspect the model
summary(mod2da)

#### Exercise 3.5 ####

# Contour plot
plot(mod2da, pages = 1)

# 3D surface plot
plot(mod2da, scheme = 1, pages = 1)

# Colored heat map
plot(mod2da, scheme = 2, pages = 1)

#### Exercise 3.6 ####

mod2d <- gam(cadmium ~ s(x,y), data=meuse, method = "REML")

# Make the perspective plot with error surfaces
vis.gam(mod2d, view = c("x", "y"),
        plot.type = "persp", se = 2)

# Rotate the same plot
vis.gam(mod2d, view = c("x", "y"),
        plot.type = "persp", se = 2, theta = 135)

#### Exercise 3.7 ####

# Make plot with 5% extrapolation
vis.gam(mod2d, view = c("x", "y"),
        plot.type = "contour", too.far = 0.05)

# Overlay data
points(meuse)

# Make plot with 10% extrapolation
vis.gam(mod2d, view = c("x", "y"),
        plot.type = "contour", too.far = 0.1)

# Overlay data
points(meuse)

# Make plot with 25% extrapolation
vis.gam(mod2d, view = c("x", "y"),
        plot.type = "contour", too.far = 0.25)

# Overlay data
points(meuse)

#### Exercise 3.9 ####

# Fit a model with separate smooths for each land-use level
mod_sep <- gam(copper ~ s(dist, by = landuse) + landuse,
               data = meuse, method = "REML")

# Examine the summary
summary(mod_sep)

# Fit a model with factor-smooth interaction
mod_fs <- gam(copper ~ s(dist, landuse, bs = "fs"),
              data = meuse, method = "REML")

# Examine the summary
summary(mod_fs)

#### Exercise 3.10 ####

# Plot both the models with plot()
plot(mod_sep, pages = 1)
plot(mod_fs, pages = 1)

# Plot both the models with vis.gam()
vis.gam(mod_sep, view = c("dist", "landuse"), plot.type = "persp")
vis.gam(mod_fs, view = c("dist", "landuse"), plot.type = "persp")

#### Exercise 3.12 ####

# Fit the model
tensor_mod <- gam(cadmium ~ te(x, y, elev),
                  data = meuse, method = "REML")

# Summarize and plot
summary(tensor_mod)
plot(tensor_mod)

#### Exercise 3.13 ####

# Fit the model
tensor_mod2 <- gam(cadmium ~ s(x, y) + s(elev) + ti(x, y, elev),
                   data = meuse, method = "REML")

# Summarize and plot
summary(tensor_mod2)
plot(tensor_mod2, pages = 1)





