#setwd('~/Msc/Sem 1/DBMS/DBMS-Codes')
source('closure.r')

check_extraneous <- function(attr,row,data,side = "right"){
  value = FALSE
  if(side == "left"){
    cof <- remove_char(attr,data[row,'V1'])
    closure <- find_closure(cof,data)
    if(search_attr(data[row,'V2'],closure)){
      value = TRUE
    }
  }else{
    cof <- data[row,'V1']
    check <- data[row,'V2']
    new_fd <- c(data[row,'V1'],remove_char(attr,data[row,'V2']))
    data <- data[-row,]
    data <- rbind(data,new_fd)
    closure <- find_closure(cof,data)
    if(search_attr(check,closure)){
      value = TRUE
    }
  }
  return(value)
}

#Minimal Cover
minimal_cover <- function(data){
  data <- combine_fd(data) #In function.r
  nofd <- nrow(data)
  
  #Checking For LHS
  loop_condition <- TRUE
  i <- 1
  while(loop_condition){
    
    #Checking Extraneous on Left-Hand Side
    nocl <- nchar(data[i,'V1'])
    j <- 1
    while(nocl != 1){
      attr <- substr(data[i,'V1'],j,j)
      if(check_extraneous(attr,i,data,"left")){
        data[i,'V1'] <- remove_char(attr,data[i,'V1'])
        nocl <- nocl - 1
      }
      j <- j + 1
    }
    
    #Checking Extraneous on Right-Hand Side
    nocr <- nchar(data[i,'V2'])
    j <- 1
    while(nocr != 1){
      attr <- substr(data[i,'V2'],j,j)
      if(check_extraneous(attr,i,data)){
        data[i,'V2'] <- remove_char(attr,data[i,'V2'])
        nocr <- nocr - 1
      }
      j <- j + 1
    }
    data <- unique(data)
    nofd <- nrow(data)
    i <- i + 1
    if(i > nofd)
      loop_condition <- FALSE
  }
  return(data)
}