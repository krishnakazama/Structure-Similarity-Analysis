
calculate_similarity_matrix <- function(sdf_file) {
  # Read the SDF file
  sdfset <- read.SDFset(sdf_file)
  
  # Convert SDF to APS
  apset <- sdf2ap(sdfset) 
  
  # Make unique IDs for compounds
  unique_ids <- makeUnique(sdfid(sdfset))
  cid(sdfset) <- unique_ids 
  
  # Calculate the number of compounds
  num_compounds <- length(apset)
  
  # Initialize a similarity matrix
  similarity_matrix <- matrix(0, nrow = num_compounds, ncol = num_compounds)
  
  # Calculate pairwise Tanimoto similarities
  for (i in 1:num_compounds) {
    for (j in 1:num_compounds) {
      similarity_matrix[i, j] <- cmp.similarity(apset[[i]], apset[[j]])
    }
  }
  
  # Set row and column names for the similarity matrix
  rownames(similarity_matrix) <- unique_ids
  colnames(similarity_matrix) <- unique_ids
  
  # Return the similarity matrix
  return(similarity_matrix)
}
