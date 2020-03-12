library(tidyverse)

data("diamonds")

glimpse(diamonds)
?diamonds





ggplot(diamonds,aes(y=price,x=carat)) + geom_hex(alpha=.25) +
  geom_smooth(method="lm",aes(color=clarity)) +
  coord_cartesian(ylim=c(0,20000)) +
                    facet_wrap(~cut)

#   price = y axis (dependent variable)
mod1 <- lm(data = diamonds, price ~ carat)
mod2 <- lm(data = diamonds, price ~ carat + clarity)


newdata <- data.frame(carat = c(2,2.1,2.2,2.3),
                      clarity = "I1")

predict(mod2,newdata = newdata)


summary(mod1)
summary(mod2)


beep(sound = "mario")

