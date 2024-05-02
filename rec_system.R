library(tidyverse)            
library(knitr)
library(Matrix)
library(recommenderlab)
library(data.table)


#read

dataBooks <- read_csv("/Users/jessicachait/Downloads/RRecommendation/cleanedbooks.csv")


ratings_matrix <- dataBooks %>%
  select(id, rating) %>%
  mutate(value =0) %>%
  spread(rating, value, fill = 1) %>%
  select(-id) %>%
  as.matrix() %>%
  as("realRatingMatrix")

e <- evaluationScheme(ratings_matrix, method = "split", train = 0.5,given= 5, goodRating = NA)

IBCF_Z_P <- Recommender(getData(e, "train"), "IBCF", 
                        param=list(normalize=NULL, method = "cosine"))

p <- predict(IBCF_Z_P, getData(e, "unknown"), type = "topNList", n = 1)

class(p)

rec_list <-attr(p, which = "items", exact = FALSE)
#print(rec_list[2])
class(rec_list)

title_list <-attr(dataBooks, which = "title")
print(title_list)

y <- dataBooks[2]
print(dataBooks[1,2])

bookRec <- as.matrix(rec_list)
bookRec
bookRec <- as.data.frame(bookRec)

title_orig <- list()
auth_orig <- list()
title_rec <- list()
auth_rec <- list()

for (i in 1:length(rec_list)){
  x <- rec_list[[i]]
  title_orig[i] <- dataBooks[i,2]
  auth_orig[i] <- dataBooks[i,3]
  title_rec[i] <- dataBooks[x,2]
  auth_rec[i] <- dataBooks[x,3]
  
}

lists <- list(title_orig,auth_orig,title_rec,auth_rec)

finalRec <- as.data.frame(do.call(cbind,lists))
class(finalRec)

finalRec

finalRec <- apply(finalRec, 2, as.character)

capture.output(finalRec, file ="data.csv")

print('done')




