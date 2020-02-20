 ## **For credit...**
  
#1.  Push a completed version of your Rproj and R-script (details at end of this assignment) to GitHub
#2.  Your score will also depend on whether any files generated in this workflow are found in your repository
#3.  Upload a copy of your hp_maximums.txt file to Canvas (see task 11 below)


# Your task is to Write an R script that:

#1.  loads the mtcars data set
#2.  subsets the mtcars dataframe to include only **automatic transmissions**
#3.  saves this new subset as a new file called "automatic_mtcars.csv" in your Assignment_5 directory
#4.  plots the effect of horsepower on miles-per-gallon (update plot to have meaningful labels and title)
#5.  saves this plot as a png image called "mpg_vs_hp_auto.png" in your Assignment_5 directory
#6.  plots the effect of weight on miles-per-gallon (with improved labels, again)
#7.  saves this second plot as a **tiff** image called "mpg_vs_wt_auto.tiff" in your Assignment_5 directory
#8.  subsets the original mtcars dataframe to include only cars with displacements less than or equal to 200 cu.in.
#9.  saves that new subset as a csv file called mtcars_max200_displ.csv
#10. includes code to calculate the maximum horsepower for each of the three dataframes (original, automatic, max200)
#11. prints these calculations (from task 10) in a readable format to a new plaintext file called hp_maximums.txt




#step 1
data("mtcars")
library(knitr)
library(tidyverse)

#step 2

str(mtcars)
automatic_mtcars <- mtcars %>% filter(am %in% c("0"))

#step 3

write.csv(automatic_mtcars, "./Assignments/Assignment_6/automatic_mtcars.csv",quote = FALSE,row.names = FALSE)

#step 4

ggplot(automatic_mtcars,aes(x=mpg,y=hp)) +
  geom_point(aes(color=factor(cyl)),size=2) +
  geom_smooth(method="lm") +
  labs(x="mpg",y="hp",title="mpg vs hp")

#step 5

png("./Assignments/Assignment_6/mpg_vs_hp_auto.png")
ggplot(automatic_mtcars,aes(x=mpg,y=hp)) +
  geom_point(aes(color=factor(cyl)),size=2) +
  geom_smooth(method="lm") +
  labs(x="mpg",y="hp",title="mpg vs hp")
dev.off()

#step 6

ggplot(automatic_mtcars,aes(x=mpg,y=wt)) +
  geom_point(aes(color=factor(cyl)),size=2) +
  geom_smooth(method="lm") +
  labs(x="mpg",y="wt",title="mpg vs weight")

#step 7

tiff("./Assignments/Assignment_6/mpg_vs_wt_auto.tiff")
ggplot(automatic_mtcars,aes(x=mpg,y=wt)) +
  geom_point(aes(color=factor(cyl)),size=2) +
  geom_smooth(method="lm") +
  labs(x="mpg",y="wt",title="mpg vs weight")
dev.off()

#step 8

mtcars_max_200 <- mtcars %>% filter(disp <= 200)

#step 9

write.csv(mtcars_max200_displ.csv,"./Assignments/Assignment_6/mtcars_max200_displ.csv",quote = FALSE,row.names = FALSE)

#step 10


origmax=max(mtcars$hp)
automax=max(automatic_mtcars$hp)
max200=max(mtcars_max_200$hp)
data.frame(Original = origmax,Automax = automax,Max200 = max200)




#step 11

#can also use write.csv()

sink("./Assignments/Assignment_6/hp_maximums.txt")
origmax=max(mtcars$hp)
automax=max(automatic_mtcars$hp)
max200=max(mtcars_max_200$hp)
data.frame(Original = origmax,Automax = automax,Max200 = max200)
sink(NULL)

#this saves as text:
#sink("./myfile.txt")
#dat
#sink(NULL)

