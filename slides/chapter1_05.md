---
type: slides
---

# Basis Functions and Smoothing

Noam Ross
Senior Research Scientist, EcoHealth Alliance

Notes: Now that you have a sense of how GAMs can fit nonlinear data, let's learn a bit more about how they work. GAMs are powerful because of their ability to take on many shapes, but this is also what makes them challenging. Their flexibility makes it easy to over-fit your da

---

# Getting the right fit

![](https://github.com/flor14/gams-in-r-course/blob/master/images/thin-gam-fit-1.png?raw=true)

-  Close to the data (avoiding under-fitting)
-  Not fitting the noise (avoiding over-fitting)

Notes: In general, we want to balance two things when fitting a nonlinear model.  We want a model that captures the relationship by being close to the data, but we also want to avoid fitting our model to noise, or over-fitting.

---

# Balancing Wiggliness

![](https://github.com/flor14/gams-in-r-course/blob/master/images/formula1-chapter1.png?raw=true)

Notes: How well the GAM captures patterns in the data is measured by a term called likelihood.  Its complexity, or how much the curve changes shape, is measured by wiggliness. The key to a good fit is the trade-off between the two. This trade-off is expressed by this simple equation, with a smoothing parameter, or lambda value, controlling the balance. This smoothing parameter is optimized when R fits a GAM to data.

---

# Choosing the Right Smoothing Parameter

![](https://github.com/flor14/gams-in-r-course/blob/master/images/diffsmooth-1.png?raw=true)

Notes: Here are plots of three GAMs with different smoothing, or lambda values.  As you can see, the one on the left smooths too much, creating a straight line through curved data.  The one in the middle smooths too little, fitting noise rather than the trend.  The one on the right is just right. It's lambda value balances over-and-under-fitting.

---

# Smoothing Syntax

Setting a fixed smoothing parameter

```r
gam(y ~ s(x), data = dat, sp = 0.1)
gam(y ~ s(x, sp = 0.1), data = dat)
```
Smoothing via restricted maximum likelihood

```r
gam(y ~ s(x), data = dat, method = "REML")
```

Notes: Normally when we fit a model with mgcv's gam() function, we let the package do the work of selecting a smoothing parameter.  However, we can fix the smoothing parameter to a value of our choosing via the sp argument.  The sp argument can be set for the whole model via an argument to the gam() function, as in the first line of code.  We can also set the sp argument for a specific term in the GAM formula, as shown in the second line of code.

Instead if we allow R to do this work for us, the mgcv package offers several different methods for selecting smoothing parameters.  I, and most GAM experts, strongly recommend that you fit models with the REML, or "Restricted Maximum Likelihood" method.  While different methods have their advantages, REML is most likely to give you reliable, stable results. 

---

# Number of basis functions

![](https://github.com/flor14/gams-in-r-course/blob/master/images/diffbasis-1.png?raw=true)

Notes: In addition to the smoothing parameter, the other factor that affects how wiggly a GAM function can be is the number of basis functions that make up a smooth function.  Here I've plotted GAMs with 3, 7, and 12 basis functions all fit to the same data.

As you can see, a smooth with a small number of basis functions is limited in its wiggliness, while one with many basis functions is capable of capturing finer patterns.

---

# Basis Function Syntax

Setting number of basis functions

```r
gam(y ~ s(x, k = 3), data = dat, method = "REML")
    
gam(y ~ s(x, k = 10), data = dat, method = "REML")
```

Use the defaults

```r
gam(y ~ s(x), data = dat, method = "REML")
```

Notes: To set the number of basis functions in a smooth, we use the k argument in the smooth function in a GAM formula.  Setting this value too low will prevent the model from being sufficiently wiggly.  If it's high, though, the automatic smoothing parameter selection will prevent it from being too wiggly. We just don't want to set it very high, which can result in a model with more parameters than data, or one that is slow to fit.

Later, in the model testing portion of the course, we will learn how to test if the number of basis functions are adequate to fit our data.

---

# Let's practice!

Notes: Now, let's explore GAMs with different smoothing parameters and different numbers of basis functions.













