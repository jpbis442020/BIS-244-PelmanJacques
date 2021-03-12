library(tidyverse)
library(readr)
PRESIDENT_precinct_primary <- read_csv("PRESIDENT_precinct_primary.csv/PRESIDENT_precinct_primary.csv")
PRESIDENT_precinct_primary$votes<-as.numeric(PRESIDENT_precinct_primary$votes)
#PRESIDENT_precinct_primary$party_simplified<-as.factor(PRESIDENT_precinct_primary$party_simplified)
PRESIDENT_precinct_primary$state<-as.factor(PRESIDENT_precinct_primary$state)
simpdata<-PRESIDENT_precinct_primary %>% select(party_simplified, votes, state)

for(i in 1:641839){
  if (is.na(simpdata$party_simplified[i]))
    {
    simpdata$party_simplified[i]="OTHER"
  }
}
simpdata$party_simplified<-as.factor(simpdata$party_simplified)
simpdata$state<-as.factor(simpdata$state)
simpdata$votes<-as.numeric(simpdata$votes)
#str(simpdata$votes)

library(dplyr)
simpdata <- group_by(simpdata, state, party_simplified)
COUNTS1 <- summarise(simpdata, votes = sum(votes))
COUNTS1<- mutate(COUNTS1, party_simplified= replace(party_simplified, party_simplified=="LIBERTARIAN","OTHER"))
COUNTS1<- mutate(COUNTS1, party_simplified= replace(party_simplified, party_simplified=="GREEN","OTHER"))
COUNTS1<- mutate(COUNTS1, party_simplified= replace(party_simplified, party_simplified=="INDEPENDENT","OTHER"))
COUNTS1<- mutate(COUNTS1, party_simplified= replace(party_simplified, party_simplified=="NONPARTISAN","OTHER"))
COUNTS1<- mutate(COUNTS1, party_simplified= replace(party_simplified, party_simplified=="DEMOCRATIC","DEMOCRAT"))
#COUNTS1<- mutate(COUNTS1, party_simplified= replace(party_simplified, party_simplified=="REPUBLICAN","1.REPUBLICAN"))
View(COUNTS1)



library(gapminder)
library(socviz)
library(ggplot2)
p<- ggplot(data = COUNTS1,
           mapping = aes (x=state,
                          y= votes,
                          ))
p<-p+geom_point(mapping = aes (color=party_simplified))+ scale_y_binned()
p<-p+labs(x= "Name of State",
          y= "# of votes",
          title="2020 election votes")
p