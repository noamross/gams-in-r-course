mcycle <- MASS::mcycle

library(mgcv)
# Fit the model
mod <- gam(accel ~ s(times), data = mcycle, method = "REML")

# Make the plot with residuals
plot(mod, residuals = TRUE)

# Change shape of residuals
plot(mod, residuals = TRUE, pch = 1, cex = 1)