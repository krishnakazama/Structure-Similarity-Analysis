library(pheatmap)

pheatmap(sim,
         main = "Heatmap of Molecular Similarity",
         cluster_rows = TRUE,  # Cluster rows
         cluster_cols = TRUE,  # Cluster columns
         display_numbers = TRUE,  # Display similarity values
         number_format = "%.2f",  # Format for numbers
         fontsize_number = 10,  # Font size for numbers
         fontsize_row = 10,  # Font size for row labels
         fontsize_col = 10,  # Font size for column labels
         color = colorRampPalette(c("blue", "white", "red"))(50)  # Color gradient
)
