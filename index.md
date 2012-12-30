---
title       : PCA for the uninitiated
subtitle    : Intuitive motivation via maximum variance interpretation
author      : Ben Mabey
job         : Programmer
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      #
widgets     : [mathjax]            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}

--- &twocol

## The versatile PCA

*** left
* Dimensionality Reduction
 * Data Visualization
 * Learn faster
 * Lossy Data Compression
* Noise Reduction
* Exploration
* Feature Extraction
* Regression (Orthogonal)

*** right

* Unsupervised Learning Algorithm
 * Anomaly Detection (not the best)
 * Matching/Distance (e.g. [Eigenfaces](http://en.wikipedia.org/wiki/Eigenface), [LSI](http://en.wikipedia.org/wiki/Latent_semantic_indexing))
* K-Means
* Computer Graphics (e.g. Bounded Volumes)
* and many more across various domains...

---

## Majority of PCA tutorials...

1. Organize dataset as matrix.
1. Subtract off the mean for each measurement.
1. Calculate the covariance matrix and perform eigendecomposition.
1. Profit!

---

## Majority of PCA tutorials...

1. Organize dataset as matrix.
1. Subtract off the mean for each measurement.
1. Calculate the <del>covariance</del> correlation matrix and perform eigendecomposition.
1. Profit!

---

## Majority of PCA tutorials...

1. Organize dataset as matrix.
1. Subtract off the mean for each measurement.
1. <del>Calculate the <del>covariance</del> correlation matrix and perform eigendecomposition.</del>
1. Perform SVD.
1. Profit!



--- &vcenter

<img style="height:600px;opacity:0.7;" src="assets/img/confused_gandalf.jpg"/>


---

## The intuitive <del>Magic</del> Math behind PCA
* **Maximize the variance.**
* Minimize the projection error.

--- &vcenter

<span style="font-size:500%">$P_{m\times m}X_{m\times n} = Y_{m\times n}$</span>

*** pnotes
- Its goal is to extract the important information from the data and to express this information as a set of new orthogonal variables called principal components.
- A *linear* transformation!  This is a big assumption.
- *Is there another basis, which is a linear combination of the original basis, that best re-expresses our data set?*
- This transformation will become the *principal components* of X.
- What does the transformation boil down to?
 - Rotation and scale.. so how does that help us?
 - What should our P be doing?
 - What do we want our Y do look like?


--- &full_image local:signal_noise.png source:http://www.squidoo.com/noise-sources-signal-noise-ratio-snr-and-a-look-at-them-in-the-frequency-domain text_class:white

*** pnotes

- Every dataset has noise and signal... How can we bring out the signal?


--- &vcenter

<span style="font-size:500%">$SNR = \frac{\sigma^2_{signal}}{\sigma^2_{noise}}$</span>


--- &full_image local:svn.png


--- &twocol

## Rotate to maximize variance

*** left

<img style="width:500px" src="assets/img/svn.png"/>


*** right

<img src="assets/img/snr_rotation.png"/>

--- &vcenter

<img style="height:600px" src="assets/img/redundancy.jpg"/>

---


```r
library(PerformanceAnalytics)
chart.Correlation(iris[-5], bg = iris$Species, pch = 21)
```

![plot of chunk pairs](figure/pairs.png) 



---


```r
chart.Correlation(decorrelated.iris, bg = iris$Species, pch = 21)
```

![plot of chunk decorrelated_pairs](figure/decorrelated_pairs.png) 


---
## Variance and Covariance Review
\(
   \DeclareMathOperator{\stddev}{stddev}
   \DeclareMathOperator{\var}{var}
   \DeclareMathOperator{\cov}{cov}
   \DeclareMathOperator{\corr}{corr}
\)

<div class="build">
<table>
<thead>
<th></th>
<th>Mathematically Useful</th>
<th style="text-align:center">Intuitive</th>
</thead>
<tr>
<td>Dispersion</td>
<td>$$\var(X) = E[(X - \mu_X)^2]$$</td>
<td>$$\sigma_X = \stddev(X) = \sqrt{\var(X)}$$</td>
</tr>
<tr>
<td>Relationship</td>
<td>$$\sigma_{XY} = \cov(X,Y) = E[(X - \mu_X)(Y - \mu_Y)]$$</td>
<td>$$\rho_{XY} = \frac{\sigma_{XY}}{\sigma_X\ \sigma_Y} = \frac{\cov(XY)}{\stddev(X) \stddev(Y)}$$ </td>
</tr>
</table>
<div> $$\cov(X,X) = \var(X)$$ </div>
<div> $\corr(X,Y)$ unitless intuitive measure $(-1.0..1.0)$</div>
</div>

---
## Correlation
$\rho = \corr(X,Y) = \frac{\sigma_{XY}}{\sigma_X \sigma_Y} = \frac{\cov(X,Y)}{\stddev(X)\stddev(Y)}$



```r
cor(iris[-5])
```

```
##              Sepal.Length Sepal.Width Petal.Length Petal.Width
## Sepal.Length       1.0000     -0.1176       0.8718      0.8179
## Sepal.Width       -0.1176      1.0000      -0.4284     -0.3661
## Petal.Length       0.8718     -0.4284       1.0000      0.9629
## Petal.Width        0.8179     -0.3661       0.9629      1.0000
```


---
## References and Resources
1. Jon Shlens (version 2.0, and 3.0), <cite>[Tutorial on Principal Component Analysis](http://www.snl.salk.edu/~shlens/)</cite>
1. H Abdi and L J Williams (2010), <cite>[Principal component analysis](http://www.universityoftexasatdallascomets.com/~herve/abdi-wireCS-PCA2010-inpress.pdf)</cite>
1. Andrew Ng (2009), <cite>[cs229 Lecture Notes 10](http://see.stanford.edu/materials/aimlcs229/cs229-notes10.pdf)</cite>
1. Andrew Ng (2009), <cite>[cs229 Lectures 14 & 15](http://see.stanford.edu/see/lecturelist.aspx?coll=348ca38a-3a6d-4052-937d-cb017338d7b1)</cite>
1. Christopher Bishop (2006), <cite>[Pattern Recognition and Machine Learning](http://research.microsoft.com/en-us/um/people/cmbishop/prml/)</cite>, section 12.1
1. Steve Pittard (2012), <cite>[Principal Components Analysis Using R](http://www.youtube.com/user/biorsph)</cite>
1. Quick-R, <cite>[Principal Components and Factor Analysis](http://www.statmethods.net/advstats/factor.html)</cite> (good pointers to additional R packages)
1. C Ding, X He (2004), <cite>[K-means Clustering via Principal Component Analysis](http://ranger.uta.edu/~chqding/papers/KmeansPCA1.pdf)</cite>

--- .class #id

## Slide with LaTeX

\(\begin{align*}
&\begin{bmatrix}
\mathbf{y}\\
y_*
\end{bmatrix}
=\mathcal{N}\left(0,\begin{bmatrix}
K & K_*\\
K_*^T & K_{**}
\end{bmatrix}\right)\\
\Longrightarrow & y_*|\mathbf{y}\sim\mathcal{N}\left(K_*K^{-1}\mathbf{y},K_{**}-K_*K^{-1}K_*^T\right)\\
\Longrightarrow & \overline{y_*}=K_*K^{-1}\mathbf{y}
\end{align*}\)


---

## Experimenting with speech bubbles...

<blockquote class="oval-speech">
<p>This is a blockquote that is styled to look like a speech bubble</p>
</blockquote>

<blockquote class="rectangle-speech-border">
<p>This is a blockquote that is styled to look like a speech bubble</p>
</blockquote>

<blockquote class="oval-speech-border">
<p>This is a blockquote that is styled to look like a speech bubble</p>
</blockquote>

<blockquote class="oval-thought-border">
<p>This is a blockquote that is styled to look like a thought bubble</p>
</blockquote>
