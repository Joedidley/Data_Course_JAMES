#Assignment 4
library(tidyverse)
?read.table()
df = read.csv("Data/landdata-states.csv")
class(df)

head(df)
?read.csv()


#+ **1. What other stuff does read.csv() do automatically?**
# seperates things by commas, takes first row and turns into column headers
#automatically uses quote as "  ", every stringle automatically into factor

 # + **2. How is it different from read.csv2()?**
#the source code is different, sep = ";" 

  #+ **3. Why does read.csv2() even exist?**
#read.csv2() is used in countries that use a comma as decimal point
#and a semicolon as field separator


class(df$State)
class(df$Date)

#**4. How could I change the parameters of read.csv() to make it so the class of the "State" column is "character" instead of "factor?"**
#   class(df$State)         #see that it's a factor
#   as.character(df$State)        #change the data to character
#   df$State <- as.character(df$State)       #save the character by assigning it
#   class(df$State)        #check that it's now a character

#A "TAB" SEPARATES THIS DATA FILE SO SAVING WITH .CSV (comma seperated) IS MEH

dim(df) # dimensions of the data frame (rows, columns)
str(df) # another nice way to glimpse a data frame
summary(df) # summary() works differently for different data classes. Note how it summarizes factors vs numerics


# **5. What command would give the summary stats for ONLY the Home.Value column?**
summary(df$Home.Value)

# **6. What value is returned by the command: names(df)[4]  ?**
names(df)[4]
#Home.Value      #gives the name of the 4th item 


hist(df$Land.Value) # histogram showing number of times each numeric value was seen in the vector "Land.Value"
# If you want to look at land value by region, you could do this:
plot(x=df$region,y=df$Land.Value)
# Land value by year
plot(x=df$Year,y=df$Land.Value)


# **7. What is happening when you add (...col=df\$region) to the above plotting code?**  
#**In other words, what happens when you run: plot(x=df\$Year,y=df\$Land.Value,col=df\$region)**
plot(x=df$Year,y=df$Land.Value,col=df$region)
#it colors the points by region


#####---------------------Assignment 4--------------

#delim seperates based on tabs and not columns
df <- read.delim("./Data/ITS_mapping.csv")
#stringsAsFactors = FALSE

dim(df) # dimensions of the data frame (rows, columns)
str(df) # another nice way to glimpse a data frame
summary(df) # summary() works differently for different data classes. Note how it summarizes factors vs numerics
glimpse(df) #no summary statistics
table(df$Ecosystem) #number of difference ecosystems

plot(x=df$Ecosystem,y=df$Lat)

png(filename = "./Assignments/Assignment_4/silly_boxplot.png")
plot(x=df$Ecosystem,y=df$Lat)
dev.off()

