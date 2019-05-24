mcycle <- MASS::mcycle

# Load mgcv
___

# Fit the model
gam_mod <- gam(___ ~ s(___), data = mcycle)

# Plot the results
plot(gam_mod, residuals = TRUE, pch = 1)