library("gpuR")

ORDER = 1024*1024*1024

A = matrix(rnorm(ORDER^2), nrow=ORDER)
B = matrix(rnorm(ORDER^2), nrow=ORDER)
gpuA = gpuMatrix(A, type="double")
gpuB = gpuMatrix(B, type="double")

C=A %*% B
gpuC = gpuA %*% gpuB

vclA = vclMatrix(rnorm(10000), nrow = 100, ncol = 100)
vclB = vclMatrix(rnorm(10000), nrow = 100, ncol = 100)
vclC = vclMatrix(rnorm(10000), nrow = 100, ncol = 100)

# GEMM
vclD = vclA %*% vclB

# Element-wise addition
vclD = vclD + vclC

hist(vclA)
hist(A)
hist(gpuA)
gpuA
A
