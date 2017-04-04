# Simple tests

a<-c(9,16,25,36,49)
b<-sqrt(a)
b
c<-sqrt(b)
c
a
plot(a,b, 
     #xaxp = c(5,55,55-5),
     log = "y",
     type = "l"
     )

x = rnorm(50)
y = rnorm(x)
plot(x,y)
hist.default(x)
hist.default(y)
ls()
x = 1:50
plot(x,y)
y = 1:50
plot(x,y)
w = 1 + sqrt(x)/2
dummy = data.frame(x=x, y =x +  rnorm(x)*w)
plot(dummy)
pairs(dummy)

library(psych)
pairs.panels(dummy)

fm = lm(y ~ x, data=dummy)
summary(fm)
plot(fm)
pairs.panels(fm)
a
1/a

k = 1:10
l = k * c(1,0) +1
