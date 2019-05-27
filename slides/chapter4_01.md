---
type: slides
---

# Logistic GAMs for Classification

Noam Ross 
Senior Research Scientist, EcoHealth Alliance

Notes: Up until now, we have been using GAMs to model only one type of outcome - continuous numeric values. However, GAMs have the ability to model many other types of outcomes.  In this chapter, we'll learn how to use logistic GAMs for binary classification.
---

# Types of outcomes

**Continuous outcomes**

- Speed of a motorcycle (mph)
- Fuel efficiency of a car (mpg)
- Level of pollution in soil (g/kg)

**Binary outcomes** 

- Presence or absence of an organism in a location 
- Whether a purchase was made 
- Yes/No answer on a survey 

Notes: Our previous data had all outcomes, or Y values, that could take on many different numeric values, such as speed, fuel efficiency or concentration of pollution.

However, we often want to model data with binary outcomes, like the presence of organisms, customer conversion, or yes/no answers on a survey.  We need to modify our models to take into account this type of data.

---

# Probabilities and Log-Odds: Logistic Function

![](https://github.com/noamross/gams-in-r-course/blob/master/images/logistic-1.png?raw=true)

Notes: When we model a binary outcome, our prediction is a probability, which must be between zero and one. Since GAMs can have an outcome of any number, we convert the GAM output to a probability using a logistic function. The logistic function is a transformation that converts numbers of any value to probabilities between zero and one.  In this context the numbers that take on any value can be interpreted as log-odds - the log of the ratio of positive outcomes to negative outcomes.

---

# Probabilities and Log-Odds: Logit Function

![](https://github.com/noamross/gams-in-r-course/blob/master/images/logit-1.png?raw=true)

Notes: The inverse of the logistic function is the logit function, which translates probabilities between zero and one to log-odds which can have any value.

---

# Logistic and Logit Functions in R

```r
plogis() # Logistic
qlogis() # Logit

qlogis(plogis(0.5))
[1] 0.5

qlogis(0.25) == log(1/3)
[1] TRUE
```

Notes: In R, the logistic function is plogis(), and the logit function is qlogis(). These functions are inverses of each other.  As you can see, the logistic of a logit returns the original value.  You can also see how probabilities convert to odds. A 0.25 probability converts to log-odds by taking a log of the ratio of positives - one - to negatives - three.

---

# Logistic GAMs with mgcv

```r
gam(y ~ x1 + s(x2),
   data = dat,
   family = binomial,
   method = "REML")
```

Notes: To use logistic and logit functions to fit a GAM where we have binary outcomes, we add the family=binomial argument to our GAM function call.  This tells the GAM function that outcomes are ones and zeros, and that it should fit the model on a logistic scale.

---

# Logistic GAM outputs

```out
Family: binomial 
Link function: logit 

Formula:
y ~ s(x1) + s(x2)

Parametric coefficients:
            Estimate Std. Error z value Pr(>|z|)    
(Intercept)   0.7330     0.1208    6.07 1.28e-09 ***
 ---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Approximate significance of smooth terms:
        edf Ref.df Chi.sq  p-value    
s(x1) 1.367  1.646  25.83 1.23e-05 ***
s(x2) 5.754  6.890  51.37 8.12e-09 ***
```

```r
plogis(0.733)
[1] 0.6754633
```

Notes: The output of a logistic GAM looks similar to that of previous GAMs we fit. As with regular GAMs, non-parametric terms are on top, and smooths on the bottom. EDFs still indicate the complexity of smooths, and asterisks indicate significance.  However, it's important to understand that outputs are on the log-odds scale. To interpret them as probabilities, we need to convert them using the logistic function.  Here, the value of the intercept is 0.733.  We can use the plogis() logistic function to convert it to a probability.

Converted, the intercept is about 0.67.

This means that the model predicts a 67 percent baseline chance of a positive outcome. This is what we would expect if x1 and x2 were at their average values.

---

# The `csale` data set

```r
head(csale)
```

```out
  purchase n_acts bal_crdt_ratio avg_prem_balance retail_crdt_ratio
1        0     11        0.00000         2494.414           0.00000
2        0      0       36.09506         2494.414          11.49123
3        0      6       17.60000         2494.414           0.00000
4        0      8       12.50000         2494.414           0.80000
5        0      8       59.10000         2494.414          20.80000
6        0      1       90.10000         2494.414          11.49123
  avg_fin_balance mortgage_age cred_limit
1        1767.197     182.0000      12500
2        1767.197     138.9601          0
3           0.000     138.9601          0
4        1021.000     138.9601          0
5         797.000      93.0000          0
6        4953.000     138.9601          0
```

Notes: Before we start exercises, lets get familiar with a new data set. The "csale" data set consists of anonymized information from the insurance industry.  The outcome, "purchase", represents whether customers purchased insurance following a direct mail campaign. The other variables consist of information from credit reports of those customers.  This is a small subset of all the variables and data in this set, which is available in the "Information" package. We'll be using this data to model predictors of purchasing behavior.

---

# Let's practice!

Notes: Now let's fit and interpret some GAMs.













