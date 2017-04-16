# First we get our data.
mydata <- read.table("panel80.txt")
# attach(mydata) # In case you want to work with the variables directly
names(mydata) # This shows us all the variable names.
# options(scipen=20) # suppress "scientific" notation
options(scipen=NULL) # Brings things back to normal
reagan.model <- lm(REAFEEL3 ~ INC + AGE + PARTYID, data=mydata)
summary(reagan.model)
layout(matrix(c(1,2,3,4),2,2)) # optional 4 graphs/page
plot(reagan.model) # These are diagnostic plots.
windows()
carter.model <- lm(CARFEEL3 ~ INC + AGE + PARTYID, data=mydata)
summary(carter.model)
layout(matrix(c(1,2,3,4),2,2)) # optional 4 graphs/page
plot(carter.model) # These are diagnostic plots.
mysubsetdata<-subset(mydata, select=c(REAFEEL3, CARFEEL3, INC, AGE, PARTYID)) #This keeps only the variables that we are using.
cor(mysubsetdata, use = "pairwise.complete.obs") # A correlation matrix for the variables in the regression
cov(mysubsetdata, use = "pairwise.complete.obs") # A covariance matrix for the variables in the regression
# Now let's get the standardized regression coeficients
sdvariables <- sapply(mysubsetdata, sd, na.rm = TRUE) # This gets the standard deviations of all the variables.
sdvariables # This prints out the standard deviations, which is not very useful but nice to see.
mystandardizeddata <- as.data.frame(scale(mysubsetdata, center=FALSE, scale=sdvariables) ) # standardize variables
var(mystandardizeddata, use = "pairwise.complete.obs") # Note that the variance-covariance matrix = correlation matrix
carter.model2 <- lm(CARFEEL3 ~ INC + AGE + PARTYID, data=mystandardizeddata)
summary(carter.model2)

