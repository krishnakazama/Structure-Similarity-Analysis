calculate_similarity_matrix_from_smiles <- function(smiles_file) {
  # Read the SMILES data from the file
  input_data <- readLines(smiles_file)
  
  # Split the input into headers and SMILES
  headers <- sapply(strsplit(input_data, " "), `[`, 1)  # Extract headers
  smiles_vector <- sapply(strsplit(input_data, " "), `[`, 2)  # Extract SMILES
  
  # Convert SMILES to SDF
  sdfset <- smiles2sdf(smiles_vector)
  
  # Assign unique headers as compound IDs
  cid(sdfset) <- headers
  
  # Convert SDF to APS
  apset <- sdf2ap(sdfset) 
  
  # Make unique IDs for compounds
  unique_ids <- makeUnique(cid(sdfset))
  
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
