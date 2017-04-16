#test statistics datasets

# load data set -----------------------------------------------------------

# First we get our data.
mydata <- read.table("StatisticsDataSets/usparty.txt")
names(mydata) # Lets us see all the variable names.
#attach(mydata) # This puts the variable names in memory. We will not be using this.
mysubsetdata<-subset(mydata, select=c(YEAR, MTOTCONG, ON)) #This keeps only the two variables that we need.
summary(mysubsetdata) # Since no variables are listed, a summary for all variables in the data frame is printed.
mysubsetdata #This prints out all the variable values.


# first plot --------------------------------------------------------------

# Now let us look at what the on-year/off-year pattern looks like.
# Note that to reference a variable, you need to put the data set name followed by a $ before the variable name.
# We can reference the variables directly without using the data set name and the $ if we used the attach command above.
# But we do not want to use the attach command now because we will be creating other data sets that contain the same variable names.
plot(mysubsetdata$YEAR, mysubsetdata$MTOTCONG, xlab="", ylab="", ylim=c(0.2,0.8), pch=19, type="o")
title(xlab="Year", ylab="Congressional Mobilization", main="Figure 1: Plot of U.S. Congressional Mobilization", cex=1.5, col="black", font=2)
# Now let us get the overall mean for congressional mobilization
mean(mysubsetdata$MTOTCONG) # Here we are getting the mean only of the MTOTCONG variable.

#windows() # This prevents the next plot from erasing the previous plot by giving us a new graphics window.


# Now let us work with just the years 1950 through 1970.
my5070data <- subset(mysubsetdata, YEAR >= 1950 & YEAR <= 1970)
my5070data
# attach(my5070data) # Let us avoid variable confusion with these data sets by not doing this.
plot(my5070data$YEAR, my5070data$MTOTCONG, xlab="", ylab="", ylim=c(0.3,0.7), pch=19, type="o", axes=FALSE)
axis(1, at=c(1952, 1956, 1960, 1964, 1968)) # This defines the X axis tick marks.
axis(2, yaxs="r") # This defines the Y axis.
#axis(2, at = c(0.3,0.5,0.7)) # This defines the Y axis.
box()
title(xlab="Year", ylab="Congressional Mobilization", main="Figure 2: Plot of U.S. Congressional Mobilization, 1950-70", cex=1.5, col="black", font=2)
mean(my5070data$MTOTCONG)

# year 50 to 70 -----------------------------------------------------------

# Now let us work with just the years 1972 through 1988.
my7288data <- subset(mysubsetdata, YEAR >= 1972 & YEAR <= 1988)
my7288data
# attach(my7288data) # Again, let us avoid variable confusion with these data sets by not doing this.
plot(my7288data$YEAR, my7288data$MTOTCONG, xlab="", ylab="", ylim=c(0.2,0.8), pch=19, type="o", axes=FALSE)
axis(1, at=c(1972, 1976, 1980, 1984, 1988)) # This defines the X axis tick marks.
axis(2, yaxs="r") # This defines the Y axis.
box()
title(xlab="Year", ylab="Congressional Mobilization", main="Figure 2: Plot of U.S. Congressional Mobilization, 1972-88", cex=1.5, col="black", font=2)
mean(my7288data$MTOTCONG)

# Now let us work with on-year and off-year separately to get the means
myON5070data <- subset(mysubsetdata, YEAR == 1952 | YEAR == 1956 | YEAR == 1960 | YEAR == 1964 | YEAR == 1968)
mean(myON5070data$MTOTCONG)
myOFF5070data <- subset(mysubsetdata, YEAR == 1950 | YEAR == 1954 | YEAR == 1958 | YEAR == 1962 | YEAR == 1966 | YEAR == 1970)
mean(myOFF5070data$MTOTCONG)

myON5070data2 <- subset(my5070data, ON == 1)
myON5070data2
mean(myON5070data2$MTOTCONG)
myOFF5070data2 <- subset(my5070data, ON == 0)
myOFF5070data2
mean(myOFF5070data2$MTOTCONG)


# my new data set ---------------------------------------------------------

myON7288data <- subset(my7288data, ON ==1)
myOFF7288data <- subset(my7288data, ON ==0)
my7288dataMean <- mean(my7288data$MTOTCONG)
myON7288dataMean <- mean(myON7288data$MTOTCONG)
myOFF7288dataMean <- mean(myOFF7288data$MTOTCONG)


# my plot -----------------------------------------------------------------

# attach(my7288data) # Again, let us avoid variable confusion with these data sets by not doing this.
plot(my7288data$YEAR, my7288data$MTOTCONG, xlab="", ylab="", ylim=c(0.2,0.8), pch=19, type="o", axes=FALSE, lty="3313")
lines(myON7288data$YEAR,myON7288data$MTOTCONG, lty="3313")
lines(myOFF7288data$YEAR,myOFF7288data$MTOTCONG, lty="3313")
lines(c(min(my7288data$YEAR),max(my7288data$YEAR)),c(myON7288dataMean, myON7288dataMean), col="red")
lines(c(min(my7288data$YEAR),max(my7288data$YEAR)),c(myOFF7288dataMean, myOFF7288dataMean),col="blue")
lines(c(min(my7288data$YEAR),max(my7288data$YEAR)),c(my7288dataMean, my7288dataMean),col="green")
axis(1, at=as.vector(myOFF7288data$YEAR)) # This defines the X axis tick marks.
axis(2, yaxs="r") # This defines the Y axis.

box()
title(xlab="Year", ylab="Congressional Mobilization", main="Figure 4: Plot of U.S. Congressional Mobilization, 1972-88", cex=1.5, col="black", font=2)


# test --------------------------------------------------------------------


