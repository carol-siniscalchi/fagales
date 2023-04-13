# Fagalean phylogeny in a nutshell: Chronicling the diversification history of Fagales

Scripts, data files and figures from the manuscript "Fagalean phylogeny in a nutshell: Chronicling the diversification history of Fagales". 

## Directory structure


### RevBayes_FBD

This directory contains all the scripts and data used to run all FDB analyses (full, containing all terminals, with age of origin set between 94.0 and 125.0 my; tests with a reduced dataset and two different age of origin range; test with the morphological dataset only). 
The script "mcmc_CEFBDP.Rev" calls the other scripts and run the analysis. Within RevBayes, use the command below to execute:
```
source("mcmc_CEFBDP.Rev")
```

* **all** - full analysis
  * data
    * fagales.new.concat.nex - molecular matrix
    * fagales_morpho_new.nex - morphological matrix
    * fagales_age_range.tsv - minimum and maximum age for all taxa in the analysis
  * scripts
    * mcmc_CEFBDP.Rev - run the full analysis
    * model_FBDP.Rev - sets up the FBD model
    * model_GTRG.Rev - sets up GTR+G model for the molecular matrix
    * model_Morph.Rev - sets up the morphological model
    * model_UExp.Rev - sets up the clock model
    * summarize_CEFBD.Rev - summarizes all sampled trees and create MCC tree

* **age_of_origin_test** - defines the analyses testing different ages of origin
  * data - full dataset trimmed to match sampling of Larson-Johnson (2016)
    * fagales_dna_trimmed.nex - molecular matrix
    * fagales_morpho_trimmed.nex - morphological matrix
    * fagales_age_range_trimmed.tsv - minimum and maximum age for all taxa in the analysis
  * scripts folders - contain the same files defined above
  
* **morphology_only** - defines the analyses testing the FDB model with only the morphological dataset
  * data - same files as the full analysis
    * fagales_morpho_new.nex - morphological matrix
    * fagales_age_range.tsv - minimum and maximum age for all taxa in the analysis
  * scripts folders - contain the scripts needed to run the analysis, modified to exclude the molecular dataset
    * mcmc_CEFBDP.Rev - run the full analysis
    * model_FBDP.Rev - sets up the FBD model
    * model_Morph.Rev - sets up the morphological model
    * summarize_CEFBD.Rev - summarizes all sampled trees and create MCC tree

### RevBayes_EBD

This directory contains files related to the episodic birth-death analyses. 

* fagales.mcc.tre - tree used in the analyses
* mcmc_EBD.Rev - base script used to run the RevBayes analyses (set up for 20 time bins)
* plot_EBD.R - base script used to plot the results using the RevGadgets R package.
* EBD_10bins.pdf and EBD_10bins_ext.pdf - full and extant only results with 10 time bins
* EBD_20bins.pdf and EBD_20bins_ext.pdf - full and extant only results with 20 time bins

### biogeography

This directory contains files and scripts used to run BioGeoBears analyses.

* **all** - full analysis
   * fagales.newoct22.mcc.simplified.noancestors.tre - tree used in the analysis, with sampled ancestors removed
   * geo.txt - geographic coding
   * fagales_all_DEC.pdf - DEC reconstruction
   * node_labels_all.pdf - tree with numbered nodes
   * range_probabilities_all.txt - range probabilities for each node
  
 * **extant_only** - extant only analysis
   * fagales.newoct22.mcc.simplified.noancestors.extantonly.tre - tree used in the analysis, with sampled ancestors and extinct taxa removed
   * geo.trim.txt - geographic coding
   * fagales_extantonly_DEC.pdf - DEC reconstruction
   * labels_extant.pdf - tree with numbered nodes
   * range_probabilities_extant.txt - range probabilities for each node
  
  * **map_bio_regions** - map containing the regions used for coding
  
  ### temperature_reconstruction
  
  Files and scripts to perform the reconstruction.
  
  * fagales_MAT_fossil.txt - mean temperatures
  * fagales_temp_recon.R - script that performs the reconstruction
  * fagales.newoct22.mcc.simplified.noancestors.tre - tree used in the reconstruction
  * fagales.ancestral.temperature.newNov22.pdf - result
