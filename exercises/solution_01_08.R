mcycle <- MASS::mcycle

library(mgcv)

# Fit the GAM
gam_mod_sk <- gam(accel ~ s(times, k = 50), data = mcycle, sp = 0.0001)

# Visualize the model
plot(gam_mod_sk, residuals = TRUE, pch = 1)