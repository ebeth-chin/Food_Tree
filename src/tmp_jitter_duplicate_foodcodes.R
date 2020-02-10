require(dplyr)

items= read.csv("/Users/elizabeth.chin/Desktop/milk/Food_Tree/data/raw_input/Items_JACorrections.csv", header=T)
dup.codes=read.table("/Users/elizabeth.chin/Desktop/milk/Food_Tree/data/02_manual_taxonomy_curation/foodcodes_duplicated_with_jitter.txt",
                    sep="\t", dec = ".", stringsAsFactors = F)

colnames(dup.codes)<-dup.codes[1,]
dup.codes<-dup.codes[-1,]

#dup.codes=read.csv("/Users/elizabeth.chin/Desktop/milk/Food_Tree/data/02_manual_taxonomy_curation/foodcodes_duplicated_with_jitter.csv",
#                   header=T, )

items$Food_Description<- trimws(items$Food_Description)
dup.codes$Food_Description<- trimws(dup.codes$Food_Description)

items$combo<- paste0(items[,"FoodCode"],"_", items[,"Food_Description"])
dup.codes$combo<- paste0(dup.codes[,"FoodCode"],"_", dup.codes[,"Food_Description"])

new.df<- merge(items, dup.codes, by = "combo", all.x=T)

new.foodcode<-array(dim=nrow(new.df))

tiny.df<-new.df[,c("UserName", "RecallNo", "FoodCode.x","FoodCode.y", "Food_Description.x", "Food_Description.y", "FoodCode.jitter")]
View(tiny.df)
for(i in 1:nrow(tiny.df)){
  if(is.na(tiny.df[i, "FoodCode.jitter"])){
    new.foodcode[i]<- tiny.df[i,"FoodCode.x"]
  }else(new.foodcode[i]<-tiny.df[i,"FoodCode.jitter"])
}
tiny.df$foodcode.keep<- new.foodcode
View(tiny.df)

