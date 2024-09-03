These are the codes and datasets (1 original and 15 with simulated missingness: MCAR, MAR, and MNAR at 5%, 10%, 20%, 30%, and 40% missingness) used for the imputation tests in Ryan-Despraz and Wissler, 2024. "Imputation Methods for Mixed Datasets in Bioarchaeology". 

Analyses in the publication used R version 4.3.1
The following codes use default settings for basic precision testing. Please read each package's documentation for additional arguments that could be applicable to other datasets and analysis objectives.
As an example, the codes calculate imputations for the dataset "MCAR_10percent_missingness.csv" from the original study. 

Make sure all data types are properly recognized by R and the levels for ordered data are defined.

Additional argument information:
For Random Forest: Set ntree equal to the number of variables and maxiter (maximum number of iterations) to 10, but it may stop sooner if the stopping criterion is met
For methods using "mice" (PMM, RSOV, and MM): set "m" equal to the number of imputations desired (e.g. equal to the percent missingness -- for example 10% missingness applies 10 imputations), set "meth" equal to either "pmm" or "sample" (RSOV), see documentation for other possible methods, Ryan-Despraz and Wissler (2024) set the number of maximum iterations to 50

