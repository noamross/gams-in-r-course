---
title: '3 - Spatial GAMs and Interactions'
description:
  'In this chapter, you will extend the types of models you can fit to those with interactions of multiple variables.  You will fit models of geospatial data by using these interactions to model complex surfaces, and visualize those surfaces in 3D.  Then you will learn about interactions between smooth and categorical variables, and how to model interactions between very different variables like space and time.'
prev: /chapter2
next: /chapter4
type: chapter
id: 3
---
<exercise id="1" title="Two-dimensional smooths and spatial data" type="slides">

<slides source="chapter3_01">
</slides>

</exercise>

<exercise id="2" title="Modeling soil pollution in the Netherlands">

Let's take a closer look at the `meuse` data and use it to fit your first 2-D model. 

**Instructions**
- Inspect the `meuse` data with the `head()` and `str()` functions.

<codeblock id="03_02">

`head(meuse)` and `str(meuse)` will give you a glimpse at the variables in this data set.

</codeblock>

- Fit a GAM model to the data that predicts the concentration of cadmium in the soil using an interaction of x and y coordinates. 
- Inspect your model with the `summary()` and `coef()` functions.

<codeblock id="03_02_1">

- The formula syntax for an interaction in a GAM model is `s(x1, x2)`. 
- Don't forget to use the "REML" method in your GAM.
- Look at the output of `coef(mod2d)`. How many coefficients are associated with the `s(x, y)` smooth?

</codeblock>

Multiple Choice: How many basis functions are used in the two-dimensional smooth?

<choice>
<opt text="10">

Incorrect. Remember, the number of basis functions is equal to the number of the smooth's coefficients

</opt>

<opt text="23">

Incorrect. Remember, the number of basis functions is equal to the number of the smooth's coefficients

</opt>

<opt text="29" correct="true">

Correct! There are 29 coefficients in `s(x, y)`. Surfaces require more basis coefficients to construct than single variable smooths. That's why the default value for `k` is high for 2-D smooths.

</opt>

<opt text="36">

Incorrect. Remember, the number of basis functions is equal to the number of the smooth's coefficients.

</opt>

</choice>

</exercise>

<exercise id="3" title="Adding more variables to predict soil pollution">

Now let's add additional predictors to the model with spatial interactions.

**Instructions** 
Fit another model to predict cadmium in the soil, this time including smooths for the effect of elevation (`elev`) and distance from the river (`dist`) in addition to an `x`, `y` surface.

<codeblock id="03_03">

- To fit a model with both interaction and univariate smooths, use the syntax `s(x1, x2) + s(x3) + s(x4)`
- Don't forget to use the "REML" method

</codeblock>

</exercise>

<exercise id="4" title="Plotting and interpreting GAM interactions" type="slides">

<slides source="chapter3_04">
</slides>

</exercise>

<exercise id="5" title="Plotting the model surface">

Let's explore the different visualization schemes available in `mgcv`'s `plot()` function.

We'll use the model you built in the last exercise (`mod2da`).

**Instructions**
- Plot the interaction terms of `mod2da` as a contour plot.

<codeblock id="03_05">

To display interaction terms as contour plot, call the `plot()` function.

</codeblock>

- Run the `plot()` function so interaction terms are displayed as 3D surfaces.

<codeblock id="03_05_1">

To display interaction terms as 3D surfaces, use `scheme = 1`.

</codeblock>

- Run the `plot()` function so interaction terms are displayed as colored heat maps on a sigle page.

<codeblock id="03_05_2">

To display interaction terms as colored heat maps, use `scheme = 2`.

</codeblock>

</exercise>

<exercise id="6" title="Customizing 3D plots">

Uncertainty is easy to see in plots of univariate smooths, but more challenging to represent in 2D relationships.  Here we'll visualize uncertainty in a geospatial interaction, using the model `mod2d` from exercise 2.

<codeblock id="03_06">

</codeblock>

Use `vis.gam()` to make a 3D perspective plot of the x, y relationship in the model, using the `se` argument to make confidence interval surfaces at +/- 2 standard errors.

<codeblock id="03_06_1">

- Use the parameter `plot.type = "persp"` to generate a 3D perspective plot. 
- The `se` parameter determines the distance of standard errors.

</codeblock>

Make another version of the same plot, rotated 135 degrees to view it from another angle.

<codeblock id="03_06_2">

The `theta` parameter rotates the plot.

</codeblock>

</exercise>

<exercise id="7" title="Extrapolation in surface plots">

When making predictions from the models, it is important to understand how far from the range of your data you are extrapolating.  With multivariate smooths, the shape of the areas supported by data may be complex.  Here you'll make plots that compare extrapolations to support in the data.

