library(tidyverse) #load tidyverse

#my new file

#load Loblolly data set
data("Loblolly")
Loblolly

#remove unwanted data sets
rm(Titanic) 

#tells us description of loblolly points that were used
?Loblolly

#gives us a vector
Loblolly$Seed


#Tells us what type it is (numeric, ordered factor, etc)
class(Loblolly$Seed)
class(Loblolly$height)

#tells us 
num1 <- Loblolly$Seed[1]
#^^^^ if it says levels, we dealing with a 'factor'

num1+1
#we cant do this because even though we know num1 is 301, it cant add it to one, like adding blue eyes to 1

#gives structure of the data set
str(Loblolly)
summary(Loblolly) #gives the summary of the data
table(Loblolly$Seed) #gives possible categories of a variable
levels(Loblolly$Seed) #return the character value of each 

as.numeric(Loblolly$Seed)
as.character(Loblolly$Seed)

nums1 <- as.numeric(as.character(Loblolly$Seed)) #gives values as numbers

nums1[1]
nums1[1] + 1

glimpse(Loblolly) 


hist(Loblolly$height) #gives histogram of data (frequency of different values; ie distribution)

hist(Loblolly$height,breaks = 84)

hist(Loblolly$age)


#gives plot, can tell it what axis labels are
plot(y=Loblolly$height,x=Loblolly$age,col=Loblolly$Seed, 
pch=19, main = "Trees Grow, yo!",xlab = "Tree Age",ylab = "Tree Height")

pch #fills in circles instead of hollow points
main #tells heading
xlab, ylab #x and y labels

plot(x=Loblolly$Seed,y=Loblolly$height)

table(Loblolly$Seed,Loblolly$age)
plot(x=Loblolly$Seed,y=Loblolly$age)
