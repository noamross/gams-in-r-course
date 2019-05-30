library(mgcv)
csale <- readRDS("csale.rds")

# Examine the csale data frame
head(csale)
str(csale)

# Fit a logistic model
log_mod <- gam(purchase ~ s(mortgage_age), data = csale,
               family = binomial,
               method = "REML")

# Calculate the probability at the mean
plogis(coef(log_mod)[1])
