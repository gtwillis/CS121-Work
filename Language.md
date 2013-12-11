Language
========================================================

```r
require(mosaic)
```

```
## Loading required package: mosaic Loading required package: grid Loading
## required package: lattice
## 
## Attaching package: 'mosaic'
## 
## The following objects are masked from 'package:stats':
## 
## binom.test, cor, cov, D, fivenum, IQR, median, prop.test, sd, t.test, var
## 
## The following object is masked from 'package:base':
## 
## max, mean, min, print, prod, range, sample, sum
```

```r
fetchData("COMP121/word-hints.R")
```

```
## Retrieving from http://www.mosaic-web.org/go/datasets/COMP121/word-hints.R
```

```
## [1] TRUE
```

1. letterProportion

```r
letterProportion <- function(string) {
    string <- tolower(string)
    string <- unlist(strsplit(string, split = NULL))
    proportions <- c()
    for (k in 1:26) {
        proportions <- c(proportions, ((sum(grepl(letters[k], string)))/length(string)))
    }
    
    return(as.table(proportions))
}
letterProportion("birdman")
```

```
##      A      B      C      D      E      F      G      H      I      J 
## 0.1429 0.1429 0.0000 0.1429 0.0000 0.0000 0.0000 0.0000 0.1429 0.0000 
##      K      L      M      N      O      P      Q      R      S      T 
## 0.0000 0.0000 0.1429 0.1429 0.0000 0.0000 0.0000 0.1429 0.0000 0.0000 
##      U      V      W      X      Y      Z 
## 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
```


I was unable to figure out how to coerce the data properly in the time provided. Please be merciful!
