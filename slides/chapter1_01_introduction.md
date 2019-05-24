---
type: slides
---

# Introduction to Generalized Additive Models

Noam Ross 
Senior Research Scientist, EcoHealth Alliance

Notes: Hi, I'm Noam Ross. I'm a scientist who studies infectious diseases. I use R and Generalized Additive Models to better understand complex biological and ecological systems. This course will teach you how to use these versatile models to analyze and understand complex, multifaceted, non-linear relationships in your own work.

---

# Trade-offs in Model Building

![](https://github.com/flor14/gams-in-r-course/blob/master/images/tradeoff-slider.png?raw=true)


Notes: Whenever we build statistical models, we face a trade-off between flexibility and interpretability. GAMs offer a middle ground between simple models, such as those we fit with linear regression, and more complex machine learning models like neural networks.

Linear models are easy to interpret and to use for inference: It is easy to understand the meaning of their parameters. However, we often need to model more complex phenomena than can be represented by linear relationships.

On the other hand, machine learning models, like boosted regression trees or neural networks, can be very good at making predictions of complex relationships. The problem is that they tend to need lots of data, are quite difficult to interpret, and one can rarely make inferences from the model results.

GAMs offer a middle ground: they can be fit to complex, nonlinear relationships and make good predictions in these cases, but we are still able to do inferential statistics and understand and explain the underlying structure of our models and why they make predictions that they do.

---

# Non-linear Relationships

![](https://github.com/flor14/gams-in-r-course/blob/master/images/nonlinear-scatter-1.png?raw=true)

Notes: GAMs let us flexibly model non-linear relationships. Here I've made a scatter plot of two variables, X and Y. We can see from the scatterplot that there is clearly some relationship between the variables, but it is not linear.

---

# Non-linear Relationships (2)

```r
linear_mod <- lm(y ~ x, data = my_data)
```

![](https://github.com/flor14/gams-in-r-course/blob/master/images/nonlinear-scatter-lm-1.png?raw=true)

Notes: If we fit a linear model to the data using the lm() function and the usual formula syntax, we can see it won't do a very good job. The model doesn't capture key aspects of this relationship.

---

# Non-linear Relationships (3)

```{r}
library(mgcv)
gam_mod <- gam(y ~ s(x), data = my_data)
```

![](https://github.com/flor14/gams-in-r-course/blob/master/images/nonlinear-scatter-gam-1.png?raw=true)

Notes: With a GAM, however, we can fit data with smooths, or splines, which are functions that can take on a wide variety of shapes. 
We fit a GAM using the gam() function from the mgcv package. 
Here, when we fit this GAM, we wrap the independent variable, x, in the s(), that is smooth function to specify that we want this relationship to be flexible.
A GAM can capture the nonlinear aspects of not only this relationship, but of many nonlinear relationships, because of the flexibility of splines.

---

# Basis Functions

![](https://github.com/flor14/gams-in-r-course/blob/master/images/basis-functions-1.png?raw=true)

Notes: The flexible smooths in GAMs are actually constructed of many smaller functions. These are called basis functions. Each smooth is the sum of a number of basis functions, and each basis function is multiplied by a coefficient, each of which is a parameter in the model. In the plot here on the left, we show the basis functions of a GAM where all the coefficients are the same. On the right, we show the same basis functions after model-fitting, where each has a coefficient fit to the data. You can see how these basis functions add up to create the overall smooth shape. So a single nonlinear relationship between a dependent and independent variable has several parameters, plus an intercept. This is different, and more complex, than a linear model, where each variable has only a single coefficient or parameter.

---

# Basis Functions (2)

```{r}
gam_mod <- gam(y ~ s(x), data = my_data)

coef(gam_mod)

(Intercept)     s(x2).1     s(x2).2    
7.814448        5.272290    5.104941
     
s(x2).3         s(x2).4     s(x2).5
1.271135        1.720561   -1.180613 
     
s(x2).6 
-2.676133
```

Notes: When we fit a GAM with R, we can extract the coefficients just like we can for linear models using the coef() function.  Calling this function on a GAM model object will show the coefficients of each of the basis functions of the model.  You can see that even a simple one-smooth model has many coefficients.

---

# Let's practice!

Notes: Now, let's fit our first set of models.


