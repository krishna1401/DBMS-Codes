setwd('~/Msc/Sem 1/DBMS/DBMS-Codes')
source('functions.r')

#Hiding Warning Messages
options(warn = -1)

print("Main Menu")
print("1. Candidate Key")
print("2. Closure")
print("3. Equivalence of FD")
print("4. Minimal Cover")
print("5. Boyce-Codd Normal Form")
choice <- as.integer(readline(prompt = "Enter Your Choice : "))

if(choice == 1){
  file.edit("~/R/Msc/DBMS/input/candidate.txt")
  source('candidate.r')
  input <- read.csv("input/candidate.txt",sep = '-',header = FALSE,stringsAsFactors = FALSE)
  attr <- find_attr(input)
  #Find All Possible Keys
  keys <- keys(attr,input,'c')
  print(keys)
}else if(choice == 2){
  file.edit("~/R/Msc/DBMS/input/closure.txt")
  source('closure.r')
  input <- read.csv("input/closure.txt",sep = '-',header = FALSE,stringsAsFactors = FALSE)
  attr <- find_attr(input)
  #Find Particular Closure
  closure <- readline(prompt = "Enter Closure Attribute : ")
  z <- find_closure(closure,input)
  print(z)
}else if(choice == 3){
  file.edit("~/R/Msc/DBMS/input/fd1.txt")
  source('equivalence.r')
  fd1 <- read.csv("input/fd1.txt",sep = '-',header = FALSE,stringsAsFactors = FALSE)
  file.edit("~/R/Msc/DBMS/input/fd2.txt")
  fd2 <- read.csv("input/fd2.txt",sep = '-',header = FALSE,stringsAsFactors = FALSE)
  if(equivalence(fd1,fd2)){
    print("FD1 and FD2 are Equivalent")
  }else{
    print("FD1 and FD2 are not Equivalent")
  }
}else if(choice == 4){
  file.edit("~/R/Msc/DBMS/input/minimal_cover.txt")
  source('minimal_cover.r')
  input <- read.csv("input/minimal_cover.txt",sep = '-',header = FALSE,stringsAsFactors = FALSE)
  attr <- find_attr(input)
  cover <- minimal_cover(input)
  
  #Printing
  for(i in 1:nrow(cover)){
    print(paste(cover[i,'V1'],"->",cover[i,'V2']))
  }
}else if(choice == 5){
  file.edit("~/R/Msc/DBMS/input/bcnf.txt")
  source('bcnf.r')
  input <- read.csv("input/bcnf.txt",sep = '-',header = FALSE,stringsAsFactors = FALSE)
  output <- bcnf(input)
  
  #Printing
  for(i in 1:nrow(output)){
    print(paste(output[i,'V3'],":",output[i,'V1'],"->",output[i,'V2']))
  }
}else{
  print("Invalid Choice")
}

#Unhiding Warning Messages
options(warn = 1)