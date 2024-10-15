library(tidyverse)

# Plotting the accumulation curve in ggplot:
# with base R. 
# plot(accum.curve, xaxt = "n", xlab = "", ylab = "Richness")
# site_names <- row.names(otu.tab.trans)
# axis(1, at = 1:length(site_names), labels = site_names, las = 2, cex.axis = 0.7)

# Using ggplot: 
accum_df <- accum.curve$richness %>% as_tibble()
colnames(accum_df) <- "Richness"
accum_df$Date <- row.names(otu.tab.trans)
accum_df


# Plot using ggplot
ggplot(accum_df, aes(x = Date, y = Richness, group = "Richness")) +
  geom_line() +
  geom_point() +
  labs(x = "Sites", y = "Richness", title = "Species Accumulation Curve") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


# plotting the Shannon H index 
H <- diversity(otu.tab.trans, index = "shannon")
H
# The simple plot: 
plot(H, type = "l", col = "blue")

H_df <- as.data.frame(H)
row.names(H_df)
H_df$Date <- row.names(H_df) 
H_df

ggplot(H_df, aes(x = Date, y = H, group = 1)) +
  geom_line() +  # Line plot
  geom_point() +  # Points on the line
  labs(x = "Date", y = "H", title = "H values over time") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) 

# Plotting trees: 
library(ape)

# Convert the consensus tree from recluster into a phylo object if it's not already
tree <- otu.tab.trans.ss.nozero.bray.upgma$cons

# Basic tree plot with ape
plot.phylo(tree, type = "unrooted", # Circular layout
           edge.width = 2,     # Thicker branches for visibility
           cex = 0.7,          # Adjust label size
           tip.color = "blue") # Color tips (OTU labels)

# Add bootstrap values to the tree (assuming they are stored in the tree$node.label)
nodelabels(tree$node.label, frame = "none", cex = 0.6, adj = c(1.2, -0.5), col = "red")

# Optionally, you can ladderize the tree to improve readability:
tree <- ladderize(tree)

# Re-plot the ladderized tree
plot.phylo(tree, type = "fan", edge.width = 2, cex = 0.7, tip.color = "blue")
# You can also try "unrooted" or "phylogram" for other layouts.
nodelabels(tree$node.label, frame = "none", cex = 2.6, col = "red")

plot.phylo(tree, direction = "right")
nodelabels(as.data.frame(otu.tab.trans.ss.nozero.bray.upgma.boot)$V1, frame = "none", cex = 1.6, col = "red")


