#test gplot

## ----library, message=FALSE----------------------------------------------
library("EBImage")
options(EBImage.display = "raster")
library(colorspace)
library(ggplot2)

## ----readImage-----------------------------------------------------------
img = readImage("/home/ros/Bilder/17_Extern/Export/R/2015_10_11_11_03_02_87_01.tif")
#hist(img)
#display(img)


#analyses image part
img_crop = img[2900:2999, 1900:1999,]
img_crop = img
#img_crop
display(img_crop)
hist(img_crop)
img_r = imageData(img_crop)[,,1]
img_r_v = as.vector(img_r)
str(img_r_v)

str(img_r_v)
plot(sort(img_r_v[1:1000]),type = "l")
plot(sort(img_r_v)[1:1000],type = "l")
plot(sort(img_r_v)[img_r_v<0.1],type = "l")
plot(img_r_v[img_r_v<0.1],type = "l")
hist(img_r_v[img_r_v<0.2])
hist(img_r_v[img_r_v>0.8])
system.time(hist.default(img[,,1]))
system.time(hist(img[,,]))
system.time(hist(as.vector(img[,,1])))
system.time(hist(img_r))
system.time(hist(img_r_v))

system.time(display(img))
hist.default

hist(img_r_v)
img_r[1,1]

p2 <- ggplot(img_r_v, aes(x = img_r_v))
p2 + geom_histogram()


qplot(as.factor(as.vector(imageData(img_crop))), geom="histogram")

ggplot() + geom_histogram(imageData(img_crop),bins = 20)
