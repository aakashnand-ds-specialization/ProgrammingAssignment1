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
  result_df
  # print(result_df)
  
}