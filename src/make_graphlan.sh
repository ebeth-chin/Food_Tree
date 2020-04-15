## first run: 
# conda activate graphlan 

cd /Users/elizabeth.chin/Desktop/milk/Food_Tree/data/03_make_newick_tree_all_foods/

graphlan_annotate --annot annot_1.txt fl100_newick_tree_all_foods.txt fl100.tree.xml

graphlan_annotate --annot annot_2.txt  fl100.tree.xml fl100.tree2.xml

graphlan_tree fl100.tree2.xml fl100_food_tree_all_foods.png --dpi 300 --size 5 --external_legend

cd /Users/elizabeth.chin/Desktop/milk/Food_Tree/data/05_make_newick_tree_foods_from_recalls/

graphlan_annotate --annot ../03_make_newick_tree_all_foods/annot_1.txt fl100_newick_tree_from_recalls.txt fl100.tree.xml

graphlan_annotate --annot ../03_make_newick_tree_all_foods/annot_2.txt  fl100.tree.xml fl100.tree2.xml

graphlan_tree fl100.tree2.xml fl100_food_tree_from_recalls.png --dpi 300 --size 5 --external_legend

