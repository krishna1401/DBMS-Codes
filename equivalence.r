#Equivalence of FD's
equivalence <- function(fd1,fd2){
  #All Attributes on RHS of FD1
  temp <- strsplit(paste(fd1[,'V2'],collapse = ''),'')[[1]]
  temp <- temp[!duplicated(temp)]
  rhs_fd1 <- paste(sort(temp),collapse = '')
  
  #All Attributes on RHS of FD2
  temp <- strsplit(paste(fd2[,'V2'],collapse = ''),'')[[1]]
  temp <- temp[!duplicated(temp)]
  rhs_fd2 <- paste(sort(temp),collapse = '')
  
  equi = FALSE
  if(rhs_fd1 == rhs_fd2){
    c1 = check_subset(fd1,fd2) #In function.r
    c2 = check_subset(fd2,fd1) #In function.r
    if(c1 == c2)
      equi = TRUE
  }
  return(equi)
}