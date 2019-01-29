setwd("~/git/jsa")

library(ggmap)
source('scripts/R/helper.R')

#### DATA IMPORT ####
#Importing Raw Data
data <- read.csv("data/appendix_edited.csv")
raw <- read.csv("data/areacompare.csv")

#Renaming Columns, deleting first row
colnames(raw) <- c('Year','MSA code',	'MSA','closest MSA in hours','Total Population', 'Working Age Population','Percent College Grad','Top 20 Grad Programs','Ugrads to Top 20 per Year','House Price', '% Commute < 30 minutes','Viol Crime per 1000',
                              'Patent /1000 work', 'Kauffman','Site selection', 'Total Sq Feet', 'Underused Sq Feet','acres land','ToRemove','Top 50 Grad programs','govt at univ R&D per capita')
raw <- raw[-c(1), ]
raw$ToRemove <- NULL

# #Adding data on pairs and triangles
# grouped <- read.csv("potentialmatches.csv")
# colnames(grouped) <- c('Year','MSA code',	'MSA','closest','Total Population', 'Working Age Population','Percent College Grad','Top 20 Grad Programs','Ugrads to Top 20 per Year','House Price', '% Commute < 30 minutes','Viol Crime per 1000',
#                    'Patent /1000 work', 'Kauffman','Site selection', 'Total Sq Feet', 'Underused Sq Feet','acres land','ToRemove','Top 50 Grad programs','govt at univ R&D per capita')
# grouped <- grouped[-c(1),]
# grouped$ToRemove <- NULL
# 
# 
# grouped_nums <- within(grouped,rm(MSA,closest))
# insert = 1
# ind = 3
# start_ind = 3
# 
# while (ind < nrow(grouped)){
#   if (is.na(grouped$Year[ind])){
#     #grouped$MSA[insert] <- grouped_name(grouped$MSA[start_ind:ind-1])
#     ind = ind + 1
#     start_ind = ind + 1
#     insert = insert + 1
#   }
#   else{
#     ind = ind + 1
#   }
# }

#### NEW DATA FRAME ####
#Creating new data frame
MSA <- as.character(data$Place.Name)[1:nrow(data)]
cleaned <- data.frame(MSA,data$Population.25.64,data$Percent.College.Grad,data$Top.Science.Grad.Programs,data$Top.Science.Undergraduates,data$Patents.per.Worker,data$Average.House.Price,
                      data$Violent.Crimes.per.Capita,data$Commute.Less.than.30.min)

#Retrieving and attaching longitude and latitude data for top MSAs
new_loc <- unlist(lapply(MSA,correct_loc))
loc <- geocode(new_loc,source='dsk')
cleaned$Longitude <- loc$lon
cleaned$Latitude <- loc$lat

#Merging raw data with top 102 MSAs list --> CURRENTLY ONLY CONTAINS non-combined MSAs
merged <- merge(cleaned,raw,by.y="MSA",by.x="MSA",all.x=TRUE)

#### EXPORTING DATA ####
#Writing into new csv
write.csv(merged,'data/merged.csv')
