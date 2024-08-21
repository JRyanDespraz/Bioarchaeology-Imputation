######FAMD imputation (Factorial Analysis for Mixed Data)########

#https://cran.r-project.org/web/packages/missMDA/index.html
library(missMDA)

#Step 1: calculate the number of components
#make sure R is reading the categorical variables as factors and the quantitative variables as numeric
original_dataset <- read.csv('data/original_dataset.csv')
ncp.FAMD <- estim_ncpFAMD(original_dataset)

#Step 2: Impute
imputed_FAMD <- imputeFAMD(original_dataset, ncp = ncp.FAMD$ncp, seed = 99, maxiter = 1000)

#get the matrix with $completeObs
final_imputed_dataset <- imputed_FAMD$completeObs

