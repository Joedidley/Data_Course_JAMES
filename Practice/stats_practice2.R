


?rnorm
?rbinom
?runif


set.seed(123)
a <- rnorm(10,mean = 0, sd =1)
a
b <- rnorm(10,mean = 5,sd=1)
b

hist(a)
hist(b)

df <- data.frame(a=a,b=b) %>% gather(key=object,value=value,1:2)

ggplot(df,aes(x=value,fill=object)) + geom_density(alpha=0.5)
pnorm(7,mean=5,sd=1,lower.tail = FALSE) #calculates the area under a curve in a normal distribution

t.test(a,b)
#t test gives p value that gives us the percent change of us being right (that the null hypothesis was right)
#null hypothesis assumes the graphed variables are the same

getwd()
filesnames <- list.files(recursive = TRUE,pattern = ".fastq")


