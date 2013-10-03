Functions and Graphics
========================================================

## Sums of numbers

### How many are odd

```
> countOdds<- function(x){
+     sum(x%%2)
+ }
```

### How many are even

```
> countEvens<- function(x){
+     sum((x+1)%%2)
+ }
```
## Triangles

### Pythagoras

```
> hypotenuseLength<- function(a,b){
+     sqrt((a^2)+(b^2))
+ }
```

### Law of Cosines

```
> lawOfCosines<- function(a,b,theta){
+     sqrt((a^2)+(b^2)-2*a*b*cos(theta))
+ }
```

### Find the angle

```
> thetaFromLengths<- function(a,b,c) {
+     acos(((a^2)+(b^2)-(c^2))/(2*a*b))
+ }
```

### Test thetaFromLengths()

```
> thetaFromLengthsTest<- function(a,b,theta){
+     thetaFromLengths(a,b,lawOfCosines(a,b,theta))-theta 
+ }
```

## Graphics

### Function: canvas()

```
> canvas<- function(x,y,...){
+     plot(x,y,type="n",axes=FALSE,ann=FALSE,xlim=c(0,x), ylim = c(0,y))
+ }
```

### Function: drawCircle()

```
> drawCircle<- function(x,y,r){
+     angs=seq(0,2*(pi), length=1000)
+     xpts<- x+r*cos(angs)
+     ypts<- y+r*sin(angs)
+     polygon(xpts,ypts,border=NULL)
+     }
```

### Function: modify drawCircle()

```
> drawCircle<- function(x,y,r,...){
+    angs=seq(0,2*(pi), length=1000)
+    xpts<- x+r*cos(angs)
+    ypts<- y+r*sin(angs)
+    polygon(xpts,ypts,border=NULL,...)
+}
```

### Draw overlapping circles

``` 
plot(100,100,asp=1)
drawCircle(20,50,15)
drawCircle(30,40,15)
drawCircle(40,50,15)
drawCircle(50,40,15)
drawCircle(60,50,15)
```

### Draw the Olympic logo

```
plot(100,100,asp=1)
drawCircle(20,50,15, lwd=500, col="blue")
drawCircle(30,40,15, lwd=500, col="yellow")
drawCircle(40,50,15, lwd=500)
drawCircle(50,40,15, lwd=500, col="green")
drawCircle(60,50,15, lwd=500, col="red")
```