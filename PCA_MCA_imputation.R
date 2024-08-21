###############PCA/MCA imputation#############
#https://cran.r-project.org/web/packages/missMDA/index.html

library(missMDA)
set.seed(99)

#For PCA
#Calculate the number of components
#PCA is for quantitative data, therefore it is necessary to specify where in the dataset the quantitative data is located
ncp.PCA <- estim_ncpPCA(original_dataset[])

#Impute
pca.imputed <- imputePCA(as.matrix(original_dataset[]), ncp = ncp.PCA$ncp, scale = TRUE, maxiter = 1000)
#scale = TRUE gives the same weight to each variable

#get the matrix with $completeObs
pca.imputed.final <- pca.imputed$completeObs

#same process for MCA as for PCA, specify where in the datast the categorical data is located
ncp.MCA <- estim_ncpMCA(original_dataset[])
mca.imputed <- imputeMCA(as.matrix(original_dataset[]), ncp = ncp.MCA$ncp, maxiter = 1000)
mca.imputed.final <- mca.imputed$completeObs

#Combine the PCA and MCA imputed datasets
PCA_MCA_combined <- cbind(mca.imputed.final, pca.imputed.final)



