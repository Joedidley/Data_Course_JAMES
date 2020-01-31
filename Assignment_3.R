# Assignment Week 3
library(tidyverse)



# topics:   type conversions, factors, plot(), making a data frame from "scratch",
#           reordering, 


# vector operations!

vector1 = c(1,2,3,4,5,6,7,8,9,10)
vector2 = c(5,6,7,8,4,3,2,1,3,10)

vector1*vector2

list.files()

#this pulls certain data out of a file, and assigns it to the term 'dat'
dat = read.csv("./Data/thatch_ant.csv") #can do read.csv(Data/thatch_ant.csv) [the ./ just means where you are currently]
names(dat)



#why are these plots different???
plot(x=dat$Headwidth..mm., y=dat$Mass)
plot(x=dat$Size.class, y=dat$Mass)
#these plots are different because headwidth is numeric, but size.class is a factor

#check the classes of these vectors
class(dat$Headwidth..mm.)
class(dat$Size.class)

#this is for my own interest
class(dat$Mass) #also numeric

# plot() function behaves differently depending on classes of objects given to it!

# Check all classes (for each column in dat)
str(dat)

# Two of them are "Factor" ....why is the column "Headwidth" a factor? It looks numeric!

#the factor levels are different; we have 25.000 but also 21,20,10, etc


# we can try to coerce one format into another with a family of functions
# as.factor, as.matrix, as.data.frame, as.numeric, as.character, as.POSIXct, etc....

#make a numeric vector to play with:
nums = c(1,1,2,2,2,2,3,3,3,4,4,4,4,4,4,4,5,6,7,8,9)
class(nums) # make sure it's numeric

# convert to a factor (numeric to a factor)
as.factor(nums) # show in console
nums_factor = as.factor(nums) #assign it to a new object as a factor
class(nums_factor) # check it

#check it out
plot(nums) #this is numeric, and gives a scatter plot
plot(nums_factor) #this is factor, and gives a histogram
# take note of how numeric vectors and factors behave differently in plot()

# Let's modify and save these plots. Why not!?
?plot()
plot(nums, main = "My Title", xlab = "My axis label", ylab = "My other axis label")
plot(nums, main = "Head Width vs Time", xlab = "Head Width", ylab = "Size.class")

jpeg("headwidthplot.jpg")
plot(nums, main = "Head Width vs Time", xlab = "Head Width", ylab = "Size.class")
dev.off()



# back to our ant data...
dat$Headwidth #when it says LEVELS, it means factors, not numeric, which is a problem
levels(dat$Headwidth) # levels gives all the "options" of a factor you feed it

# I notice a couple weird ones in there: "" and "41mm"
# The "" means a missing value, basically. The "41mm" sure looks like a data entry error.
                                            # It should probably be "41.000"

# FIND WHICH ONES HAVE "41mm"
which(dat$Headwidth == "41mm") #returns line number for which are true, which is 1031
dat$Headwidth == "41mm"

#bad41 <-  which(dat$Headwidth == "41mm")
#dat$Headwidth[bad41] <- "41.000"



# CONVERT THOSE TO "41.000"
dat$Headwidth[dat$Headwidth =="41mm"] <- "41.000"


# DO THE SAME FOR "", BUT CONVERT THOSE TO "NA"
dat$Headwidth[dat$Headwidth == ""] <- "NA"


# NOW, REMOVE ALL THE ROWS OF "dat" THAT HAVE AN "NA" VALUE
dat <- na.omit(dat) #putting the 'dat <- ' saves the na.omit(dat) command


# NOW, CONVERT THAT PESKY "Headwidth" COLUMN INTO A NUMERIC VECTOR WITHIN "dat"
levels(dat$Headwidth) #shows all possabilities
unique(dat$Headwidth) #shows what we fixed

factor(dat$Headwidth,levels = unique(dat$Headwidth))
dat$Headwidth <- factor(dat$Headwidth,levels = unique(dat$Headwidth))
levels(dat$Headwidth)


as.numeric(as.character(dat$Headwidth)) #same thing. turned it into a character first,
#making the 41.000 into a character instead of a factor, which can then be turned into a numeric
dat$Headwidth <- dat$Headwidth %>% as.character() %>% as.numeric() #same thing(tidyverse)


#as.numeric(dat$Headwidth) this wont work, need to turn the factor into a character before we turn into numeric
dat$Headwidth_numeric = as.numeric(dat$Headwidth) #this creates a Headwidth_numeric
class(dat$Headwidth) #this is a factor
class(dat$Headwidth_numeric) #this is a numeric



plot(dat$Headwidth,dat$Mass) #this will give scatter plot now since both--
#--since both headwidth and mass are NUMERIC 

