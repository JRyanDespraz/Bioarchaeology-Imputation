#################PMM and RSOV imputation##########
#https://cran.r-project.org/web/packages/mice/index.html

##Perform imputations using MICE
##set "m" equal to the number of imputations desired 
##set "meth" equal to either "pmm" or "sample" (RSOV), see documentation for other possible methods
##Ryan-Despraz and Wissler (2024) set the number of maximum iterations to 50

library(mice)
PMM_imputed <- mice(original_dataset, m=, maxit=, meth=, seed=99) 

##Obtain complete dataset
pmm.complete <- complete(PMM_imputed)

##For multiple imputations, this needs to be calculated for each imputation. For example, if "m=5":
#complete1 <- complete(PMM_imputed, 1)
#complete2 <- complete(PMM_imputed, 2)
#complete3 <- complete(PMM_imputed, 3)
#complete4 <- complete(PMM_imputed, 4)
#complete5 <- complete(PMM_imputed, 5)

##for the quantitative data, calculate the average to achieve one final, complete dataset
#pmm_quant_dataframe <- (complete1[] + complete2[] + complete3[] + complete4[] + complete5[])/5

##for the qualitative data, calculate the mode 
#find_mode <- function(x) {
#  u <- unique(x)
#  tab <- tabulate(match(x, u))
#  m = u[tab == max(tab)]
#  if (length(m)>1) {
#    return (sample(m, size=1))
#  }
#  return (m)
#}

##an example for calculating the mode of each column: 
#for (x in 1:481){
#sex.mode <- find_mode(c(complete1$Sex[x], complete2$Sex[x], complete3$Sex[x], complete4$Sex[x], complete5$Sex[x]))
#}
##then combine into a dataframe, for example:
#colnames(categ_df) <- c("Column1", "Column2", "Column3")

##combine the quantitative and qualitative datasets, for example:
#final_dataset <- cbind(unordered_data, ordered_data, binary_data, pmm_quant_dataframe)


#----------------------------------------
#Multi-method imputation using MICE
library(mice)

#Assuming columns are variables, set the desired imputation method for each column based on data type. For example (using the four methods used by Ryan-Despraz and Wissler (2024)): 
imputation_methods <- c("lasso.select.logreg", "polyreg", "polr", "lasso.select.norm")

#This method also uses mice, therefore the above criteria (e.g. for multiple imputations) used for PMM and RSOV also applies here
multi.method.imputed <- mice(original_dataset, m=, maxit=, method = imputation_methods,  seed=99)
  


