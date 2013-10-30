Numbers and Strings
========================================================

## Basic Statistics


```r
outlier <- function(x) {
    result <- c()
    lowerLim <- as.numeric(quantile(x, probs = 0.25))
    upperLim <- as.numeric(quantile(x, probs = 0.75))
    for (k in 1:length(x)) {
        if (lowerLim <= x[k] & upperLim >= x[k]) {
            result <- c(result, TRUE)
        } else {
            result <- c(result, FALSE)
        }
    }
    return(result)
}
```


## Numbers and Languages

```r
digitToWords <- function(numbers, words) {
    result <- c()
    for (k in 1:length(numbers)) {
        outputWord <- words[numbers[k]]
        result <- c(result, outputWord)
    }
    return(result)
}
```


```r
digitToWords(c(3, 4, 2, 1, 5), c("domus", "virum", "confutatis", "magnificat", 
    "requiem"))
```

```
## [1] "confutatis" "magnificat" "virum"      "domus"      "requiem"
```


## Help for Crossword Puzzles

```r
lettersMatch <- function(words, pattern) {
    template <- grepl(pattern, words)
    result <- c()
    for (k in 1:length(words)) {
        if (template[k] == TRUE) {
            result <- c(result, words[k])
        }
    }
    return(result)
}
```


```r
lettersMatch(c("one", "two", "three", "four", "five", "six"), "f")
```

```
## [1] "four" "five"
```


## Have your π two ways
### One way: A Series

```r
piSeries <- function(n) {
    result <- c()
    for (k in 1:n) {
        res <- (((-1)^(k + 1))/(-1 + 2 * k))
        result <- sum(result, res)
    }
    return(4 * result)
}
```


```r
howCloseToPi <- function(n) {
    yValues <- function(n) {
        vector <- c()
        for (k in 1:n) {
            vector <- c(vector, (piSeries(k) - pi))
        }
        return(vector)
    }
    x <- (1:n)
    y <- yValues(n)
    plot(x, y, ylab = "divergence from pi", xlab = "n")
    
}
```


How close?


```r
howCloseToPi(100)
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8.png) 


Accuracy to 3 digits?


```r
yValues <- function(n) {
    vector <- c()
    for (k in 1:n) {
        vector <- c(vector, (piSeries(k)))
    }
    return(vector)
}
```


```r
yValues(200)
```

```
##   [1] 4.000 2.667 3.467 2.895 3.340 2.976 3.284 3.017 3.252 3.042 3.232
##  [12] 3.058 3.218 3.070 3.208 3.079 3.200 3.086 3.194 3.092 3.189 3.096
##  [23] 3.185 3.100 3.182 3.103 3.179 3.106 3.176 3.108 3.174 3.110 3.172
##  [34] 3.112 3.170 3.114 3.169 3.115 3.167 3.117 3.166 3.118 3.165 3.119
##  [45] 3.164 3.120 3.163 3.121 3.162 3.122 3.161 3.122 3.160 3.123 3.160
##  [56] 3.124 3.159 3.124 3.159 3.125 3.158 3.125 3.157 3.126 3.157 3.126
##  [67] 3.157 3.127 3.156 3.127 3.156 3.128 3.155 3.128 3.155 3.128 3.155
##  [78] 3.129 3.154 3.129 3.154 3.129 3.154 3.130 3.153 3.130 3.153 3.130
##  [89] 3.153 3.130 3.153 3.131 3.152 3.131 3.152 3.131 3.152 3.131 3.152
## [100] 3.132 3.151 3.132 3.151 3.132 3.151 3.132 3.151 3.132 3.151 3.133
## [111] 3.151 3.133 3.150 3.133 3.150 3.133 3.150 3.133 3.150 3.133 3.150
## [122] 3.133 3.150 3.134 3.150 3.134 3.149 3.134 3.149 3.134 3.149 3.134
## [133] 3.149 3.134 3.149 3.134 3.149 3.134 3.149 3.134 3.149 3.135 3.149
## [144] 3.135 3.148 3.135 3.148 3.135 3.148 3.135 3.148 3.135 3.148 3.135
## [155] 3.148 3.135 3.148 3.135 3.148 3.135 3.148 3.135 3.148 3.135 3.148
## [166] 3.136 3.148 3.136 3.148 3.136 3.147 3.136 3.147 3.136 3.147 3.136
## [177] 3.147 3.136 3.147 3.136 3.147 3.136 3.147 3.136 3.147 3.136 3.147
## [188] 3.136 3.147 3.136 3.147 3.136 3.147 3.136 3.147 3.136 3.147 3.137
## [199] 3.147 3.137
```

```r
# n=127
```

Accuracy to 15 digits would probably require a value of n on the order of 10^5
### Another way:A "Monte Carlo" Method

```r
randomApproxToPi <- function(n) {
    x <- runif(n)
    y <- runif(n)
    bank <- c()
    for (k in 1:n) {
        if (((x[k])^2 + (y[k])^2) < 1) {
            bank <- sum(bank, 1)
        }
    }
    return(4 * bank/n)
}
```


How close?


```r
x <- 10^runif(100, min = 2, max = 6)
y <- sapply(x, randomApproxToPi)
plot(x, y, pch = 20, col = rgb(0, 0, 0, 0.4), log = "x", ylab = "Approx to pi", 
    xlab = "n")
```

![plot of chunk unnamed-chunk-12](figure/unnamed-chunk-12.png) 


