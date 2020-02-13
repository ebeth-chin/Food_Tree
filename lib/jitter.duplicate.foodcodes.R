#Author: Elizabeth L. Chin
#Purpose: Some FoodCodes have multiple food descriptions, where the 'main' description of the food is the same
#but details differ (e.g. Coffee, Latte W/ WHOLE MILK vs W/ SOY MILK) 
#this code adds .1 to the end of duplicated foodcodes that we want to retain because the 
#food descriptions indicate that the foods are quite different 

require(stringr)
require(dplyr)

jitter.duplicate.foodcodes<-function(items, #input items files 
                                     foodcode_col, #column corresponding to the FoodCode in the input file
                                     duplicated_codes, #file of duplicated foodcodes as a text file
                                     dupecodes_col, #column name in duplicated_codes containing duplicated foodcode
                                     jittercode_col, #colname in duplicated_codes containing the foodcode with jitter added 
                                     outfile #output file 
){
  #importing files
  items<- read.csv(items, header=T)
  dup.codes<- read.table(duplicated_codes, sep="\t", dec=".", stringsAsFactors = F)
  
  #fix column names
  colnames(dup.codes)<- dup.codes[1,]
  dup.codes<- dup.codes[-1,]
  
  #trimws
  items$Food_Description<- trimws(items$Food_Description)
  dup.codes$Food_Description<- trimws(dup.codes$Food_Description)
  
  #make new columns that combine the foodcode and description 
  items$combo<- paste0(items[,"FoodCode"],"_", items[,"Food_Description"])
  dup.codes$combo<- paste0(dup.codes[,"FoodCode"],"_", dup.codes[,"Food_Description"])
  
  #merge 
  new.df<- merge(items, dup.codes, by="combo", all.x=T)
  
  new.foodcode<- array(dim=nrow(new.df))
  
  for(i in 1:nrow(new.df)){
    if(is.na(new.df[i,jittercode_col])){
    new.foodcode[i] <- new.df[i, "FoodCode.x"]
   }else(new.foodcode[i] <- new.df[i,jittercode_col])
  }
  
  new.df$FoodCode<- new.foodcode
  names(new.df)[names(new.df) == "Food_Description.x"] <- "Food_Description"
  write.csv(new.df, outfile, row.names=F)
  
  #for troubleshooting 
  #new.df$foodcode.keep<- new.foodcode
  #write.csv(new.df %>% dplyr::select(UserName, RecallNo, FoodCode.x, FoodCode.jitter, Food_Description.x), outfile, row.names = F)  

}




