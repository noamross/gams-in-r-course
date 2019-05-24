csale <- readRDS(url("https://assets.datacamp.com/production/repositories/1786/datasets/cad8c6b369fb6bfbdbae6b17c01df88e1bd336c4/csale.rds"))
set.seed(0)
library(mgcv)
log_mod2 <- gam(purchase ~ s(n_acts) + s(bal_crdt_ratio) +
                		   s(avg_prem_balance) + s(retail_crdt_ratio) +
                           s(avg_fin_balance)  + s(mortgage_age) + s(cred_limit),
              data = csale,
              family = binomial,
              method = "REML")

# Plot on the log-odds scale
___			  