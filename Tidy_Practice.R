library(tidyverse)


#load "wide" data examples
df1 <- read.csv("./Data/FacultySalaries_1995.csv")

df2 <- read.csv("./wide_income_rent.csv")



#make boxplot (x=professor rank, y=1995 salary)

names(df1)
long <- gather(df1,key = Rank,value = Salary,5:7)

long$Rank
newranknames <- str_remove(long$Rank,c("Avg")) %>% str_remove("Salary")
newranknames[3000]

long$Rank <- newranknames

ggplot(long,aes(x=Rank,y=Salary,fill=Rank)) + geom_boxplot() +
  scale_fill_brewer(palette = 2)


#make boxplot (x=comp, y=1995 salary)
names(long)
long2 <- gather(long,key = Comp,value = Salary,6:8)

long2$Comp
newcompnames <- str_remove(long2$Comp,c("Avg")) %>% str_remove("Comp")
long2$Comp <- newcompnames
names(long2)

ggplot(long2,aes(x=Comp,y=Salary,fill=Comp)) + geom_boxplot()


####
names(long2)
long3 <- gather(long2,key = Type,value = Dollars,c(13:14))

ggplot(long3,aes(x=Rank,y=Dollars,fill=Rank)) + geom_boxplot() +
  facet_wrap(~Type)

long3$Dollars <- as.numeric(long3$Dollars)





##########Second example
#using df2
names(df2)
long4 <- gather(df2,key=State,value = Amount,c(2:53))


ggplot(long4,aes(x=State,y=Amount)) + geom_point() +facet_grid(~variable) 
