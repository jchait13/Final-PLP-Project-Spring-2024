# Importing libraries
library(data.table)           
library(readxl)               
library(tidyverse)


# import raw data file and trim out whitespaces
dataBooks <- read_csv("/Users/jessicachait/Downloads/RRecommendation/cleanedbooks.csv")

# First glance at the data
dataBooks %>%  skim()

#exploring data
dataBooks %>%
  group_by(genre1) %>%
  summarize(count = n()) %>%
  top_n(10, wt=count) %>%
  arrange(desc(count)) %>% 
  ggplot(aes(x = reorder(genre1, count), y = count))+
  geom_bar(stat = "identity", fill = "royalblue", colour = "blue") +
  labs(x = "", y = "number of books per genre", title = "Top Genres") +
  coord_flip() +
  theme_grey(base_size = 12)

