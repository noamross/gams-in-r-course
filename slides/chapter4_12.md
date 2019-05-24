---
type: slides
---

# Doing more with GAMs

Noam Ross
Senior Research Scientist, EcoHealth Alliance

Notes: Congratulations!  You've have successfully completed this course on Generalized Additive Models.  Let's quickly review what you've learned, and point you towards a few resources for you to use as you apply these models in your future work.

---

# Course review

**Chapter 1**

- GAM theory
- Fitting GAMs
- Mixing linear and nonlinear terms

**Chapter 2**

- Interpreting GAMs
- Visualizing GAMs
- Model-checking and concurvity

Notes: In the first chapter of the course, you learned the basic theory of how smooths are constructed and how to assemble GAMs from multiple smooths and linear terms.  In chapter two, you learned how to interpret GAM model outputs, plot partial effects to check your models for problems and how to fix them. 

---

# Course review

**Chapter 3**

- 2-D Interactions and spatial data
- Interactions with different scales
- Continuous-categorical interaction

**Chapter 4**

- Logistic GAMs
- Plotting logistic outputs
- Making predictions

Notes: Then, in chapter three, you expanded to building and visualizing GAMs with interactions of multiple variables, including geospatial GAMs and GAMs with continuous-categorical interactions.  Finally, in chapter 4, you learned how to use logistic GAMs for binary classification and prediction.  Altogether, you've created a toolbox for using GAMs to model many different types of data and problems.

Now I'll point you to a few more resources for using GAMs in your work.

---

# GAMs and the Tidyverse

```r
library(broom)

augment(gam_model)
tidy(gam_model)
glance(gam_model)
```

```r
library(caret)

train(x, y, method = "gam", ...)
```

Notes: In this course we did not make use of tools from the popular set of R packages known as the tidyverse, but GAMs work readily with tidy tools.

If you are familiar with the broom package, you'll know of general functions like augment(), tidy(), and glance().  All these functions work well with GAMs, giving you tidy ways of inspecting, evaluating, and predicting from your models.

Similarly, if you use the caret package for predictive modeling, you can pass "gam" to the method argument and caret will fit models with the mgcv package.

---

# Other types of smooths

```r
?smooth.terms
```

Notes: As you continue to use GAMs, you'll discover mgcv has many additional capabilities.  The package also has many extended help files on specific topics that will be useful to explore.

First, there are many additional types of smooths beyond the ones we have used here.  These can be useful in specific situations, such as geospatial modeling or for seasonal time series.  You'll find these described in the ?smooth.terms help file.

---

# Other types of outcomes/distributions

```r
?family.mgcv
```
See [Generalized Linear Models](https://www.datacamp.com/courses/generalized-linear-models-in-r)


Notes: If you have taken a course in generalized linear models, you probably know that there are many types of outcomes, such as count data, which they can model. These can be fit with GAMs, as well. mgcv also has an extensive collection of outcome distributions above and beyond those available in most GLM packages. You'll find them described in the ?family.mgcv help file.  If you have not taken it already, you may want to consider DataCamp's Generalized Linear Models course.

---
# Variable selection

```r
?gam.selection
```

Notes: mgcv has tools for variable selection when model building.  You can learn about these in the ?gam.selection help file.

---

# Complex model structures

```r
?gam.models
``` 

See [Hierarchical and Mixed Effects Models](https://www.datacamp.com/courses/hierarchical-and-mixed-effects-models)

Notes: Finally, there are other options in mgcv for alternative or more complex model structures, such as mixed effects. The ?gam.models help file has an overview of these topics and will point you to more documentation.  If you are interested in these more complex models, the course on Hierarchical and Mixed Effects Models here on DataCamp may be of interest to you.

---

#  Thank You!

Notes: Thanks for taking this course on nonlinear modeling in R with GAMs. I hope you make good use of these flexible modeling tools in your Data Science journey.

