Recursion
========================================================
Write a recursive function to add up the numbers from n to zero.

```r
addNSeq <- function(n) {
    if (n < 2) {
        return(n)
    }
    return(n + addNSeq(n - 1))
}
```

Write a recursive function to add up all the numbers in a vector. Hint: to simplify, index the vector with [-1]

```r
addRecursively <- function(v) {
    if (length(v) == 1) {
        return(v)
    }
    return(v[1] + addRecursively(v[-1]))
}
```

TEST CASES

```r
addNSeq(10)
```

```
## [1] 55
```

```r
addRecursively(c(1, 2, 3, 4, 5))
```

```
## [1] 15
```

Looping Versions

```r
addNSeqLoop <- function(n) {
    sum <- 0
    for (k in 1:n) {
        sum <- sum + k
    }
    return(sum)
}
addNSeqLoop(10)
```

```
## [1] 55
```

```r
addLoop <- function(v) {
    sum <- 0
    for (k in 1:length(v)) {
        sum <- sum + v[k]
    }
    return(sum)
}
addLoop(c(1, 2, 3, 4, 5))
```

```
## [1] 15
```

## Natural Setttings for Recursion
Simple Riemann

```r
simpleRiemann <- function(f, a, b, n) {
    rectangleWidth = (b - a)/n
    midpoints <- seq(a + rectangleWidth/2, b - rectangleWidth/2, length = n)
    rectangleAreas <- sapply(midpoints, f) * rectangleWidth
    return(sum(rectangleAreas))
}
```

Modify Integrate Recursive

```r
integrateRecursive <- function(f, a, b, tolerance) {
    bigBins <- simpleRiemann(f, a = a, b = b, n = 5)
    smallBins <- simpleRiemann(f, a = a, b = b, n = 10)
    if (abs(bigBins - smallBins) < tolerance) 
        return(smallBins) else {
        mid <- (a + b)/2
        total <- integrateRecursive(f, a = a, b = mid) + integrateRecursive(f, 
            a = mid, b = b)
        return(total)
    }
}
```

## A better simple integrator
Gaussian Quadrature

```r
gaussQuadrature <- function(f, a = 0, b = 1) {
    z <- c(c(-1, 1) * sqrt((3 - 2 * sqrt(6/5))/7), c(-1, 1) * sqrt((3 + 2 * 
        sqrt(6/5))/7))
    w <- c(rep((18 + sqrt(30))/36, 2), rep((18 - sqrt(30))/36, 2))
    x <- ((b - a)/2) * z + (a + b)/2
    return(((b - a)/2) * sum(w * sapply(x, f)))
}
```


