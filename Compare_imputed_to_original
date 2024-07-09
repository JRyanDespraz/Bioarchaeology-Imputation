###### Calculations used for comparing an imputed dataset to an original dataset ##################
#https://cran.r-project.org/web/packages/missMethods/index.html

library(missMethods)

# These calculations are for categorical data, therefore the rows/columns with categorical data need to be specified
categ.precision <- evaluate_imputed_values(imputed_dataset[], original_dataset[], criterion = "precision")
nr_equal <- evaluate_imputed_values(imputed_hotdeck[], original_dataset[], criterion = "nr_equal")
res.MAE <- evaluate_imputed_values(imputed_hotdeck[], original_dataset[], criterion = "MAE")

# These calculations are only for quantitative data, therefore the rows/columns with quantitative data need to be specified
NRMSE_col_mean_sq <- evaluate_imputed_values(imputed_hotdeck[], original_dataset[], criterion = "NRMSE_col_mean_sq")
NRMSE_tot_sd <- evaluate_imputed_values(imputed_hotdeck[], original_dataset[], criterion = "NRMSE_tot_sd") 

#relative MAE
#call out applicable columns/rows
#when applicable, make sure data type is recognized as.numeric
#it may be necessary to unlist the data (e.g. unlist(lapply(dataset[], as.numeric))
absolute_data <- abs(original[] - imputed[])
print(mean(absolute_data))

cat("categ.precision =", categ.precision, "nr_equal =", nr_equal, "res.MAE"  =", res.MAE, "NRMSE_col_mean_sq =", NRMSE_col_mean_sq, "NRMSE_tot_sd =", NRMSE_tot_sd)
