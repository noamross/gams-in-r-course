set.seed(0)
dat <- mgcv::gamSim(1,n=600, scale=0.6, verbose=FALSE)
mod <- mgcv::gam(y ~ s(x0, k = 3) + s(x1, k=3) + s(x2, k=3) +s (x3, k=3),
           data=dat, method = "REML")

library(mgcv)
# Fit the model
mod <- gam(y ~ s(x0, k = 3) + s(x1, k = 3) + s(x2, k = 3) + s(x3, k = 3),
           data = dat, method = "REML")

# Check the diagnostics
___

# Refit to fix issues
mod2 <- gam(y ~ s(x0, k = ___) + s(x1, k = ___) + s(x2, k = ___) + s(x3, k = ___),
           data = dat, method = "REML")

# Check the new model
___
