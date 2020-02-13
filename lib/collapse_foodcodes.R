#Author: Elizabeth L. Chin
#Purpose: to collapse ASA24-2014 FoodCodes into ASA24-2016 FoodCodes for the same foods.
#Having two separate FoodCodes for the same foods will make two different leaves/nodes on the food tree, even though the food is the same. 


require(dplyr)
require(stringr)

collapse.foodcodes<- function(foodcode_list, #input file of food codes in txt format
                              codes_2014, #column containing 2014 food codes that need to be swiched out in foodcode_list
                              codes_2016, #column containing 2016 food codes in foodcode_list
                              input_foods, #items recorded in ASA24 recalls 
                              foodcode_column, #colname containing the FoodCodes in input_foods
                              output_foods #output file of items with updated foodcodes
){
  #read in the tables
  codes<- read.table(foodcode_list, stringsAsFactors = F, sep="\t")
  colnames(codes)<- codes[1,]
  codes<- codes[-1,]
  items<- read.csv(input_foods, header=T)
  
  print(colnames(codes))
  
  #merge the tables
  #items.new<- merge(items, codes, by.x= items[,foodcode_column], by.y= codes[,codes_2014], all.x = T)
  items.new<- merge(items, codes, by.x= "FoodCode", by.y=  "FoodCode.2014", all.x = T)
  
  #make a new column of foodcodes, so you can check that the replacement is correct
  foodcode.keep<- array(dim=nrow(items.new))
  
  #replace the 2014 foodcodes
  for(i in 1:nrow(items.new)){
    if(is.na(items.new[i,codes_2016])){
      foodcode.keep[i] <- items.new[i, foodcode_column]
    }else(foodcode.keep[i] <- items.new[i,codes_2016])
  }
  #replace the old foodcode with the updated ones. we want to retain the ASA24 "FoodCode" column name 
  #so it can be easily combined with the ASA24-2016 data
  items.new$FoodCode<- foodcode.keep
  
  #if you want to do some QC... 
  #items.new$FoodCode.keep<- foodcode.keep
  #items.new$check<-ifelse(items.new[,foodcode_column] == items.new$FoodCode.keep, 1, 0)
  
  write.csv(items.new, file = output_foods, row.names=F)
}

