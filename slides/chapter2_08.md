---
type: slides
---

# Model checking with gam.check()

Noam Ross
Senior Research Scientist, EcoHealth Alliance

Notes: Now that we can fit and plot GAMs, we need some checks to make sure that we have well-fit models. There are several pitfalls we need to look out for when fitting GAMs. Thankfully, mgcv provides helpful tools to check for these.

---

# Pitfall One: Inadequate Basis Number

```r
mod <- gam(y ~ s(x1, k = 4) + s(x2, k = 4),
           data = check_data, method = "REML")
```
![](https://github.com/noamross/gams-in-r-course/blob/master/images/fourbases-1.png?raw=true)


Notes: We've learned that the number of basis functions determines how wiggly a smooth can be.  If there are not enough basis functions, it may not be wiggly enough to capture the relationships in data.  Here is a model where smooths have 4 basis functions.  As we see in this partial effect plot, this is not enough to capture the pattern.

It's not always obvious visually whether we have enough basis functions.  We can test for this, though, via the gam.check() function.

---

# # Running `gam.check`

```r
gam.check(mod)
```

```out
Method: REML   Optimizer: outer newton
full convergence after 9 iterations.
Gradient range [-0.0001467222,0.00171085]
(score 784.6012 & scale 2.868607).
Hessian positive definite, eigenvalue range [0.00014,198.5]
Model rank =  7 / 7 

Basis dimension (k) checking results. Low p-value
(k-index<1) may indicate that k is too low, especially
if edf is close to k'.

        k'  edf k-index p-value    
s(x1) 3.00 1.00    0.35  <2e-16 ***
s(x2) 3.00 2.88    1.00    0.52    
 ---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1
```

Notes: Running gam.check() on a model provides several outputs, in both the console and as plots.  We'll start with the console output.

First, gam.check() reports on model convergence.  Here, it reports full convergence. R has found a best solution.  If the model has not converged,  results are likely not correct. This can happen when there are too many parameters in the model for not enough data.

Below, we see a table of basis checking results. This shows a statistical test for patterns in model residuals, which should be random.  Each line reports the test results for one smooth. It shows the k value or number of basis functions, the effective degrees of freedom, a test statistic, and p-value.

Here, small p-values indicate that residuals are not randomly distributed. This often means there are not enough basis functions. 

This is an approximate test. Always visualize your results too, and compare the k and edf values in addition to looking at the p-value.

---

# Running gam.check (2)

```r
mod <- gam(y ~ s(x1, k = 12) + s(x2, k = 4),
                data = dat, method = "REML")
gam.check(mod)
```
    
```out
...
    
         k'   edf k-index p-value  
s(x1) 11.00 10.85    1.05   0.830  
s(x2)  3.00  2.98    0.89   0.015 *
    
...
```

Notes: If we re-fit our model with higher k , we see that this test  is no longer significant. However, now we see a problem with the second smooth - the p-value for its test is now significant.  Fixing one problem can reveal another.  So it is always important to re-run gam.check after changing models.

---

# Running `gam.check` (3)

```r
mod <- gam(y ~ s(x1, k = 12) + s(x2, k = 12),
            data = dat, method = "REML")
gam.check(mod)
```

```out 
...
         k'   edf k-index p-value
s(x1) 11.00 10.86    1.08    0.94
s(x2) 11.00  7.78    0.94    0.12
...
```


Notes: If we increase the k value for the second smooth, and run gam.check() again, now both smooths pass the test. 

Neither has significant patterns in their residuals and both have enough basis functions.

---

# Diagnostic Plots

![](https://github.com/noamross/gams-in-r-course/blob/master/images/gamcheck-1.png?raw=true)

Notes: gam.check() will also generate four plots. Each of these gives a different way of looking at your model residuals.  These plots show the results from the original, poorly fit model. On the top-left is a Q-Q plot, which compares the model residuals to a normal distribution.  A well-fit model's residuals will be close to a straight line.  On bottom left is a histogram of residuals.  We would expect this to have a symmetrical bell shape.  On top-right is a plot of residual values.  These should be evenly distributed around zero.  Finally, on the bottom-right is plot of response against fitted values.  A perfect model would form a straight line.  We don't expect a perfect model, but we do expect the pattern to cluster around the 1-to-1 line.

---

# Diagnostic Plots

![](https://github.com/noamross/gams-in-r-course/blob/master/images/gamcheck2-1.png?raw=true)

Notes: Now, here is the output of our final model, with larger k values.  See that the Q-Q plot no longer curves, the histogram is bell shaped, and the comparison of response vs. fitted values clusters around a 1-to-1 line.  These all indicate a much better model fit.
