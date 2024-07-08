These are the codes for imputing mixed datasets used in: Ryan-Despraz and Wissler, 2024. "Imputation Methods for Mixed Datasets in Bioarchaeology". Archaeological and Anthropological Sciences. 

Analyses in the publication used R version 4.3.1
The following codes use default settings for basic precision testing. Please read each package's documentation for additional arguments that could be applicable to other datasets and analysis objectives. 
Make sure all data types are properly recognized by R and the levels for ordered data are defined.

Additional argument information:
For RF: Set ntree equal to the number of variables and maxiter (maximum number of iterations) to 10, but it may stop sooner if the stopping criterion is met
For methods using "mice" (PMM, RSOV, and MM): set "m" equal to the number of imputations desired (e.g. equal to the percent missingness -- for example 10% missingness applies 10 imputations), set "meth" equal to either "pmm" or "sample" (RSOV), see documentation for other possible methods, Ryan-Despraz and Wissler (2024) set the number of maximum iterations to 50

See the documentation for missMethods (https://www.rdocumentation.org/packages/missMethods/versions/0.4.0/topics/evaluate_imputed_values) for a complete overview of all evaluation metrics for comparing original with imputed data
