# Fagalean phylogeny in a nutshell: Chronicling the diversification history of Fagales

Scripts, data files and figures from the manuscript "Fagalean phylogeny in a nutshell: Chronicling the diversification history of Fagales". 

## Directory structure

### EBD_plots

This directory contains files related to the episodic birth-death analyses. 

* **fagales.mcc.tre** - tree used in the analyses
* **mcmc_EBD.Rev** - base script used to run the RevBayes analyses (set up for 20 time bins)
* **plot_EBD.R** - base script used to plot the results using the RevGadgets R package.
* **EBD_10bins.pdf** and **EBD_10bins_ext.pdf** - full and extant only results with 10 time bins
* **EBD_20bins.pdf** and **EBD_20bins_ext.pdf** - full and extant only results with 20 time bins

### RevBayes_scripts

This directory contains all the scripts used to run the FDB analysis. As set up, it runs the full analysis, containing all terminals, with age of origin between 94.0 and 125.0 million years. The script "mcmc_CEFBDP.Rev" calls the other scripts and run the analysis. Within RevBayes, use the command below to execute:

```
source("mcmc_CEFBDP.Rev")
```

### biogeography

This directory contains files and scripts used to run BioGeoBears analyses.

* **all** - full analysis
  * fagales.newoct22.mcc.simplified.noancestors.tre - tree used in the analysis, with sampled ancestors removed
  * geo.txt - geographic coding
  * fagales_all_DEC.pdf - DEC reconstruction
  * node_labels_all.pdf - tree with numbered nodes
  *range_probabilities_all.txt - range probabilities for each node
