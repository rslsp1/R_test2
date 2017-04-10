#install.packages("gmatrix" ,  
#                 configure.args = "
#      --with-arch=sm_30
#      --with-cuda-home=/opt/cuda
#      --with-r-home==/opt/R"
#)
install.packages("gmatrix")

library(gmatrix)
gtest()

help(package="gmatrix")
