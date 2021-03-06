Substitution Cypher
========================================================
## Step 1, the Key
develop a function that transforms letters into numbers

```r
key <- function(word) {
    output <- gsub("a", "01", word)
    output <- gsub("b", "02", output)
    output <- gsub("c", "03", output)
    output <- gsub("d", "04", output)
    output <- gsub("e", "05", output)
    output <- gsub("f", "06", output)
    output <- gsub("g", "07", output)
    output <- gsub("h", "08", output)
    output <- gsub("i", "09", output)
    output <- gsub("j", "10", output)
    output <- gsub("k", "11", output)
    output <- gsub("l", "12", output)
    output <- gsub("m", "13", output)
    output <- gsub("n", "14", output)
    output <- gsub("o", "15", output)
    output <- gsub("p", "16", output)
    output <- gsub("q", "17", output)
    output <- gsub("r", "18", output)
    output <- gsub("s", "19", output)
    output <- gsub("t", "20", output)
    output <- gsub("u", "21", output)
    output <- gsub("v", "22", output)
    output <- gsub("w", "23", output)
    output <- gsub("x", "24", output)
    output <- gsub("y", "25", output)
    output <- gsub("z", "26", output)
    return(as.double(output))
}
```


```r
key("zoo")
```

```
## [1] 261515
```

## Step 2, the Cypher

```r
cypher <- function(word) {
    set.seed(key(word))
    from <- c(letters, LETTERS, ".", ",", "!", "?", ":", ";")
    to <- sample(from)
    return(to)
}
```

## Step 3, Encryption

```r

encrypt <- function(word) {
    old <- paste(c(letters, LETTERS, ".", ",", "!", "?", ":", ";"), collapse = "")
    new <- paste(cypher("zoo"), collapse = "")
    output <- chartr(old, new, word)
    return(output)
}
```


```r
encrypt("zoo")
```

```
## [1] "Ree"
```

## Step 4, Decryption

```r
decrypt <- function(word) {
    old <- paste(c(letters, LETTERS, ".", ",", "!", "?", ":", ";"), collapse = "")
    new <- paste(cypher("zoo"), collapse = "")
    output <- chartr(new, old, word)
    return(output)
}
```


```r
decrypt("Ree")
```

```
## [1] "zoo"
```

