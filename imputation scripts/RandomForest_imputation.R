############Random Forest imputation###########
#Step 1: Load the dataset containing missingness
# Load the necessary library
library(readr)

# Load the dataset containing missingness with semicolon-separated columns and decimal points
dataset_with_missingness <- read_delim("MAR_10percent_missingness.csv", delim = ";", locale = locale(decimal_mark = "."))

# Set data types
dataset_with_missingness[, 1:7] <- lapply(dataset_with_missingness[, 1:7], as.factor)
dataset_with_missingness$AgeGroup <- factor(dataset_with_missingness$AgeGroup, ordered = TRUE, levels = c("1", "2", "3", "4", "5"))
dataset_with_missingness[, 9:13] <- lapply(dataset_with_missingness[, 9:13], factor, ordered = TRUE, levels = c("0", "0.5", "1", "2", "3"))
dataset_with_missingness[, 14:41] <- lapply(dataset_with_missingness[, 14:41], as.numeric)

#Step 2: Load the imputation library
# Load the missForest library
# https://cran.r-project.org/web/packages/missForest/index.html
library(missForest)

# Set seed for reproducibility
set.seed(99)

# Ensure dataset_with_missingness is a data frame
dataset_with_missingness <- as.data.frame(dataset_with_missingness)

# Perform random forest imputation
# "ntree" is set to the number of variables
imputed_rf_dataset <- missForest(dataset_with_missingness, maxiter = 10, ntree = 41, verbose=TRUE)

# Extract the imputed data
final_rf_imputed_dataset <- imputed_dataset$ximp
