---
type: slides
---

# Plotting GAM interactions

Noam Ross
Senior Research Scientist, EcoHealth Alliance

Notes: Interactions in GAMs are powerful tools for modeling complex or spatial data.  However, their complexity makes them challenging to understand.  Visualizing interactions helps us unlock understanding of these complexities. In this lesson we will learn mgcv's tools for visualizing interactions in two and three dimensions.

---

# Using mgcv's `plot()` command with interactions.

```r
plot(mod_2d)
```
![](https://github.com/flor14/gams-in-r-course/blob/master/images/contourA-1.png?raw=true)

Notes: In mgcv's plot() command,  interactions are represented with contour plots.  A single plot represents both variables and their interaction. In this plot the axes represent values of our predictor variables, x1 and x2.  The interior is a topographic map of predicted values.  The contour lines represent points of equal predicted values, and they are labeled.  The dotted lines show uncertainty in prediction; they represent how contour lines would move if predictions were one standard error higher or lower.

---

# Using mgcv's `plot()` with interactions

```r
plot(mod_2d, scheme = 1)
```
![](https://github.com/flor14/gams-in-r-course/blob/master/images/contourB-1.png?raw=true)


Notes: A contour plot is not always the most intuitive way of plotting interactions, so mgcv has a couple of more options.  Setting the scheme parameter in the plot function to 1, we get a 3D perspective plot instead.

---

# Using mgcv's `plot()` with interactions

```r
plot(mod_2d, scheme = 2)
```
![](https://github.com/flor14/gams-in-r-course/blob/master/images/contourC-1.png?raw=true)

Notes: Setting scheme to 2 generates a heat map. This is a simplified contour map on top of which colors are added.  The yellow colors represent larger predictions and the red colors smaller ones.

---

# Customizing interaction plots with `vis.gam()`

```r
vis.gam(x,
        view = NULL,
        cond = list(),
        n.grid = 30,
        too.far = 0,
        col = NA,
        color = "heat",
        contour.col = NULL,
        se = -1,
        type = "link",
        plot.type = "persp",
        zlim = NULL,
        nCol = 50,
        ...)
```

Notes: These pre-defined schemes are a nice way to view your model interactions quickly.  However, we often want to customize these plots.  For this, we can use mgcv's vis.gam().  vis.gam() has MANY options. We will focus on a few important ones.

---

# Customizing interaction plots with `vis.gam()`

```r
vis.gam(x = mod,                # GAM object
        view = c("x1", "x2"),   # variables
        plot.type = "persp")    # kind of plot 
```

![](https://github.com/flor14/gams-in-r-course/blob/master/images/twoperspB-1.png?raw=true)


Notes: The first argument to vis.gam(), x, is the GAM model.  The second, view, is where you list which variables in the model you want to visualize jointly.  

Setting the plot.type argument to "persp" will produce a 3D perspective plot as shown here.

In this case, x1 and x2 are interacting variables, but they do not need to be.  You can view a perspective plot of any two variables in the model to see their combined effects.


---

# Customizing interaction plots with `vis.gam()` (2)

```r
vis.gam(x = mod,                # GAM object
        view = c("x1", "x2"),   # variables
        plot.type = "contour")  # kind of plot 
```

![](https://github.com/flor14/gams-in-r-course/blob/master/images/twoperspB-2.png?raw=true)

Notes: Or you can set plot.type to "contour", which will produce a contour plot or heat map.

---

# Customizing interaction plots with `vis.gam()`

```r
vis.gam(mod, view = c("x1", "x2"), plot.type = "contour", too.far = 0.1)
vis.gam(mod, view = c("x1", "x2"), plot.type = "contour", too.far = 0.05)
```

![](https://github.com/flor14/gams-in-r-course/blob/master/images/toofar2-1.png?raw=true)

Notes: The too.far argument is an important one in using these plots to inspect your model.  too.far indicates what predictions should not be plotted because they are too far from the actual data.  In other words, how far is too far to extrapolate? Setting this value lets you see what combinations of variables are not represented in your data and therefore might not yield good predictions in your model.   

too.far is scaled from zero to one along the range of the variables.  Here, we set it at 0.1 for the left plot and 0.05 on the right. On the left, 10% extrapolation fills in most of the surface. On the right, 5% extrapolation shows more areas not supported by data.

---

# Options for perspective plots

```{r}
vis.gam(x = mod, view = c("x1", "x2"), 
        plot.type = "persp", se = 2)          
```
![](https://github.com/flor14/gams-in-r-course/blob/master/images/se-1.png?raw=true)

Notes: For perspective plots, one can display confidence intervals of the predictions with the "se" argument.  se takes a number which is the number of standard errors away from the average prediction to plot high- and low-prediction surfaces.

---

# Options for perspective plots

```{r}
vis.gam(g, view = c("x1", "x2"), plot.type = "persp", theta = 220)
vis.gam(g, view = c("x1", "x2"), plot.type = "persp", phi = 55)
vis.gam(g, view = c("x1", "x2"), plot.type = "persp", r = 0.1)
```

![](https://github.com/flor14/gams-in-r-course/blob/master/images/persp3d-1.png?raw=true)

Notes: You can also control the rotation angle of your perspective plots.  The theta parameter controls horizontal rotation, the phi parameter controls vertical rotation, and the r parameter controls how zoomed in the plot is.  Plots with low r values have lots of distortion or parallax, while plots with high r values have little sense of perspective.

---

# Options for contour plots

```{r}
vis.gam(g, view = c("x1", "x2"), plot.type = "contour", color = "gray")
vis.gam(g, view = c("x1", "x2"), plot.type = "contour", contour.col = "blue")
vis.gam(g, view = c("x1", "x2"), plot.type = "contour", nlevels = 20)
```
![](https://github.com/flor14/gams-in-r-course/blob/master/images/contouropts-1.png?raw=true)

Notes: When making contour plots, color and contrast are important for clarity.  Three important additional options for contours shown here are the color parameter, which selects the background color palette, the contour.col parameter, which selects the color of lines, and the nlevels option, which lets you control the number of contour lines - important for showing details and subtleties of interactions.

---

# Now let's make some plots!

Notes: Now let's make some plots!










