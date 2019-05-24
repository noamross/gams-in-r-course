library(mgcv)
data(meuse, package="sp")

# Fit a model with separate smooths for each land-use level
mod_sep <- gam(copper ~ s(dist, by = landuse) + landuse, 
               data = meuse, method = "REML")

# Examine the summary
