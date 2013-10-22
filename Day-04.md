Functions and Graphics
========================================================

## Sums of numbers

### How many are odd


```r
countOdds <- function(x) {
    sum(x%%2)
}
```


### How many are even


```r
countEvens <- function(x) {
    sum((x + 1)%%2)
}
```

## Triangles

### Pythagoras


```r
hypotenuseLength <- function(a, b) {
    sqrt((a^2) + (b^2))
}
```


### Law of Cosines


```r
lawOfCosines <- function(a, b, theta) {
    sqrt((a^2) + (b^2) - 2 * a * b * cos(theta))
}
```


### Find the angle


```r
thetaFromLengths <- function(a, b, c) {
    acos(((a^2) + (b^2) - (c^2))/(2 * a * b))
}
```


### Test thetaFromLengths()


```r
thetaFromLengthsTest <- function(a, b, theta) {
    thetaFromLengths(a, b, lawOfCosines(a, b, theta)) - theta
}
```


## Graphics

### Function: canvas()


```r
canvas <- function(x, y, ...) {
    plot(x, y, type = "n", axes = FALSE, ann = FALSE, xlim = c(0, x), ylim = c(0, 
        y))
}
```


### Function: drawCircle()


```r
drawCircle <- function(x, y, r) {
    angs = seq(0, 2 * (pi), length = 1000)
    xpts <- x + r * cos(angs)
    ypts <- y + r * sin(angs)
    polygon(xpts, ypts, border = NULL)
}
```


### Function: modify drawCircle()


```r
drawCircle <- function(x, y, r, ...) {
    angs = seq(0, 2 * (pi), length = 1000)
    xpts <- x + r * cos(angs)
    ypts <- y + r * sin(angs)
    polygon(xpts, ypts, ...)
}
```


### Draw overlapping circles


```r
canvas(100, 100, asp = 1)
drawCircle(20, 50, 15)
drawCircle(30, 40, 15)
drawCircle(40, 50, 15)
drawCircle(50, 40, 15)
drawCircle(60, 50, 15)
```

![plot of chunk unnamed-chunk-10](figure/unnamed-chunk-10.png) 


### Draw the Olympic logo


```r
canvas(100, 100, asp = 1)
drawCircle(20, 50, 9, border = "blue", lwd = 10)
drawCircle(30, 40, 9, border = "yellow", lwd = 10)
drawCircle(40, 50, 9, lwd = 10)
drawCircle(50, 40, 9, border = "green", lwd = 10)
drawCircle(60, 50, 9, border = "red", lwd = 10)
```

![plot of chunk unnamed-chunk-11](figure/unnamed-chunk-11.png) 

