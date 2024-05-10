cls
clear all
//ssc install var_nr

cd "/Users/gianiranzetti/Github/Monetary-policy-effect-on-Stock-Prices/Stata"

global dofile  "/Users/gianiranzetti/Github/Monetary-policy-effect-on-Stock-Prices/Stata/dofiles"

global data "/Users/gianiranzetti/Github/Monetary-policy-effect-on-Stock-Prices/Stata/data"

global output  "/Users/gianiranzetti/Github/Monetary-policy-effect-on-Stock-Prices/Stata/output"

cd "$dofile"

// Summary Statistic table
do "$dofile/VAR.do"

do "$dofile/SVAR.do"
