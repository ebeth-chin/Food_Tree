#purpose: 
#now that we know which food codes are duplicated and which 2014 foodcodes can be converted to a 2016 counterpart
#we will tidy these up in the final food list. 

setwd("/Users/elizabeth.chin/Desktop/milk/Food_Tree/")
#bring in the items
items<- read.table("data/00_formatted_foods/ITEMS_formatted.txt", sep="\t", header=T)
inf<- read.table("data/00_formatted_foods/INFMYPHEI_formatted.txt", sep="\t", header=T)

#remove multiple underscores
items$Food_Description<- gsub("[[:punct:]]+",'_', items$Food_Description)
inf$Food_Description<- gsub("[[:punct:]]+",'_', inf$Food_Description)

#merge the items and inf files 
foods<- rbind(items, inf)
dim(foods) #3449 foods total
length(unique(foods$FoodCode)) #2431 unique foods 

#bring in the foodcodes to jitter and food codes to collapse 
jitter<-read.table("data/02_foodcode_curation/foodcodes_duplicated_with_jitter.txt",  sep="\t", dec=".", stringsAsFactors = F)
#this includes milk NFS FoodCode with almond milk description 
colnames(jitter)<- jitter[1,]
jitter<-jitter[-1,]

fc.col<- read.table("data/02_foodcode_curation/foodcodes2014_convert_to_16_input.txt", stringsAsFactors = F, sep="\t")
colnames(fc.col)<- fc.col[1,]
fc.col<- fc.col[-1,]

##########################################################
#clean up the descriptions of the jitter foodcode files #
##########################################################
source("lib/format_input_files.R")
format.file(filename = "data/02_foodcode_curation/foodcodes_duplicated_with_jitter.txt", 
            foodcodecolname = "FoodCode",
            columns= "Food_Description", 
            outdir = "data/02_foodcode_curation/foodcodes_duplicated_with_jitter_formatted.txt")

jitter.clean<- read.table("data/02_foodcode_curation/foodcodes_duplicated_with_jitter_formatted.txt", header=T)

#add the jitter foodcode column back
jitter2<- cbind(jitter.clean,jitter$FoodCode.jitter)
colnames(jitter2)<- c("FoodCode", "Food_Description", "FoodCode.jitter")
write.table(jitter2, "data/02_foodcode_curation/foodcodes_duplicated_with_jitter_formatted.txt", row.names = F, quote=F, sep="\t")



##############################
#add foodcodes for duplicates#
##############################
source("lib/jitter.duplicate.foodcodes.R")
#write foods as csv for input into cleanup steps
write.csv(foods, "data/02_foodcode_curation/foods_for_cleanup.csv", row.names=F)
jitter.duplicate.foodcodes(items= "data/02_foodcode_curation/foods_for_cleanup.csv",
                           foodcode_col = "FoodCode", 
                           duplicated_codes="data/02_foodcode_curation/foodcodes_duplicated_with_jitter_formatted.txt",
                           dupecodes_col = "FoodCode",
                           jittercode_col = "FoodCode.jitter",
                           outfile= "/Users/elizabeth.chin/Desktop/milk/Food_Tree/data/02_foodcode_curation/foods_jitter_fixed.csv")

##############################################
#collapse 2014 foodcodes into 2016 foodcodes #
##############################################
source("lib/collapse_foodcodes.R")
collapse.foodcodes(input_foods = "/Users/elizabeth.chin/Desktop/milk/Food_Tree/data/02_foodcode_curation/foods_jitter_fixed.csv",
                   foodcode_list = "data/02_foodcode_curation/foodcodes2014_convert_to_16_input.txt",
                   codes_2014 = "FoodCode.2014", 
                   codes_2016 = "FoodCode.2016", 
                   foodcode_column = "FoodCode", 
                   output_foods = "data/02_foodcode_curation/foods_collapsed.csv")


#################
#check your work#
#################
diet<-read.csv("data/02_foodcode_curation/foods_collapsed.csv", header=T)
length(unique(diet$FoodCode)) #2413 unique foodcodes, 4 of these have 0.1 added (you can't see it in R viewer pane, but it comes up if you search .1)

library(gplots)
fc.venn<- venn(list("merged" = unique(diet$FoodCode), 
          "2016" = unique(items$FoodCode), 
          "2014" = unique(inf$FoodCode)))
attr(fc.venn, "intersections")$'merged'

#2431 unique foodcodes reported in fl100, before cleanup
#2413 unique foodcodes reported in fl100, after cleanup
# 887 + 1315 + 201 + 28 = 2431 yay 
# 10 of the foodcodes that are 'unique' to the merged dataset are foods with 0.1 added to the foodcode
# or foodcodes that were in FL100 ASA24-2014 that were not reported by FL100 ASA24-2016 users, but were reported
# in the MCT study (used ASA24-2016) which is why the foodcode got converted to a 2016 foodcode (I looked up the codes in the MCT file)
# the 2016 foodcode was used when possible (sourced from FL100 ASA24-2016 users or the MCT FoodCodes) because the taxonomy was built using 2016 FNDDS


#########################################################
#now just get the first instance of each unique foodcode#
#########################################################
#note that some foods are duplicated because the description differs in minor details like
#type of oil (W/ VEGETABLE OIL, NFS vs W/ BUTTER)
#for this analyses, we treat all of these as the same food and just pick whichever description shows up in the details
#see 02_manual_curation_of_foods and files for details about which foods are considered duplicate foodcodes w/ different foods based on the description
diet$FoodCode<- trimws(diet$FoodCode)
diet.input<- diet %>% filter(Food_Description != "") %>% #no blank food descriptions (from ASA24 system errors)
    .[!duplicated(.$FoodCode),] %>% #no duplicated foodcodes- 2412 (FoodCode == 9 is excluded, which only occurs due to system/reporting errors)
  dplyr::select(FoodCode, Food_Description) #just get relevant columns

################################
# save file for graphlan input #
################################
colnames(diet.input)<- c("FoodID", "Main.food.description") #this is what the function make.food.tree requires
write.table(diet.input, file = "data/03_make_newick_tree/fl100_final_all_foods.txt", sep="\t",quote = F, row.names=F)
