csale <- readRDS("csale.rds")
set.seed(0)
library(mgcv)
log_mod2 <- gam(purchase ~ s(n_acts) + s(bal_crdt_ratio) +
                  s(avg_prem_balance) + s(retail_crdt_ratio) +
                  s(avg_fin_balance)  + s(mortgage_age) + s(cred_limit),
                data = csale,
                family = binomial,
                method = "REML")

# Plot with the intercept
plot(log_mod2, pages = 1, trans = plogis,
     shift = ___)
