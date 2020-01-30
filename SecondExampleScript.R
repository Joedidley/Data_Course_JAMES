library(tidyverse)


#load data
data("iris")

#subset. Give subset of iris
iris <- #subset == Virginica
iris <- iris %>% filter(Species == "virginica") #redid the data to only show the species "virginica"

glimpse(iris) #gives a glimpse of the iris data set

#class = double, double, double, double, factor. double is numeric. 

#plot sepal length (y axis) as a function of petal length (x axis), 
#and color points in scatter plot by species

plot(y=iris$Sepal.Length,x=iris$Petal.Length,col=iris$Species,pch=20,
     main="You're gonna hate iris before this is over",ylab="Sepal Length",
     xlab="Petal Length")

summary(iris)


#Give boxplot of Sepal Length as a function of Species

#couldnt get this one to work
plot(x=iris$Species,y=iris$Sepal.Length, 
     main="You're gonna hate iris before this is over",
     ylab="Sepal Length", xlab="Petal Length")

hist(iris$Sepal.Length,breaks = 30)
plot(density(iris$Sepal.Length))#you can export this graph or save it


#how to save a plot. You can save it to anywhere by putting relative file path 
jpeg("densityplot.jpg") #opens connection on a file to your computer
plot(density(iris$Petal.Width))
dev.off() #closes and writes that file you opened

#for assignment 3
dat$Headwidth[dat$Headwidth=="41mm"] <- 41 #wont work because factor level is .ooo
dat$Headwidth[dat$Headwidth=="41mm"] <- 41.000 #this will bc 41.000 IS in data set
