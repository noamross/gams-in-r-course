library(mgcv)
csale <- readRDS(url("https://assets.datacamp.com/production/repositories/1786/datasets/cad8c6b369fb6bfbdbae6b17c01df88e1bd336c4/csale.rds"))
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
