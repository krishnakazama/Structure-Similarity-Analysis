# Structure-Similarity-Analysis
Matrix generation for  small molecule structure (drug and drug like compounds) similarity 

1. Load the required libraries: R language
   
    if (!requireNamespace("BiocManager", quietly=TRUE)) {
      install.packages("BiocManager")
    }
   
    BiocManager::install("ChemmineR")
   
    BiocManager::install("ChemmineOB")

  library(ChemmineR)

  library(ChemmineOB)


# Similarity Matrix Calculation from SDF
This repository contains a function to calculate the similarity matrix from an SDF file using Tanimoto similarity.

## Function
### `calculate_similarity_matrix(sdf_file)`
Copy the functiona and run it 

calculate_similarity_matrix("combined.sdf") ## run this by placing your ".sdf" file instead of combined   
Eg. 
- **sdf_file**: A string representing the path to the SDF file.
- 
#### Returns:
- A similarity matrix where each entry represents the Tanimoto similarity between pairs of compounds.


# Similarity Matrix Calculation from smiles
This repository contains a function to calculate the similarity matrix from an SDF file using Tanimoto similarity.

## Function
### `calculate_similarity_matrix_from_smiles (sdf_file)`
Copy the functiona and run it 
calculate_similarity_matrix("combined.sdf") ## run this by placing your ".sdf" file instead of combined   
Eg. 
- **sdf_file**: A string representing the path to the SDF file.
- 
#### Returns:
- A similarity matrix where each entry represents the Tanimoto similarity between pairs of compounds.


