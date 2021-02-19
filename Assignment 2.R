install.packages("dplyr")
library(dplyr)
pelmanjacrepo<-getwd()
setwd("./covid-19-data")
usstates<-read.csv("us-states.csv")
setwd(pelmanjacrepo)
#install.packages("dplyr")
#library(dplyr)
usstates<-plyr::arrange(usstates, state)
penn<- subset(usstates, state=="Pennsylvania")
penn$adj_death <- penn[,5]
penn["2020-04-21","adj_death"]=1338
penn["2020-04-22","adj_death"]=2583
deathsadj<- sum(penn$adj_death)
print(deathsadj)