
setwd("/Users/elizabeth.chin/Desktop/milk/Food_Tree/")
foods<- read.table("data/03_make_newick_tree/raw_newick_tree/fl100_foods_for_newick.txt", header=T)
jitter<-read.table("data/02_manual_taxonomy_curation/foodcodes_duplicated_with_jitter.txt",  sep="\t", dec=".", stringsAsFactors = F)
colnames(jitter)<- jitter[1,]
jitter<-jitter[-1,]

source("lib/format_input_files.R")

#clean up the descriptions 
format.file(filename = "data/02_manual_taxonomy_curation/foodcodes_duplicated_with_jitter.txt", 
            foodcodecolname = "FoodCode",
            columns= "Food_Description", 
            outdir = "data/02_manual_taxonomy_curation/foodcodes_duplicated_with_jitter_formatted.txt")

jitter.clean<- read.table("data/02_manual_taxonomy_curation/foodcodes_duplicated_with_jitter_formatted.txt", header=T)

#add the jitter column back
jitter2<- cbind(jitter.clean,jitter$FoodCode.jitter)
colnames(jitter2)<- c("FoodCode", "Food_Description", "FoodCode.jitter")
write.table(jitter2, "data/02_manual_taxonomy_curation/foodcodes_duplicated_with_jitter_formatted.txt", row.names = F, quote=F, sep="\t")

source("lib/jitter.duplicate.foodcodes.R")

#write foods as csv
colnames(foods)<-c("FoodCode", "Food_Description")
write.csv(foods, "data/03_make_newick_tree/raw_newick_tree/fl100_foods_for_newick.csv", row.names=F)

jitter.duplicate.foodcodes(items= "data/03_make_newick_tree/raw_newick_tree/fl100_foods_for_newick.csv",
                           foodcode_col = "FoodCode", 
                           duplicated_codes="data/02_manual_taxonomy_curation/foodcodes_duplicated_with_jitter_formatted.txt",
                           dupecodes_col = "FoodCode",
                           jittercode_col = "FoodCode.jitter",
                           outfile= "/Users/elizabeth.chin/Desktop/milk/Food_Tree/data/04_get_abundance/foods_jitter_fixed.csv")


foods$combo<- paste0(foods[,"FoodCode"],"_", foods[,"Food_Description"])
jitter2$combo<- paste0(jitter2[,"FoodCode"],"_", jitter2[,"Food_Description"])

#merge 
new.df<- merge(foods, jitter2, by="combo", all.x=T)

new.foodcode<- array(dim=nrow(new.df))

for(i in 1:nrow(new.df)){
  if(is.na(new.df[i,"FoodCode.jitter"])){
    new.foodcode[i] <- new.df[i, "FoodCode.x"]
  }else(new.foodcode[i] <- new.df[i,"FoodCode.jitter"])
}

new.df$FoodCode<- new.foodcode