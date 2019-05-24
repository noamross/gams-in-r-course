---
title: '4 - Logistic GAMs for Classification'
description:
  'In the first three chapters, you used GAMs for regression of continuous outcomes.  In this chapter, you will use GAMs for classification. You will build logistic GAMs to predict binary outcomes like customer purchasing behavior, learn to visualize this new type of model, make predictions, and learn how to explain the variables that influence each prediction.'
prev: /chapter3
next: /chapter1
type: chapter
id: 4
---
<exercise id="1" title="Types of model outcomes" type="slides">

<slides source="chapter4_01">
</slides>

</exercise>

<exercise id="2" title="Classifying purchasing behavior">

Let's fit some GAMs to the `csale` data, which has the binary `purchase` outcome variable.

After you fit the model, answer the following question:

What does the `log_mod` model estimate the probability of a person making a purchase who has mean values of all variables?

**Instructions**

- Fit a logistic GAM predicting whether a `purchase` will be made based only on a smooth of the `mortgage_age` variable.

<codeblock id="04_02">

Use the `family = binomial` argument to fit a logistic model.

</codeblock>


<choice>
<opt text="7.5%">

Incorrect. The probability when all variables are at their mean is determined only by the value of the intercept.

</opt>

<opt text="11%">

Incorrect. The probability when all variables are at their mean is determined only by the value of the intercept.

</opt>

<opt text="21%" correct="true">

Correct! This is the probability when all smooths are at zero and the only effect is the intercept.

</opt>

<opt text="72%">

Incorrect. The probability when all variables are at their mean is determined only by the value of the intercept.

</opt>

</choice>

</exercise>

<exercise id="3" title="Purchase behavior with multiple smooths">

In this exercise, you will fit a logistic GAM that predicts the outcome (`purchase`) in `csale`, using ***all*** other variables as predictors.

After summarizing the model, answer the following question:  

Which term in the model is _significant_ but approximately _linear_?

**Instructions**
- Fit a logistic GAM on all variables. 
- Print the summary of the model.

<codeblock id="04_03">

- Wrap each variable in the data frame `csale` in an `s()` term in the model formula except the outcome variable, `purchase`.
- Use `names(csale)` in the R console to view all the variable names.

</codeblock>

Choice

<choice>
<opt text="`s(n_acts)`">

Incorrect. `s(n_acts)` is nonlinear, as it has `edf` much larger than 1.

</opt>

<opt text="`s(avg_prem_balance)`">

Incorrect. `s(avg_prem_balance)` is nonlinear, as it has `edf` much larger than 1.

</opt>

<opt text="`s(retail_crdt_ratio)`" >

Incorrect. `s(retail_crdt_ratio)` is nonsignifcant, as it has p > 0.05.

</opt>

<opt text="`s(cred_limit)`" correct="true">

Correct! This term is linear with `edf` near one, and with p < 0.05.  These same terms apply in the case of logistic GAMs.

</opt>

</choice>

</exercise>

<exercise id="4" title="Visualizing logistic GAMs" type="slides">

<slides source="chapter4_04">
</slides>

</exercise>

<exercise id="5" title="Visualizing influences on purchase probability">

Let's try plotting and interpreting the purchasing behavior model from the last lesson.  You'll step through several iterations of plots of `log_mod2`, moving from raw plots on the fitting scale towards plots on the response scale with more natural interpretations.

The model (`log_mod2`) from the previous exercise is available in your workspace.

```r
csale <- readRDS(url("https://assets.datacamp.com/production/repositories/1786/datasets/cad8c6b369fb6bfbdbae6b17c01df88e1bd336c4/csale.rds"))
set.seed(0)
library(mgcv)
log_mod2 <- gam(purchase ~ s(n_acts) + s(bal_crdt_ratio) +
                		   s(avg_prem_balance) + s(retail_crdt_ratio) +
                           s(avg_fin_balance)  + s(mortgage_age) + s(cred_limit),
              data = csale,
              family = binomial,
              method = "REML")
```


**Instructions**

- Plot all partial effects of `log_mod2` on the log-odds scale. Put all plots on a single page.

<codeblock id="04_05">

