library(ggmap)

#Importing Raw Data
data <- read.csv("areacompare.csv")
source('helper.R')

#Renaming Columns, deleting first row and irrelevant columns
data <- data[-c(1),-c(1,2,4,19) ]
indices <- c('population','collegegrad','sciencegrad','scienceugrad','houseprice', 'commute','violentcrime','patents')
colnames(data) <- c('MSA','Total Population', indices, 'Kauffman','Site selection', 'Total Sq Feet', 'Underused Sq Feet','acres land','Top 50 Grad programs','govt at univ R&D per capita')

#Retrieving and attaching longitude and latitude data for all MSAs
new_loc <- unlist(lapply(as.character(data$MSA)[1:nrow(data)],correct_loc))
loc <- geocode(new_loc,source='dsk')
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
write.csv(data,'all_data_loc.csv')

