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
---

## The versatile PCA

* Dimensionality Reduction
* Noise Reduction
* Factor Analysis
* Data Exploration & Visualization
* Feature Extraction
* Regression (Orthogonal)
* Unsupervised Learning Algorithm
* K-Means Initializer
* Lossy Data Compression
* Computer Graphics (e.g. Bounded Volumes)
* and more!

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
1. Calculate the <strike>covariance</strike> correlation matrix and perform eigendecomposition.
1. Profit!

---

## Majority of PCA tutorials...

1. Organize dataset as matrix.
1. Subtract off the mean for each measurement.
1. <strike>Calculate the <strike>covariance</strike> correlation matrix and perform eigendecomposition.</strike>
1. Perform SVD.
1. Profit!



--- &vcenter

<img style="height:600px" src="assets/img/confused_gandalf.jpg"/>


---

## The intuitive <strike>Magic</strike> Math behind PCA
* **Maximize the variance.**
* Minimize the projection error.

--- &vcenter

<span style="font-size:500%">$P_{m\times m}X_{m\times n} = Y_{m\times n}$</span>

*** pnotes

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
## Covariance
\(
   \DeclareMathOperator{\stddev}{stddev}
   \DeclareMathOperator{\var}{var}
   \DeclareMathOperator{\cov}{cov}
   \DeclareMathOperator{\corr}{corr}
\)
$\var(X) = E[(X - \mu_X)^2]$

$\sigma_{XY} = \cov(X,Y) = E[(X - \mu_X)(Y - \mu_Y)]$

```r
cov(iris[-5])
```

```
##              Sepal.Length Sepal.Width Petal.Length Petal.Width
## Sepal.Length      0.68569    -0.04243       1.2743      0.5163
## Sepal.Width      -0.04243     0.18998      -0.3297     -0.1216
## Petal.Length      1.27432    -0.32966       3.1163      1.2956
## Petal.Width       0.51627    -0.12164       1.2956      0.5810
```


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
