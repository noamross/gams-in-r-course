---
title: '2 - Interpreting and Visualizing GAMs'
description:
  'In this chapter, you will take a closer look at the models you fit in chapter 1 and learn how to interpret and explain them.  You will learn how to make plots that show how different variables affect model outcomes.  Then you will diagnose problems in models arising from under-fitting the data or hidden relationships between variables, and how to iteratively fix those problems and get better results.'
prev: /chapter1
next: /chapter3
type: chapter
id: 2
---
<exercise id="1" title="Interpreting GAM outputs" type="slides">

<slides source="chapter2_01"> 
</slides>

</exercise>

<exercise id="2" title="Significance and linearity (I)">

It's time for you to summarize a model and interpret the output.

After summarizing the model, you will answer the following question: 

Which smooth term in this model is _significant_ and _linear_?

** Instructions **
- Summarize the `mod_city4` model.

<codeblock id="02_02">

You can call the `summary()` function on the model object which will provide you with a table of information on the model smooths.

</codeblock>

(hint)You can call the `summary()` function on the model object which will provide you with a table of information on the model smooths.

<choice>
<opt text="weight">

`s(weight)` has `edf` over five, indicating it is nonlinear."

</opt>

<opt text="length" >

`s(length)` has a `p-value` over 0.05 and no stars, indicating it is not significant.

</opt>

<opt text="price" correct="true">

Correct! `price` is significant (p <0.05) and linear (`edf` near 1).

</opt>

<opt text="rpm">

`s(rpm)` has `edf` over five, indicating it is nonlinear.

</opt>

<opt text="width">

`s(width)` has a `p-value` over 0.05 and no stars, indicating it is not significant.

</opt>
</choice>

</exercise>

<exercise id="3" title="Significance and linearity (II)">

Looking at the same model (`mod_city4`), which smooth term is _non-significant_ and _non-linear_?

<choice>
<opt text="weight">

`s(weight)` has a p-value below 0.05, indicating that it is significant.

</opt>

<opt text="length" correct="true">

Correct! Now let's move on to interpreting our models visually.

</opt>

<opt text="price" >

`s(price)` has a p-value below 0.05, indicating that it is significant, and also an `edf` of 1, indicating it is linear.

</opt>

<opt text="rpm">

`s(rpm)` has a p-value below 0.05, indicating that it is significant.

</opt>

<opt text="width">

`s(width)` has an `edf` near 1, indicating it is linear.

</opt>
</choice>

</exercise>

<exercise id="4" title="Visualizing GAMs" type="slides">

<slides source="chapter2_04"> 
</slides>

</exercise>

<exercise id="5" title="Plotting the motorcycle crash model and data">

For our first plotting exercise, we'll add _partial residuals_ to the _partial effect plot_ of a GAM so as to compare the model to the data.

-  Plot the model (`mod`) that uses `mcycle` data. Add partial residuals to the plot.
-  Make a second plot, making partial residuals more visible by changing the shape using the `pch` argument, and size of the residuals using the `cex` argument. Set both the `pch` and `cex` arguments to 1.

<codeblock id="02_05">

-  Use the `plot()` function with the `residuals` argument.
-  Change shape and size of residuals with the `pch` and `cex` arguments.

</codeblock>

</exercise>

<exercise id="6" title="Plotting multiple auto performance variables">

In plotting GAMs, you sometimes want to look at just parts of a model, or all the terms in model.  Here you'll practice selecting which terms to visualize.

** Instructions **
-  Plot the provided model (`mod`) that uses the `mpg` data, using the `select` term to view only the partial effect of `price`. 
-  Make another plot, this time showing _all_ terms on a single page, including the linear `comp.ratio` term.

<codeblock id="02_06">

-  Use the `select` argument in `plot()` to show the partial effect of a specific term, using the _number_ of the term in the model formula to select it.
-  The `pages` argument determines the total number of pages across which to plot terms.
-  The `all.terms = TRUE` argument includes linear terms in the plot.
-  You can look up function arguments with `?plot.gam`.

</codeblock>

</exercise>

<exercise id="7" title="Visualizing auto performance uncertainty">

Confidence intervals are a very important visual indicator of model fit.  Here you'll practice changing the appearance of confidence intervals and transforming the scale of partial effects plots.

** Instructions **
-  Plot the model (`mod`) that uses the `mpg` data, plotting only the partial effect of `weight`. Make the confidence interval shaded and `"hotpink"` in color.
-  Make another plot of the `weight` partial effect, this time shifting the scale by the value of the intercept using the `shift` argument, and including the uncertainty of the model intercept using the `seWithMean` argument.

<codeblock id="02_07">

