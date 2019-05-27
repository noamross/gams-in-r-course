---
title: '1 - Introduction to Generalized Additive Models'
description:
  'In this chapter, you will learn how Generalized additive models work and how to use flexible, nonlinear functions to model data without over-fitting. You will learn to use the gam() function in the mgcv package, and how to build multivariate models that mix nonlinear, linear, and categorical effects to data.'
prev: null
next: /chapter2
type: chapter
id: 1
---
<exercise id="1" title="Introduction" type="slides">

<slides source="chapter1_01_introduction">
</slides>

</exercise>

<exercise id="2" title="Motorcycle crash data: linear approach">

In this first exercise, you will fit a linear model to a data set and visualize the results
to see how well it captures relationships in the data.  The data set, stored in a data frame named [`mcycle`](https://www.rdocumentation.org/packages/MASS/topics/mcycle), contains measurement of acceleration of a crash-test dummy head
during a motorcycle crash. It contains measurements of acceleration (g) in the `accel` column
and time (milliseconds) in the `times` column.

**Instructions**
- Use the `head()` and `plot()` functions to look at the data frame named `mcycle`. 
- Use the `lm()` function to fit a model to the `mcycle` data where the `accel` variable is a _linear_ function of `times`. 
- Visualize the model fit using the provided call to `termplot()`.

<codeblock id="01_02">

When fitting a linear model with `lm()`, use the formula syntax `y ~ x` in the first argument to specify that `y` is modeled as a linear function of `x`.

</codeblock>

</exercise>

<exercise id="3" title="Motorcycle crash data: non-linear approach">

Now you will fit a non-linear model to the same `mcycle` data using the `gam()` function from
the **mgcv** package.

**Instructions**
- Load the `mgcv` package. 
- Fit a model to the  `mcycle` data where `accel` has a smooth, nonlinear relation to `times` using the `gam()` function. 
- Visualize the model fit using the provided call to `plot()`.

<codeblock id="01_03">

When fitting a GAM, use the syntax `y ~ s(x)` in the model formula to indicate that `y` should be a _smooth, non-linear_ function of `x`.

</codeblock>

</exercise>

<exercise id="4" title="Parts of non-linear function">

GAMs are made up of _basis functions_ that together compose the smooth terms in models. The `coef()` function extracts the coefficients of these basis functions the GAM model object.  

**Instructions**
- Extract the model coefficients of the `gam_mod` object which is available in your workspace. Then determine how many basis functions compose the smooth curve of the mode.

<codeblock id="01_04">

- The `coef()` function extracts all the model coefficients, which are coefficients for each basis function that makes up the smooth.
- The model coefficients include one coefficient for the intercept as well as one coefficient for each basis function in the smooth.
</codeblock>


Multiple Choice: How many coefficients are there for the _basis functions_ that compose the smooth curve in this model?

<choice>
<opt text="1">

There are coefficients for the intercept and more for the basis functions that make up the smooth term.

</opt>

<opt text="2">

There are coefficients for the intercept and more for the basis functions that make up the smooth term.

</opt>

<opt text="9" correct="true">

Correct! The smooth is made up of 9 basis functions, each with their own coefficient.  A GAM with just two variables can have many coefficients, which means they require a bit more data than linear models.

</opt>

<opt text="10">

Close. That's the number of coefficients in the model, but not all of them are for the basis functions.

</opt>
</choice>

</exercise>

<exercise id="5" title="Basis functions and smoothing" type="slides">

<slides source="chapter1_05"> 
</slides>

</exercise>

<exercise id="6" title="Setting complexity of the motorcycle model">

The number of basis functions in a smooth has a great impact
on the shapes a model can take.  Here, you'll practice modifying
the number of basis functions in a model and examining the results.

**Instructions**
-  Fit a GAM with 3 basis functions to the `mcycle` data, with `accel` as a smooth function of `times`. 
-  Fit the same GAM again, but this time with 20 basis functions. 
-  Use the provided `plot()` functions to visualize both models.

<codeblock id="01_06">

To specify the number of basis functions, add a `k` argument to the smooth function
in the model formula, e.g., `y ~ s(x, k = 5)`.

</codeblock>

</exercise>

<exercise id="7" title="Using smoothing parameters to avoid overfitting">

The smoothing parameter balances between likelihood and wiggliness to optimize model fit. Here, you'll examine smoothing parameters and will fit models with different fixed smoothing parameters.

**Instructions**
- View the value of the smoothing parameter ($\lambda$) of the provided `gam_mod` model by extracting the `sp` value from the model.
- Fit two models to the `mcycle` data with `accel` as a smooth function of `times` and a smoothing parameter of: 
    - 0.1
    - 0.0001
- Visualize both models.

<codeblock id="01_07">

- The `sp` value can be extracted from a GAM model with the `$` operator.
- To set a smoothing parameter, use the `sp` argument to `gam()`. 
- You don't need `method = "REML"` when you set your own smoothing parameter because no smoothing selection method is used.

</codeblock>

</exercise>

<exercise id="8" title="Complexity and smoothing together">

The number of basis functions and the smoothing parameters interact to
control the wiggliness of a smooth function.  Here you will see how
changing both together affects model behavior.

**Instructions**
-  Fit a GAM models to the `mcycle` data with `accel` as a smooth function of `times` with 50 basis functions and a smoothing parameter of 0.0001. 
-  Visualize the model.

<codeblock id="01_08">

- To specify the number of basis functions, add a `k` argument to the smooth function
in the model formula. 
- Use the `sp` argument to set the smoothing parameter in the `gam()` function.

</codeblock>

</exercise>

<exercise id="9" title="Multivariate GAMs" type="slides">

<slides source="chapter1_09"> 
</slides>

</exercise>

<exercise id="10" title="Multivariate GAMs of auto performance">

GAMs can accept multiple variables of different types. In the following exercises, you'll work with the `mpg` dataset available in the [`gamair`](https://www.rdocumentation.org/packages/gamair/topics/gamair-package) package to practice fitting models of different forms.

**Instructions**
-  Use the `head()` and `str()` functions to examine the `mpg` data set. 
-  Fit a GAM to these data to predict `city.mpg` as the sum of smooth functions of `weight`, `length`, and `price`. 
-  Use the `plot()` function provided to visualize the model.

<codeblock id="01_10">

A formula of the form `y ~ s(x1) + s(x2) + s(x3)` will fit a model which uses the sum of three smooth functions.

</codeblock>

</exercise>

<exercise id="11" title="Adding categorical to the auto performance model">

Now you'll include categorical variables in your model. Categories are inherently linear, so you'll model them as linear terms.

**Instructions**
- Fit a GAM to the `mpg` data, modeling `city.mpg` as a sum of smooth functions of `weight`, `length`, and `price`, and also include the categorical terms `fuel`, `drive`, and `style`. 
- Use the `plot()` function provided to visualize the model.

<codeblock id="01_11">

Categorical terms should be included as linear terms without `s()`. Mix non-linear and linear terms in a GAM formula like so:  `y ~ s(x1) + s(x2) + x3 + x4.`

</codeblock>

</exercise>

<exercise id="12" title="Category-level smooths for different auto types">

Now you extend your models to include different smooths for different levels of categorical terms.

**Instructions**
- Fit a model to predict city fuel efficiency (`city.mpg`) with smooth terms of `weight`, `length`, and `price`, but make
  each of these smooth terms depend on the `drive` categorical variable using `by=` in the smooth terms. 
- Include a separate linear term for the `drive` variable.

<codeblock id="01_12">

- Fit a formula of the form `y ~ s(x1, by = x3) + s(x2, by = x3) + ...`. 
- Don't forget to include your `by` term as a linear categorical term, with `... + x3`, as well.

</codeblock>

</exercise>

