---
type: slides
---

# Visualizing categorical-continuous interactions

Noam Ross
Senior Research Scientist, EcoHealth Alliance

Notes: Simple smooth x,y interactions are not the only kind of complex relationship between variables in GAMs. Let's take a look at how to visualize another type of interaction.

---

# Categorical-continuous interactions

```r
model4b <- gam(hw.mpg ~ s(weight, by = fuel) + fuel, data = mpg,
              method = "REML")
```
![](https://github.com/noamross/gams-in-r-course/blob/master/images/categorical-by-intercept-1.png?raw=true)


Notes: Back in Chapter 1, we introduced the idea of factor-smooth interactions.  That is, models where we used the "by" argument in a smooth to fit different smooths for each value of a categorical variable.  Here's the fuel economy model we fit, where we used different smooths for the effect of weight on fuel economy depending on the fuel type used by cars.

---

# Factor-smooths

```r
model4c <- gam(hw.mpg ~ s(weight, fuel, bs = "fs"),
               data = mpg,
               method = "REML")
```

Notes: There's another kind of categorical-continuous interaction, called a "factor-smooth".  In a factor-smooth, rather than using the by argument, we use a factor-smooth basis type.  We specify the two variables as part of the smooth by setting the bs argument to "fs".  

Note that in this case, we do not include an additional linear term to make separate intercepts for each level.  The factor-smooth formulation accounts for this automatically.

---

# Factor-smooths

```out
> summary(model4c)

Family: gaussian 
Link function: identity 

Formula:
hw.mpg ~ s(weight, fuel, bs = "fs")

Parametric coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)   28.644      7.615   3.761 0.000223 ***
 ---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Approximate significance of smooth terms:
                edf Ref.df     F p-value    
s(weight,fuel) 7.71     19 53.12  <2e-16 ***
 ---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

R-sq.(adj) =  0.832   Deviance explained = 83.8%
-REML = 518.54  Scale est. = 7.9735    n = 205
```

Notes: With factor-smooths, we do not get a different term for each level of the categorical variable.  Rather, we get one overall interaction term.  This means that they are not as good for distinguishing between categories.  However, factor smooths are good for controlling for the effects of categories that are not our main variables of interest, especially when there are very many categories, or only a few data points in some categories.

---

# Plotting factor-smooths

```r
plot(model4c)
vis.gam(model4c, theta = 125, plot.type = "persp")
```
![](https://github.com/noamross/gams-in-r-course/blob/master/images/plotvvisgam-1.png?raw=true)


Notes: When you call the plot() function on a GAM with a factor-smooth fit using the bs="fs" argument, it will, by default, make one plot with multiple smooths on it.  

However, you can also use the vis.gam() function to visualize factor-smooths.  These staircase-like perspective plots are often helpful for comparing the shapes of different smooths.
