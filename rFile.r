install.packages("tidyverse")
install.packages("rlang")
install.packages('dplyr')
install.packages('caret')

getwd()
list.files()
library(tidyverse)
library(rlang)
library(dplyr)
library(caret)

df <- read.csv('training.csv') # header is true bc of first row = columns
head(df)
summary(df) # 5 step summary of data
dim(df) # shows dimensions of data

# attempting to drop columns
df <- df[ -c(11, 16:20) ]
dim(df) # should be 15

colnames(df)
ncol(df)
#data.frame(index = seq_along(colnames(df)), name = colnames(df))

# attempting again
#df <- df %>% select(-duration, -emp.var.rate, -cons.price.idx, -cons.conf.idx, -euribor3m, -nr.employed) # need to use base r i assume

#df <- df[, !names(df) %in% c("duration", 'emp.var.rate', 'cons.price.idx', 'cons.conf.idx', 'euribor3m', 'nr.employed')]
head(df)
dim(df)

# duplicates
sum(duplicated(df)) # apparently over 1080 duplicates?? now only 4?
#duplicated(df)

dim(df) # checking if the rows decreased from 26,874 something; needs to go to to 26870 based on ipynb file

#duplicatedRows <- df |> # send df forward
    # group_by_all() |> # group by every column
    # filter(n() > 1) |> # keep only duplicated rows, where the row exists more than one time
    # ungroup() # clean up group formatting
#duplicatedRows # prints the duplicated rows with the data types and both the original row and the repeated row
df <- unique(df)
head(df)
# addressing multiple things

glimpse(df) # use to see head of data in tibble

# standardizing age
df$age <- scale(df$age)

# one hot encoding (better than numeric dictionaries)
dmy <- dummyVars("~.", data = df)
df2 <- data.frame(predict(dmy, newdata = df))
print(head(df2))

# handling outliers
boxplot(df$age)
# to remove the outliers
boxplot(newDF)
