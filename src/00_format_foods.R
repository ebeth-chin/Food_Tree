#format the unique lists of ITEMS and INFMYPHEI foods to remove special characters

source("lib/format_input_files.R")

#ASA24-2016 foods
format.file(filename="/Users/elizabeth.chin/Desktop/milk/FL100_ASA24_lactose_estimation/data/outputs/Items_unique.txt",
            foodcodecolname = "FoodCode",
            columns = "Food_Description", 
            outdir= "/Users/elizabeth.chin/Desktop/milk/Food_Tree/data/00_formatted_foods/ITEMS_formatted.txt")

#ASA24-2014 foods
format.file(filename="/Users/elizabeth.chin/Desktop/milk/FL100_ASA24_lactose_estimation/data/outputs/INFMYPHEI_unique.txt",
            foodcodecolname = "FoodCode",
            columns = "Food_Description", 
            outdir= "/Users/elizabeth.chin/Desktop/milk/Food_Tree/data/00_formatted_foods/INFMYPHEI_formatted.txt")

#MCT Taxonomy (from Knight lab); food description column currently has spaces instead of underscores
format.file(filename="/Users/elizabeth.chin/Desktop/milk/Food_Tree/food_tree_gits/food_graphlan-master/data/mct.taxonomy.txt",
            foodcodecolname = "FoodID",
            columns = "Main.food.description", 
            outdir= "/Users/elizabeth.chin/Desktop/milk/Food_Tree/data/00_formatted_foods/MCT_taxonomy_formatted.txt")
