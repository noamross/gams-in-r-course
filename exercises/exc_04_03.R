csale <- readRDS("csale.rds")
library(mgcv)

# Fit a logistic model
log_mod2 <- gam(___,
                data = csale,
                family = binomial,
                method = "REML")

# View the summary
___

