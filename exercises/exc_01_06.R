mcycle <- MASS::mcycle

library(mgcv)

# Fit a GAM with 3 basis functions
gam_mod_k3 <- gam(accel ~ s(times, k = ___), data = mcycle)

# Fit with 20 basis functions
gam_mod_k20 <- gam(___)

# Visualize the GAMs
par(mfrow = c(1, 2))
plot(gam_mod_k3, residuals = TRUE, pch = 1)
plot(gam_mod_k20, residuals = TRUE, pch = 1)