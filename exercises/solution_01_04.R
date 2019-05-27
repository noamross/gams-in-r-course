library(mgcv)

mcycle <- MASS::mcycle
gam_mod <- mgcv::gam(accel ~ s(times), data=mcycle)

# Extract the model coefficients
coef(gam_mod)