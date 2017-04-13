#test some colorspace manipulations
library(colorspace)

## Show the LAB space
set.seed(1)
valsr = seq(0, 1, length.out = 40)
valsr
valsb = seq(1, 0, length.out = 40)
valsb
x <- RGB(valsr, 1, valsb)
y <- as(x, "LAB")
head(x)
head(y)
plot(y)
plot(x)
x
y
str(x)
print(x)


px_rgb = RGB(50/255,80/255,120/255)
px_rgb

px_lab = as(px_rgb,"LAB")
px_lab
