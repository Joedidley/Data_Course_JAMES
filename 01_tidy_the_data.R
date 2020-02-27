#load packages
library(tidyverse)
library(readxl)
#library ggimage

#load some data
dat <- read_xlsx("./Data/wide_data_example.xlsx") #excel spreadsheet
data("iris") 

#this is wrong, treatment 1 still has a "?" and isn't numeric
ggplot(dat,aes(x=`Treatment 1`,y=`Treatment 2`,color=SampleID))+
  geom_point()

#find and destroy the '?'
dat$`Treatment 1`[dat$`Treatment 1` == "?"] <- NA
#convert treatment 1 to numeric
dat$`Treatment 1` <- as.numeric(dat$`Treatment 1`)

#rename to get rid of spaces
names(dat) <- c("SampleID","Treatment1","Treatment2")

#tidy it to "long format"
long <- gather(dat,key="Watering",value="Height",2:3)

#get rid of "treatment" text
long$Watering <- str_replace(long$Watering,"Treatment","")
ggplot(long,aes(x=SampleID,y=Height,color=Watering)) +geom_boxplot()


#save the tidied version
write.csv(long,"./Data/long_and_tidy.csv",row.names = FALSE)


