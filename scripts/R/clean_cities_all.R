setwd("~/git/jsa")
library(ggmap)

#Importing Raw Data
data <- read.csv("data/areacompare.csv")
source('scripts/R/helper.R')
apikey <- "AhOEjpt6lpUWgRVwwNI7WfkXVbAt97SgCkNlc8dS-IgciqusrkvVWRUo3Z23mMe1"

#Renaming Columns, deleting first row and irrelevant columns
data <- data[-c(1),-c(1,2,4,19) ]
indices <- c('population','collegegrad','sciencegrad','scienceugrad','houseprice', 'commute','violentcrime','patents')
colnames(data) <- c('MSA','Total Population', indices, 'Kauffman','Site selection', 'Total Sq Feet', 'Underused Sq Feet','acres land','Top 50 Grad programs','govt at univ R&D per capita')

#Retrieving and attaching longitude and latitude data for all MSAs
new_loc <- unlist(lapply(as.character(data$MSA)[1:nrow(data)],correct_loc))
loc <- geocode(new_loc[1:10],source='dsk')

  

devtools::install_github("gsk3/taRifx.geo")
options(BingMapsKey=apikey)
#geocodeVect <- Vectorize(geocode, vectorize.args="location")
loc2 <- geocode("Abilene, TX", service="bing", returntype="coordinates")

data$Longitude <- loc$lon
data$Latitude <- loc$lat
# 
# for (ind in indices){
#   col <- paste(ind,'rank',sep='_')
#   temp <- order(data[[ind]])
#   data[[col]] <- temp
# }

#### EXPORTING DATA ####
#Writing into new csv
write.csv(data,'data/all_data_loc.csv')

