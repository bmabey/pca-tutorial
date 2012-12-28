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

## The versatile PCA...

* Dimensionality Reduction Technique
* Preparing datasets by reducing noise
* Factor Analysis
* Data Exploration & Visualization
* Feature Extraction
* Regression (Orthogonal)
* Unsupervised Learning Algorithm
* K-Means Initializer
* Lossy Data Compression
* Computer Graphics (e.g. Bounded Volumes)
* and more!


--- &full_image local:sky.jpg source:www.flickr.com/photos/25797459@N06/5438799763/ text_class:white

## Full image...

--- 

## A change of basis

#  PX = Y

*** pnotes

- A *linear* transformation!  This is a big assumption.  
- What does the transformation boil down to?  
 - Rotation and scale.. so how does that help us?


--- .class #id 

## Slide 2

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




