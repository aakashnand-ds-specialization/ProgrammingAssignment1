# Author: Aakash Nand
# Coursera: Week-2 R-programming function programming assignment
# Date: 28/03/2019

corr<-function(directory,threshold=0){
  if(grep('specdata',directory)==1){
    directory<-("./specdata/")
  }
  #complete_df<-complete("specdata")
  #threshold_complete_df<-complete_df[complete_df['nobs'] > threshold, ]
  
  all_files<-as.character(list.files(directory))
  file_paths<-paste(directory,all_files,sep="")
  cor_values<-c()
  
  for(i in 1:332){
     nitrate_values<-c()
     sulphate_values<-c()
     file<-read.csv(file_paths[i],header = T, sep=",")
     file <- file[complete.cases(file),]
     #print(nrow(file))
     if(nrow(file) > threshold){
       nitrate_values<-file['nitrate']
       sulphate_values<-file['sulfate']
       #print(length(nitrate_values))
       cor_values<-c(cor_values,cor(sulphate_values,nitrate_values))
     }
  }
  cor_values
}


