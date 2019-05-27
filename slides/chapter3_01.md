---
type: slides
---

# 2-Dimensional Smooths and Spatial Data

Noam Ross 
Senior Research Scientist, EcoHealth Alliance

Notes: Up until now, we have been working with models made up of one or several smooths, each of a single variable.  Now, we will expand our models to include smooths of multiple variables and their interactions.  This will allow us to look at new kinds of data, especially geospatial data, which are best represented by complex surfaces rather than single smooth lines.

---

# Interactions

![](https://github.com/noamross/gams-in-r-course/blob/master/images/formula1-chapter3.png?raw=true)

Notes: You may be familiar with the concept of interactions from linear modeling.  Interactions in models represent the fact that outcomes depend on non-independent relationships of multiple variables.  In a linear model, they are generally represented by adding a term multiplying two variables.  This can result in the outcome being higher or lower than what would be predicted by the sum of the two values alone.

---

# Interactions in GAMs

<div  class='left' style='float:left;width:25%'>
<p data-markdown>
![](https://github.com/noamross/gams-in-r-course/blob/master/images/formula2-chapter3.png?raw=true)
</p>
</div>
<div class='right' style='float:right;width:75%'>
<p data-markdown>
![](https://github.com/noamross/gams-in-r-course/blob/master/images/interactions-1-1.png?raw=true)
</p>
</div>



Notes: In a GAM, the relationship between a variable and an outcome changes across the range of the smooth. Similarly, interactions are different across all the values of two or more variables. We represent interactions between variables as a smooth surface, so any combination of variables can take a different value. This is also a natural way to represent spatial data.

---

# Syntax for interactions

```r
gam(y ~ s(x1, x2), # <-- 2 variables 
        data = dat, method = "REML")
```

Notes: The syntax for interactions in GAMs is straightforward.  To model the interaction between two variables, we put two variables inside the s() function in a GAM formula, as shown here.


---

# Mixing interaction and single terms

```r
gam(y ~ s(x1, x2) + s(x3),
        data = dat, method = "REML")
``` 

```r
gam(y ~ s(x1, x2) + x3 + x4,
        data = dat, method = "REML")
```

Notes: You can mix interactions with other terms, which can be linear or nonlinear.  For instance, the first formula here has an additional nonlinear term, x3, which is separate from the interaction of terms x1 and x2.  The second formula has linear terms x3 and x4.  Just as in our previous GAMs, you can include discrete, categorical terms along with interactions and linear terms.

A common way to model geospatial data is to use an interaction term of x and y coordinates, along with individual terms for other predictors. The interaction term then accounts for the spatial structure of the data.

---

# Interaction model outputs

```out
Family: gaussian 
Link function: identity 

Formula:
y ~ s(x1, x2)

Parametric coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)  0.34256    0.01646   20.82   <2e-16 ***
 ---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Approximate significance of smooth terms:
           edf Ref.df     F p-value    
s(x1,x2) 10.82   14.9 14.37  <2e-16 *** #<-- Interaction
 ---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

R-sq.(adj) =  0.519   Deviance explained = 54.5%
GCV = 0.057564  Scale est. = 0.054161  n = 200
```

Notes: When you look at the summary outputs of a model with interactions, you'll see that the interaction is a single smooth term.  This combines the effects of x1, x2, and their
combination in a single smooth.  This differs from what you may expect in a linear model, where terms for x1, x2, and their combination are separate. We will discuss how to fit a model that separates these components later in this chapter.

Also note the high EDF, that is, effective degrees of freedom for this term. It takes many more basis functions, and therefore more data, to build a two-dimensional surface rather than a one-dimensional line.

---

# Spatial data

```r
meuse
```

```out
         x      y cadmium copper lead zinc   elev       dist   om ffreq soil lime landuse dist.m
1   181072 333611    11.7     85  299 1022  7.909 0.00135803 13.6     1    1    1      Ah     50
2   181025 333558     8.6     81  277 1141  6.983 0.01222430 14.0     1    1    1      Ah     30
3   181165 333537     6.5     68  199  640  7.800 0.10302900 13.0     1    1    1      Ah    150
4   181298 333484     2.6     81  116  257  7.655 0.19009400  8.0     1    2    0      Ga    270
5   181307 333330     2.8     48  117  269  7.480 0.27709000  8.7     1    2    0      Ah    380
6   181390 333260     3.0     61  137  281  7.791 0.36406700  7.8     1    2    0      Ga    470
7   181165 333370     3.2     31  132  346  8.217 0.19009400  9.2     1    2    0      Ah    240
8   181027 333363     2.8     29  150  406  8.490 0.09215160  9.5     1    1    0      Ab    120
9   181060 333231     2.4     37  133  347  8.668 0.18461400 10.6     1    1    0      Ab    240
10  181232 333168     1.6     24   80  183  9.049 0.30970200  6.3     1    2    0       W    420  
```

```r
?sp::meuse
```

Notes: For exercises involving interactions in GAMs, we will use a new data set called "meuse".  This is geospatial data of heavy metal soil pollution along the Meuse river in the Netherlands. It consists of a data frame with x and y coordinates, measures of heavy metals in the soil, and other spatial covariates such as elevation, distance from the river, and the land-use type occurring in that location. For more information on the source and variables of these data, you can look at the help file for this data set in the sp package.
---

# Let's practice!

Notes: Now let's try some examples of two-dimensional modeling with GAMs.














