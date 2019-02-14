library(gdata)
setwd("~/git/jsa")

#Importing Raw Data
data <- read.xls("data/appendix_revision.xls")
data <- data[-c(1,2),]

#Helper Function for Getting State Names
get_states <- function(loc){
  return(strsplit(as.character(loc),', ')[[1]][2])
}

#Helper Function for Stripping State Names
strip_states <- function(loc){
  return(strsplit(as.character(loc),',')[[1]][1])
}

##Finding list of all states

# states <- vector(mode = 'character',length=200)
# count = 1
# for (msa in data$msa){
#   state <- strsplit(get_states(msa),'-')[[1]]
#   for (item in state){
#     states[count] <- item
#     count = count + 1
#   }
# }

#List of msas without states
msa_nostate <- sapply(unlist(data$Location.Name),strip_states)

#list of states
states <- sapply(unlist(data$Location.Name),get_states)

#Combined list with rankings
#msa_rank <- paste0(msa_nostate, " (", data$overall_rank,")")
msa_rank<-msa_nostate
app <- data.frame(data$Overall,msa_rank,states)

#Order by state then place, alphabetically
app_order <- app[order(app$states,app$msa_rank),]

#Export to csv
write.csv(app_order,'data/msas_by_state.csv',row.names = FALSE)

