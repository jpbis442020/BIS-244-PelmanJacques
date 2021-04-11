library(tidyverse)
library(readr)
library(dplyr)
library(gapminder)
library(socviz)
library(ggplot2)
library(ggrepel)
library(here)
us_counties <- read_csv("covid-19-data/us-counties.csv")
Pa<- us_counties %>% filter(state == "Pennsylvania")
pacurrentdate<- Pa[Pa$date == max(Pa$date),]
paplot <- ggplot(data= pacurrentdate, mapping = aes(x= cases, y= deaths, label = county))


paplot<- paplot + geom_point()+
  geom_smooth(method = "lm", se = FALSE)+
  geom_text_repel() +
  labs(x= "cases", y= "deaths",
         title= "COVID-19 Deaths VS Cases For PA")

paplot