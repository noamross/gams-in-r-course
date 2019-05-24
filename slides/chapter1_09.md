---
type: slides
---

# Multiple Regression with GAMs

Noam Ross
Senior Research Scientist, EcoHealth Alliance

Notes: So far, all the GAMs we have seen have been univariate; they have a single predictor for the outcome. However, we can perform multiple regression with GAMs. Multiple GAMS also can contain a mixture of smooths, linear effects, and continuous or categorical variables. In this lesson, we'll learn how to use this flexibility to fit a variety of different models to data.

---

# Working Dataset: mpg

```r
mpg
```

```out
    symbol loss          make   fuel aspir doors       style drive eng.loc    wb length width
1        3   NA   alfa-romero    gas   std   two convertible   rwd   front  88.6  168.8  64.1
2        3   NA   alfa-romero    gas   std   two convertible   rwd   front  88.6  168.8  64.1
3        1   NA   alfa-romero    gas   std   two   hatchback   rwd   front  94.5  171.2  65.5
4        2  164          audi    gas   std  four       sedan   fwd   front  99.8  176.6  66.2
5        2  164          audi    gas   std  four       sedan   4wd   front  99.4  176.6  66.4
6        2   NA          audi    gas   std   two       sedan   fwd   front  99.8  177.3  66.3
7        1  158          audi    gas   std  four       sedan   fwd   front 105.8  192.7  71.4
8        1   NA          audi    gas   std  four       wagon   fwd   front 105.8  192.7  71.4
9        1  158          audi    gas turbo  four       sedan   fwd   front 105.8  192.7  71.4
10       0   NA          audi    gas turbo   two   hatchback   4wd   front  99.5  178.2  67.9
...
```

Notes: We'll now work with the mpg data set.  This is a data set of 205 models of cars, consisting of various traits like their make, model, cylinders, price and weight, and their city and highway fuel efficiency. We'll be building models that use the vehicle traits to predict fuel efficiency.

---

# Multiple Smooths (1)

```r
model <- gam(hw.mpg ~ s(weight), data = mpg,
             method = "REML")
```
![](http://s3.amazonaws.com/assets.datacamp.com/production/course_6790/datasets/onevar-1.png)


Notes: Let's start with a very simple one variable model.  Here is the code for a model that predicts highway fuel efficiency as a smooth function of automobile weight. The resulting model captures the nonlinear decreasing relationship between these two variables.

---

# Multiple Smooths (2)

```r
model <- gam(hw.mpg ~ s(weight), data = mpg,
             method = "REML")
```

```r
model2 <- gam(hw.mpg ~ s(weight) + s(length), data = mpg,
              method = "REML")
```


Notes: To add an additional variable, such as length, we just include
another s() function in our formula, separated by a plus sign. Here, we add car length as another predictor.

---

# Multiple Smooths (3)

```r
model2 <- gam(hw.mpg ~ s(weight) + s(length), data = mpg,
              method = "REML")
```

![](http://s3.amazonaws.com/assets.datacamp.com/production/course_6790/datasets/twovars-1.png)


Notes: 
We see from these plots that length has increasing nonlinear effect on fuel economy, and this effect is weaker than the weight effect. 

Note that, in this model, both the effect of weight and price are non-linear terms, but the two are simply added together to get a final prediction.  That addition is where the additive in generalized additive models comes from.

---

# Linear terms

```r
model2 <- gam(hw.mpg ~ s(weight) + length, data = mpg,
              method = "REML")
```
![](http://s3.amazonaws.com/assets.datacamp.com/production/course_6790/datasets/mixed-linear-1.png)


Notes: Not every term in a GAM has to be nonlinear.  You can combine linear and nonlinear terms.  To add a linear term, don't wrap the predictor in the s() function.  Here I've made the length term from the previous model linear. 

In practice, we rarely make continuous variables linear in GAMs. This is because, if the relationship is really linear, or there is not enough data to show otherwise, automatic smoothing will force a linear shape.

---

# Linear Terms (2)

```r
model2b <- gam(hw.mpg ~ s(weight) + s(length, sp = 1000), data = mpg,
              method = "REML")
```

![](http://s3.amazonaws.com/assets.datacamp.com/production/course_6790/datasets/mixed-linear-1.png)

Notes: We can produce the same model if we set the smoothing parameter of the length term very high. Strong smoothing results in a linear model.

---

# Categorical Terms (1)

```r
model3 <- gam(hw.mpg ~ s(weight) + fuel, data = mpg,
              method = "REML")
```

![](http://s3.amazonaws.com/assets.datacamp.com/production/course_6790/datasets/categorical-1.png)

Notes: However, linear terms are very useful when we have categorical variables as predictors.  For instance, in our mpg data set, the fuel variable has two categories: diesel and gas. When we include a linear term with this categorical variable, the gam() function fits a model with a fixed effect for each level of the category. Here, you can see that having gasoline has a negative effect; diesel vehicles are more fuel efficient. 

In this model the nonlinear effect of weight applies to vehicles of both gas types. This is nonlinear equivalent to the fixed slope, varying intercept models you may recall from a linear regression course.

Note that, when you use categorical variables this way, it's important that the variables are stored as factors. The mgcv package does not use character variables.

---

# Categorical Terms (2)

```r
model4 <- gam(hw.mpg ~ s(weight, by = fuel), data = mpg,
              method = "REML")
```
![](http://s3.amazonaws.com/assets.datacamp.com/production/course_6790/datasets/categorical-by-1.png)


Notes: We can also specify a GAM formula that will fit different smooths for different categorical variables.  We call this a factor-smooth interaction.  By specifying the "by" argument to the s() function, we can tell R to calculate a different smooth for each unique category.

You can see here we have different smooths for diesel and gas cars, but the diesel smooth is much more uncertain.

---

# Categorical Terms (3)

```r
model4b <- gam(hw.mpg ~ s(weight, by = fuel) + fuel, data = mpg,
              method = "REML")
```

![](http://s3.amazonaws.com/assets.datacamp.com/production/course_6790/datasets/categorical-by-intercept-1.png)


Notes: Usually, when we have smooth-factor interactions, we want to also include a varying intercept, in case the different categories are different in overall means in addition to shape of their smooths.  Here, you see adding this varying intercept improves the estimate of the smooth for diesel cars.

---

# Let's practice!

Notes: Now, let's practice fitting these different combinations of models.





