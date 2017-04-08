## ----library, message=FALSE----------------------------------------------
library("EBImage")
options(EBImage.display = "raster")
library(colorspace)

## ----readImage-----------------------------------------------------------
img = readImage("/home/ros/Bilder/17_Extern/Export/R/2015_10_11_11_03_02_87_01.tif")
#hist(img)
#display(img)


#analyses image part
img_crop = img[2900:2999, 1900:1999,]
#img_crop
display(img_crop)
hist(img_crop)

#get the image data
img_crop_data = imageData(img_crop)

#get only the red values
img_crop_data_r = img_crop_data[,,1]


# make new imahe switch the chanels and multipy red with 3
img_crop_new2 = img_crop
imageData(img_crop_new2)[,,1]=imageData(img_crop)[,,2]*3
imageData(img_crop_new2)[,,2]=imageData(img_crop)[,,3]
imageData(img_crop_new2)[,,3]=imageData(img_crop)[,,1]
hist(img_crop_new2)
display(img_crop_new2)


