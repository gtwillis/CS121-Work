Interacting with Loops
========================================================

## Looping a launch.

Non-loop


```r
# this function has a prescribed time for count down
blastoff <- function() {
    cat("1\n")
    Sys.sleep(1)
    cat("2\n")
    Sys.sleep(1)
    cat("3\n")
    Sys.sleep(1)
    cat("4\n")
    Sys.sleep(1)
    cat("5\n")
    Sys.sleep(1)
    cat("Blastoff!")
}
blastoff()
```

```
## 1
## 2
## 3
## 4
## 5
## Blastoff!
```

For loop

```r
blastoffFor <- function(time) {
    for (k in 1:time) {
        cat(paste(k, "\n"))
        Sys.sleep(1)
    }
    cat("Blastoff!")
}
blastoffFor(5)
```

```
## 1 
## 2 
## 3 
## 4 
## 5 
## Blastoff!
```

While loop

```r
blastoffWhile <- function(time) {
    res <- time
    while (res > 0) {
        cat(paste((time - res + 1), "\n"))
        res <- (res - 1)
        Sys.sleep(1)
    }
    cat("Blastoff!")
}
blastoffWhile(5)
```

```
## 1 
## 2 
## 3 
## 4 
## 5 
## Blastoff!
```

Repeat loop

```r
blastoffRepeat <- function(time) {
    res <- time
    repeat {
        cat(paste((time - res + 1), "\n"))
        res <- (res - 1)
        Sys.sleep(1)
        if (res == 0) 
            break
    }
    cat("Blastoff!")
}
blastoffRepeat(5)
```

```
## 1 
## 2 
## 3 
## 4 
## 5 
## Blastoff!
```


## Testing Human Response Times

```r
testLatency <- function(x) {
    delayTimes <- rexp(x, rate = 1/2)
    responseTimes <- c()
    readline("Ready?")
    for (k in 1:x) {
        cat(rep("\n", 20))
        Sys.sleep(delayTimes[k])
        startTime <- Sys.time()
        readline("Press Return")
        response <- Sys.time()
        responseTimes <- c(responseTimes, as.numeric(response - startTime))
    }
    return(list(delayTimes, responseTimes))
}
```


```r
load("GeoffData.RData")
plot(x = GeoffData[[1]], y = GeoffData[[2]], xlab = "pause time", ylab = "latency")
```

![plot of chunk unnamed-chunk-6](figure/unnamed-chunk-6.png) 

