# learn hist function from 
# https://www.r-bloggers.com/how-to-make-a-histogram-with-basic-r/ 

datasets::AirPassengers
hist(AirPassengers, 
     main="Histogram for Air Passengers", 
     xlab="Passengers", 
     border="blue", 
     col="green",
     xlim=c(100,700),
     ylim = c(0,4),
     las=1, 
     breaks=300)

