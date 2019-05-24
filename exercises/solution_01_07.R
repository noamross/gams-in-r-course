mcycle <- MASS::mcycle

library(mgcv)

# Extract the smoothing parameter
gam_mod <- gam(accel ~ s(times), data = mcycle, method = "REML")
gam_mod$sp

# Fix the smoothing parameter at 0.1
gam_mod_s1 <- gam(accel ~ s(times), data = mcycle, sp = 0.1)

# Fix the smoothing parameter at 0.0001
gam_mod_s2 <- gam(accel ~ s(times), data = mcycle, sp = 0.0001)

# Plot both models
par(mfrow = c(2, 1))
plot(gam_mod_s1, residuals = TRUE, pch = 1)
plot(gam_mod_s2, residuals = TRUE, pch = 1)