# First we get our data.
mydata <- read.table("StatisticsDataSets/usparty.txt")
names(mydata) # Lets us see all the variable names.
mysubsetdata<-subset(mydata, select=c(YEAR, MTOTCONG, ON)) #This keeps only the three variables that we need.
summary(mysubsetdata) # Since no variables are listed, a summary for all variables in the data frame is printed.
mysubsetdata #This prints out all the variable values.

# Now let us work with just the years 1932 through 1970, on-year data only.
my3270onyeardata <- subset(mysubsetdata, YEAR >= 1932 & YEAR <= 1970 & ON == 1)
my3270onyeardata

# Now let us work with just the years 1972 through 1988, on-year data only.
my7288onyeardata <- subset(mysubsetdata, YEAR >= 1972 & YEAR <= 1988 & ON == 1)
my7288onyeardata

# Here is the t-test between the earlier and later periods for on-year elections.
t.test(my3270onyeardata$MTOTCONG, my7288onyeardata$MTOTCONG)
# If you were assuming equal variances across time periods, then you would write this test as below.
t.test(my3270onyeardata$MTOTCONG, my7288onyeardata$MTOTCONG, var.equal=TRUE)
# You could also conduct an F-test to see if the variances really are equal, to be safe.
var.test(my3270onyeardata$MTOTCONG, my7288onyeardata$MTOTCONG)

