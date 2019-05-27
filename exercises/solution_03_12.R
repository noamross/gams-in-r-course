library(mgcv)
data(meuse, package="sp")

# Fit the model
tensor_mod <- gam(cadmium ~ te(x, y, elev), 
                  data = meuse, method = "REML")

# Summarize and plot
summary(tensor_mod)
plot(tensor_mod)
