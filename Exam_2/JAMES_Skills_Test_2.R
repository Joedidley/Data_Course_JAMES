#exam 2

#I.      Load the landdata-states.csv file into R
library(tidyverse)
landdata_states <- read.csv("Exam_2/landdata-states.csv")

#Re-create the graph shown in "fig1.png"
names(landdata_states) <- c("State","Region","Date","Home.Value",
                            "Structure.Cost","Land Value (USD)",
                            "Land.Share..Pct","Home.Price.Index",
                            "Land.Price.Index","Year","Qrtr")
options(scipen = 999)
ggplot(landdata_states,aes(x=Year,y=`Land Value (USD)`,color=Region))+ 
  geom_smooth() + theme_minimal()


#Export it to your Exam_2 folder as LASTNAME_Fig_1.jpg (note, that's a jpg, not a png)
        #To change the y-axis values to plain numeric, add options(scipen = 999) to your script

jpeg("./Exam_2/JAMES_Fig_1.jpg") 
ggplot(landdata_states,aes(x=Year,y=`Land Value (USD)`,color=Region))+ 
  geom_smooth() + theme_minimal()
dev.off() 

        
#II.     What is "NA Region???"
        #Write some code to show which state(s) are found in the "NA" region          
# The NA Region is for D.C (District of Columbia) or Washington D.C. 
# D.C. is technically not a part of the 50 states, but apart of Maryland and Virginia
summary(landdata_states$Region)

landdata_states %>% filter(State %in% c("MD","VA"))


#III.    The rest of the test uses another data set. The unicef-u5mr.csv data. Get it loaded and take a look.
        #It's not exactly tidy. You had better tidy it!

unicef <- read.csv("Exam_2/unicef-u5mr.csv")
summary(unicef)
names(unicef)

long <- gather(unicef,key = Year,value = MortalityRate,2:67)
long$Year <- str_remove(long$Year, "U5MR.")
long$Year <- as.numeric(long$Year)
class(long$Year)

                                            
#IV.     Re-create the graph shown in fig2.png
ggplot(long,aes(x=Year,y=MortalityRate,color=Continent)) + geom_point() + theme_minimal()



#Export it to your Exam_2 folder as LASTNAME_Fig_2.jpg (note, that's a jpg, not a png)
jpeg("./Exam_2/JAMES_Fig_2.jpg") 
ggplot(long,aes(x=Year,y=MortalityRate,color=Continent)) + geom_point() + theme_minimal()
dev.off() 


#IV.     Re-create the graph shown in fig3.png
  #Note: This is a line graph of average mortality rate over time for each continent 
  #(i.e., all countries in each continent, yearly average), this is NOT a geom_smooth() 


long2 <- aggregate(MortalityRate ~ Year + Continent, long, mean)

ggplot(long2,aes(x=Year,y=MortalityRate,color=Continent)) + geom_line(size=2.5) + theme_minimal() +
  labs(y="Mean Mortality Rates (deaths per 100 live births)") 
                                                       
#Export it to your Exam_2 folder as LASTNAME_Fig_3.jpg (note, that's a jpg, not a png)
jpeg("./Exam_2/JAMES_Fig_3.jpg") 
ggplot(long2,aes(x=Year,y=MortalityRate,color=Continent)) + geom_line(size=2.5) + theme_minimal() +
  labs(y="Mean Mortality Rates (deaths per 100 live births)") 
dev.off()


#V.      Re-create the graph shown in fig4.png
  #Note: The y-axis shows proportions, not raw numbers
  #This is a scatterplot, faceted by region

SmallMortality <-  long$MortalityRate /1000
p2 <- ggplot(long,aes(x=Year,y=SmallMortality)) + labs(y="Mortality Rate") + geom_point(size=0.2,color="blue") + theme_minimal()

p2 + facet_wrap(~ Region) + theme(legend.position = "none", 
      strip.text.x = element_text(size = 7.5, face="plain"),
      strip.background = element_rect(fill = "white"))


  #Export it to your Exam_2 folder as LASTNAME_Fig_3.jpg (note, that's a jpg, not a png)
jpeg("./Exam_2/JAMES_Fig_4.jpg")
p2 + facet_wrap(~ Region) + theme(legend.position = "none", 
      strip.text.x = element_text(size = 7.5, face="plain"),
      strip.background = element_rect(fill = "white"))
dev.off()


#VI.		Commit and push all your code and files to GitHub. 
  #I'll pull your repository at 9:30pm sharp and grade what I find.
                                                                                                              