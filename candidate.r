#setwd('~/Msc/Sem 1/DBMS/DBMS-Codes')
source('closure.r')

#Candidate Key
keys <- function(attr,data,type = 'c'){
  all_keys <- c()
  noa <- nchar(attr)
  mkey <- attr
  for(i in 1:nrow(data)){
    mkey <- remove_char(data[i,'V2'],mkey) #In function.r
  }
  if(find_closure(mkey,data)$closure == attr){ #Find Closure of the calculated minimal key
    all_keys <- append(mkey,all_keys)
  }else{
    #print("check")
    i <- 1
    temp <- remove_char(mkey,attr)
    loop_condition <- TRUE
    while(loop_condition){
      pc = combn(strsplit(temp,'')[[1]],i)
      for(j in 1:ncol(pc)){
        permutation <- paste(pc[,j],collapse = '')
        key = paste(mkey,permutation,sep = '')
        if(find_closure(key,data)$closure == attr){
          all_keys <- append(key,all_keys)
          temp <- remove_char(permutation,temp)
        }
      }
      i <- i+1
      if(type == 'c'){
        if(length(all_keys) != 0)
            loop_condition <- FALSE
      }
      #check temp is equal to ==
      if(temp == ''){               
        loop_condition <- FALSE
      }
      if(i > noa){
        loop_condition <- FALSE
      }
      if(i > nchar(temp)){
        loop_condition <- FALSE
      }
    }
  }
  if(type == 'c')
    all_keys <- all_keys[1]
  return(all_keys)
}
