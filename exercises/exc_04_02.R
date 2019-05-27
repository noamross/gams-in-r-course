library(mgcv)
csale <- readRDS("csale.rds")
log_mod <- gam(purchase ~ s(mortgage_age), data = csale,
               family = binomial,
               method = "REML")

# Examine the csale data frame
head(csale)
str(csale)

# Fit a logistic model
log_mod <- gam(___, data = csale,
               ___,
               method = "REML")

# Calculate the probability at the mean
___
