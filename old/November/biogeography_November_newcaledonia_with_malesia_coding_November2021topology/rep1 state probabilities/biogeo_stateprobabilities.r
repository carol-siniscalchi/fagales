# Load a DEC result for rep 1 into memory before starting

####################################
# Probabilities of states/ranges at each node
####################################
# To get the probabilities of each state/range at each node:
# What you want, if "res" is your results object, is:
res$ML_marginal_prob_each_state_at_branch_top_AT_node

# In this table:
# - columns are states/ranges
# - rows are nodes, in APE order (tips, then root, then internal)

#  You can see the node numbers in the same APE order with:
trtable = prt(tr, printflag=FALSE)
head(trtable)
tail(trtable)

# Plot tree with node labels
plot(tr, cex = 0.4)
axisPhylo()
nodelabels(cex = 0.4)
tiplabels(1:length(tr$tip.label), cex = 0.4)

# Get your states list (assuming, say, 4-area analysis, with max. rangesize=4)
max_range_size = 5
areas = getareas_from_tipranges_object(tipranges)

# This is the list of states/ranges, where each state/range
# is a list of areas, counting from 0
library(cladoRcpp)
states_list_0based = rcpp_areas_list_to_states_list(areas=areas, maxareas=max_range_size, include_null_range=TRUE)

# Make the list of ranges
ranges_list = NULL
for (i in 1:length(states_list_0based))
    {    
    if ( (length(states_list_0based[[i]]) == 1) && (is.na(states_list_0based[[i]])) )
        {
        tmprange = "_"
        } else {
        tmprange = paste(areas[states_list_0based[[i]]+1], collapse="")
        }
    ranges_list = c(ranges_list, tmprange)
    }

# Look at the ranges list
ranges_list

# Make the node numbers the row names
# Make the range_list the column names
range_probabilities = as.data.frame(res$ML_marginal_prob_each_state_at_branch_top_AT_node)
row.names(range_probabilities) = trtable$node
names(range_probabilities) = ranges_list

# Look at the table (first six rows)
head(range_probabilities)

# Write the table to a tab-delimited text file (for Excel etc.)
write.table(range_probabilities, file="range_probabilities.txt", quote=FALSE, sep="\t")

# Look at the file
moref("range_probabilities.txt")