# LET'S LEARN HOW TO MAKE A DATA FRAME FROM SCRATCH... WE JUST FEED IT VECTORS WITH NAMES!

# make some vectors *of equal length* (or you can pull these from existing vectors)
col1 = c("hat", "tie", "shoes", "bandana")
col2 = c(1,2,3,4)
col3 = factor(c(1,2,3,4)) # see how we can designate something as a factor             

# here's the data frame command:
data.frame(Clothes = col1, Numbers = col2, Factor_numbers = col3) # colname = vector, colname = vector....
df1 = data.frame(Clothes = col1, Numbers = col2, Factor_numbers = col3) # assign to df1
df1 # look at it...note column names are what we gave it.

dat$Mass
plot(y=dat$Mass,x=dat$Size.class)

under30_mass <- dat %>% filter(Size.class == "<30") %>%
  select((Mass))

class(under30_mass$Mass)
mean(under30_mass$Mass)


# Make a data frame from the first 20 rows of the ant data that only has "Colony" and "Mass"
# save it into an object called "dat3"


dat3 <- dat[1:20,c("Colony","Headwidth")]

write.csv(dat3, "dat3.csv")

###### WRITING OUT FILES FROM R #######
?write.csv()




# Write your new object "dat3" to a file named "LASTNAME_first_file.csv" in your PERSONAL git repository
write.csv(dat3, "JAMES_first_file.csv")




### for loops in R ###

#simplest example:
for(i in 1:10){
  print(i+10)
}

#another easy one
for(i in levels(dat$Size.class)){
  print(i)
}

# can calculate something for each value of i ...can use to subset to groups of interest
for(i in levels(dat$Size.class)){
  print(mean(dat[dat$Size.class == i,"Mass"]))
}

# more complex:
# define a new vector or data frame outside the for loop first
new_vector = c() # it's empty
# also define a counter
x = 1




for(i in levels(dat$Size.class)){
  new_vector[x] = mean(dat[dat$Size.class == i,"Mass"])
  x = x+1 # add 1 to the counter (this will change the element of new_vector we access each loop)
}
  
#check it
new_vector



# PUT THIS TOGETHER WITH THE LEVELS OF OUR FACTOR SO WE HAVE A NEW DATA FRAME:
# FIRST COLUMN WILL BE THE FACTOR LEVELS....
# SECOND COLUMN WILL BE NAMED "MEAN" AND WILL BE VALUES FROM  new_vector

#fill it in
size_class_mean_mass = data.frame(...)

size_class_mean_mass = data.frame(SizeClass=levels(dat$Size.class),
                                  MEAN=new_vector,
                                  abcs=letters[1:6])

#this is another way to do it
dat %>% group_by(Size.class) %>%
  summarize(MEAN = mean(Mass))

#another example, with more variables
dat %>% group_by(Size.class) %>%
  summarize(firstvariablename = mean(Mass),
            secondaskoehfow = mean(Headwidth),
            medianheadwidth = median(Headwidth))

#if you want to save it, add "datsummary <- "

datsummary <- dat %>% group_by(Size.class) %>%
  summarize(firstvariablename = mean(Mass),
            secondaskoehfow = mean(Headwidth),
            medianheadwidth = median(Headwidth))

#write.csv(d,"Assignments/Assignment3,"my thing"")
#^^^example of saving downstream (into further files)


#ADDITIONAL PRACTTICE
#data("iris")
#iris %>% group_by(Species) %>%
  #summarize(MeanSepLength = mean(Sepal.Length))



############ YOUR HOMEWORK ASSIGNMENT ##############

# 1.  Make a scatterplot of headwidth vs mass. See if you can get the points to be colored by "Colony"
plot(y=dat$Headwidth, x=dat$Mass, col=dat$Colony, pch=20,
     main = "Headwidth vs Mass", ylab = "Headwidth", xlab = "Mass")

# 2.  Write the code to save it (with meaningful labels) as a jpeg file


#how to save a plot. You can save it to anywhere by putting relative file path 
jpeg("HeadwidthVsMassPlot.jpg") #opens connection on a file to your computer
plot(y=dat$Headwidth, x=dat$Mass, col=dat$Colony, pch=20,
     main = "Headwidth vs Mass", ylab = "Headwidth", xlab = "Mass")
dev.off() #closes and writes that file you opened



# 3.  Subset the thatch ant data set to only include ants from colony 1 and colony 2
dat %>% filter(Colony %in% c(1,2))
datC1C2 <- dat %>% filter(Colony %in% c(1,2))

# 4.  Write code to save this new subset as a .csv file
write.csv(dat,file="assignment3.csv")

# 5.  Upload this R script (with all answers filled in and tasks completed) to canvas
      # I should be able to run your R script and get all the plots created and saved, etc.

getwd()
