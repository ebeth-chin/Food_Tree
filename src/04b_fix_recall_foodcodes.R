
setwd("/Users/elizabeth.chin/Desktop/milk/Food_Tree/")
require(gplots)
require(dplyr)
source("lib/collapse_foodcodes.R")
source("lib/jitter.duplicate.foodcodes.R")

# purpose: to clean up the food codes in the recalls that have been QC'd:
# recalls passing data QC
# subjects have at least 2 at-home recalls 

#import the qc'd recalls-- make sure it's the right n of rows 
#diet<- read.csv("data/04_get_abundance/fl100_recalls_qcd.csv")

##########################
#fix duplicated foodcodes#
##########################
set.seed(0)
jitter.duplicate.foodcodes(items = "data/04_get_abundance/fl100_recalls_qcd.csv",
                           foodcode_col = "FoodCode",
                           duplicated_codes= "data/02_foodcode_curation/foodcodes_duplicated_with_jitter.txt", #don't use the formatted one
                           dupecodes_col = "FoodCode",
                           jittercode_col = "FoodCode.jitter",
                           outfile = "data/04_get_abundance/recalls_duplicated_fixed.csv")
####################
#fix 2014 foodcodes#
####################
collapse.foodcodes(foodcode_list = "data/02_foodcode_curation/foodcodes2014_convert_to_16_input.txt",
                   codes_2014 = "FoodCode.2014", 
                   codes_2016 = "FoodCode.2016", 
                   input_foods="data/04_get_abundance/recalls_duplicated_fixed.csv",
                   foodcode_column = "FoodCode", 
                   output_foods = "data/04_get_abundance/recalls_foodcodes_qcd.csv")


