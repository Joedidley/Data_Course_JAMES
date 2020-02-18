library(tidyverse)

#load some data
data("iris")
data("mtcars")

#ggplot
#first arguement is a dataframe
names(iris)
# data frame(aesthetics)     x              y
ggplot(iris,aes(x = Sepal.Length,y = Sepal.Width, color = Species)) + 
  geom_point()
#^^^this gave scatter plot, colored by species


#bar chart, colored by species
ggplot(iris,aes(x = Sepal.Length,y = Sepal.Width, fill = Species)) + 
  geom_bar(stat = "identity")
#geom_bar can't have y
#geom_count = histogram
#geom_col

#bar chart showing mean of each species sepal length
ggplot(iris,aes(x=Species,y=Sepal.Length)) +
  geom_col()
#---------------we need to get the mean first, then redirect into data
iris %>% group_by(Species) %>%
  summarize(Mean = mean(Sepal.Length)) %>%   
ggplot(aes(x=Species,y=Mean,fill=Species)) +
         geom_col()

       
#another scatter plot
#setosa and versicolor
#scatterplot = x=Sepal.Length, y=Sepal.Width, color=Species
iris %>% filter(Species %in% c("versicolor","setosa")) %>%
  ggplot(aes(x=Sepal.Length,y=Sepal.Width,color=Species)) +
  geom_point() +
  geom_smooth(method = "lm")

#this is the same in the end
iris %>% filter(Species != c("virginica")) %>%
  ggplot(aes(x=Sepal.Length,y=Sepal.Width,color=Species)) +
  geom_point()




#mpg on y axis
names(mtcars)


ggplot(mtcars,aes(x=disp,y=mpg,color=factor(cyl))) +
  geom_point() +
  geom_smooth(method='lm')
#use "Factor" to get rid of continuous, (so this makes it 1,2,3; not 1.2,1.3,etc)

#now do it but I just one one line
pal <- c("#78cc8f","#9277c9","#c96fab")



ggplot(mtcars,aes(x=disp,y=mpg,)) +
  geom_point(aes(color=factor(cyl))) +
  geom_smooth(method="lm",color="purple",size=2,linetype=2,se=FALSE) +
  labs(x="displacement",y="mpg", title="MPG ~Disp",subtitle = "stuff",
       caption= "Brought to you by",
       color="Cylinders") +
  scale_color_manual(values=pal) +
  theme_bw() +
  theme(plot.title = element_text(angle=60,hjust=1,face="italic",size=18))

#fill, color, alpha(how transparent)


#ignore this
for(i in names(mtcars)[-1]){
assign(x=paste0(i,"_plot")),ggplot(mtcars,aes(x=i,y=mpg)) +geom_point()
}

qsec_plot
vs_plot


?geom_point
?stat_count
?geom_smooth #use "lm" for linear regression model
geom_



