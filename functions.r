#Remove Characters
remove_char <- function(elements,x){
  for(j in strsplit(elements,'')[[1]]){
    x <- gsub(j,'',x) #Check weather the given character is in the possible x and if so replace it
  }
  return(x)
}

#Search weather LHS exsists in the current Closure
search_attr <- function(x,data){
  condition = TRUE
  for(i in 1:nchar(data)){
    if(x == ''){break}
    if(!grepl(substr(x,1,1),data)){
      condition = FALSE
      break
    }
    x <- substr(x,2,nchar(x))
  }
  if(x != '')
    condition = FALSE
  return(condition)
}


#Check weather one FD is a subset of another FD
check_subset <- function(superset,subset){
  condition = TRUE
  for(i in 1:nrow(subset)){
    temp <- find_closure(subset[i,'V1'],superset)
    if(!search_attr(subset[i,'V2'],temp)){
      condition = FALSE
      break
    }
  }
  return(condition)
}

# Combining FD's with Common LHS
combine_fd <- function(data){
  nofd <- nrow(data)
  loop_condition = TRUE
  i <- 1
  while(loop_condition){
    common <- c()
    for(j in 1:nofd){
      if(data[j,'V1'] == data[i,'V1']){
        common <-append(common,j)
      }
    }
    temp <- strsplit(paste(data[common,'V2'],collapse = ""),'')[[1]]
    temp <- temp[!duplicated(temp)]
    add <- c(data[i,'V1'],paste(temp,collapse = ''))
    data <- data[-common,]
    data <- rbind(data,add)
    nofd <- nrow(data)
    i <- i + 1
    if(i > nofd)
      loop_condition = FALSE
  }
  return(data)
}

#Find all Attributes possible using FD's
find_attr <- function(input){
  temp <- paste(paste(input[,'V1'],collapse = ''),paste(input[,'V2'],collapse = ''),sep = '')
  temp <- strsplit(temp,'')[[1]]
  temp <- temp[!duplicated(temp)]
  attr <- paste(sort(temp),collapse = '')
  return(attr)
}
