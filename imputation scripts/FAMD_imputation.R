######FAMD imputation (Factorial Analysis for Mixed Data)########

#Step 1: Load the dataset with missingness
# Load the necessary library
library(readr)

# Load the dataset containing missingness with semicolon-separated columns and decimal points
# Dataset: here we use the example dataset "MAR_10percent_missingness.csv" from the publication, which is available in the "data" folder
dataset_with_missingness <- read_delim("MAR_10percent_missingness.csv", delim = ";", locale = locale(decimal_mark = "."))

# Set data types
dataset_with_missingness[, 1:7] <- lapply(dataset_with_missingness[, 1:7], as.factor)
dataset_with_missingness$AgeGroup <- factor(dataset_with_missingness$AgeGroup, ordered = TRUE, levels = c("1", "2", "3", "4", "5"))
dataset_with_missingness[, 9:13] <- lapply(dataset_with_missingness[, 9:13], factor, ordered = TRUE, levels = c("0", "0.5", "1", "2", "3"))
dataset_with_missingness[, 14:41] <- lapply(dataset_with_missingness[, 14:41], as.numeric)

#Step 2: Load the necessary library for imputation
#https://cran.r-project.org/web/packages/missMDA/index.html
library(missMDA)

#Step 3: calculate the number of components
#Ensure that the dataset is converted to a data frame
dataset_with_missingness <- as.data.frame(dataset_with_missingness)

# Ensure that all factor variables are properly handled
for (col in names(dataset_with_missingness)) {
  if (is.factor(dataset_with_missingness[[col]])) {
    dataset_with_missingness[[col]] <- as.character(dataset_with_missingness[[col]])
  }
}

# Convert character columns back to factors
for (col in names(dataset_with_missingness)) {
  if (is.character(dataset_with_missingness[[col]])) {
    dataset_with_missingness[[col]] <- as.factor(dataset_with_missingness[[col]])
  }
}

ncp.FAMD <- estim_ncpFAMD(dataset_with_missingness)

#Step 4: Impute
imputed_FAMD <- imputeFAMD(dataset_with_missingness, ncp = ncp.FAMD$ncp, seed = 99, maxiter = 1000)

#get the final imputed matrix with $completeObs
final_famd_imputed_dataset <- imputed_FAMD$completeObs

