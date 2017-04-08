library(jsonlite)
## Not run: retrieve data frame
data1 <- fromJSON("https://api.github.com/users/rslsp1")
names(data1)
data1$login
data1$public_repos

data1_json <- toJSON(data1, pretty = TRUE)
cat(data1_json)

data1_repos <- fromJSON("https://api.github.com/users/rslsp1/repos")
cat(toJSON(data1_repos, pretty = TRUE))

