#########Hotdeck imputation###########

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

#Step 2: Load the imputation library
#https://cran.r-project.org/web/packages/VIM/VIM.pdf
library(VIM)

#Step 3: Perform the imputation
set.seed(99)
imputed_hotdeck <- hotdeck(original_dataset, imp_var = FALSE)


