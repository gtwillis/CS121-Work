plot(100, 100, type="n", axes=FALSE, ann=FALSE, xlim=c(0, 100), ylim = c(0,100), asp=1)
polygon(c(64,75,86,82,68), c(59,67,59,45,45), density=75, col="yellow", border=NA)
circle<- function(x,y,r,...){
  angs=seq(0,2*(pi), length=1000)
  xpts<- x+r*cos(angs)
  ypts<- y+r*sin(angs)
  polygon(xpts,ypts,...)
   }
circle(50,50,25, density=200, col="darkslategray2", border=NA)
ellipse<- function(x, y, r_1, r_2, ...){
  angs=seq(0,2*(pi), length=1000)
  xpts<- x+r_1*cos(angs)
  ypts<- y+r_2*sin(angs)
  polygon(xpts,ypts,...)
  }
ellipse(30,60,15,25, density=200, col="plum2", border=NA)
polygon(c(30,30,50,50), c(10,30,30,10), density=200, col="red", border="gray0")
polygon(c(20,20,45,45), c(35,60,60,35), density=30, col="green", border="dodgerblue", lwd=5)
