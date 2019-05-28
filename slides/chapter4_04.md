---
type: slides
---

# Visualizing Logistic GAMs

Noam Ross
Senior Research Scientist, EcoHealth Alliance

Notes: Logistic GAMs are very useful for classification.  However, to make the most of these models, we need to visualize logistic GAM outputs in an interpretable way.  Here we'll learn how to modify plotting commands so as to make our logistic visualizations easy to understand.
---

# Transforming Scales

![](https://github.com/noamross/gams-in-r-course/blob/master/images/logistic-1.png?raw=true)

Notes: In the last lesson we learned that when building GAMs for binary classification, outputs are in log-odds and need to be transformed by the logistic function to be interpreted as probabilities.

---

# Log-odds plots

```r
plot(binom_mod)
```
![](https://github.com/noamross/gams-in-r-course/blob/master/images/untrans-1.png?raw=true)

Notes: When we plot the output of a logistic GAM, we see the partial effect of smooths on the log-odds scale.  It can be difficult to interpret this.  We understand the shape of the effect, but the magnitude of the effect on probability is not immediately apparent.

---

# Converting partial effects

```r
plot(binom_mod, pages = 1, trans = plogis)
```

![](https://github.com/noamross/gams-in-r-course/blob/master/images/trans-1.png?raw=true)

Notes: When plotting, we can convert our output to the probability scale by using the trans argument. The trans argument takes a function that transforms the output.  So we can pass the plogis() logistic function to this argument, and all values in plots will be transformed from log-odds to probabilities.

As you can see, the outputs are now on a probability scale between zero and one.  You can see the first term, which was previously linear, has a slight curve on this scale.

---

# Converting partial effects (2)

```r
plot(binom_mod, pages = 1, trans = plogis)
```
![](https://github.com/noamross/gams-in-r-course/blob/master/images/translin-1.png?raw=true)

Notes: When we transform this way, we see our partial effects are all centered on an average value of 0.5.  This is because we are looking at each partial effect with no intercept.

---

# Adding an intercept

```r
plot(binom_mod, pages = 1, trans = plogis,
     shift = coef(binom_mod)[1])
```
![](https://github.com/noamross/gams-in-r-course/blob/master/images/wintercept-1.png?raw=true)


Notes: To incorporate the model intercept, we can use the shift argument that we learned earlier. shift adds its value to all model outputs, before the transformation in the function we pass to trans.  So we shift our outputs by passing the intercept,  extracting it from the model object with the coef() function.

---

# Adding an intercept (2)

```r
plot(binom_mod, pages = 1, trans = plogis,
     shift = coef(binom_mod)[1])
```

![](https://github.com/noamross/gams-in-r-course/blob/master/images/winterceptlin-1.png?raw=true)

Notes: Now our partial effect plots have much more intuitive interpretation.  Each partial effect plot can be interpreted as showing the probability of the outcome if all other variables were at their average value.  At their own average value, you get only the effect of the intercept.

Here, we can see that the variable x1 affects the probability of the outcome, lowering it to just over 0.5 when x1's value is zero, to just over 0.8 when it's value is 1. x2's nonlinear effect is greater, pushing the outcome probability down to near 0.2 at its highest value.

---

# Incorporating intercept uncertainty

```r
plot(binom_mod, pages = 1, trans = plogis,
     shift = coef(binom_mod)[1],
     seWithMean = TRUE)
```
![](https://github.com/noamross/gams-in-r-course/blob/master/images/wintercepterr-1.png?raw=true)

Notes: Earlier we learned about the seWithMean argument, which adds the intercept uncertainty to the smooth uncertainty. It is natural to include this uncertainty here, as we are adding the intercept term.  

Now, the confidence intervals in our partial effect plots also have a natural interpretation.  They  may be interpreted as the range of uncertainty of the probability of the outcome for any value of the variable, holding other variables equal at their average value.

---

# Improving the plot

```r
plot(binom_mod, pages = 1, trans = plogis, shift = coef(binom_mod)[1],
     seWithMean = TRUE, rug = FALSE, shade = TRUE, shade.col = "lightgreen", 
     col = "purple")
```
![](https://github.com/noamross/gams-in-r-course/blob/master/images/winterceptcol-1.png?raw=true)

Notes: Finally, we can always improve our plot by changing visual options as we did with earlier plots.
