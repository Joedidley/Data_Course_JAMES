
library(modelr)
library(broom)
library(dplyr)
library(fitdistrplus)
library(tidyr)
library(tidyverse)
library(GGally)
library(sjPlot)




# At last, your assignment!

#+ Make a new Rproj and Rscript in your personal Assignment_7 directory and work from there.
#+ Write a script that:

#  1.  loads the "/Data/mushroom_growth.csv" data set

dat <- read.csv("./Data/mushroom_growth.csv")


#2.  creates several plots exploring relationships between the response and predictors

ggpairs(dat)


dat$Light <- as.numeric(dat$Light)
dat$Temperature <- as.numeric(dat$Temperature)
dat$Nitrogen <- as.numeric(dat$Nitrogen)
dat$Species <- as.integer(dat$Species)


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

cortest <- cor.test(dat$GrowthRate, as.numeric(dat$Light))
cortest$p.value; cortest$conf.int

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

summary(lm(mod1))$r.squared
summary(lm(mod2))$r.squared
summary(lm(mod3))$r.squared

#5.  selects the best model you tried

mod2

#6.  adds predictions based on new values for the independent variables used in your model

dat2 = add_predictions(dat, mod2,type = "response")


#7.  plots these predictions alongside the real data



add_predictions(dat2,mod2) %>%
  ggplot(aes(x=Light,aplha=0.5)) +
  geom_point(aes(y=pred),color="Red",shape=1,size=2) +
  geom_point(aes(y=GrowthRate,color=Nitrogen))

#the red are the predictions



#+ Upload responses to the following as a numbered plaintext document to Canvas:
#  1.  Are any of your predicted response values from your best model scientifically meaningless? Explain.
#2.  In your plots, did you find any non-linear relationships?  If so, do a bit of research online and give a link to at least one resource explaining how to deal with this in R
