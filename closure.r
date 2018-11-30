#Find Closure of Given Attribute
find_closure <- function(closure,data){
  loop_condition = TRUE
  possible_rows <- c()
  while(loop_condition){
    loop_condition <- FALSE
    delete <- c()
    for(i in 1:nrow(data)){
      if(search_attr(data[i,'V1'],closure)){
        loop_condition = TRUE
        possible_rows <- append(possible_rows,i)
        closure <- paste(closure,data[i,'V2'],sep = '')
        delete <- append(delete,i)
      }
    }
    if(!is.null(delete)){data <- data[-delete,]}
    if(nrow(data) == 0){loop_condition = FALSE}
  }
  #Removing Duplicates
  temp = strsplit(closure,'')[[1]]
  temp <- temp[!duplicated(temp)]
  closure <- paste(sort(temp),collapse = '')
  return(list("closure" = closure,"rows" = possible_rows))
}
