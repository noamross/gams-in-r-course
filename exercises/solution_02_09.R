library(mgcv)
set.seed(0)
dat <- gamSim(1,n=200)

library(mgcv)
# Fit the model
mod <- gam(y ~ s(x0, k = 5) + s(x1, k = 5) + s(x2, k = 5) + s(x3, k = 5),
           data = dat, method = "REML")

# Run the check function
gam.check(mod)