Use `pages = 1` to put all the partial effects on a single page.

</codeblock>

**Instructions**

- Convert the plots to the probability scale using the `trans` argument.

<codeblock id="04_05_1">

Use the `plogis` function in the `trans` argument to convert log-odds to probability.

</codeblock>

**Instructions**

- Convert the plots to probability _centered on the intercept_ with the `shift` argument.

<codeblock id="04_05_2">

Pass the model intercept, which is the first value in the vector returned by `coef(model)`, to the `shift` argument.

</codeblock>

**Instructions**

- Add intercept-related uncertainty to the plots using the `seWithMean` argument.

<codeblock id="04_05_3">

Setting `seWithMean = TRUE` incorporates intercept uncertainty into the plots.

</codeblock>

</exercise>

<exercise id="6" title="Interpreting purchase effect plots (I)">

For the next few questions, you'll inspect the partial effects plots of some of the terms in `log_mod2`.

All else being equal, which of these variables has the largest effect on purchase probability?

#![](https://assets.datacamp.com/production/repositories/1786/datasets/7ae1b168cc3fb462fadc5e554aabc410332d55aa/logmod2plot-1.png)

`@hint`
Which partial effect spans the largest range on the y-axis?

<choice>
<opt text="`s(avg_fin_balance)`">

Incorrect. `avg_fin_balance` does not have the largest effect on purchase probability.

</opt>

<opt text="`s(mortage_age)`">

Incorrect. `cred_limit` does not have the largest effect on purchase probability.

</opt>

<opt text="`s(cred_limit)`" >

Incorrect. `mortgage_age` does not have the largest effect on purchase probability.

</opt>

<opt text="`s(n_acts)`" correct="true">

Correct! `n_acts` has the largest effect on purchase probability.

</opt>

</choice>

</exercise>

<exercise id="7" title="Interpreting purchase effect plots (II)">

What is the expected purchase probability of a person with 20 accounts (`n_acts = 20`) if all other values are average?

#![](https://assets.datacamp.com/production/repositories/1786/datasets/7ae1b168cc3fb462fadc5e554aabc410332d55aa/logmod2plot-1.png)

`@hint`
For the smooth `s(n_acts)`, what is the approximate value on the y-axis where the x axis equals 20?

<choice>
<opt text="0.15">

Incorrect. What is the probability on the y-axis where `n_acts` is 20?

</opt>

<opt text="0.25">

Incorrect. What is the probability on the y-axis where `n_acts` is 20?

</opt>

<opt text="0.35" >

Incorrect. What is the probability on the y-axis where `n_acts` is 20?

</opt>

<opt text="0.55" correct="true">

Correct! When `n_acts` is 20 the predicted probability of purchase is about 0.55, all else being equal.
</opt>

</choice>

</exercise>

<exercise id="8" title="Interpreting purchase effect plots (III)">

Which of these predictions has the greatest uncertainty, assuming all other variables are at average levels?

#![](https://assets.datacamp.com/production/repositories/1786/datasets/7ae1b168cc3fb462fadc5e554aabc410332d55aa/logmod2plot-1.png)

`@hint`
Look at the confidence intervals around the partial effects at each value.

<choice>
<opt text="The probability of purchase when `avg_fin_balance` is 2000.">

Incorrect. Where along this partial effect are the confidence intervals wider?

</opt>

<opt text="The probability of purchase when `mortgage_age` is 50.">

Incorrect. Look at the confidence intervals around other partial effects.

</opt>

<opt text="The probability of purchase when `avg_fin_balance` is 5000." correct="true">

Correct. There are wide confidence intervals around the `avg_fin_balance` smooth at a value at 5000.

</opt>

<opt text="The probability of purchase when `mortgage_age` is 150." >

Incorrect. Look at the confidence intervals around other partial effects.

</opt>

</choice>

</exercise>

<exercise id="9" title="Making predictions" type="slides">

<slides source="chapter4_09">
</slides>

</exercise>

<exercise id="10" title="Predicting purchase behavior and uncertainty(tab)">

The `log_mod2` purchase behavior model lets you make predictions off credit data. In this exercise, you'll use a new set of data, `new_credit_data`, and calculate predicted outcomes and confidence bounds. 

