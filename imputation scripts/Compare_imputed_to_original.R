###### Calculations used for comparing an imputed dataset to an original dataset ##################
#https://cran.r-project.org/web/packages/missMethods/index.html
library(missMethods)

#Step 1: Load the original and imputed datasets
# Load the necessary library
library(readr)

# Load the original dataset with semicolon-separated columns and decimal points
original_dataset <- read_delim("original_dataset.csv", delim = ";", locale = locale(decimal_mark = "."))

# Set data types
original_dataset[, 1:7] <- lapply(original_dataset[, 1:7], as.factor)
original_dataset$AgeGroup <- factor(original_dataset$AgeGroup, ordered = TRUE, levels = c("1", "2", "3", "4", "5"))
original_dataset[, 9:13] <- lapply(original_dataset[, 9:13], factor, ordered = TRUE, levels = c("0", "0.5", "1", "2", "3"))
original_dataset[, 14:41] <- lapply(original_dataset[, 14:41], as.numeric)

# Load the dataset containing missingness with semicolon-separated columns and decimal points
dataset_with_missingness <- read_delim("MAR_10percent_missingness.csv", delim = ";", locale = locale(decimal_mark = "."))

# Set data types
dataset_with_missingness[, 1:7] <- lapply(dataset_with_missingness[, 1:7], as.factor)
dataset_with_missingness$AgeGroup <- factor(dataset_with_missingness$AgeGroup, ordered = TRUE, levels = c("1", "2", "3", "4", "5"))
dataset_with_missingness[, 9:13] <- lapply(dataset_with_missingness[, 9:13], factor, ordered = TRUE, levels = c("0", "0.5", "1", "2", "3"))
dataset_with_missingness[, 14:41] <- lapply(dataset_with_missingness[, 14:41], as.numeric)


#Step 2: Evaluate the differences between original and imputed values
#load the necessary library
library(missMethods)

# These calculations are for binary and unordered categorical data
# Make sure to specify applicable variables
binary.precision <- evaluate_imputed_values(dataset_with_missingness[,1:2], original_dataset[,1:2], criterion = "precision")
unorderd_precision <- evaluate_imputed_values(dataset_with_missingness[,3:7], original_dataset[,3:7], criterion = "precision")

# These calculations are for ordered categorical variables
# Ryan-Despraz and Wissler (2024) calculated the "Age" variable separately as the levels were different from the other ordered variables
# For age: 
original.age <- as.numeric(original_dataset$AgeGroup)
imputed.age <- as.numeric(dataset_with_missingness$AgeGroup)
absolute.age <- abs(original.age - imputed.age)
MAE.age <- mean(absolute.age)

# For other ordered data: 
original.ordered <- unlist(lapply(original_dataset[,9:13], as.numeric))
imputed.ordered <- unlist(lapply(dataset_with_missingness[,9:13], as.numeric))
absolute.ordered <- abs(original.ordered - imputed.ordered)
MAE.ordered <- mean(absolute.ordered)

# These calculations are only for quantitative data, therefore the rows/columns with quantitative data need to be specified
NRMSE_col_mean_sq <- evaluate_imputed_values(dataset_with_missingness[,14:41], original_dataset[,14:41], criterion = "NRMSE_col_mean_sq")
NRMSE_tot_sd <- evaluate_imputed_values(dataset_with_missingness[,14:41], original_dataset[,14:41], criterion = "NRMSE_tot_sd") 
MAE_rel <- evaluate_imputed_values(dataset_with_missingness[,14:41], original_dataset[,14:41], criterion = "MAE_rel")

# Print all calculated values with labels
cat("binary.precision =", binary.precision, "\n")
cat("unorderd_precision =", unorderd_precision, "\n")
cat("MAE.age =", MAE.age, "\n")
cat("MAE.ordered =", MAE.ordered, "\n")
cat("NRMSE_col_mean_sq =", NRMSE_col_mean_sq, "\n")
cat("NRMSE_tot_sd =", NRMSE_tot_sd, "\n")
cat("MAE_rel =", MAE_rel, "\n")
