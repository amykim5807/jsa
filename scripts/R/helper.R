#### HELPER FUNCTIONS ####
#Helper Function to correct geospatial data
correct_loc <- function(loc){
  if (grepl('[A-Z]{2}-[A-Z]{2}',loc)){
    return (gsub('-[A-Z]{2}.*',', USA',loc))
  }
  else{
    return (loc)
  }
}

#Helper Function to merge pair/triangle MSA names (currently unused)
grouped_name <- function(names){
  MSAs <- vector('character',length = length(names))
  states <- vector('character',length = length(names))
  
  ind = 1
  for (name in names){
    div <- regexpr(', [A-Z][A-Z]',name)[[1]][1]
    MSAs[ind] <- substr(name,1,div-1)
    states[ind] <- substr(name,div+2,nchar(name))
    ind = ind + 1
  }
  result <- paste(paste(MSAs,collapse="/"),paste(unique(states),collapse='-'),sep=', ')
}