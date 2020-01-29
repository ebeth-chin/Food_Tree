
#to add first three levels to taxonomy based on FNDDS foodcode and coding scheme developed by Knight lab
#knight lab coding scheme: /Food_Tree-master/raw_data/coding.scheme.txt
create.taxonomy<-function(foods, outdir){
  #create columns for L1-L5
  L1<- array(dim=nrow(foods))
  #now add the L1
  for(i in 1:nrow(foods))
    if(grepl("^1", foods[i,"FoodCode"])){
      L1[i] <- "Milk and Milk Products"
    }else if (grepl("^2", foods[i,"FoodCode"])){
      L1[i]<- "Meat, Poultry, Fish, and Mixtures"
    }else if (grepl("^3", foods[i,"FoodCode"])){
      L1[i]<- "Eggs"
    }else if (grepl("^4", foods[i,"FoodCode"])){
      L1[i]<- "Dry Beans, Peas, Other Legumes, Nuts, and Seeds"
    }else if (grepl("^5", foods[i,"FoodCode"])){
      L1[i]<- "Grain Product"
    }else if (grepl("^6", foods[i,"FoodCode"])){
      L1[i]<- "Fruits"
    }else if (grepl("^7", foods[i,"FoodCode"])){
      L1[i]<- "Vegetables"
    }else if (grepl("^8", foods[i,"FoodCode"])){
      L1[i]<- "Fats, Oils, and Salad Dressings"
    }else if (grepl("^9", foods[i,"FoodCode"])){
      L1[i]<- "Sugars, Sweets, and Beverages"
    }
  foods$L1<-L1
  #add the L2
  L2<- array(dim=nrow(foods))
  for(i in 1:nrow(foods))
    if (grepl("^11", foods[i,"FoodCode"])){
      L2[i]<- "Milk and milk drinks"
    }else if (grepl("^12", foods[i,"FoodCode"])){
      L2[i]<- "Creams and cream substitutes"
    }else if (grepl("^13", foods[i,"FoodCode"])){
      L2[i]<- "Milk desserts, sauces, gravies"
    } else if (grepl("^14", foods[i,"FoodCode"])){
      L2[i]<- "Cheeses"
    }else if (grepl("^20", foods[i,"FoodCode"])){
      L2[i]<- "Meat"
    }else if (grepl("^21", foods[i,"FoodCode"])){
      L2[i]<- "Beef"
    }else if (grepl("^22", foods[i,"FoodCode"])){
      L2[i]<- "Pork"
    }else if (grepl("^23", foods[i,"FoodCode"])){
      L2[i]<- "Lamb, veal, game, other"
    }else if (grepl("^24", foods[i,"FoodCode"])){
      L2[i]<- "Poultry"
    }else if (grepl("^25", foods[i,"FoodCode"])){
      L2[i]<- "Organ meats, sausages and lunchmeats"
    }else if (grepl("^26", foods[i,"FoodCode"])){
      L2[i]<- "Fish and shellfish"
    }else if (grepl("^27", foods[i,"FoodCode"])){
      L2[i]<- "Meat,poultry, fish with nonmeat"
    }else if (grepl("^28", foods[i,"FoodCode"])){
      L2[i]<- "Frozen and shelf-stable plate meals, soups, and gravies"
    }else if (grepl("^31", foods[i,"FoodCode"])){
      L2[i]<- "Eggs"
    }else if (grepl("^32", foods[i,"FoodCode"])){
      L2[i]<- "Egg mixtures"
    }else if (grepl("^33", foods[i,"FoodCode"])){
      L2[i]<- "Egg substitutes"
    }else if (grepl("^35", foods[i,"FoodCode"])){
      L2[i]<- "Frozen plate meals with egg as major"
    }else if (grepl("^41", foods[i,"FoodCode"])){
      L2[i]<- "Legumes"
    }else if (grepl("^42", foods[i,"FoodCode"])){
      L2[i]<- "Nuts, nut butters, and nut mixtures"
    }else if (grepl("^43", foods[i,"FoodCode"])){
      L2[i]<- "Seeds and seed mixtures"
    }else if (grepl("^44", foods[i,"FoodCode"])){
      L2[i]<- "Carob products"
    }else if (grepl("^50", foods[i,"FoodCode"])){
      L2[i]<- "Flour and dry mixes"
    }else if (grepl("^51", foods[i,"FoodCode"])){
      L2[i]<- "Yeast"
    }else if (grepl("^52", foods[i,"FoodCode"])){
      L2[i]<- "Quick breads"
    }else if (grepl("^53", foods[i,"FoodCode"])){
      L2[i]<- "Cakes, cookies, pies, pastries, bars"
    }else if (grepl("^54", foods[i,"FoodCode"])){
      L2[i]<- "Crackers and salty snacks from grain"
    }else if (grepl("^55", foods[i,"FoodCode"])){
      L2[i]<- "Pancakes, waffles, French toast, other"
    }else if (grepl("^56", foods[i,"FoodCode"])){
      L2[i]<- "Pastas, cooked cereals, rice"
    }else if (grepl("^57", foods[i,"FoodCode"])){
      L2[i]<- "Cereals, not cooked or NS as to cooked"
    }else if (grepl("^58", foods[i,"FoodCode"])){
      L2[i]<- "Grain mixtures, frozen plate meals, soups"
    }else if (grepl("^59", foods[i,"FoodCode"])){
      L2[i]<- "Meat substitutes, mainly cereal protein"
    }else if (grepl("^61", foods[i,"FoodCode"])){
      L2[i]<- "Citrus fruits, juices"
    }else if (grepl("^62", foods[i,"FoodCode"])){
      L2[i]<- "Dried fruits"
    }else if (grepl("^63", foods[i,"FoodCode"])){
      L2[i]<- "Other fruits"
    }else if (grepl("^64", foods[i,"FoodCode"])){
      L2[i]<- "Fruit juices and nectars excluding citrus"
    }else if (grepl("^67", foods[i,"FoodCode"])){
      L2[i]<- "Fruits and juices baby food"
    }else if (grepl("^71", foods[i,"FoodCode"])){
      L2[i]<- "White potatoes and Puerto Rican starchy vegetables"
    }else if (grepl("^72", foods[i,"FoodCode"])){
      L2[i]<- "Dark-green vegetables"
    }else if (grepl("^73", foods[i,"FoodCode"])){
      L2[i]<- "Deep-yellow vegetables"
    }else if (grepl("^74", foods[i,"FoodCode"])){
      L2[i]<- "Tomatoes and tomato mixtures"
    }else if (grepl("^75", foods[i,"FoodCode"])){
      L2[i]<- "Other vegetables"
    }else if (grepl("^76", foods[i,"FoodCode"])){
      L2[i]<- "Vegetables and mixtures mostly vegetables baby food"
    }else if (grepl("^77", foods[i,"FoodCode"])){
      L2[i]<- "Vegetables with meat, poultry, fish"
    }else if (grepl("^78", foods[i,"FoodCode"])){
      L2[i]<- "Mixtures mostly vegetables without meat, poultry, fish"
    }else if (grepl("^81", foods[i,"FoodCode"])){
      L2[i]<- "Fats"
    }else if (grepl("^82", foods[i,"FoodCode"])){
      L2[i]<- "Oils"
    }else if (grepl("^83", foods[i,"FoodCode"])){
      L2[i]<- "Salad dressings"
    }else if (grepl("^91", foods[i,"FoodCode"])){
      L2[i]<- "Sugars and sweets"
    }else if (grepl("^92", foods[i,"FoodCode"])){
      L2[i]<- "Nonalcoholic beverages"
    }else if (grepl("^93", foods[i,"FoodCode"])){
      L2[i]<- "Alcoholic beverages"
    }else if (grepl("^94", foods[i,"FoodCode"])){
      L2[i]<- "Water, noncarbonated"
    }else if(grepl("^95", foods[i,"FoodCode"])){
      L2[i]<- "Formulated nutrition beverages, energy drinks, sports drinks, function"
    }
  foods$L2<- L2
  #Now L3
  L3<-array(dim=nrow(foods))
  for(i in 1:nrow(foods))
  if(grepl("^111", foods[i,"FoodCode"])){
      L3[i]<-"Milk, fluid"
    }else if(grepl("^112", foods[i, "FoodCode"])){	
      L3[i]<-"Milk, fluid, evaporated and condensed"
    }else if(grepl("^113", foods[i, "FoodCode"])){	
      L3[i]<-"Milk, fluid, imitation"
    }else if(grepl("^114", foods[i, "FoodCode"])){	
      L3[i]<-"Yogurt"
    }else if(grepl("^115", foods[i, "FoodCode"])){	
      L3[i]<-"Flavored milk and milk drinks, fluid"
    }else if(grepl("^117", foods[i, "FoodCode"])){	
      L3[i]<-"Infant formulas, fluid, reconstituted"
    }else if(grepl("^118", foods[i, "FoodCode"])){	
      L3[i]<-"Milk, dry, and powdered mixtures with"
    }else if(grepl("^121", foods[i, "FoodCode"])){	
      L3[i]<-"Sweet dairy cream"
    }else if(grepl("^122", foods[i, "FoodCode"])){	
      L3[i]<-"Cream substitutes"
    }else if(grepl("^123", foods[i, "FoodCode"])){	
      L3[i]<-"Sour cream"
    }else if(grepl("^131", foods[i, "FoodCode"])){	
      L3[i]<-"Milk desserts, frozen"
    }else if(grepl("^132", foods[i, "FoodCode"])){	
      L3[i]<-"Puddings, custards, and other milk"
    }else if(grepl("^133", foods[i, "FoodCode"])){	
      L3[i]<-"Milk desserts baby food"
    }else if(grepl("^134", foods[i, "FoodCode"])){	
      L3[i]<-"White sauces and milk gravies"
    }else if(grepl("^140", foods[i, "FoodCode"])){	
      L3[i]<-"Cheese, NS as to type"
    }else if(grepl("^141", foods[i, "FoodCode"])){	
      L3[i]<-"Natural cheeses"
    }else if(grepl("^142", foods[i, "FoodCode"])){	
      L3[i]<-"Cottage cheeses"
    }else if(grepl("^143", foods[i, "FoodCode"])){	
      L3[i]<-"Cream cheeses"
    }else if(grepl("^144", foods[i, "FoodCode"])){	
      L3[i]<-"Processed cheeses and cheese spreads"
    }else if(grepl("^145", foods[i, "FoodCode"])){	
      L3[i]<-"Imitation cheeses"
    }else if(grepl("^146", foods[i, "FoodCode"])){	
      L3[i]<-"Cheese mixtures"
    }else if(grepl("^147", foods[i, "FoodCode"])){	
      L3[i]<-"Cheese soups"  
    }else if(grepl("^200", foods[i, "FoodCode"])){	
      L3[i]<-"Meat, NS as to type"
    }else if(grepl("^210", foods[i, "FoodCode"])){	
      L3[i]<-"Beef, NFS"
    }else if(grepl("^211", foods[i, "FoodCode"])){	
      L3[i]<-"Beef steak"
    }else if(grepl("^213", foods[i, "FoodCode"])){	
      L3[i]<-"Beef oxtails, neckbones, short ribs, head"
    }else if(grepl("^214", foods[i, "FoodCode"])){	
      L3[i]<-"Beef roasts, stew meat, corned beef, beef brisket, sandwich steaks"
    }else if(grepl("^215", foods[i, "FoodCode"])){	
      L3[i]<-"Ground beef, beef patties, beef meatballs"
    }else if(grepl("^216", foods[i, "FoodCode"])){	
      L3[i]<-"Other beef items (beef bacon; dried beef; pastrami)"
    }else if(grepl("^217", foods[i, "FoodCode"])){	
      L3[i]<-"Beef baby food"
    }else if(grepl("^220", foods[i, "FoodCode"])){
      L3[i]<-"Pork, NFS; ground, dehydrated"
    }else if(grepl("^221", foods[i, "FoodCode"])){	
      L3[i]<-"Pork chops"
    }else if(grepl("^222", foods[i, "FoodCode"])){
      L3[i]<-"Pork steaks, cutlets"
    }else if(grepl("^223", foods[i, "FoodCode"])){	
      L3[i]<-"Ham"
    }else if(grepl("^224", foods[i, "FoodCode"])){	
      L3[i]<-"Pork roasts"
    }else if(grepl("^225", foods[i, "FoodCode"])){	
      L3[i]<-"Canadian bacon"
    }else if(grepl("^226", foods[i, "FoodCode"])){	
      L3[i]<-"Bacon, salt pork"
    }else if(grepl("^227", foods[i, "FoodCode"])){	
      L3[i]<-"Other pork items"
    }else if(grepl("^228", foods[i, "FoodCode"])){	
      L3[i]<-"Pork baby food"
    }else if(grepl("^230", foods[i, "FoodCode"])){	
      L3[i]<-"Lamb, NFS"
    }else if(grepl("^231", foods[i, "FoodCode"])){	
      L3[i]<-"Lamb and goat"
    }else if(grepl("^232", foods[i, "FoodCode"])){	
      L3[i]<-"Veal"
    }else if(grepl("^233", foods[i, "FoodCode"])){	
      L3[i]<-"Game"
    }else if(grepl("^234", foods[i, "FoodCode"])){	
      L3[i]<-"Lamb or veal baby food"
    }else if(grepl("^241", foods[i, "FoodCode"])){	
      L3[i]<-"Chicken"
    }else if(grepl("^242", foods[i, "FoodCode"])){
      L3[i]<-"Turkey"
    }else if(grepl("^243", foods[i, "FoodCode"])){
      L3[i]<-"Duck"
    }else if(grepl("^244", foods[i, "FoodCode"])){
      L3[i]<-"Other poultry"
    }else if(grepl("^247", foods[i, "FoodCode"])){
      L3[i]<-"Poultry baby food"
    }else if(grepl("^251", foods[i, "FoodCode"])){
      L3[i]<-"Organ meats and mixtures"
    }else if(grepl("^252", foods[i, "FoodCode"])){	
      L3[i]<-"Frankfurters, sausages, lunchmeats, meat spreads"
    }else if(grepl("^261", foods[i, "FoodCode"])){
      L3[i]<-"Finfish"
    }else if(grepl("^262", foods[i, "FoodCode"])){	
      L3[i]<-"Other seafood"
    }else if(grepl("^263", foods[i, "FoodCode"])){	
      L3[i]<-"Shellfish"
    }else if(grepl("^271", foods[i, "FoodCode"])){	
      L3[i]<-"meat,poultry,fish in gravy"
    }else if(grepl("^272", foods[i, "FoodCode"])){	
      L3[i]<-"Meat,poultry, fish with starch item"
    }else if(grepl("^273", foods[i, "FoodCode"])){	
      L3[i]<-"Meat,poultry, fish with starch item and vegetables"
    }else if(grepl("^274", foods[i, "FoodCode"])){	
      L3[i]<-"Meat, poultry, fish with vegetables"
    }else if(grepl("^275", foods[i, "FoodCode"])){	
      L3[i]<-"Sandwiches with meat, poultry, fish"
    }else if(grepl("^276", foods[i, "FoodCode"])){	
      L3[i]<-"Meat, poultry, fish with nonmeat items baby food"
    }else if(grepl("^281", foods[i, "FoodCode"])){	
      L3[i]<-"Frozen or shelf-stable plate meals with meat, poultry, fish"
    }else if(grepl("^283", foods[i, "FoodCode"])){
      L3[i]<-"Soups, broths, extracts from meat, poultry, fish base"
    }else if(grepl("^284", foods[i, "FoodCode"])){	
      L3[i]<-"Gelatin and gelatin-based meal supplements"
    }else if(grepl("^285", foods[i, "FoodCode"])){	
      L3[i]<-"Gravies from meat, poultry, fish base"
    }else if(grepl("^311", foods[i, "FoodCode"])){
      L3[i]<-"Chicken eggs"
    }else if(grepl("^312", foods[i, "FoodCode"])){
      L3[i]<-"Other poultry eggs"
    }else if(grepl("^321", foods[i, "FoodCode"])){	
      L3[i]<-"Egg dishes made with whole eggs"
    }else if(grepl("^322", foods[i, "FoodCode"])){	
      L3[i]<-"Egg sandwiches"
    }else if(grepl("^323", foods[i, "FoodCode"])){	
      L3[i]<-"Egg soups"
    }else if(grepl("^324", foods[i, "FoodCode"])){	
      L3[i]<-"Mixtures made with egg whites"
    }else if(grepl("^330", foods[i, "FoodCode"])){	
      L3[i]<-"Egg substitute, NS as to form"
    }else if(grepl("^334", foods[i, "FoodCode"])){	
      L3[i]<-"Mixtures made with egg substitutes"
    }else if(grepl("^350", foods[i, "FoodCode"])){	
      L3[i]<-"Frozen plate meals with egg as major"
    }else if(grepl("^411", foods[i, "FoodCode"])){	
      L3[i]<-"Dried beans"
    }else if(grepl("^412", foods[i, "FoodCode"])){	
      L3[i]<-"Dried beans mixtures"
    }else if(grepl("^413", foods[i, "FoodCode"])){	
      L3[i]<-"Dried peas, lentils, and mixtures"
    }else if(grepl("^414", foods[i, "FoodCode"])){	
      L3[i]<-"Soybean derived products (excluding milks)"
    }else if(grepl("^416", foods[i, "FoodCode"])){	
      L3[i]<-"Soups with legumes as major ingredient"
    }else if(grepl("^418", foods[i, "FoodCode"])){
      L3[i]<-"Meat substitutes, mainly legume protein"
    }else if(grepl("^419", foods[i, "FoodCode"])){	
      L3[i]<-"Meat substitute sandwiches"
    }else if(grepl("^421", foods[i, "FoodCode"])){	
      L3[i]<-"Nuts"
    }else if(grepl("^422", foods[i, "FoodCode"])){	
      L3[i]<-"Nut butters"
    }else if(grepl("^423", foods[i, "FoodCode"])){	
      L3[i]<-"Nut butter sandwiches"
    }else if(grepl("^424", foods[i, "FoodCode"])){	
      L3[i]<-"Coconut beverages"
    }else if(grepl("^425", foods[i, "FoodCode"])){	
      L3[i]<-"Nut mixtures"
    }else if(grepl("^431", foods[i, "FoodCode"])){	
      L3[i]<-"Seeds"
    }else if(grepl("^441", foods[i, "FoodCode"])){	
      L3[i]<-"Carob powder, flour"
    }else if(grepl("^442", foods[i, "FoodCode"])){	
      L3[i]<-"Carob chips, syrup"
    }else if(grepl("^500", foods[i, "FoodCode"])){	
      L3[i]<-"Flour and dry mixes"
    }else if(grepl("^510", foods[i, "FoodCode"])){	
      L3[i]<-"Bread,rolls,NFS"
    }else if(grepl("^511", foods[i, "FoodCode"])){	
      L3[i]<-"White breads, rolls"
    }else if(grepl("^512", foods[i, "FoodCode"])){	
      L3[i]<-"Whole wheat breads, rolls"
    }else if(grepl("^513", foods[i, "FoodCode"])){	
      L3[i]<-"Wheat, cracked wheat breads, rolls"
    }else if(grepl("^514", foods[i, "FoodCode"])){	
      L3[i]<-"Rye breads, rolls"
    }else if(grepl("^515", foods[i, "FoodCode"])){	
      L3[i]<-"Oat breads"
    }else if(grepl("^516", foods[i, "FoodCode"])){	
      L3[i]<-"Multigrain breads, rolls"
    }else if(grepl("^518", foods[i, "FoodCode"])){	
      L3[i]<-"Other breads"
    }else if(grepl("^521", foods[i, "FoodCode"])){	
      L3[i]<-"Biscuits"
    }else if(grepl("^522", foods[i, "FoodCode"])){	
      L3[i]<-"Cornbread, corn muffins, tortillas"
    }else if(grepl("^523", foods[i, "FoodCode"])){	
      L3[i]<-"Other muffins, popovers"
    }else if(grepl("^524", foods[i, "FoodCode"])){	
      L3[i]<-"Other quick breads"
    }else if(grepl("^531", foods[i, "FoodCode"])){	
      L3[i]<-"Cakes"
    }else if(grepl("^532", foods[i, "FoodCode"])){	
      L3[i]<-"Cookies"
    }else if(grepl("^533", foods[i, "FoodCode"])){	
      L3[i]<-"Pies (fruit pies; pie tarts)"
    }else if(grepl("^534", foods[i, "FoodCode"])){	
      L3[i]<-"Cobblers, eclairs, turnovers, other pastries"
    }else if(grepl("^535", foods[i, "FoodCode"])){	
      L3[i]<-"Danish, breakfast pastries, doughnuts"
    }else if(grepl("^536", foods[i, "FoodCode"])){	
      L3[i]<-"Coffee cake, not yeast"
    }else if(grepl("^537", foods[i, "FoodCode"])){	
      L3[i]<-"Bars"
    }else if(grepl("^538", foods[i, "FoodCode"])){	
      L3[i]<-"Cookies and bars, baby food"
    }else if(grepl("^540", foods[i, "FoodCode"])){	
      L3[i]<-"Crackers, NS as to type"
    }else if(grepl("^541", foods[i, "FoodCode"])){	
      L3[i]<-"Sweet crackers"
    }else if(grepl("^542", foods[i, "FoodCode"])){	
      L3[i]<-"Low sodium crackers"
    }else if(grepl("^543", foods[i, "FoodCode"])){	
      L3[i]<-"Nonsweet crackers"
    }else if(grepl("^544", foods[i, "FoodCode"])){	
      L3[i]<-"Salty snacks from grain products"
    }else if(grepl("^551", foods[i, "FoodCode"])){	
      L3[i]<-"Pancakes"
    }else if(grepl("^552", foods[i, "FoodCode"])){	
      L3[i]<-"Waffles"
    }else if(grepl("^553", foods[i, "FoodCode"])){	
      L3[i]<-"French toast"
    }else if(grepl("^554", foods[i, "FoodCode"])){	
      L3[i]<-"Crepes"
    }else if(grepl("^555", foods[i, "FoodCode"])){	
      L3[i]<-"Flour-water patties"
    }else if(grepl("^556", foods[i, "FoodCode"])){	
      L3[i]<-"Flour-milk dumplings, plain"
    }else if(grepl("^557", foods[i, "FoodCode"])){	
      L3[i]<-"Rice flour cakes"
    }else if(grepl("^558", foods[i, "FoodCode"])){	
      L3[i]<-"Funnel cakes"
    }else if(grepl("^561", foods[i, "FoodCode"])){	
      L3[i]<-"Pastas"
    }else if(grepl("^562", foods[i, "FoodCode"])){	
      L3[i]<-"Cooked cereals, rice"
    }else if(grepl("^570", foods[i, "FoodCode"])){	
      L3[i]<-"Cereal, NS as to cooked"
    }else if(grepl("^571", foods[i, "FoodCode"])){
      L3[i]<-"Ready-to-eat cereals"
    }else if(grepl("^572", foods[i, "FoodCode"])){	
      L3[i]<-"Ready-to-eat cereals"
    }else if(grepl("^573", foods[i, "FoodCode"])){	
      L3[i]<-"Ready-to-eat cereals"
    }else if(grepl("^574", foods[i, "FoodCode"])){	
      L3[i]<-"Ready-to-eat cereals"
    }else if(grepl("^576", foods[i, "FoodCode"])){	
      L3[i]<-"Cereal grains, not cooked"
    }else if(grepl("^578", foods[i, "FoodCode"])){	
      L3[i]<-"Cereals baby food"
    }else if(grepl("^581", foods[i, "FoodCode"])){	
      L3[i]<-"Mixtures, mainly grain, pasta, or bread"
    }else if(grepl("^582", foods[i, "FoodCode"])){	
      L3[i]<-"Mixtures, mainly grain, pasta, or bread"
    }else if(grepl("^583", foods[i, "FoodCode"])){	
      L3[i]<-"Frozen plate meals with grain mixture as major ingredient"
    }else if(grepl("^584", foods[i, "FoodCode"])){	
      L3[i]<-"Soups with grain product as major ingredient"
    }else if(grepl("^585", foods[i, "FoodCode"])){	
      L3[i]<-"Grain mixtures baby food"
    }else if(grepl("^590", foods[i, "FoodCode"])){	
      L3[i]<-"Meat substitutes, mainly cereal protein"
    }else if(grepl("^611", foods[i, "FoodCode"])){	
      L3[i]<-"Citrus fruits"
    }else if(grepl("^612", foods[i, "FoodCode"])){
      L3[i]<-"Citrus fruit juices"
    }else if(grepl("^621", foods[i, "FoodCode"])){	
      L3[i]<-"Dried fruits"
    }else if(grepl("^631", foods[i, "FoodCode"])){	
      L3[i]<-"Fruits, excluding berries"
    }else if(grepl("^632", foods[i, "FoodCode"])){	
      L3[i]<-"Berries"
    }else if(grepl("^633", foods[i, "FoodCode"])){	
      L3[i]<-"Mixtures of two or more fruits"
    }else if(grepl("^634", foods[i, "FoodCode"])){	
      L3[i]<-"Mixtures of fruits and nonfruit items"
    }else if(grepl("^641", foods[i, "FoodCode"])){	
      L3[i]<-"Fruit juices, excluding citrus"
    }else if(grepl("^642", foods[i, "FoodCode"])){	
      L3[i]<-"Nectars"
    }else if(grepl("^644", foods[i, "FoodCode"])){	
      L3[i]<-"Vinegar"
    }else if(grepl("^671", foods[i, "FoodCode"])){	
      L3[i]<-"Fruits and fruit mixtures baby food"
    }else if(grepl("^672", foods[i, "FoodCode"])){	
      L3[i]<-"Fruit juice and fruit juice mixtures baby"
    }else if(grepl("^673", foods[i, "FoodCode"])){	
      L3[i]<-"Fruits with cereal baby food"
    }else if(grepl("^674", foods[i, "FoodCode"])){	
      L3[i]<-"Fruit desserts and fruit-flavored pudding"
    }else if(grepl("^675", foods[i, "FoodCode"])){	
      L3[i]<-"Fruits with meat or poultry baby food"
    }else if(grepl("^676", foods[i, "FoodCode"])){	
      L3[i]<-"Fruits and vegetables mixtures baby food"
    }else if(grepl("^710", foods[i, "FoodCode"])){	
      L3[i]<-"White potatoes, NFS"
    }else if(grepl("^711", foods[i, "FoodCode"])){	
      L3[i]<-"White potatoes, baked and boiled"
    }else if(grepl("^712", foods[i, "FoodCode"])){
      L3[i]<-"White potatoes, chips and sticks"
    }else if(grepl("^713", foods[i, "FoodCode"])){
      L3[i]<-"White potatoes, creamed, scalloped, au gratin"
    }else if(grepl("^714", foods[i, "FoodCode"])){	
      L3[i]<-"White potatoes, fried"
    }else if(grepl("^715", foods[i, "FoodCode"])){	
      L3[i]<-"White potatoes, mashed, stuffed, puffs"
    }else if(grepl("^716", foods[i, "FoodCode"])){	
      L3[i]<-"Potato salad"
    }else if(grepl("^717", foods[i, "FoodCode"])){	
      L3[i]<-"Potato recipes"
    }else if(grepl("^718", foods[i, "FoodCode"])){	
      L3[i]<-"Potato soups"
    }else if(grepl("^719", foods[i, "FoodCode"])){	
      L3[i]<-"Puerto Rican starchy vegetables"
    }else if(grepl("^721", foods[i, "FoodCode"])){	
      L3[i]<-"Dark-green leafy vegetables"
    }else if(grepl("^722", foods[i, "FoodCode"])){	
      L3[i]<-"Dark-green nonleafy vegetables"
    }else if(grepl("^723", foods[i, "FoodCode"])){	
      L3[i]<-"Dark-green vegetable soups"
    }else if(grepl("^731", foods[i, "FoodCode"])){	
      L3[i]<-"Carrots"
    }else if(grepl("^732", foods[i, "FoodCode"])){	
      L3[i]<-"Pumpkin"
    }else if(grepl("^733", foods[i, "FoodCode"])){	
      L3[i]<-"Squash, winter"
    }else if(grepl("^734", foods[i, "FoodCode"])){	
      L3[i]<-"Sweet potatoes"
    }else if(grepl("^735", foods[i, "FoodCode"])){	
      L3[i]<-"Deep-yellow vegetable soups"
    }else if(grepl("^741", foods[i, "FoodCode"])){	
      L3[i]<-"Tomatoes, raw"
    }else if(grepl("^742", foods[i, "FoodCode"])){	
      L3[i]<-"Tomatoes, cooked"
    }else if(grepl("^743", foods[i, "FoodCode"])){	
      L3[i]<-"Tomato juices"
    }else if(grepl("^744", foods[i, "FoodCode"])){	
      L3[i]<-"Tomato sauces"
    }else if(grepl("^745", foods[i, "FoodCode"])){
      L3[i]<-"Tomato mixtures"
    }else if(grepl("^746", foods[i, "FoodCode"])){
      L3[i]<-"Tomato soups"
    }else if(grepl("^747", foods[i, "FoodCode"])){	
      L3[i]<-"Tomato sandwiches"
    }else if(grepl("^751", foods[i, "FoodCode"])){
      L3[i]<-"Other vegetables, raw"
    }else if(grepl("^752", foods[i, "FoodCode"])){
      L3[i]<-"Other vegetables, cooked"
    }else if(grepl("^753", foods[i, "FoodCode"])){
      L3[i]<-"Other vegetable mixtures, cooked"
    }else if(grepl("^754", foods[i, "FoodCode"])){
      L3[i]<-"Other cooked vegetables, cooked with sauces, batters, casseroles"
    }else if(grepl("^755", foods[i, "FoodCode"])){
      L3[i]<-"Olives, pickles, relishes (excluding tomatoes)"
    }else if(grepl("^756", foods[i, "FoodCode"])){
      L3[i]<-"Vegetable soups"
    }else if(grepl("^761", foods[i, "FoodCode"])){
      L3[i]<-"Dark-green vegetables baby food"
    }else if(grepl("^762", foods[i, "FoodCode"])){	
      L3[i]<-"Deep-yellow vegetables"
    }else if(grepl("^764", foods[i, "FoodCode"])){	
      L3[i]<-"Vegetables other than dark-green, deep-yellow, and tomato"
    }else if(grepl("^765", foods[i, "FoodCode"])){
      L3[i]<-"Vegetables with grain baby food"
    }else if(grepl("^766", foods[i, "FoodCode"])){	
      L3[i]<-"Vegetables with meat baby food"
    }else if(grepl("^771", foods[i, "FoodCode"])){	
      L3[i]<-"White potato with meat, poultry, fish (mixtures)"
    }else if(grepl("^772", foods[i, "FoodCode"])){
      L3[i]<-"Puerto Rican starchy vegetable (viandas) mixtures"
    }else if(grepl("^773", foods[i, "FoodCode"])){
      L3[i]<-"Other vegetable mixtures"
    }else if(grepl("^775", foods[i, "FoodCode"])){
      L3[i]<-"Puerto Rican stews or soups with starchy vegetables"
    }else if(grepl("^781", foods[i, "FoodCode"])){	
      L3[i]<-"Vegetable and fruit juice blends, 100% juice"
    }else if(grepl("^811", foods[i, "FoodCode"])){	
      L3[i]<-"Table fats"
    }else if(grepl("^812", foods[i, "FoodCode"])){
      L3[i]<-"Cooking fats"
    }else if(grepl("^813", foods[i, "FoodCode"])){	
      L3[i]<-"Other fats"
    }else if(grepl("^821", foods[i, "FoodCode"])){
      L3[i]<-"Vegetable oils"
    }else if(grepl("^831", foods[i, "FoodCode"])){	
      L3[i]<-"Regular salad dressings"
    }else if(grepl("^832", foods[i, "FoodCode"])){	
      L3[i]<-"Light salad dressings"
    }else if(grepl("^833", foods[i, "FoodCode"])){	
      L3[i]<-"Fat free salad dressings"
    }else if(grepl("^911", foods[i, "FoodCode"])){	
      L3[i]<-"Sugars and sugar-sugar substitute blends"
    }else if(grepl("^912", foods[i, "FoodCode"])){	
      L3[i]<-"Sugar replacements or substitute"
    }else if(grepl("^913", foods[i, "FoodCode"])){	
      L3[i]<-"Syrups, honey, molasses, sweet toppings"
    }else if(grepl("^914", foods[i, "FoodCode"])){	
      L3[i]<-"Jellies, jams, preserves"
    }else if(grepl("^915", foods[i, "FoodCode"])){
      L3[i]<-"Gelatin desserts or salads "
    }else if(grepl("^916", foods[i, "FoodCode"])){	
      L3[i]<-"Ices or popsicles"
    }else if(grepl("^917", foods[i, "FoodCode"])){	
      L3[i]<-"Candies"
    }else if(grepl("^918", foods[i, "FoodCode"])){	
      L3[i]<-"Chewing gums"
    }else if(grepl("^921", foods[i, "FoodCode"])){	
      L3[i]<-"Coffee"
    }else if(grepl("^922", foods[i, "FoodCode"])){	
      L3[i]<-"Coffee substitutes"
    }else if(grepl("^923", foods[i, "FoodCode"])){	
      L3[i]<-"Tea"
    }else if(grepl("^924", foods[i, "FoodCode"])){	
      L3[i]<-"Soft drinks, carbonated"
    }else if(grepl("^925", foods[i, "FoodCode"])){	
      L3[i]<-"Fruit drinks"
    }else if(grepl("^926", foods[i, "FoodCode"])){	
      L3[i]<-"Beverages, nonfruit"
    }else if(grepl("^928", foods[i, "FoodCode"])){	
      L3[i]<-"Nonalcoholic beers, wines, cocktails"
    }else if(grepl("^929", foods[i, "FoodCode"])){	
      L3[i]<-"Beverage concentrates, dry, not reconstituted"
    }else if(grepl("^931", foods[i, "FoodCode"])){	
      L3[i]<-"Beers and ales"
    }else if(grepl("^932", foods[i, "FoodCode"])){	
      L3[i]<-"Cordials and liqueurs "
    }else if(grepl("^933", foods[i, "FoodCode"])){	
      L3[i]<-"Cocktails"
    }else if(grepl("^934", foods[i, "FoodCode"])){	
      L3[i]<-"Wines"
    }else if(grepl("^935", foods[i, "FoodCode"])){	
      L3[i]<-"Distilled liquors"
    }else if(grepl("^940", foods[i, "FoodCode"])){	
      L3[i]<-"Water, not bottled"
    }else if(grepl("^941", foods[i, "FoodCode"])){	
      L3[i]<-"Water, bottled"
    }else if(grepl("^942", foods[i, "FoodCode"])){	
      L3[i]<-"Water, bottled, fortified"
    }else if(grepl("^943", foods[i, "FoodCode"])){	
      L3[i]<-"Water, baby food"
    }else if(grepl("^951", foods[i, "FoodCode"])){	
      L3[i]<-"Nutrition drinks"
    }else if(grepl("^952", foods[i, "FoodCode"])){	
      L3[i]<-"Nutrition powders"
    }
  foods$L3<-L3
  #Now L4
  L4<- array(dim=nrow(foods))
  for(i in 1:nrow(foods))
    if(grepl("^1148", foods[i, "FoodCode"])){	L4[i]<-"Yogurt, baby food"
    }else if(grepl("^2511", foods[i, "FoodCode"])){	L4[i]<-"Liver"
    }else if(grepl("^2512", foods[i, "FoodCode"])){	L4[i]<-"Hearts"
    }else if(grepl("^2513", foods[i, "FoodCode"])){	L4[i]<-"Kidney"
    }else if(grepl("^2514", foods[i, "FoodCode"])){	L4[i]<-"Sweetbreads"
    }else if(grepl("^2515", foods[i, "FoodCode"])){	L4[i]<-"Brains"
    }else if(grepl("^2516", foods[i, "FoodCode"])){	L4[i]<-"Tongue"
    }else if(grepl("^1148", foods[i, "FoodCode"])){	L4[i]<-"Yogurt, baby food"
    }else if(grepl("^2511", foods[i, "FoodCode"])){	L4[i]<-"Liver"
    }else if(grepl("^2512", foods[i, "FoodCode"])){	L4[i]<-"Hearts"
    }else if(grepl("^2513", foods[i, "FoodCode"])){	L4[i]<-"Kidney"
    }else if(grepl("^2514", foods[i, "FoodCode"])){	L4[i]<-"Sweetbreads"
    }else if(grepl("^2515", foods[i, "FoodCode"])){	L4[i]<-"Brains"
    }else if(grepl("^2516", foods[i, "FoodCode"])){	L4[i]<-"Tongue"
    }else if(grepl("^2517", foods[i, "FoodCode"])){	L4[i]<-"Other variety meats"
    }else if(grepl("^2521", foods[i, "FoodCode"])){	L4[i]<-"Frankfurters"
    }else if(grepl("^2522", foods[i, "FoodCode"])){	L4[i]<-"Sausages"
    }else if(grepl("^2523", foods[i, "FoodCode"])){	L4[i]<-"Luncheon meats"
    }else if(grepl("^2524", foods[i, "FoodCode"])){	L4[i]<-"Potted meat,spreads"
    }else if(grepl("^2711", foods[i, "FoodCode"])){	L4[i]<-"Beef in gravy or sauce"
    }else if(grepl("^2712", foods[i, "FoodCode"])){	L4[i]<-"Pork with gravy or sauce"
    }else if(grepl("^2713", foods[i, "FoodCode"])){	L4[i]<-"Lamb and veal with gravy or sauce"
    }else if(grepl("^2714", foods[i, "FoodCode"])){	L4[i]<-"Poultry with gravy or sauce"
    }else if(grepl("^2715", foods[i, "FoodCode"])){	L4[i]<-"Fish, shellfish with gravy or sauce"
    }else if(grepl("^2716", foods[i, "FoodCode"])){	L4[i]<-"Miscellaneous meats with gravy or sauce"
    }else if(grepl("^2721", foods[i, "FoodCode"])){	L4[i]<-"Beef with starch item"
    }else if(grepl("^2722", foods[i, "FoodCode"])){	L4[i]<-"Pork with starch item"
    }else if(grepl("^2723", foods[i, "FoodCode"])){	L4[i]<-"Lamb, veal, game with starch item"
    }else if(grepl("^2724", foods[i, "FoodCode"])){	L4[i]<-"Poultry with starch item"
    }else if(grepl("^2725", foods[i, "FoodCode"])){	L4[i]<-"Fish, shellfish with starch item"
    }else if(grepl("^2726", foods[i, "FoodCode"])){	L4[i]<-"Miscellaneous meats with starch item"
    }else if(grepl("^2731", foods[i, "FoodCode"])){	L4[i]<-"Beef with starch and vegetable"
    }else if(grepl("^2732", foods[i, "FoodCode"])){	L4[i]<-"Pork with starch and vegetable"
    }else if(grepl("^2733", foods[i, "FoodCode"])){	L4[i]<-"Lamb, veal, game with starch and vegetable"
    }else if(grepl("^2734", foods[i, "FoodCode"])){	L4[i]<-"Poultry with starch and vegetable"
    }else if(grepl("^2735", foods[i, "FoodCode"])){	L4[i]<-"Fish, shellfish with starch and vegetable"
    }else if(grepl("^2736", foods[i, "FoodCode"])){	L4[i]<-"Miscellaneous meats with starch and vegetable"
    }else if(grepl("^2741", foods[i, "FoodCode"])){	L4[i]<-"Beef with vegetable, no potatoes"
    }else if(grepl("^2742", foods[i, "FoodCode"])){	L4[i]<-"Pork with vegetable, no potatoes"
    }else if(grepl("^2743", foods[i, "FoodCode"])){	L4[i]<-"Lamb, veal, game with vegetable, no potatoes"
    }else if(grepl("^2744", foods[i, "FoodCode"])){	L4[i]<-"Poultry with vegetables, no potatoes"
    }else if(grepl("^2745", foods[i, "FoodCode"])){	L4[i]<-"Fish, shellfish with vegetables, no potatoes"
    }else if(grepl("^2746", foods[i, "FoodCode"])){	L4[i]<-"Miscellaneous meats with vegetable, no potatoes"
    }else if(grepl("^2751", foods[i, "FoodCode"])){	L4[i]<-"Beef sandwiches"
    }else if(grepl("^2752", foods[i, "FoodCode"])){	L4[i]<-"Pork sandwiches"
    }else if(grepl("^2754", foods[i, "FoodCode"])){	L4[i]<-"Poultry sandwiches"
    }else if(grepl("^2755", foods[i, "FoodCode"])){	L4[i]<-"Fish, shellfish sandwiches"
    }else if(grepl("^2756", foods[i, "FoodCode"])){	L4[i]<-"Frankfurters, luncheon meat, potted meat sandwiches"
    }else if(grepl("^2757", foods[i, "FoodCode"])){	L4[i]<-"Hors d'oeuvres, finger sandwiches"
    }else if(grepl("^2761", foods[i, "FoodCode"])){	L4[i]<-"Beef mixtures baby food"
    }else if(grepl("^2764", foods[i, "FoodCode"])){	L4[i]<-"Poultry mixtures baby food"
    }else if(grepl("^2811", foods[i, "FoodCode"])){	L4[i]<-"Beef frozen or shelf-stable meals"
    }else if(grepl("^2813", foods[i, "FoodCode"])){	L4[i]<-"Veal frozen or shelf-stable meals "
    }else if(grepl("^2814", foods[i, "FoodCode"])){	L4[i]<-"Poultry frozen or shelf-stable meals"
    }else if(grepl("^2815", foods[i, "FoodCode"])){	L4[i]<-"Fish,shellfish frozen meals"
    }else if(grepl("^2816", foods[i, "FoodCode"])){	L4[i]<-"Miscellaneous meat frozen or shelf-stable meals"
    }else if(grepl("^2831", foods[i, "FoodCode"])){	L4[i]<-"Beef soups"
    }else if(grepl("^2832", foods[i, "FoodCode"])){	L4[i]<-"Pork soups"
    }else if(grepl("^2833", foods[i, "FoodCode"])){	L4[i]<-"Lamb soups"
    }else if(grepl("^2834", foods[i, "FoodCode"])){	L4[i]<-"Poultry, soups"
    }else if(grepl("^2835", foods[i, "FoodCode"])){	L4[i]<-"Fish,shellfish soups"
    }else if(grepl("^2836", foods[i, "FoodCode"])){	L4[i]<-"Puerto Rican soups"
    }else if(grepl("^5371", foods[i, "FoodCode"])){	L4[i]<-"Cereal bars, granola bars"
    }else if(grepl("^5372", foods[i, "FoodCode"])){	L4[i]<-"Nutrition bars (protein, energy, meal)"
    }else if(grepl("^7514", foods[i, "FoodCode"])){	L4[i]<-"Raw vegetable mixtures "
    }else if(grepl("^9251", foods[i, "FoodCode"])){	L4[i]<-"Fruit juice drinks and fruit-flavored drinks"
    }else if(grepl("^9253", foods[i, "FoodCode"])){	L4[i]<-"Fruit juice drinks and fruit flavored drinks with high vitamin C"
    }else if(grepl("^9254", foods[i, "FoodCode"])){	L4[i]<-"Fruit flavored drinks, made from powdered mix"
    }else if(grepl("^9255", foods[i, "FoodCode"])){	L4[i]<-"Fruit juice drinks and fruit flavored drinks, low calorie"
    }else if(grepl("^9258", foods[i, "FoodCode"])){	L4[i]<-"Fruit juice drinks and fruit flavored drinks, fortified with calcium"
    }else if(grepl("^9531", foods[i, "FoodCode"])){	L4[i]<-"Energy drinks"
    }else if(grepl("^9532", foods[i, "FoodCode"])){	L4[i]<-"Sports drinks"
    }else if(grepl("^9533", foods[i, "FoodCode"])){	L4[i]<-"Fluid replacements"
    }else if(grepl("^9534", foods[i, "FoodCode"])){	L4[i]<-"Other functional beverages"
    }else if(grepl("^28345", foods[i, "FoodCode"])){	L4[i]<-"Poultry cream soups "}
  foods$L4<-L4
  write.table(foods, file=outdir, sep = "\t", quote = FALSE, row.names = FALSE)
}

