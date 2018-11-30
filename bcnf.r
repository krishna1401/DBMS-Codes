#setwd('~/Msc/Sem 1/DBMS/DBMS-Codes')
source('candidate.r')
source('closure.r')

#Check wether there is super Dependency or Not
super_dependency <- function(lhs,super){
  condition = FALSE
  for(j in 1:length(super)){
    temp <- super[j]
    for(i in strsplit(lhs,"")[[1]]){
      temp <- sub(i,"",temp)
    }
    if((nchar(temp) == 0)){
      condition <- TRUE
      break
    }
  }
  return(condition)
}

#Update the rows of original Data Frame
update_fd <- function(original,updates){
  for(i in 1:nrow(updates)){
    for(j in 1:nrow(original)){
      if((updates[i,'V1'] == original[j,'V1']) && (updates[i,'V2'] == original[j,'V2'])){
        original[j,'V3'] = updates[i,'V3']
        break
      }
    }
  }
  return(original)
}

#Decomposing Relation
decompose_relation <- function(input,tables){
  #Removing FD's that do not voilate NF Rule
  temp <- input[input['V3']== (tables+1), ]
  loop_condition = TRUE
  rows = nrow(temp)
  while(loop_condition){
    
    #Row number of FD's that need to be separated
    closure <- find_closure(temp[1,'V1'],temp)$rows 
    update <- temp[closure,]
    temp <- temp[-closure,]
    
    #Updating the Fd's in Original FD's
    update_rows <- is.na(match(paste0(input$V1,input$V2),paste0(update$V1,update$V2)))
    input[update_rows == FALSE,'V3'] = tables + 1
    tables <- tables + 1
    
    #If no more updates required Terminate the loop
    if(nrow(temp) == 0)
      loop_condition = FALSE
  }
  #Return updated Fd's & Max Number of Tables formed
  return(list("input" = input,"tables" = tables))
}

#Checking weather Relation is in 2NF?
bcnf <- function(input){
  
  #Adding New Column to Define the Relation in which FD is after decomposition
  V3 = c(rep(1,nrow(input)))
  input <- cbind(input,V3)
  
  no_of_relation = 1;
  #Execute 2NF till all Relations are in 2NF
  loop_condition <- TRUE
  while(loop_condition){
    
    #Checking for all Decomposed Relations
    for(i in 1:no_of_relation){
      temp <- input[input['V3'] == i,]
      if(nrow(temp) > 0){
        two_nf = TRUE
        
        attr <- find_attr(temp)
        super <- keys(attr,temp,'s')
        for(j in 1:nrow(temp)){
          if(!super_dependency(temp[j,'V1'],super)){
            temp[j,'V3'] = no_of_relation + 1
            two_nf = FALSE
          }
        }
        if(!two_nf){
          output <- decompose_relation(temp,no_of_relation)
          temp <- output$input
          no_of_relation <- output$tables
        }else{
          loop_condition = FALSE
        }
      }
      if(nrow(temp) > 0)
        input <- update_fd(input,temp)
    }
  }
  return(input)
}