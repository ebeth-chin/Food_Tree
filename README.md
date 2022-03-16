# Food_Tree
project: FL100  
purpose: make 'phylogenetic' food tree for ASA24 foods, similar to [Johnson et al.](https://www.sciencedirect.com/science/article/abs/pii/S1931312819302501?via%3Dihub) `(Knight Lab Food Tree GitHub found [here](https://github.com/knights-lab/Food_Tree))    

## create a conda environment to run [Graphlan](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4476132/)   
installation instructions and usage can be found on the [Graphlan github page](https://github.com/biobakery/graphlan)

`conda install -c bioconda graphlan`

## optional docker container for R scripts
An optional dockerfile is provided to generate a R enviornment identical to the enviornment used here. With the dockerfile and renv.lock file you can build the container (assuming docker is installed):

`docker build -t food_tree_r:1.0 /path/to/dockerfile&renv.lock`

And run the container:

`docker run --rm -it -p 8787:8787 -e PASSWORD=yourpasswordhere -v /path/to/Food_Tree_repo:home food_tree_r:1.0`