The model (`log_mod2`) from the exercise 3 is available in your workspace.

```{r}
library(mgcv)
csale <- readRDS(url("https://assets.datacamp.com/production/repositories/1786/datasets/3331154338220d6597187e3c7bc1e5b7ec064858/csale.rds"))
new_credit_data <- readRDS(url("https://assets.datacamp.com/production/repositories/1786/datasets/c76599b99a7f00c8b7f74ca7765b2186216b0dde/new_credit_data.rds"))
log_mod2 <- gam(purchase ~ s(n_acts) + s(bal_crdt_ratio) +
                		   s(avg_prem_balance) + s(retail_crdt_ratio) +
                           s(avg_fin_balance)  + s(mortgage_age) + s(cred_limit),
              data = csale,
              family = binomial,
              method = "REML")
```

**Instructions**
- Use the model `log_mod2` to calculate the predicted purchase log-odds, and standard errors for those predictions, for the observations in `new_credit_data`.

<codeblock id="04_10">

- Use the `predict()` function.
- The `newdata` argument takes the new dataset.
- The `type` argument gives probabilities if given a value of `"response"` and log-odds if given a value of `"link"`. 
- The `se.fit`  argument determines whether to return standard errors.

</codeblock>

**Instructions**
- Using your predictions and standard errors, calculate high and low confidence bounds for the log-odds of purchase for each observation. 
- Calculate the high confidence bound as two standard errors above the mean prediction, and the low confidence bound as two standard errors below the mean prediction.

<codeblock id="04_10_1">

Confidence bounds should be calculated by adding or subtracting multiples of the standard errors (`multiple*predictions$se.fit`) from the mean predictions (`predictions$fit`).

</codeblock>

**Instructions**
- Convert your calculated confidence bounds from the log-odds scale to the probability scale.

<codeblock id="04_10_2">

The `plogis()` function converts values from log-odds to probability.

</codeblock>

</exercise>

<exercise id="11" title="Explaining individual behaviors">

In the final exercise of this chapter, you will use the model `log_mod2` to predict the contribution of each term to the prediction of one row in `new_credit_data`.  

After predicting, answer the following question:  

Which term makes the greatest contribution to the prediction of this first data point?

```r
library(mgcv)
csale <- readRDS(url("https://assets.datacamp.com/production/repositories/1786/datasets/3331154338220d6597187e3c7bc1e5b7ec064858/csale.rds"))
new_credit_data <- readRDS(url("https://assets.datacamp.com/production/repositories/1786/datasets/c76599b99a7f00c8b7f74ca7765b2186216b0dde/new_credit_data.rds"))
log_mod2 <- gam(purchase ~ s(n_acts) + s(bal_crdt_ratio) +
                		   s(avg_prem_balance) + s(retail_crdt_ratio) +
                           s(avg_fin_balance)  + s(mortgage_age) + s(cred_limit),
              data = csale,
              family = binomial,
              method = "REML")

```

**Instructions**
- Predict the effect of each model term on the output _for the first row_ of `new_credit_data`.

<codeblock id="04_11">

- Use the `type = "terms"` argument in `predict()` to get the contribution of each term. 
- Subset the predictions to the first row.

</codeblock>

hint - Which term has the greatest absolute value?

<choice>
<opt text="`s(n_acts)`">

Incorrect. `s(n_acts)` lower the predicted probability, but another term raises it even more.

</opt>

<opt text="`s(bal_crdt_ratio)`" correct="true">

Correct! For this data point, `s(bal_crdt_ratio)` has the greatest contribution to the prediction.  Note this is despite the fact that `s(n_acts)` has a larger _overall_ effect, as we saw in the last section.

</opt>

<opt text="`s(avg_prem_balance)`">

Incorrect. Another term has more influence on this prediction than `s(avg_premium_balance)`

</opt>

<opt text="`s(retail_crdt_ratio)`" >

Incorrect. `s(retail_crdt_ratio)` has a very small influence on the predicted outcome.

</opt>

</choice>

</exercise>

<exercise id="12" title="Doing more with GAMs" type="slides">

<slides source="chapter4_12">
</slides>

</exercise>

