One again we'll use `mod2d` from exercise 2.

**Instructions**
Make a contour plot of the model using `vis.gam()`, extrapolating out from the data **5%**.

<codeblock id="03_07">

The `too.far` argument determines how far from actual data to extrapolate as a % of the data range.

</codeblock>

Make a contour plot of the model using `vis.gam()`, extrapolating out from the data **10%**.

<codeblock id="03_07_1">

The argument `plot.type = "contour"` creates a contour-type plot.

</codeblock>

- Make a contour plot of the model using `vis.gam()`, extrapolating out from the data **25%**. 
- Overlay the `meuse` data on top of your visualization as points.

<codeblock id="03_07_2">

Use the `points()` function to overlay the data.

</codeblock>

</exercise>

<exercise id="8" title="Visualizing categorical-continuous interactions" type="slides">

<slides source="chapter3_08">
</slides>

</exercise>

<exercise id="9" title="Soil pollution in different land uses">

The `meuse` data set has a factor variable, `landuse`, which specifies the type of land use or cover at the location where soil was sampled.

**Instructions**
- Using a categorical-continuous interaction (e.g., the `by =` form),  fit a model to the `meuse` data that predicts `copper` levels as a function of `dist`, with different smooths for each level of `landuse`.
- Include a separate term for varying intercepts for each level of `landuse`.
- Print the model summary.

<codeblock id="03_09">

- The formula should look like `y ~ s(continuous_variable, by = categorical_variable) + categorical_variable`.  
- Don't forget `method = "REML"` in your call to `gam()`.

</codeblock>

**Instructions**
- Fit a model with a factor-smooth interaction between `dist` and `landuse` variables using the `bs = "fs"` formulation.
- Print the model summary.

<codeblock id="03_09_1">

- The formula should look like `y ~ s(continuous_variable, categorical_variable, bs = "fs")`. 
- A separate intercept term in not necessary for models of this form.
- Don't forget `method = "REML"` in your call to `gam()`.

</codeblock>

</exercise>

<exercise id="10" title="Plotting pollution in different land uses">

You can observe the differences between different continuous-categorical interaction types by visualizing them.  Here, you'll look at the different ways the `by`-type and factor-smooth-type interactions are plotted, an see how the approaches fit the models differently.

Both the models (`mod_sep` and `mod_fs`) from the previous exercise are available in your workspace.

**Instructions**
- Plot both models using the `plot()` function, using the `pages` argument to keep all terms on one plot.

<codeblock id="03_10">

Use `pages = 1` in the `plot()` function to fit multiple plots onto a single page.

</codeblock>

- Plot both models making 3D perspective plots with `vis.gam()`.

<codeblock id="03_10_1">

Use `plot.type = "persp"` to make perspective plots with `vis.gam()`.

</codeblock>

</exercise>

<exercise id="11" title="Interactions with different scales: Tensors" type="slides">

<slides source="chapter3_11">
</slides>

</exercise>

<exercise id="12" title="Pollution models with multi-scale interactions">

The `meuse` dataset contains some predictor variables that are on the same scale (`x`, `y`), and some that are on different scales (`elev`, `dist`, `om`). In a previous exercise, you fit a model where you predicted cadmium pollution as a function of location and elevation: 

```{r}
mod <- gam(cadmium ~ s(x, y) + s(elev), 
           data = meuse, method = "REML")
```

In this exercise, you'll build a model that allows multiple variables to interact despite these different scales using a tensor smooth, `te()`.

**Instructions**
- Convert this to a model where `x`, `y`, and `elev` all interact in a single `te()` term, varying on their own scales. 
- Then summarize the model and visualize it with `plot()`.

<codeblock id="03_12">

- Tensor smooths can take more than two variables.  Use the syntax `te(x1, x2, x3)`. 
- Don't forget `method = "REML"`.

</codeblock>

</exercise>

<exercise id="13" title="Teasing apart multi-scale interactions">

In the previous exercise, you fit the following model: 

```{r}
tensor_mod <- gam(cadmium ~ te(x, y, elev), 
                  data = meuse, method = "REML")
```

In this exercise, you will fit a model with smooths and tensor _interactions_ to separate out the independent and interacting effects of variables.

**Instructions**
- Convert the above model such that `x` and `y` interact on the same scale, the effect `elev` is a separate smooth, and the interaction of all three on different scales is a separate term. 
- Summarize and plot the model.

<codeblock id="03_13">

- Single-variable smooths use `s()`. 
- Smooths in which multiple variables interact on the same scale also use `s()`. 
- Smooths that have only interactions, but have multiple lambda terms or scales, use `ti()`.

</codeblock>

</exercise>






















