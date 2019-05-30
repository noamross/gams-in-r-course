---
title: 'Reference and Resources'
description: 'Here are scripts to re-use and links to additional references and topics to learn.'
prev: /chapter4
next: /chapter1
type: chapter
id: 5
---

<exercise id="1" title="Reference Scripts" type="reference">

In these reference scripts you will find all code from the exercises in this course, with redundant
set-up code removed.  You may find these helpful in adapting the models you fit in this course to your work.

- [Chapter 1](https://github.com/noamross/gams-in-r-course/blob/master/reference/gams_in_r_code_ch1.R)
- [Chapter 2](https://github.com/noamross/gams-in-r-course/blob/master/reference/gams_in_r_code_ch2.R)
- [Chapter 3](https://github.com/noamross/gams-in-r-course/blob/master/reference/gams_in_r_code_ch3.R)
- [Chapter 4](https://github.com/noamross/gams-in-r-course/blob/master/reference/gams_in_r_code_ch4.R)

</exercise>

<exercise id="2" title="Links and Resources" type="reference">

If you want to continue to use and learn about GAMs, here are a number of other resources:

-  [Slides](https://github.com/noamross/gam-resources/blob/master/2017-11-14-noamross-gams-nyhackr.pdf) and [Video (~80 minutes)](https://www.youtube.com/watch?v=q4_t8jXcQgc) from my talk at the [New York Open Statistical Meetup](https://www.meetup.com/nyhackr/) provide a high-level introduction of many things that GAMs and **mgcv** can do.
-  Materials from a [2018 Ecological Society of America workshop on GAMs](https://noamross.github.io/mgcv-esa-2018/), by Eric Pedersen, David L. Miller, Gavin Simpson, and myself.  These are designed for an interactive workshop but may still be useful for self-teaching. The target audience for these materials is graduate students with a some statistical training; knowledge of GLMs is a prerequisite. There is more material on statistical inference, theory and the more exotic outcome distributions. See the [references page](https://noamross.github.io/mgcv-esa-2018/links_and_bibliography.html) in particular for papers from the statistical literature.
-  The essential GAMs reference is Simon Wood's [Generalized Additive Models in R](https://www.crcpress.com/Generalized-Additive-Models-An-Introduction-with-R-Second-Edition/Wood/p/book/9781498728331).  
-  [An online book](https://m-clark.github.io/generalized-additive-models/) by Michael Clark gives a very nice short introduction to both GAM theory and use in R if you want an alternative approach from this course.
-  On, Gavin Simpsons' excellent, [GAM-centric blog](https://www.fromthebottomoftheheap.net/), he tries out new and little-used GAM formulations.
-  [StackOverflow](https://stackoverflow.com/questions/tagged/mgcv) and [Cross Validated](https://stats.stackexchange.com/questions/tagged/mgcv) have tags for `mgcv`.
-  [A post by Kim Larsen's GAMs on the Stitchfix Blog](http://multithreaded.stitchfix.com/blog/2015/07/30/gam/) explains GAMs and compares them to other methods for classification.
-  The [**gratia**](https://github.com/gavinsimpson/gratia) package by Gavin Simpson a provides **ggplot2** plotting methods for GAMs and other useful and tidy helper functions, such as ones calculating spline derivatives and simulating from model posteriors.  Here's a [blog post](https://www.fromthebottomoftheheap.net/2018/10/23/introducing-gratia/) introducing it.
-  [Hierarchical Generalized Additive Models: an introduction with mgcv](https://peerj.com/articles/6876/) by Eric J. Pedersen, David L. Miller, Gavin Simpson, and Noam Ross, goes into detail on fitting GAMs with heirarchical/mixed structures.  There's a GitHub repo with all the code [here](https://github.com/noamross/mixed-effect-gams).
-  [Modelling palaeoecological time series using generalized additive models](https://www.biorxiv.org/content/early/2018/05/15/322248), by Gavin L. Simpson, is useful if you are interested in time-series applications.
- [Bayesian views of generalized additive modelling](https://arxiv.org/abs/1902.01330) is a brief but useful write-up on Bayesian approaches and interpretations of GAMs by David L. Miller.
- [Generalised additive mixed models for dynamic analysis in linguistics: a practical introduction](https://arxiv.org/abs/1703.05339) by [Márton Sóskuthy](https://twitter.com/msoskuthy).
- [Simplified Integrated Nested Laplace Approximation](https://people.maths.bris.ac.uk/~sw15190/ginlane.pdf) by Simon N. Wood, details the `ginla()` function added in **mgcv** 1.8-27.

</exercise>


