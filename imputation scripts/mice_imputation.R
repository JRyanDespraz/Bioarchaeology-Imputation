####----mice imputation: PMM and RSOV -----##########

####Step 1: Load the dataset containing missingness
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


####Step 2: Perform the imputation
#load the necessary library
#https://cran.r-project.org/web/packages/mice/index.html
library(mice)

#set "m" equal to the number of imputations desired 
#set "meth" equal to either "pmm" or "sample" (RSOV), see documentation for other possible methods
mice_imputed <- mice(dataset_with_missingness, m=10, maxit=50, meth="pmm", seed=99) 

#Obtain complete datasets
mice.complete <- complete(mice_imputed)

#The above example generates 10 imputed datasets. To view a specific dataset, for example the 3rd imputed dataset, use code, "complete(mice_imputed, 3)"


####Step 3: If desired, combine the imputed datasets (m) into a single, master dataset based on the mode of categorical variables and the mean of numeric variables
#Please note that combining the datasets is not necessarily advised for statistical analyses. Ryan-Despraz and Wissler (2024) combined the datasets in order to compare imputation methods, not for data analysis
# Load necessary libraries
library(dplyr)
library(mice)

# Function to calculate mode
get_mode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

# Initialize an empty data frame to store the final dataset
final_mice_imputed_dataset <- data.frame(matrix(ncol = ncol(mice.complete), nrow = nrow(mice.complete)))

# Loop through each column to calculate mode for categorical and mean for numeric
for (i in 1:ncol(mice.complete)) {
  if (i <= 13) {
    # Calculate mode for categorical variables across all imputations
    modes <- apply(sapply(1:5, function(m) complete(mice_imputed, m)[, i]), 1, get_mode)
    final_mice_imputed_dataset[, i] <- modes
  } else {
    # Calculate mean for numeric variables across all imputations
    means <- rowMeans(sapply(1:5, function(m) complete(mice_imputed, m)[, i]), na.rm = TRUE)
    final_mice_imputed_dataset[, i] <- means
  }
}

# Set column names
colnames(final_mice_imputed_dataset) <- colnames(mice.complete)


  


