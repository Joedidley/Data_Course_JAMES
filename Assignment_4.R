#Assignment 4
library(tidyverse)
?read.table()
df = read.csv("Data/landdata-states.csv")
class(df)

head(df)
?read.csv()


#+ **1. What other stuff does read.csv() do automatically?**
#

 # + **2. How is it different from read.csv2()?**
#the source code is different, sep = ";"

  #+ **3. Why does read.csv2() even exist?**
#the variant used in countries that use a comma as decimal point
#and a semicolon as field separator
