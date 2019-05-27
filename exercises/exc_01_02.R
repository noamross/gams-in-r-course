mcycle <- MASS::mcycle

# Examine the mcycle data frame
head(___)
plot(___)

# Fit a linear model
lm_mod <- lm(___, data = mcycle)

# Visualize the model
termplot(lm_mod, partial.resid = TRUE, se = TRUE)