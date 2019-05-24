---
type: slides
---

# Making predictions

Noam Ross 
Senior Research Scientist, EcoHealth Alliance

Notes: GAMs are great for understanding complex systems, and also for making predictions. Here we'll learn to make predictions from the models we fit, and to explain how the model creates them.

---

# mgcv's `predict()` function

```r
predict(log_mod2)
```

```out
            1             2             3             4 
-0.8672827973 -2.9135420237 -0.4839780158 -0.1996086132 
            5             6             7             8 
-0.4416783066 -1.2351679544 -0.6148559122 -2.9135420237 
...
```

Notes: As with most models in R, you can make predictions from a GAM object with the predict() function.  Simply running predict() on a model, in this case our logistic model of purchasing behavior, will yield a vector of predictions for each data point in the data set we used to fit the model.

---

# Prediction types

```r
predict(log_mod2, type = "link")
```

```out
            1             2             3             4 
-0.8672827973 -2.9135420237 -0.4839780158 -0.1996086132 
            5             6             7             8 
-0.4416783066 -1.2351679544 -0.6148559122 -2.9135420237 
...
```

```r
predict(log_mod2, type="response")
```

```out
         1          2          3          4 
0.29582001 0.05148818 0.38131322 0.45026288 
         5          6          7          8 
0.39134114 0.22527819 0.35095230 0.05148818 
...
```

```r
plogis(predict(log_mod2, type="link"))
```

Notes: By default, the predict() function returns values on the "link" scale.  That is, the scale on which the model was fit to the data. For a logistic model, this is the log-odds scale.  We can have predict() return results on the probability scale by using the argument type = "response".  This is the equivalent of running the plogis() logistic function on our predictions.

---

# Standard errors

```r
predict(log_mod2, type = "link", se.fit = TRUE)
```

```out
$fit
         1          2          3          4 
-0.8672828 -2.9135420 -0.4839780 -0.1996086 
         5          6          7          8 
-0.4416783 -1.2351680 -0.6148559 -2.9135420 

$se.fit
        1         2         3         4 
0.2850848 0.1646090 0.2299404 0.2159088 
        5         6         7         8 
0.2767443 0.7601131 0.2454877 0.1646090 
```


Notes: If we set the argument se.fit to TRUE in our call, predict() returns a list where the first element, fit, contains our vector of predictions, and the second element, named se.fit, contains standard errors for our predictions.

---

# Standard errors (2)

![](https://github.com/flor14/gams-in-r-course/blob/master/images/logerrs-1.png?raw=true)


Notes: Standard errors are only approximations when we use the probability scale. This is because errors are non-symmetrical on this scale.  If you use standard errors to construct confidence intervals for your predictions, you should do so on the log-odds scale, and then convert them to probability using the plogis() logistic function.

Here, on the left, we see what happens when we make intervals by adding or subtracting on the response scale. Predictions of probability can be below zero or above one, which doesn't make any sense. On the right, we show the result of doing this correctly.  When we transform from log-odds to probability after adding the errors, our predictions are well bounded.

---

# Predictions on new data

```r
trained_model <- gam(response ~ s(predictor),
                     data = train_df,
                     family = binomial,
                     method = "REML")
```


```r
# Test data
test_predictions <- predict(trained_model,
                            type = "response",
                            newdata = test_df) 
```

Notes: Of course, we are often interested on model predictions beyond the data we use to fit the model, that is the new, out-of sample data.  The newdata argument lets us pass new data to our model and generate predictions, so we can apply our model to new situations. 

This allows us to predict on test data after fitting our model on training data.

---

# Explaining predictions by terms

```r
predict(log_mod2, type = "terms")
```

```out
      s(n_acts) s(bal_crdt_ratio) s(avg_prem_balance) s(retail_crdt_ratio) s(avg_fin_balance) s(mortgage_age) s(cred_limit)
1     1.2115213      0.3327855673        -0.135920526         0.0678994892       -0.040572487   -0.2918390343    -0.3705562
2    -0.8850186     -0.4058818961        -0.135920526        -0.0075325272       -0.040572487   -0.0209184283     0.2229033
3     0.5693622      0.2972364048        -0.135920526         0.0678994892        0.156060412   -0.0209184283     0.2229033
4     0.8974704      0.3827671103        -0.135920526         0.0626482277        0.032042157   -0.0209184283     0.2229033
5     0.8974704     -0.0727464938        -0.135920526        -0.0686510698        0.065216680    0.2906502573     0.2229033
6    -0.6228781      0.1936974771        -0.135920526        -0.0075325272        0.776081676   -0.0209184283     0.2229033
7     0.3642246      0.3377181800        -0.135920526        -0.0075325272       -0.040572487    0.2849244308     0.2229033
8    -0.8850186     -0.4058818961        -0.135920526        -0.0075325272       -0.040572487   -0.0209184283     0.2229033
9     1.0209905      0.3604064595         0.317309246        -0.0253158695       -0.040572487    0.3551533139    -0.3230903
10    1.7675666     -0.4533384774         0.346837355         0.0377046376        0.150927175    0.1269458733    -0.5366686
```

Notes: In multiple regression, it is often useful to understand how each term contributes to an individual prediction. We can examine this by setting the type argument to "terms" in the predict() function.  This will produce a matrix showing the contribution of each smooth to each prediction.

If we were to sum across all the columns of this matrix, and add the intercept, we would have our overall prediction the log-odds scale.

---

# Explaining predictions by terms (2)

```r
predict(log_mod2, type = "terms")[1, ]
```

```out
           s(n_acts)    s(bal_crdt_ratio) 
          1.21152126           0.33278557 
 s(avg_prem_balance) s(retail_crdt_ratio) 
         -0.13592053           0.06789949 
  s(avg_fin_balance)      s(mortgage_age) 
         -0.04057249          -0.29183903 
       s(cred_limit) 
         -0.37055621 
```

```r
plogis(
  sum(predict(log_mod2, type = "terms")[1, ]) + coef(log_mod2)[1]
)
```
```out
[1] 0.29582 
```


Notes: Here we look at the first row of this output to see the role of each term in influencing our prediction probability.  This allows us to explain model predictions.  

For instance, as we can see for this one data point, the number of accounts has about four times the effect in increasing purchase probability prediction than balance-credit ratio.  Mortgage age and credit limit influence the prediction in the opposite direction, about the same amount as balance-credit ratio.

If we add these terms up, add the intercept, and transform using the plogis() function, we get this data point's predicted purchase probability.
---

# Let's practice!

Notes: Now let's make and interpret some predictions.























