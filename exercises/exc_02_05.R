mcycle <- MASS::mcycle

library(mgcv)
# Fit the model
mod <- gam(accel ~ s(times), data = mcycle, method = "REML")

# Make the plot with residuals
plot(mod, ___)

# Change shape of residuals
___