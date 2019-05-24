library(mgcv)
data(meuse, package="sp")

# Fit the model
tensor_mod2 <- gam(cadmium ~ s(x, y) + s(elev) + ti(x, y, elev), 
                   data = meuse, method = "REML")

# Summarize and plot
summary(tensor_mod2)
plot(tensor_mod2, pages = 1)
