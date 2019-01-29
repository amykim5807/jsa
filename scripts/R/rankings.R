#install.packages('readstata13')
library(readstata13)
library(ggmap)
source('helper.R')

#Importing Raw Data
data <- read.dta13("appendix_summary.dta")
data <- data[,-c(1,15,19)]

#Ranking Raw Data
for (stat in c('college','house','comm','crime','ugrad','grad','pop2564','patent')){
  raw <- paste(stat,'app',sep='_')
  rank <- paste(stat,'rank', sep='_')
  
  #Rank in ascending order for housing prices and crime stats
  if ((stat == 'house') | (stat == 'crime')){
    temp <- rank(data[[raw]],ties.method='min')
  }
  else{
    temp <- rank(-data[[raw]],ties.method = 'min') 
  }
  data[[rank]] <- temp
}

#Ranking MSAs
data$raw_rank <- (1/12)*(data$grad_rank + data$college_rank + data$ugrad_rank + data$patent_rank) +
  (1/3)*data$pop2564_rank + (1/9)*(data$comm_rank + data$house_rank + data$crime_rank)
data$overall_rank <- rank(raw_rank,ties.method='min')

#Retrieving and attaching longitude and latitude data for all MSAs
new_loc <- unlist(lapply(as.character(data$msa)[1:nrow(data)],correct_loc))
loc <- geocode(new_loc,source='dsk')
data$Longitude <- loc$lon
data$Latitude <- loc$lat

#### EXPORTING DATA ####
#Writing into new csv
write.csv(data,'reranked.csv')
#write.dta(data,'reranked.dta')