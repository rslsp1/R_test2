library('magick')
#Example image
frink <- image_read("https://jeroen.github.io/images/frink.png")
print(frink)
#hist(frink)
ros_image <- image_read("/home/ros/Bilder/17_Extern/Export/DT/2017_02_03/voll/2017_02_03_18_23_24_L_voll.jpg")
str(ros_image)
ros_small <- image_scale(ros_image,"x1000")
print(ros_small)
print(ros_image)
