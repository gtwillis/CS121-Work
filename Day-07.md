Crosswords, Scabble, and Regular Expressions
========================================================


```r
# Load word bank
words <- readLines(url("http://dtkaplan.github.io/ScientificComputing/Syllabus/Daily/Day-07/word_list_moby_crossword-flat/word_list_moby_crossword.flat.txt"))
```


### Summarizing the List

The number of words of length 1, of length 2, of length 3, etc...

```r
# number of words of length 1
length(grep("^.$", words))
```

```
## [1] 0
```

```r
# number of words of length 2
length(grep("^..$", words))
```

```
## [1] 85
```

```r
# number of words of length 3
length(grep("^...$", words))
```

```
## [1] 908
```

The 100 longest words.

```r
longestWords <- function(n, bank) {
    pattern <- "^..$"
    repeat {
        bank <- grep(pattern, bank, value = TRUE, invert = TRUE)
        pattern <- sub("^.", "^.", pattern)
        if (length(bank) < n) {
            for (k in 1:(n - (length(bank)))) {
                secondBank <- grep(pattern, words, value = TRUE)
                bank <- c(bank, secondBank[k])
            }
        }
        if (length(bank) == n) 
            break
    }
    return(bank)
}
```


```r
longestWords(100, words)
```

```
##   [1] "absentmindednesses"    "adventitiousnesses"   
##   [3] "antiadministration"    "anticonservationist"  
##   [5] "antidiscrimination"    "apprehensivenesses"   
##   [7] "biodegradabilities"    "bloodthirstinesses"   
##   [9] "cantankerousnesses"    "characteristically"   
##  [11] "chemotherapeutical"    "comprehensivenesses"  
##  [13] "counteraccusations"    "counteraggressions"   
##  [15] "counterdemonstration"  "counterdemonstrations"
##  [17] "counterdemonstrator"   "counterdemonstrators" 
##  [19] "counterinflationary"   "counterpropagation"   
##  [21] "counterpropagations"   "counterretaliation"   
##  [23] "counterretaliations"   "counterrevolutions"   
##  [25] "countersuggestions"    "disinterestednesses"  
##  [27] "electrocardiograms"    "electrocardiograph"   
##  [29] "electrocardiographs"   "extraconstitutional"  
##  [31] "feeblemindednesses"    "heterogenousnesses"   
##  [33] "hydroelectricities"    "hyperaggressiveness"  
##  [35] "hyperaggressivenesses" "hyperconscientious"   
##  [37] "hypernationalistic"    "hypersensitiveness"   
##  [39] "hypersensitivenesses"  "hypersensitivities"   
##  [41] "inappropriatenesses"   "inconsideratenesses"  
##  [43] "indispensabilities"    "industrializations"   
##  [45] "interdenominational"   "interinstitutional"   
##  [47] "internationalizing"    "interrelatednesses"   
##  [49] "irreconcilabilities"   "irresponsibilities"   
##  [51] "lightheartednesses"    "microminiaturization" 
##  [53] "microminiaturizations" "miscellaneousnesses"  
##  [55] "misinterpretations"    "misrepresentations"   
##  [57] "multidenominational"   "nondiscriminations"   
##  [59] "obstreperousnesses"    "perpendicularities"   
##  [61] "postfertilizations"    "rehospitalizations"   
##  [63] "remunerativenesses"    "representativeness"   
##  [65] "representativenesses"  "simultaneousnesses"   
##  [67] "straightforwardest"    "subclassifications"   
##  [69] "subconsciousnesses"    "superintellectuals"   
##  [71] "superintelligences"    "unscrupulousnesses"   
##  [73] "absentmindednesses"    "adventitiousnesses"   
##  [75] "antiadministration"    "antidiscrimination"   
##  [77] "apprehensivenesses"    "biodegradabilities"   
##  [79] "bloodthirstinesses"    "cantankerousnesses"   
##  [81] "characteristically"    "chemotherapeutical"   
##  [83] "counteraccusations"    "counteraggressions"   
##  [85] "counterpropagation"    "counterretaliation"   
##  [87] "counterrevolutions"    "countersuggestions"   
##  [89] "electrocardiograms"    "electrocardiograph"   
##  [91] "feeblemindednesses"    "heterogenousnesses"   
##  [93] "hydroelectricities"    "hyperconscientious"   
##  [95] "hypernationalistic"    "hypersensitiveness"   
##  [97] "hypersensitivities"    "indispensabilities"   
##  [99] "industrializations"    "interinstitutional"
```

The number of words starting with each of “a”, “b”, “c”, and so on.

```r
# number of words starting with 'a'
length(grep("^a", words))
```

```
## [1] 6557
```


```r
# number of words starting with 'b'
length(grep("^b", words))
```

```
## [1] 6848
```


```r
# number of words starting with 'c'
length(grep("^c", words))
```

```
## [1] 10385
```

The full list of words with a “q” but no “u” following.

```r
grep("^q[^u]", words, value = TRUE)
```

```
##  [1] "qaid"    "qaids"   "qindar"  "qindars" "qintar"  "qintars" "qiviut" 
##  [8] "qiviuts" "qoph"    "qophs"
```

### Crossword helper

```r
# expression comes in the form '^.....$'
crossword <- function(expression) {
    return(grep(expression, words, value = TRUE))
}
```

### A Better Crossword helper

```r
crosswordPattern <- function(x) {
    outputPattern <- paste(rep.int(".", as.numeric(x[length(x)])), sep = "")
    for (k in 1:(length(x) - 1)) {
        outputPattern[x[k]] <- labels(x[k])
    }
    finalOutput <- ""
    for (k in 1:length(outputPattern)) {
        finalOutput <- paste(finalOutput, outputPattern[k], sep = "")
    }
    return(paste("^", finalOutput, "$", sep = ""))
}
```


```r
crosswordPattern(c(b = 1, s = 7, length = 7))
```

```
## [1] "^b.....s$"
```

Packaged up

```r
crosswordPackage <- function(x) {
    return(crossword(crosswordPattern(x)))
}
```


```r
crosswordPackage(c(c = 1, z = 7, length = 13))
```

```
## [1] "canonizations" "civilizations"
```

