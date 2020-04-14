library(tidyverse)
df <- read.csv("./Exam_1/DNA_Conc_by_Extraction_Date.csv")

glimpse(df)
summary(df$DNA_Concentration_Ben)

#part 1
#create separate histograms of the DNA concentrations for Katy and Ben. 
#Make sure to add nice labels to these (x-axis and main title).
hist(df$DNA_Concentration_Ben,main="Ben",xlab="DNA Concentration",ylab="Frequency")
hist(df$DNA_Concentration_Katy,main="Katy",xlab="DNA Concentration",ylab="Frequency")

#part 2
#Your second task is to look at DNA concentrations from the different extraction years. 
#One way to do this is a separate figure for each student is demonstrated in those two files:	ZAHN_Plot1.jpeg and ZAHN_Plot2.jpeg 
#Open those files in some image viewing program and take a look. I'd like you to re-create these exactly, including the labels.
#This is tricky, so I'll give a hint: the plot() function behaves differently depending on the classes of vectors that are given to it.

class(df$Year_Collected) #integer
class(df$DNA_Concentration_Ben) #numeric


df$Year_Collected <- as.factor(df$Year_Collected) #change Year_Collected to factor
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

ben_vs_katy <- df$DNA_Concentration_Ben - df$DNA_Concentration_Katy
min(ben_vs_katy)
bens_worst_relative <- which(ben_vs_katy == min(ben_vs_katy))

df[bens_worst_relative, "Year_Collected"]

#Part 5
#Subset the data frame so it's just the "Downstairs" lab.
#Now, make a scatterplot of the downstairs lab data such that "Date_Collected" 
#is on the x-axis and "DNA_Concentration_Ben" is on the y-axis. 
#Save this scatterplot as "Ben_DNA_over_time.jpg" in your Exam_1 directory.

down <- df %>% filter(Lab == "Downstairs")

down$Date_Collected <- as.POSIXct(down$Date_Collected)

plot(y=down$DNA_Concentration_Ben,x=down$Date_Collected,
     main="Ben's Concentration Downstairs", ylab="DNA Concentration",
     xlab="Date Collected")

jpeg("./Exam_1/Ben_DNA_over_time.jpg")
plot(y=down$DNA_Concentration_Ben,x=down$Date_Collected,
     main="Ben's Concentration Downstairs", ylab="DNA Concentration",
     xlab="Date Collected")
dev.off()

summary(down$DNA_Concentration_Ben)
#Bonus
#20 pts BONUS - For Ben, which year's extractions had the highest *average* DNA
#concentration and what is it?
#(code for correct answer and correct file named "Ben_Average_Conc.csv")

data.frame <- df %>%
  group_by(Year_Collected) %>%
  summarise(avg = mean(DNA_Concentration_Ben))

df2 <- data.frame
print(df2)

write.csv(df2,"./Exam_1/Ben_Average_Conc.csv", row.names = TRUE)

#ANSWER
#2007 had the highest average at 1.46