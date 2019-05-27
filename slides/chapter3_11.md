---
type: slides
---

# Interactions with Different Scales

Noam Ross
Senior Research Scientist, EcoHealth Alliance

Notes: We have learned about two kinds of two-way interactions: two-dimensional interaction smooths, and categorical-continuous interactions.  Now we will learn about another kind: tensor smooths. Tensor smooths let us model interactions that operate on different scales, such as space and time.

---

# Interactions with one smoothing parameter

![](https://github.com/noamross/gams-in-r-course/blob/master/images/formula3-chapter3.png?raw=true)

Notes: Earlier in this chapter, we discussed 2D smooths of the form s(x1, x2).  As with all GAM smooths, this one has a smoothing parameter, or lambda value, that defines wiggliness. There is a single lambda value for the whole 2D smooth.

---

# Variables with different scales or wiggliness


Numeric terms from `meuse` on different scales:

```out
        x      y  elev    om
 1 181072 333611  7.91   13.6
 2 181025 333558  6.98   14  
 3 181165 333537  7.8    13  
 4 181298 333484  7.66   8  
 5 181307 333330  7.48   8.7
 6 181390 333260  7.79   7.8
 7 181165 333370  8.22   9.2
 8 181027 333363  8.49   9.5
 9 181060 333231  8.67   10.6
10 181232 333168  9.05   6.3
```

Notes: However, there are lots of situations where having a single smoothing parameter does not make sense.  Take our meuse data set.  It has variables for x and y, as well as elevation.  All are in meters.  We would expect the scale of change to be similar horizontally along x and y, but it could be much different on a per-meter basis with elevation, where small differences could mean very different environments.  The terms would likely not have the same wiggliness.  Similarly, it would not make sense to use the same wiggliness to model distance and the om variable, which is organic matter measured in grams per kilogram.  They have incomparable units of measure.

---

# Tensor Smooths

![](https://github.com/noamross/gams-in-r-course/blob/master/images/formula4-chapter3.png?raw=true)

```r
gam(y ~ te(x1, x2), data = data, method = "REML")
```

```r
gam(y ~ te(x1, x2, k = c(10, 20)), data = data, method = "REML")
```


Notes: Tensor smooths are more appropriate for interactions of variables with different scales or units.  A tensor is similar to a regular two-dimensional smooth, but it has two smoothing parameters, one for each variable.

Tensor smooths are used similarly to regular smooths, one just uses te() instead of s() for them.  Since there are multiple smoothing parameters, you can specify a different number of basis functions, or k values, for each smooth.

---

# Example: Fitting with Tensors

![compte-1.png](https://github.com/noamross/gams-in-r-course/blob/master/images/compte-1.png?raw=true)


Notes: Here's an example that shows how tensors can be a much better tool in some cases.  On the left we're showing the actual relationship between two variables, x1 and x2, and an outcome.  x1 and x2 are on very different scales - x1 varies on a range of less than 5% of x2.  A model fit using s(), which assumes both variables vary similarly, comes out looking like the plot in the middle.  However, if we use tensor smooths, allowing the variables to have different smoothing parameters, we get the model on the right, a much better fit.

---

# Tensor interactions

![](https://github.com/noamross/gams-in-r-course/blob/master/images/formula5-chapter3.png?raw=true)

```r
gam(y ~ s(x1) + s(x2) + ti(x1, x2), data = data, method = "REML")

```

Notes: One other great advantage of tensor smooths is that they can be used to separate out interactions from individual univariate effects.  Using tensor interactions, we can model only the interaction of two variables, and not their independent effects, which we estimate separately.

To fit a model this way, we use regular smooth terms, or s() functions, to model each univariate smooth, and then tensor interactions, or ti() functions, for each interaction.

Note that each of these components has its own smoothing parameters and can have its own number of basis functions.  This means we are estimating more parameters. Necessarily, such models need more data.

---

# Example: Tensor Interactions

```out
Family: gaussian 
Link function: identity 

Formula:
y ~ s(x1) + s(x2) + ti(x1, x2)

Parametric coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept) 0.318698   0.008697   36.65   <2e-16 ***
 ---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Approximate significance of smooth terms:
            edf Ref.df     F  p-value    
te(x1)      4.93  6.009 23.16  < 2e-16 ***    # Separate terms for 
te(x2)      3.42  4.242 10.35 2.75e-08 ***    # each variable and
ti(x1,x2) 10.15 12.763 16.08  < 2e-16 ***     # the interaction
 ---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

R-sq.(adj) =  0.444   Deviance explained = 46.5%
-REML = -85.566  Scale est. = 0.037067  n = 500
```

Notes: Here's the summary output of fitting a model with tensor interactions.  As you can see, we now have separate smooth terms in the model for each variable as well as the interaction.  This allows us to evaluate the significance of these components independently.

This is another advantage of tensor smooths.  Even if two terms are not on different scales,
using tensors allows us to separate their individual effects from their interaction.

---

# Example: Tensor Interactions

```r
gam(y ~ s(x1) + s(x2) + ti(x1, x2), data = data, method = "REML")
```

![tei-1.png](https://github.com/noamross/gams-in-r-course/blob/master/images/tei-1.png?raw=true)

Notes: Here are plots of this model.  We have univariate smooths for x1 and x2, and a surface representing the interaction.  The univariate smooths are additive, and then the interaction is an addition effect on top of those.  Separating the effects in this way makes complex models more understandable.

---

# Let's practice!

Notes: Let's use what we've learned about tensor smooths to make improved models of the meuse data.































