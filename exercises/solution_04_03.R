csale <- readRDS("csale.rds")
library(mgcv)

# Fit a logistic model
log_mod2 <- gam(purchase ~ s(n_acts) + s(bal_crdt_ratio) +
                  s(avg_prem_balance) + s(retail_crdt_ratio) +
                  s(avg_fin_balance)  + s(mortgage_age) +
                  s(cred_limit),
                data = csale,
                family = binomial,
                method = "REML")

# View the summary
summary(log_mod2)

