## ----library, message=FALSE----------------------------------------------
library("EBImage")
options(EBImage.display = "raster")

## ----readImage-----------------------------------------------------------
img = readImage("/home/ros/Bilder/17_Extern/Export/R/2017_02_03_19_49_45_L.tif")
img = readImage("/home/ros/Bilder/17_Extern/Export/DT/2017_02_03/voll/2017_02_03_18_23_24_L_voll.jpg")
hist(img)
display(img)


#analyses image part
img_crop = img[1800:3000, 1400:2500,]
img_crop
display(img_crop)
hist(img_crop)

# get some masks
img_dark = img_crop < 0.3
display(img_dark)
img_light = img_crop > 0.6
display(img_light)
display(combine(img_dark,img_crop, img_light), all = TRUE)



#histogram
#hist(img)

hist.default(img_crop[,,1], 
             labels = FALSE,
             col="red",
             border = "red",
             breaks = 1000,
             xlim = c(0,1.0))
hist.default(img_crop[,,2], 
             labels = FALSE,
             col="green",
             border = "green",
             breaks = 1000,
             xlim = c(0,1.0))
hist.default(img_crop[,,3], 
             labels = FALSE,
             col="blue",
             border = "blue",
             breaks = 1000,
             xlim = c(0,1.0))
hist(img_crop, xlim = c(0,1.0))
#?hist
display(img_crop)

#image tests
w = makeBrush(size = 21, shape = 'gaussian', sigma = 3)
plot(w[(nrow(w)+1)/2, ], ylab = "w", xlab = "", cex = 0.7)
img_flo = filter2(img_crop, w)
img_high = ((img_crop - img_flo)*1.5)
display(img_high)
img_hard = img_crop + img_high
display(img_hard)

display(combine(img_crop,img_hard,img_flo, img_high, img_light, img_dark), all=FALSE, method = "browser")
# 