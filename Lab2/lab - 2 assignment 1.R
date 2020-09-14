### lab 2 assignment 1 

library(dplyr)
library(plotly)
library(ggplot2)
#import data

olives_data <- read.table("olive.csv",header = TRUE,quote = "/")
olive
#question 1 

graph1 <- ggplot(data = olive,aes( x= olive$palmitic, y= olive$oleic,color= olive$linoleic))+
  geom_point()+
  labs(title ="Dependency of palmitic on oleic",x="palmitic",y="oleic")
print(graph1)

intervaldata <- cut_interval(olive$linoleic,3)
graph2 <- ggplot(data = olive,aes( x= olive$palmitic, y= olive$oleic,color=intervaldata))+
  geom_point()

##question 2 

graph3 <- ggplot(data = olive,aes( x= olive$palmitic, y= olive$oleic,color=intervaldata))+
          geom_point()


graph3<-  ggplot(data = olive,aes(x=olive$palmitic,y=olive$oleic,size=as.numeric(intervaldata)))+
          geom_point()
graph3


graph5 <-  ggplot(data = olive,aes(x=palmitic,
                                   y=oleic,
                                   geom_spoke(Linoleic_interval_data)))+
    geom_point()
graph5


df <- expand.grid(x = 1:10, y=1:10)
df$angle <- runif(100, 0, 2*pi)
df$speed <- runif(100, 0, sqrt(0.1 * df$x))

ggplot(df, aes(x, y)) +
  geom_point() +
  geom_spoke(aes(angle = angle), radius = 0.5)
##question3 

graph6<- ggplot(data = olive,aes(x= olive$oleic ,y= olive$eicosenoic,color = olive$Region))+
  geom_point()
graph6

#converting numeric data into categorical data 

catregion <- cut(olive$Region, breaks = c(0,1,2,3),labels = c("North","South","Sardinia islands"))

graph7 <-  ggplot(data = olive,aes(x= olive$oleic ,y= olive$eicosenoic,color = catregion))+
  geom_point()
graph7



### question4 

intervaldata2 <- cut_interval(olive$linoleic,3)
intervaldata3 <- cut_interval(olive$palmitic,3)
intervaldata4 <- cut_interval(olive$palmitoleic,3)
graph8 <-  ggplot(data = olive ,aes(x=olive$oleic,y=olive$eicosenoic,
                                    color = intervaldata2,
                                    shape =intervaldata3,
                                    size = intervaldata4 ))+
  geom_point()
graph8




###question 5 


graph9 <-  ggplot(data = olive,aes(x= olive$oleic ,y= olive$eicosenoic,color =Region,
                                   shape = palmitic_class_data,
                                   size = as.numeric(palmitoleic_class_data)))+
  geom_point()
graph9
  
###question 6 

graph10 <- plot_ly(data = olive , type='pie',labels = ~olive$Area,values = olive)
graph10

## question 7 



graph11 <- ggplot(data = olive,aes(x=olive$linoleic,y= olive$eicosenoic))+
  geom_point()+
    geom_density_2d()
graph11

