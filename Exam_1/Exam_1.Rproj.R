library(tidyverse)
df <- read.csv("./Exam_1/DNA_Conc_By_Extraction_Date.csv")


#create separate histograms of the DNA concentrations for Katy and Ben. 
#Make sure to add nice labels to these (x-axis and main title).

glimpse(df)
table(df$DNA_Concentration_Ben)
levels(df$DNA_Concentration_Ben)
summary(df$DNA_Concentration_Ben)

#part 1
hist(df$DNA_Concentration_Ben,main="Ben",xlab="DNA Concentration",ylab="Frequency")
hist(df$DNA_Concentration_Katy,main="Katy",xlab="DNA Concentration",ylab="Frequency")

#part 2

class(df$Year_Collected) #integer
class(df$DNA_Concentration_Ben) #numeric

as.factor(df$Year_Collected)
df$Year_Collected <- as.factor(df$Year_Collected)
class(df$Year_Collected) #now it's a factor

plot(y=df$DNA_Concentration_Ben,x=df$Year_Collected,
     main="Ben's Extractions",ylab="DNA Concentration",xlab="YEAR")
plot(y=df$DNA_Concentration_Katy,x=df$Year_Collected,
     main="Katy's Extractions",ylab="DNA Concentration",xlab="YEAR")

#part 3
#Once you have your code for creating the figures correctly, you need to
#save those two images in YOUR Exam_1 directory. 
#Name them similarly to how I named mine, but with your LASTNAME
#Make sure your code is saving the files. 
#Don't do it manually with the mouse!

jpeg("./Exam_1/JACOB_JAMES_Plot2.jpeg")
plot(y=df$DNA_Concentration_Ben,x=df$Year_Collected,
     main="Ben's Extractions",ylab="DNA Concentration",xlab="YEAR")
dev.off()

jpeg("./Exam_1/JACOB_JAMES_Plot1.jpeg")
plot(y=df$DNA_Concentration_Katy,x=df$Year_Collected,
     main="Katy's Extractions",ylab="DNA Concentration",xlab="YEAR")
dev.off()

#Part 4
#in which extraction YEAR, was Ben's performance the lowest RELATIVE TO Katy's performance?

summary(df$DNA_Concentration_Katy)[6]
summary(df$DNA_Concentration_Ben)[1]

df %>% group_by(Year_Collected) %>%


#Part 5
#Subset the data frame so it's just the "Downstairs" lab.
#Now, make a scatterplot of the downstairs lab data such that "Date_Collected" 
#is on the x-axis and "DNA_Concentration_Ben" is on the y-axis. 
#Save this scatterplot as "Ben_DNA_over_time.jpg" in your Exam_1 directory.

  
df %>% filter(Lab %in% c("Downstairs")




