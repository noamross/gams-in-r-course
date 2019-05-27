mcycle <- MASS::mcycle

# Load mgcv
library(mgcv)

# Fit the model
gam_mod <- gam(accel ~ s(times), data = mcycle)

# Plot the results
plot(gam_mod, residuals = TRUE, pch = 1)