library("gpuR")

ORDER = 1024

A = matrix(rnorm(ORDER), nrow=ORDER)
B = matrix(rnorm(ORDER), nrow=ORDER)
gpuA = gpuMatrix(A, type="double")
gpuB = gpuMatrix(B, type="double")

C=A * B
gpuC = gpuA * gpuB

vclA = vclMatrix(rnorm(10000), nrow = 100, ncol = 100)
vclB = vclMatrix(rnorm(10000), nrow = 100, ncol = 100)
vclC = vclMatrix(rnorm(10000), nrow = 100, ncol = 100)

# GEMM
vclD = vclA %*% vclB

# Element-wise addition
vclD = vclD + vclC

# some tests
hist(vclA)
hist(A)
hist(C)
gpuA
C2 <- as.matrix(gpuC)
dim(C)
dim(C2)
X = C-C2
plot(X)
plot(C)
plot(C2)
hist(C2)

#gpu with image
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
#img_crop = img
#img_crop
display(img_crop)
hist.default(img_crop)

#get the image data
img_crop_data_r = imageData(img_crop)[,,1]
hist.default(img_crop_data_r)

#put data in gpu matrix
gpu_img_crop_data_r = gpuMatrix(img_crop_data_r, type="double")

hist.default(as.matrix(gpu_img_crop_data_r))
gpu_img_crop_data_r_new = gpu_img_crop_data_r*3

hist.default(as.matrix(gpu_img_crop_data_r_new))



# make new imahe switch the chanels and multipy red with 3
img_crop_new2 = img_crop
imageData(img_crop_new2)[,,1]=as.matrix(gpu_img_crop_data_r_new)
#imageData(img_crop_new2)[,,2]=imageData(img_crop)[,,3]
#imageData(img_crop_new2)[,,3]=imageData(img_crop)[,,1]
hist(img_crop_new2)
display(img_crop_new2)


detectGPUs()
detectCPUs()
