---
type: slides
---

# Checking concurvity

Noam Ross
Senior Research Scientist, EcoHealth Alliance

Notes: Now we'll learn about another area that's important to check in GAMs: concurvity.

---

# Collinearity

![](https://github.com/noamross/gams-in-r-course/blob/master/images/pairs-1.png?raw=true) <!-- .element: style="max-height:525px;" -->


Notes: You may recall the concept of collinearity from a linear modeling course.  When two variables or covariates in a model are strongly correlated, it's difficult to fit the model, because the outcome variable could be responding to either one.  We call this phenomenon collinearity, and it can result in poorly fit models with large confidence intervals.  In general, we avoid putting multiple collinear variables into the same model.

Here, we look at correlation between three covariates in our mpg data set: the length, width, and height of cars.  We can see that there is strong collinearity between car length and width. It would be hard to distinguish between their effects on car efficiency.

---

# Concurvity

![](https://github.com/noamross/gams-in-r-course/blob/master/images/concurv-demo-1.png?raw=true)

Notes: With GAMs, we have an additional potential pitfall. Even if two variables aren't collinear, they may have concurvity, that is, one may be a smooth curve of another.  For instance, on the left, we have two covariates, X1 and X2, that are not linearly related but form a perfect parabola.  If we use both X1 and X2 as predictors in a model, we get smooths with wild confidence intervals, as shown in the middle and right plots.

---

# The `concurvity()` function

<div  class='left' style='float:left;width:35%'>
<p data-markdown>![](https://github.com/noamross/gams-in-r-course/blob/master/images/concurv-demo2-1.png?raw=true)</p>
</div>
<div class='right' style='float:right;width:65%'>
<p data-markdown>
```r
concurvity(m1, full = TRUE)
```
</p>
<p data-markdown>
```out
            para s(X1) s(X2)
worst       0    0.84  0.84
observed    0    0.22  0.57
estimate    0    0.28  0.60
```
</p>
</div>



Notes: mgcv's concurvity() function measures concurvity in model variables.  Like gam.check(), we run this function on a model object to examine the quality of our model.  

concurvity() has two modes.

The first mode, full = TRUE, reports overall concurvity for each smooth. Specifically, it shows how much each smooth is predetermined by all the other smooths. 

Since concurvity is complex, the function reports three different ways of measuring concurvity.  Each is better in some situations.  What is important is that you should always look at the worst case, and if the value is high (say, over 0.8), inspect your model more carefully.

Here I show the output of running the concurvity() function on a model with variables that are related but not perfectly. The concurvity of the terms is high in the worst case, so we'll want to inspect the plots of our model closely and be careful in making interpretations.

---

# Pairwise concurvities

```r
concurvity(model, full = FALSE)
```

```out
$worst
      para s(X1) s(X2)
para     1  0.00  0.00
s(X1)    0  1.00  0.84
s(X2)    0  0.84  1.00

$observed                |  $estimate
      para s(X1) s(X2)   |        para s(X1) s(X2)
para     1  0.00  0.00   |  para     1  0.00   0.0
s(X1)    0  1.00  0.57   |  s(X1)    0  1.00   0.6
s(X2)    0  0.22  1.00   |  s(X2)    0  0.28   1.0


```

Notes: If any of these values from the full = TRUE mode is high, we will want to also use the second mode, setting full = FALSE.  With full = FALSE, the function returns matrices of
pairwise concurvities.  These show the degree to which each variable is predetermined by each other variable, rather than all the other variables.  This can be used to pinpoint which variables have a close relationship.  Once again, the function returns three measures, this time as three matrices.  Look for the worst-case scenario and see if variables with high values have problematic shapes or confidence intervals.
