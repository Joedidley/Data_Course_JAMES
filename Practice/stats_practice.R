


#Stepwise 

library(MASS)
library(tidyverse)
library(modelr)

?stepAIC()

data("mtcars")

fullmodel <- lm(data=mtcars, mpg ~ factor(cyl) + disp + hp + drat + wt + qsec + 
                  factor(vs) + factor(am) + factor(gear) + factor(carb))
step <- stepAIC(fullmodel)

step$call #gives us the best model it gave in stepAIC

goodmodel <- step$call #now we can  just use the good model
goodmodel <- lm(formula = mpg ~ factor(cyl) + hp + wt + factor(am), data = mtcars)


mtcars %>% add_predictions(goodmodel)
#now we split the data in half

set.seed(123)
set <- caret::createDataPartition(mtcars$mpg)
set <- set$Resample1

train <- mtcars[set,]
test <- mtcars[-set,]

formula(goodmodel)
trainedmodel <- lm(data=train, formula = formula(goodmodel))

add_predictions(test,trainedmodel) %>% 
  ggplot(aes(x=hp,color=factor(cyl))) +
  geom_point(aes(y=mpg)) + geom_smooth(method="lm", aes(y=pred))



