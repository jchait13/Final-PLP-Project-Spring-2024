# Final-PLP-Project-Spring-2024
By Jessica Chait

This project uses R programming language to generate a list recommended books from a GoodReads dataset.

## Installation

Use the package manager to install the packages below for the corresponding files.

### cleaned_data.R
```bash
install.packages("readr")
install.packages("tidyr")
```
### data_analysis.R
```bash
install.packages("data.table")
install.packages("readxl")
install.packages("tidyverse")
```

### rec_system.R
```bash
install.packages("recommenderlab")
```

## File Descriptions

### cleaned_data.R

This file reads in the initial data set from github and segments the data that is used for the project. All data cleaning is done in this file and it exports the clean file for use in the two other scripts.

### data_analysis.R
This file provides an initial analysis of the data and chart of the number of books per genre.

### rec_system.R
This file converts the data to a real ratings matrix, calculates the cosign similarity and provides a table of book recommendations based on the title a user likes.

## Sources

The works below were used in creation of this project:

### Dataset via Github
[Dataset](https://github.com/scostap/goodreads_bbe_dataset/blob/main/Best_Books_Ever_dataset/books_1.Best_Books_Ever.csv)

### General R Functions
[CRAN - Introduction to R](https://cran.r-project.org/doc/manuals/r-release/R-intro.pdf)

[Statology - Cosine Similarity in R](https://www.statology.org/cosine-similarity-r/)

### Geeks for Geeks Articles
[Removing blanks](https://www.geeksforgeeks.org/replace-0-with-na-in-r-dataframe/)

[Removing zeros](https://www.geeksforgeeks.org/replace-blank-by-na-in-r-dataframe/)

[Convert dataframe to vector](https://www.geeksforgeeks.org/convert-dataframe-column-to-vector-in-r/)

### TidyVerse Packages

[dply](https://dplyr.tidyverse.org/reference/filter.html?q=dataframe%20to%20vector#undefined)

[stringer](https://stringr.tidyverse.org/reference/modifiers.html)

[tidyr](https://tidyr.tidyverse.org/reference/index.html)


### Recommenderlab

[CRAN](https://cran.r-project.org/web/packages/recommenderlab/recommenderlab.pdf)

[r-bloggers](https://www.r-bloggers.com/2020/04/movie-recommendation-with-recommenderlab/#google_vignette)

### Books
[YaRR! The Pirates Guide to R](https://bookdown.org/ndphillips/YaRrr/)

### Similar Projects
[Market Basket Analysis via Toward Data Science](https://towardsdatascience.com/market-basket-analysis-with-recommenderlab-5e8bdc0de236)

[Comprehensive Guide On Item Based Recommendation Systems](https://towardsdatascience.com/comprehensive-guide-on-item-based-recommendation-systems-d67e40e2b75d)

[How to Code A Recommendation System in R](https://anderfernandez.com/en/blog/how-to-code-a-recommendation-system-in-r/#:~:text=Item%2Dbased%20collaborative%20recommendation%20system,and%20we%20will%20recommend%20them.)
