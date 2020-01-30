##make sure you cd into the directory where your input newick tree data lives

graphlan_annotate --annot /Users/elizabeth.chin/Desktop/milk/Food_Tree/food_tree_gits/food_graphlan-master/data/annot_1.txt fl100_newick_tree.txt fl100.tree.xml

graphlan_annotate --annot /Users/elizabeth.chin/Desktop/milk/Food_Tree/food_tree_gits/food_graphlan-master/data/annot_2.txt  fl100.tree.xml fl100.tree2.xml

graphlan_tree fl100.tree2.xml fl100.food.tree.png --dpi 300 --size 5 --external_legend

