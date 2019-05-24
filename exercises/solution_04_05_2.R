# Plot with the intercept
plot(log_mod2, pages = 1, trans = plogis, 
     shift = coef(log_mod2)[1])