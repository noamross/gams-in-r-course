---
type: slides
---

# Interpreting GAM outputs

Noam Ross 
Senior Research Scientist, EcoHealth Alliance

Notes: So far, we've learned how to fit generalized additive models to data.  

Now we'll take a more detailed look at model outputs, to learn how to interpret the results of our model-fitting and better understand the relationships between variables.

---

# GAM Summaries

```r
mod_hwy <- gam(hw.mpg ~ s(weight) + s(rpm) + 
               s(price) + s(comp.ratio) +
               s(width) + fuel + cylinders,
               data = mpg, method = "REML")
```

```r
summary(mod_hwy)
```
Notes: As with other models in R, you can get a summary of model statistics with the summary() function.  Let's look at this output for a model we fit with the mpg data.

---

# GAM Summaries (2)

```r
summary(mod_hwy)
```

```out    
Family: gaussian
Link function: identity

Formula:
hw.mpg ~ s(weight) + s(rpm) + s(price) + s(comp.ratio) +
  s(width) + fuel
    
Parametric coefficients:
            Estimate Std. Error t value Pr(>|t|)
(Intercept)   23.873      3.531   6.760 1.89e-10 ***
fuelgas        7.571      3.922   1.931   0.0551 .
 ---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    
Approximate significance of smooth terms:
                edf Ref.df      F  p-value
s(weight)     6.254  7.439 20.909  < 2e-16 ***
s(rpm)        7.499  8.285  8.534 2.07e-09 ***
s(price)      2.681  3.421  1.678    0.155
s(comp.ratio) 1.000  1.001 18.923 2.22e-05 ***
s(width)      1.001  1.001  0.357    0.551
 ---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    
R-sq.(adj) =   0.89   Deviance explained = 90.1%
REML = 464.81  Scale est. = 5.171     n = 199
```
Notes: There's a lot here, so let's go through it piece by piece.

---

# GAM Summaries (3)

```r
summary(mod_hwy)
```

```out
Family: gaussian
Link function: identity

Formula:
hw.mpg ~ s(weight) + s(rpm) + s(price) +
  s(comp.ratio) + s(width) + fuel
```

Notes: The first part of the summary describes the model we fit. The "Family" component tells us the model assumes a Gaussian or normal distribution of our errors, and the "Link" of "identity" shows that the model doesn't transform the predictions. We'll talk more about transformation in the final chapter of the course. 

After that, we have the model formula.

---

# GAM Summaries (4)

```r
summary(mod_hwy)
``` 

```out    
Parametric coefficients:
            Estimate Std. Error t value Pr(>|t|)
(Intercept)   23.873      3.531   6.760 1.89e-10 ***
fuelgas        7.571      3.922   1.931   0.0551 .
 ---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 '
```

Notes: The next section describes the parametric terms of our model. Parametric means models that have a pre-determined form.  In this context, it refers to the linear terms in the model. 

This section may be familiar from linear modeling. It shows the coefficients for the linear terms in the model, their values, errors, test statistics, and p-values.  Asterisks next to the p-values indicate statistical significance. In this case, the model intercept is significant, but the fixed effect of fuel type is only significant at the 0.1 level.

---

# GAM Summaries (5)

```r
summary(mod_hwy)
```  
    
```out
Approximate significance of smooth terms:
                edf Ref.df      F  p-value
s(weight)     6.254  7.439 20.909  < 2e-16 ***
s(rpm)        7.499  8.285  8.534 2.07e-09 ***
s(price)      2.681  3.421  1.678    0.155
s(comp.ratio) 1.000  1.001 18.923 2.22e-05 ***
s(width)      1.001  1.001  0.357    0.551
 ---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```
Notes: The next section covers smooth terms.  For smooths coefficients are not printed.  This is because each smooth has several coefficients - one for each basis function.  Instead, the first column reads edf, which stands for effective degrees of freedom.  This value represents the complexity of the smooth.  An edf of 1 is equivalent to a straight line.  An edf of 2 is equivalent to a quadratic curve, and so on, with higher edfs describing more wiggly curves.

---

# Effective Degrees of Freedom

```out
Approximate significance of smooth terms:
                edf Ref.df      F  p-value
s(weight)     6.254  7.439 20.909  < 2e-16 ***  <--
s(rpm)        7.499  8.285  8.534 2.07e-09 ***
s(price)      2.681  3.421  1.678    0.155
s(comp.ratio) 1.000  1.001 18.923 2.22e-05 ***  <--
s(width)      1.001  1.001  0.357    0.551      
```
![](https://github.com/noamross/gams-in-r-course/blob/master/images/edf-1.png?raw=true)


Notes: We can see this by plotting.  Here are partial effect plots for the weight and compression ratio smooths. You can see the weight smooth, with an edf over 6, is complex and wiggly.  But the compression ratio smooth, with an edf of 1, is linear.

---

# Significance of Smooth Terms

```out
Approximate significance of smooth terms:
                edf Ref.df      F  p-value
s(weight)     6.254  7.439 20.909  < 2e-16 ***
s(rpm)        7.499  8.285  8.534 2.07e-09 ***
s(price)      2.681  3.421  1.678    0.155
s(comp.ratio) 1.000  1.001 18.923 2.22e-05 ***
s(width)      1.001  1.001  0.357    0.551
 ---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

Notes: The terms to the right of the EDF column have to do with significance testing for smooths. The Ref.df and F columns are test statistics used in an ANOVA test to test overall significance of the smooth.  The result of this test is the p-value to the right.  It's important to note that these values are approximate, and it's important to visualize your model to check them.

---

# Significance of Smooth Terms (2)

```out
Approximate significance of smooth terms:
                edf Ref.df      F  p-value
s(weight)     6.254  7.439 20.909  < 2e-16 ***  <--
s(rpm)        7.499  8.285  8.534 2.07e-09 ***  
s(price)      2.681  3.421  1.678    0.155      <--
s(comp.ratio) 1.000  1.001 18.923 2.22e-05 ***
s(width)      1.001  1.001  0.357    0.551      
```
![](https://github.com/noamross/gams-in-r-course/blob/master/images/signif-1.png?raw=true)

Notes: A good way to interpret significance for smooth terms in GAMs is this: a significant smooth term is one where you can not draw a horizontal line through the 95% confidence interval.

If we look at plots of the weight and price smooths, we see this. Clearly a horizontal line can't go through the weight smooth confidence interval, but a horizontal line just fits inside the price smooth interval.

---

# Significance and Effective Degress of Freedom

```out
Approximate significance of smooth terms:
                edf Ref.df      F  p-value
s(weight)     6.254  7.439 20.909  < 2e-16 ***  
s(rpm)        7.499  8.285  8.534 2.07e-09 ***  
s(price)      2.681  3.421  1.678    0.155      <--
s(comp.ratio) 1.000  1.001 18.923 2.22e-05 ***  <--
s(width)      1.001  1.001  0.357    0.551      <--
```
    
![](https://github.com/noamross/gams-in-r-course/blob/master/images/signif2-1.png?raw=true)

Notes: Note that high EDF doesn't mean significance or vice-versa. A smooth may be linear and significant, non-linear and non-significant, or one of each.  

In this model, the price term is non-linear but non-significant, meaning it has some complexity but there isn't certainty as to the shape or direction of its effect.  Compression ratio is linear but significant.  Width is neither.

---

# Let's practice!

Notes: Now, let's take a close look at some of your models.






















