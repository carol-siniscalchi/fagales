library(phytools)
library(geiger)

tree <- read.tree("fagales.newoct22.mcc.simplified.noancestors.tre")

is.ultrametric(tree) 
tree <- force.ultrametric(tree, method="extend")

trait = read.csv("fagales_MAT_fossil.txt", sep = "\t", row.names=1, header = FALSE)
trait.vector = trait$V2
names(trait.vector) <- row.names(trait)
trait.vector <- trait.vector[!is.na(trait.vector)]

tree.reduced <- treedata(tree, trait.vector)$phy


# MODEL COMPARISON
fitBM = fitContinuous(tree.reduced, trait.vector)
fitOU = fitContinuous(tree.reduced, trait.vector, model = "OU") # Make sure it is truly ultrametric even considering small rounding errors -- even a small discrepancy will cause complaints and longer runtime due to VCF optimization.
fitEB = fitContinuous(tree.reduced, trait.vector, model = "EB")

# AIC
fitBM$opt$aicc   # 400.4274
fitOU$opt$aicc   # 376.6812
fitEB$opt$aicc   # 402.6464

# Root state
fitOU$opt$z0 # 12.84419

figure = contMap(tree.reduced, trait.vector, plot = FALSE)
figure <- setMap(figure,colors=c("deepskyblue","darkorchid1","red"))
pdf(file = "fagales.ancestral.temperature.newNov22.pdf", width = 6, height = 10)
plot(figure, outline = FALSE, fsize = c(.5,1), lwd=c(3,10), edge.width = 2)
dev.off()