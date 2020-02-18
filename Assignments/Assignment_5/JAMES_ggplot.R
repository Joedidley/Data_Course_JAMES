library(tidyverse)
library(ggplot2)
data("iris")


names(iris)


#plot 1
jpeg("iris_fig1.jpg") 
ggplot(iris,aes(x=Sepal.Length,y=Petal.Length,color=factor(Species))) +
  geom_point() +
  geom_smooth(method='lm') +
  labs(x="Sepal.Length",y="Petal.Length",
       title="Sepal length vs petal length",
       color="Species",
       subtitle="for three iris species")
dev.off() 

#plot 2

jpeg("iris_fig2.jpg") 
ggplot(iris,aes(Petal.Width,fill=Species)) +
  geom_density(alpha=0.5) +
  labs(x="Petal Width",y="density",
       title="Distribution of Petal Widths",
       color="Species",
       subtitle="for three iris species")
dev.off() 


#plot 3

jpeg("iris_fig3.jpg") 
Width_ratio <- iris$Petal.Width / iris$Sepal.Width
ggplot(iris,aes(x=Species,y=Width_ratio,fill=Species)) +
  geom_boxplot() +
  labs(x="Species",y="Ratio of Sepal Width to Petal Width",
       title="Sepal- to Petal-Width Ratio",
       subtitle="for three iris species",
       color="Species")
dev.off()

#plot 4


iris$'Length.Deviance' <- rownames(iris)
iris$Sepal.Length_z <- round((iris$Sepal.Length - mean(iris$Sepal.Length))/sd(iris$Sepal.Length), 3)
iris$Length_type <- ifelse(iris$Sepal.Length_z < 0,"below","above")
iris <- iris[order(iris$Sepal.Length_z), ]
iris$'Length.Deviance' <- factor(iris$'Length.Deviance', levels = iris$'Length.Deviance')

jpeg("iris_fig4.jpg") 
ggplot(iris,aes(x=iris$Length.Deviance,y=iris$Sepal.Length_z,label=Sepal.Length_z)) +
  geom_bar(stat='identity',aes(fill=Species), position = position_dodge()) +
  labs(title="Sepal length deviance from the mean of all observations",
       caption = "Note:Deviance = Sepal.Length - mean(Sepal.Length)",
       y="Deviance from the mean",
       color="Species") +
  theme(axis.title.y=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank()) +
      coord_flip()
dev.off()
