
library(modelr)
library(broom)
library(dplyr)
library(fitdistrplus)
library(tidyr)
library(tidyverse)




# At last, your assignment!

#+ Make a new Rproj and Rscript in your personal Assignment_7 directory and work from there.
#+ Write a script that:

#  1.  loads the "/Data/mushroom_growth.csv" data set

dat <- read.csv("./Data/mushroom_growth.csv")


#2.  creates several plots exploring relationships between the response and predictors



mod1 = glm(formula = GrowthRate ~ Light, data = dat)
summary(mod1)

mod2 = glm(formula = GrowthRate ~ Light*Nitrogen, data = dat)
summary(mod2)

mod3 = aov(formula = GrowthRate ~ Light+Nitrogen, data = dat)
summary(mod3)

plot(dat$GrowthRate ~ dat$Light, data = dat)
abline(mod1)

plot(mod2)
abline(mod2)

plot(mod3)
abline(mod3)

#3.  defines at least 2 models that explain the **dependent variable "GrowthRate"**
#  + One must be a lm() and 
#+ one must be an aov()

mod1 = glm(formula = GrowthRate ~ Light, data = dat)

mod2 = glm(formula = GrowthRate ~ Light*Nitrogen, data = dat)

mod3 = aov(formula = GrowthRate ~ Light+Nitrogen, data = dat)

#4.  calculates the mean sq. error of each model
mean(mod1$residuals^2)
mean(mod2$residuals^2)
mean(mod3$residuals^2)

#5.  selects the best model you tried

mod2

#6.  adds predictions based on new values for the independent variables used in your model

dat2 = add_predictions(dat, mod2,type = "response")


#7.  plots these predictions alongside the real data

p1 <- ggplot(dat2, aes(x=Light,color=Species)) +
  geom_point(aes(y=Nitrogen),alpha=.5,size=2) +
  geom_point(aes(y=pred),color="black") + theme_bw()
p1

p1 + geom_segment(aes(y=Nitrogen,xend=Light,yend=pred),
                  linetype=2,color="black",alpha=.5)

#that graph makes no sense



#+ Upload responses to the following as a numbered plaintext document to Canvas:
#  1.  Are any of your predicted response values from your best model scientifically meaningless? Explain.
#2.  In your plots, did you find any non-linear relationships?  If so, do a bit of research online and give a link to at least one resource explaining how to deal with this in R
