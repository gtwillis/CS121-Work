Indexing, Cropping and Extending Images
========================================================


```r
# Packages
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
require(COMP121)
```

```
## Loading required package: COMP121 Loading required package: jpeg Loading
## required package: png Loading required package: RCurl Loading required
## package: bitops Loading required package: markdown
```

```r
puppy <- readPNG(getURLContent("http://dtkaplan.github.io/ScientificComputing/Resources/Images/mindo.png"))
canvas(x = c(1, 216), y = c(1, 198), asp = 1)
rasterImage(puppy, 1, 1, 216, 198)
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-1.png) 


Mindo's face

```r
puppy <- puppy[1:110, 80:216, ]
canvas(x = c(1, 216), y = c(1, 198), asp = 1)
rasterImage(puppy, 1, 1, 216, 198)
```

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2.png) 


Mindo's left front paw

```r
puppy <- readPNG(getURLContent("http://dtkaplan.github.io/ScientificComputing/Resources/Images/mindo.png"))
puppy <- puppy[160:198, 1:80, ]
canvas(x = c(1, 216), y = c(1, 198), asp = 1)
rasterImage(puppy, 1, 1, 216, 198)
```

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-3.png) 

Octagonal Dog-tag

```r
puppy <- readPNG(getURLContent("http://dtkaplan.github.io/ScientificComputing/Resources/Images/mindo.png"))
puppy <- puppy[110:140, 95:120, ]
canvas(x = c(1, 216), y = c(1, 198), asp = 1)
rasterImage(puppy, 1, 1, 216, 198)
```

![plot of chunk unnamed-chunk-4](figure/unnamed-chunk-4.png) 


## Framing Task
Can't seem to get this to work yet...

```r
puppy <- readPNG(getURLContent("http://dtkaplan.github.io/ScientificComputing/Resources/Images/mindo.png"))
red <- puppy[, , 1]
```


```r
framedImage <- function(image, frameWidth, mirror, light) {
    if (mirror == FALSE) {
        framed <- cbind(image[1:frameWidth, 1:frameWidth], red, red[(ncol(image) - 
            frameWidth):ncol(image), (nrow(image) - frameWidth):nro(image)])
    } else {
        framed <- cbind(image[frameWidth:1, frameWidth:1], red, red[ncol(image):(ncol(image) - 
            frameWidth), nrow(image):(nrow(image) - frameWidth)])
    }
    if (light != NA) {
        framed <- light * framed
    }
    canvas(x = c(1, nrow(framed)), y = c(1, ncol(framed)), asp = 1)
    return(rasterImage(framed, 1, 1, nrow(framed), ncol(framed)))
}
framedImage(red, 25, mirror = TRUE, light = 1)
```

```
## Error: subscript out of bounds
```

