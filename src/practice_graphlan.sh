cd ../data/02_manual_taxonomy_curation

graphlan_annotate --annot /Users/elizabeth.chin/Desktop/milk/Food_Tree/food_tree_gits/food_graphlan-master/data/annot_1.txt FL100_final_taxonomy.txt practice.tree.xml

graphlan_annotate --annot /Users/elizabeth.chin/Desktop/milk/Food_Tree/food_tree_gits/food_graphlan-master/data/annot_2.txt  practice.tree.xml practice.tree2.xml

graphlan_tree practice.tree2.xml practice.colors.png --dpi 300 --size 5 --external_legend

