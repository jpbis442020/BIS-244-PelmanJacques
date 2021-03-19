#Jacques Pelman Exam 1 Question 12
library(gapminder)
library(socviz)
library(ggplot2)
library(tidyverse)
library(readr)
AAPL <- read_csv("AAPL.csv")
simpdata<-AAPL %>% select(Date, Open, Close)
simpdata$CHANGE <- (simpdata$Open - simpdata$Close)
simpdata$UpDown <- simpdata$CHANGE > 0

p<- ggplot(data = simpdata,
           mapping = aes (x=Date,
                          y= CHANGE,
           ))+scale_fill_discrete(name = "UpDown", labels = c("Down", "Up","NA"))
p<-p+geom_point(mapping = aes (color=UpDown))
p<-p+labs(x= "03/19/2020 through 03/18/2021",
          y= "Change in adjusted Closing Price",
          title="Changes in the APPL Daily Prices over Last 5 Years")+ ylim(-11.25,11.25)

p


