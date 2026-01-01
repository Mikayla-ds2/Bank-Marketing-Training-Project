install.packages("tidyverse")
install.packages("rlang")

getwd()
list.files()
library(tidyverse)
library(rlang)

df <- read.csv('training.csv') # header is true bc of first row = columns
head(df)
summary(df) # 5 step summary of data
dim(df) # shows dimensions of data

# attempting to drop columns
df <- df[ -c(11, 16:20) ]
dim(df) # should be 15

colnames(df)
ncol(df)
data.frame(index = seq_along(colnames(df)), name = colnames(df))

# attempting again
df <- df %>% select(-duration, -emp.var.rate, -cons.price.idx, -cons.conf.idx, -euribor3m, -nr.employed) # need to use base r i assume

df <- df[, !names(df) %in% c("duration", 'emp.var.rate', 'cons.price.idx', 'cons.conf.idx', 'euribor3m', 'nr.employed')]
head(df)
dim(df)


