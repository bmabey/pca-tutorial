# PCA for the uninitiated: Intuitive motivation via maximum variance interpretation

I gave this at [work](http://rebdrainlabs.com) to introduce people to PCA.  Basic linear algebra knowledge was assumed and code examples were given in R.  The presentation is available to view [here](http://benmabey.com/presenations/pca-tutorial).

The deck isn't completely standalone since I don't explain every step made as I did when actually presenting it.  That said I think the deck should be useful for anyone who wants to get a quick idea of what PCA is and the math behind it (I only take into account conventional PCA, not probabilistic interpretations).  I am inconsistent with some of my equations to make some of the algebra easier (all legal though!) which I explained during the actual presentation.  For people who want to go deeper and follow the math more closely I highly recommend the [tutorial by Jonathan Shlens](http://www.snl.salk.edu/~shlens/) which is where I got most of my derivations.

## References and Resources

1. Jon Shlens (versions 2.0 and 3.1), <cite>[Tutorial on Principal Component Analysis](http://www.snl.salk.edu/~shlens/)</cite>
1. H Abdi and L J Williams (2010), <cite>[Principal component analysis](http://www.universityoftexasatdallascomets.com/~herve/abdi-wireCS-PCA2010-inpress.pdf)</cite>
1. Andrew Ng (2009), <cite>[cs229 Lecture Notes 10](http://see.stanford.edu/materials/aimlcs229/cs229-notes10.pdf)</cite>
1. Andrew Ng (2009), <cite>[cs229 Lectures 14 & 15](http://see.stanford.edu/see/lecturelist.aspx?coll=348ca38a-3a6d-4052-937d-cb017338d7b1)</cite>
1. Christopher Bishop (2006), <cite>[Pattern Recognition and Machine Learning](http://research.microsoft.com/en-us/um/people/cmbishop/prml/)</cite>, section 12.1
1. Steve Pittard (2012), <cite>[Principal Components Analysis Using R](http://www.youtube.com/user/biorsph)</cite>
1. Quick-R, <cite>[Principal Components and Factor Analysis](http://www.statmethods.net/advstats/factor.html)</cite> (good pointers to additional R packages)
1. C Ding, X He (2004), <cite>[K-means Clustering via Principal Component Analysis](http://ranger.uta.edu/~chqding/papers/KmeansPCA1.pdf)</cite> 

## Thanks Slidify!

To create this deck I used the awesome [Slidify](http://ramnathv.github.com/slidify/) for R.  It was a pleasure to work with and made embedding my R code and graphs painless (via [knitr](http://yihui.name/knitr/)).