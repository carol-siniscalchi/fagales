library(phytools)

filenames = dir(pattern="*.tre")
for (i in filenames){
tree <- read.nexus(i)
tree$node.label<-NULL
tree <- di2multi(tree, tol = 1e-08)
tree <- multi2di(tree, random = TRUE)
tree <- collapse.singles(tree)
tree$edge.length[tree$edge.length==0] <- 1e-6
#tree <- force.ultrametric(tree, method="extend")
write.tree(tree, sprintf("./%s.fixed.tre", i))
}


#### For multiple trees split into lots of single files -- multiphylo is hard to work with 
# Assuming the source file is one tree per line use something like:  
# split --suffix-length=3 --lines=1 -d fagales_combined_run9.trees.subset.tre
# rename 's/$/.tre/g' *

# Do not use force.ultrametric with sampled fossils