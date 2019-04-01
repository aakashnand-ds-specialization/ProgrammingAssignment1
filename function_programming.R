# Author: Aakash Nand
# Coursera: Week-2 R-programming function programming assignment
# Date: 28/03/2019

pollutantmean<-function(directory,pollutant,id=1:332){
  
  if(grep('specdata',directory)==1){
    directory<-("./specdata/")
  }
  all_files<-as.character(list.files(directory))
  file_paths<-paste(directory,all_files,sep="")
  mean_vector<-c()
  for (i in id){
    file<-read.csv(file_paths[i],header = T, sep=",")
    na_removed_vector<-file[!is.na(file[pollutant]),pollutant]
    mean_vector<-c(mean_vector, na_removed_vector)
  }
  result<-mean(mean_vector)
  result
}

complete <-function(directory, id=1:332){
  
  if(grep('specdata',directory)==1){
    directory<-("./specdata/")
  }
  all_files<-as.character(list.files(directory))
  file_paths<-paste(directory,all_files,sep="")
  
  # Initialize empty dataframe
  result_df<-data.frame(id=id,nobs=numeric(length(id)))
  
  
  for (i in id){
    count=0
    file<-read.table(file_paths[i],header = T, sep=",")
    
    for (index in 1:nrow(file)){
      if(!is.na(file[index,2]) && !is.na(file[index,3])){
         count<-count+1
      }
      result_df[ which(result_df$id==i),2 ] <- count
    }
  }
  
  print(result_df)
  
}
