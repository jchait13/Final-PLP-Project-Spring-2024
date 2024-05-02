library(readr)
library(tidyr)

#read in data file from github and segment into only necessary columns
books_1_Best_Books_Ever <- read_csv("https://github.com/scostap/goodreads_bbe_dataset/raw/main/Best_Books_Ever_dataset/books_1.Best_Books_Ever.csv")
book_data <- books_1_Best_Books_Ever[c(2,4,5,9,18,20,22)]


#name columns
title = book_data[1]
author = book_data[2]
rating = book_data[3]
genre = book_data[4]
num_ratings = book_data[5]
liked_percent = book_data[6]
cover_img = book_data[7]


#convert to data file to dataframe
books <- data.frame(title, author,rating, genre,num_ratings, liked_percent, cover_img)

#remove all but first genre
books<- separate_wider_delim(books, genres, ",", names = c("genre1"), too_many ="drop")

#remove all but first author
books <-separate_wider_delim(books, author, ",", names = c("author1"), too_many ="drop")

#remove books with missing information
books[books==0] = NA
books[books=="[]"]=NA
books <- na.omit(books)
books$genre1<- substring(books$genre1,2)

#assign ID number to books
books$id <- seq.int(nrow(books))

#exploratory data analysis
num_ratings_vector <- as.vector(books$numRatings)
print(mean(num_ratings_vector, trim=0, na.rm=TRUE))
print(median(num_ratings_vector,trim=0, na.rm=TRUE))

percent_liked_vector <- as.vector(books$likedPercent)
print(mean(percent_liked_vector, trim=0, na.rm=TRUE))
print(median(percent_liked_vector, na.rm = TRUE))

rating_vector <- num_ratings_vector <- as.vector(books$rating)
print(min(rating_vector, na.rm=TRUE))
print(max(rating_vector, na.rm=TRUE))
print(mean(rating_vector, trim=0, na.rm=TRUE))
print(median(rating_vector,trim=0, na.rm=TRUE))

#remove books that have a rating lower than 3, liked percentage less than 80
#and less than 2500 reviews
books2 <- books[books$rating >= 3 & books$likedPercent >= 80 & books$numRatings >= 2500, ]
class(books2)

#write cleaned data file to project file
write.csv(books2, "/Users/jessicachait/Downloads/RRecommendation/cleanedbooks.csv")