-  Use the `shade` and `shade.col` arguments to shade and color the confidence interval.
-  Remember the value of the intercept is `coef(mod)[1]`. 
-  You can look up function arguments with `?plot.gam`.

</codeblock>

</exercise>

<exercise id="8" title="Model checking with gam.check()" type="slides">

<slides source="chapter2_08"> 
</slides>

</exercise>

<exercise id="9" title="Reading model diagnostics">

`gam.check()` helps you understand whether you have enough basis functions to model the data.

After running checks on the model, answer the following question: Which smooths do not have sufficient numbers of basis functions?

** Instructions **
-  Print diagnostics on model (`mod`) basis size and plots of model residuals.

<codeblock id="02_09">

Call `gam.check()` on the model.

</codeblock>


(hint) Smooths that have _significant_ effects in the diagnostic test (`p` < 0.05, with asterisks) generally do not have enough basis functions.  This indicates non-random patterns in residuals.

<choice>
<opt text="`x0`">

Incorrect. A smooth without enough basis functions would have significant results in `gam.check()`

</opt>

<opt text="`x1`" >

Incorrect. A smooth without enough basis functions would have significant results in `gam.check()`

</opt>

<opt text="`x2`" correct="true">

Correct! `x2` does not have enough basis functions because it has a significant result in the diagnostic test.

</opt>

<opt text="`x3`">

Incorrect. A smooth without enough basis functions would have significant results in `gam.check()`

</opt>

</choice>

</exercise>

<exercise id="10" title="Fixing problems with model diagnostics">

You can use `gam.check()` to improve models by updating them based on its results.

** Instructions **
- Run the model diagnostics on `mod`. 
- Based on the diagnostics, re-fit the model as `mod2`, changing the number of basis functions (`k`) for failing smooths. 
- Run the model diagnostics on `mod2` to ensure you have fixed the issue.

<codeblock id="02_10">

- Use `gam.check()` to run the model diagnostics. 
- Increase the `k` values in the model for smooths that have significant diagnostic tests. 
- Keep changing the model until the diagnostic shows no significant results for patterns in residuals.

</codeblock>

</exercise>

</exercise>

<exercise id="11" title="Checking concurvity" type="slides">

<slides source="chapter2_11"> 
</slides>

</exercise>

<exercise id="12" title="Examining overall concurvity in auto data">

Let's take a look at concurvity in the fuel efficiency model variables.  

After checking the overall concurvity of `mod`, answer the following question: Which smooth is _least_ pre-determined by all the other variables?

** Instructions **
- Inspect the overall concurvity of `mod`.

<codeblock id="02_12">

For overall concurvity, use `full = TRUE` in the `concurvity()` function.

</codeblock>

(hint) 
- The _least_ pre-determined variable generally has the _lowest_ concurvity according to all three ways of measuring it.
- It is sometime helpful to wrap the `concurvity()` results in a `round()` function for easier inspection, like so: `round(concurvity(mod, full = TRUE), 2)`.

<choice>
<opt text="`s(length)`">

Incorrect. `length` has high overall concurvity.

</opt>

<opt text="`s(width)`" >

Incorrect. `width` has high overall concurvity.

</opt>

<opt text="`s(height)`" correct="true">

Correct! `height` has relatively low concurvity.  It isn't too similar to any of the other variables.

</opt>

<opt text="`s(weight)`">

Incorrect. `weight` has high overall concurvity.

</opt>

</choice>

</exercise>

<exercise id="13" title="Examining concurvity between auto variables">

Now, let's look at concurvity _between_ model variables.

After examining the pairwise concurvity between variables in `mod`, answer the following question: Which two variables have the greatest worst-case concurvity?

** Instructions **
- Inspect the pairwise concurvity for variables in `mod`.

<codeblock id="02_13">

For pairwise concurvity, use `full = FALSE` in the `concurvity()` function.

</codeblock>

(hint) 
It is sometimes helpful to round concurvity values for easier inspection, which you can do for each matrix like so `round(concurvity(mod, full = FALSE)$worst, 2)`.

<choice>
<opt text="`height` and `length`">

`height` and `length` have worst-case concurvity of about 0.606.  Which pair of variables has greater concurvity?

</opt>

<opt text="`height` and `weight`" >

`height` and `weight` have worst-case concurvity of about 0.367.  Which pair of variables has greater concurvity?

</opt>

<opt text="`length` and `width`" correct="true">

Close! `length` and `width` have a high worst-case concurvity: about 0.834  Which pair of variables has even greater concurvity?

</opt>

<opt text="`weight` and `width`">

Correct! `weight` and `width` have worst-case concurvity of about 0.895.

</opt>

</choice>

</exercise>














