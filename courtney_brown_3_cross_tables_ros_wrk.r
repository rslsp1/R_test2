# First, load a library that will build nice crosstabulation tables
library(gmodels)
# Now we get our data.
mydata <- read.table("StatisticsDataSets/panel80.txt")
names(mydata) # This shows us all the variable names.
mynewdata <- mydata[ which(mydata$VOTE <= 2), ] # This gets rid of observations where votes went to minor candidates.
# Now we create an income category variable based on the mean for use in a table.
mynewdata$incomecategories <- ifelse(mynewdata$INC < mean(mynewdata$INC, na.rm = TRUE), 1, 2) # One way to recode variables.
CrossTable(mynewdata$SEX, mynewdata$VOTE, chisq=TRUE, expected = TRUE, format="SAS")
CrossTable(mynewdata$incomecategories, mynewdata$VOTE, chisq=TRUE, expected = TRUE, format="SAS")

