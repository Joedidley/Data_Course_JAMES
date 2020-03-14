# 3D Exploded Pie Chart
library(plotrix)



data("iris")

Sepal.Length_pie <- iris$Sepal.Length
Sepal.Width_pie <- iris$Sepal.Width
Petal.Length_pie <- iris$Petal.Length
Petal.Width_pie <- iris$Petal.Width
Species_pie <- iris$Species

pie3D(Sepal.Length_pie,labels=Species_pie,explode=0.9,shade=0.4,
      radius=0.5,height=0.2,start=4,theta=pi/4, labelcol = par("fg"),
      labelcex = 0.5,minsep=NULL,
      border = par("fg"),
      mar=c(6,9,1,1),pty="s",
      edges = 3,
      main="Iris data")


jpeg("Ugly_Plot") 
pie3D(Sepal.Length_pie,labels=Species_pie,explode=0.9,shade=0.4,
      radius=0.5,height=0.2,start=4,theta=pi/4, labelcol = par("fg"),
      labelcex = 0.5,minsep=NULL,
      border = par("fg"),
      mar=c(6,9,1,1),pty="s",
      edges = 3,
      main="Iris data")
dev.off()
