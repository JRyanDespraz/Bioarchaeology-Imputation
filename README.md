These two folders contain the datasets (1 original and 15 with simulated missingness: MCAR, MAR, and MNAR at 5%, 10%, 20%, 30%, and 40% missingness) and imputation scripts used for the imputation tests in Ryan-Despraz and Wissler, 2024. "Imputation Methods for Mixed Datasets in Bioarchaeology". The folder "imputation scripts" also includes a script for comparing original values to imputed values. 

Analyses in the publication used R version 4.3.1
The following codes use default settings for basic precision testing. Please read each package's documentation for additional arguments that could be applicable to other datasets and analysis objectives.

Make sure all data types are properly recognized by R and the levels for ordered data are defined.

Additional argument information:
For Random Forest: Set ntree equal to the number of variables and maxiter (maximum number of iterations) to the desired amount (Ryan-Despraz and Wissler (2024) used 10), but it may stop sooner if the stopping criterion is met
For methods using "mice" (PMM, RSOV, and Multi-Method): set "m" equal to the number of imputations desired (e.g. equal to the percent missingness -- for example 10% missingness applies 10 imputations), set "meth" equal to the desired imputation method (e.g. "pmm" or "sample" (RSOV), see documentation for other possible methods) Ryan-Despraz and Wissler (2024) set the number of maximum iterations to 50. Please note that these methods could require large computation times.

Further instructions and information for each method are noted in the imputation code. 
