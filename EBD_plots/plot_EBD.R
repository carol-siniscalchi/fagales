
library(RevGadgets)

tree <- read.nexus("fagales.mcc.tre")

rev_out <- processDivRates(speciation_time_log = "fagales_EBD_speciation_times.log",
                           speciation_rate_log = "fagales_EBD_speciation_rates.log", 
                           extinction_time_log = "fagales_EBD_extinction_times.log",
                           extinction_rate_log = "fagales_EBD_extinction_rates.log",
                           burnin=0.1)


pdf("EBD.pdf")
par(mfrow=c(2,2))
plotDivRates(rev_out)
dev.off()
