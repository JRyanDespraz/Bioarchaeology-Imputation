###############PCA/MCA imputation#############

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

#Step 2: Load the imputation libary
#https://cran.r-project.org/web/packages/missMDA/index.html
library(missMDA)
set.seed(99)

#For PCA
#Calculate the number of components
#PCA is for quantitative data, therefore it is necessary to specify where in the dataset the quantitative data is located
ncp.PCA <- estim_ncpPCA(dataset_with_missingness[,14:41])

#Impute
pca.imputed <- imputePCA(as.matrix(dataset_with_missingness[,14:41]), ncp = ncp.PCA$ncp, scale = TRUE, maxiter = 1000)
#scale = TRUE gives the same weight to each variable

#get the matrix with $completeObs
pca.imputed.final <- pca.imputed$completeObs

#same process for MCA as for PCA, specify where in the datast the categorical data is located
ncp.MCA <- estim_ncpMCA(dataset_with_missingness[,1:13])
mca.imputed <- imputeMCA(as.matrix(dataset_with_missingness[,1:13]), ncp = ncp.MCA$ncp, maxiter = 1000)
mca.imputed.final <- mca.imputed$completeObs

#Combine the PCA and MCA imputed datasets
PCA_MCA_combined <- cbind(mca.imputed.final, pca.imputed.final)



