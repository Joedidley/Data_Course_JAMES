library(tidyverse)

df <- read.delim("./Data/ITS_mapping.csv")

glimpse(df)
table(df$Ecosys_Type)
table(df$Host_Type)


#subset df to just Aerial and Marine      Ecosystem_Type






#ALL 3 ARE WAYS TO SUBSET DATA
#1:
df2 <- subset(df,Ecosystem_Type== "Aerial")
#2:
df[df$Ecosys_Type %in% c("Aerial","Marine"),]
#3:
#tidyverse (probably best to just learn this way)
df %>% filter(Ecosys_Type %in% c("Aerial","Marine"))

#then need to save it

df2 <-df %>% filter(Ecosys_Type %in% c("Aerial","Marine"))


summary(df)
summary(df$Lat)
#what if i want to extract the mean from the data in Lat?

summary(df$Lat)[3] #3 because its the third value given
summary(df$Lat)[c(3,5)] #mean and third quart

#saving the plot
jpeg("./Code.jpg")
plot(df2$Lat,df2$Lon)
dev.off()

#HOW TO CHANGE FACTOR TO A CHARACTER 
class(df$Ecosystem) #see that it's a factor
as.character(df$Ecosystem) #change the data to character
df$Ecosystem <- as.character(df$Ecosystem) #save the character by assigning it
class(df$Ecosystem) #check that it's now a character


#subset of Marine vs subset of Terrestrial 
#number of samples in each, and mean Lat of each

df %>% filter(Ecosys_Type %in% c("Marine","Terrestrial"))

df3 <- df %>% filter(Ecosys_Type %in% c("Marine","Terrestrial"))

df3 %>% group_by(Ecosys_Type) %>% 
  summarise(X=n(),Y=mean(Lat))



summary(df3$Lat)[c(7,4)]

#ZAHN example of above

mean(df$Lat)

notnarows <- which(!is.na(df$Lat))
df <- df[notnarows,]


# df[is.na(df$Lat),] <- 0 #changes the "NA" values to 0, so we can get mean

df %>% group_by(Ecosys_Type) %>%
  summarize(NumberOfSamples = n(),
            Mean_Lat = mean(Lat)) %>%
  filter(Ecosys_Type != "Aerial") #removing
  
  filter(Ecosys_Type %in% c("Marine","Terrestrial")) #including

#make subsets
marine <- df3 %>% filter(Ecosys_Type == "Marine")
terrestrial <- df3 %>% filter(Ecosys_Type == "Terrestrial")

# plot histograms
hist(marine$Lat)
hist(terrestrial$Lat)


both <- df3 %>% filter(Ecosys_Type %in% c("Marine","Terrestrial"))

hist(both$Lat)


#find mean and length of each subset
a <- mean(marine$Lat)
b <- length(marine$Lat)

c <- mean(terrestrial$Lat)
d <- length(terrestrial$Lat)

data.frame(MeanLat = c(a,c),
           SampleNumberc(b,d))
