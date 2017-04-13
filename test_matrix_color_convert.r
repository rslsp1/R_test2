#rgb matrix operations

#pixel value in RBG
px_rgb = c(50/255, 80/255, 120/255)

#matrix to convert RGB to XYZ from high dynamic range images page 35
mRGB2XYZ = matrix(data = c(
  0.4124,
  0.3576,
  0.1805,
  0.2126,
  0.7152,
  0.0722,
  0.0193,
  0.1192,
  0.9505
), nrow = 3, ncol = 3)
mRGB2XYZ

#convert pixel from RGB to XYZ
px_xyz = px_rgb %*% mRGB2XYZ
px_xyz

#matrix to convert XYZ to RGB
mXYZ2RGB = matrix(data = c(
  3.2405,
  -1.5371,
  -0.4985,
  -0.9693,
  1.8760,
  0.0416,
  0.0556,
  -0.2040,
  1.0572
  ), nrow = 3, ncol = 3)
mXYZ2RGB

#convert pixel back from XYZ to RGB
px2_rgb = px_xyz %*% mXYZ2RGB
px2_rgb

#check the result RGB to XYZ to RGB
px_rgb - px2_rgb
