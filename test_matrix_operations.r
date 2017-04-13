#matrix test
#create matrix
m1 = matrix(data = c(1, 1, 1, 0, 0, 0, 0, 0, 0), nrow = 3, ncol = 3)
m1
#create vector
v1 = c(1,2,3)
v1
#multiplay vector 3  with 3x3 matrix
v2 = v1 %*% m1
v2
#transpose the vector
t(v2)
