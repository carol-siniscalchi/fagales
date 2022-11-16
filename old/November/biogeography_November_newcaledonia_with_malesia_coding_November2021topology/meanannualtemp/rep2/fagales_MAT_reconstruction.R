library(phytools)
library(geiger)

tree <- read.tree("fagales_newquercus_run2.mcc.tre")

trait = read.csv("fagales_MAT_fossil.txt", sep = "\t", row.names=1, header = FALSE)
trait.vector = trait$V2
names(trait.vector) <- row.names(trait)
trait.vector <- trait.vector[!is.na(trait.vector)]

tree.reduced <- treedata(tree, trait.vector)$phy
treedata <- treedata(tree, trait.vector)$data
trait.reduced <- treedata[,1]
names(trait.reduced) <- row.names(treedata)

# MODEL COMPARISON
fitBM = fitContinuous(tree.reduced, trait.vector)
fitOU = fitContinuous(tree.reduced, trait.vector, model = "OU") # Make sure it is truly ultrametric even considering small rounding errors -- even a small discrepancy will cause complaints and longer runtime due to VCF optimization.
fitEB = fitContinuous(tree.reduced, trait.vector, model = "EB")

# AIC
fitBM$opt$aicc
fitOU$opt$aicc
fitEB$opt$aicc

# Root state
fitOU$opt$z0

figure = contMap(tree.reduced, trait.reduced, plot = FALSE)
figure <- setMap(figure,colors=c("deepskyblue","darkorchid1","red"))
plot(figure, outline = FALSE, fsize = c(.5,1), lwd=c(3,10), edge.width = 2)



#phenogram(tree.reduced, trait.vector, ftype="off",spread.labels=FALSE)
#title("Fagales MAT through time")

