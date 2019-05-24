mcycle <- MASS::mcycle

# Examine the mcycle data frame
head(mcycle)
plot(mcycle)

# Fit a linear model
lm_mod <- lm(accel ~ times, data = mcycle)

# Visualize the model
termplot(lm_mod, partial.resid = TRUE, se = TRUE)