clear
cls

import excel using "$data/spy_data_ordered.xlsx", firstrow


gen month = mofd(Date)
format month %tm
tsset month

// Run VAR model and look at sign of the coefficient on the lags
var FuturesShock SPXShock YTreasury SPXTotal GDP PCEPI, lags(1/12)

matrix A = (-1,0,0,0,0,0\0,-1,0,0,0,0\.,.,1,0,0,0\.,.,.,1,0,0\.,.,.,.,1,0\.,.,.,.,.,1)
matrix B = (1,0,0,0,0,0\0,.,0,0,0,0\0,0,.,0,0,0\0,0,0,.,0,0\0,0,0,0,.,0\0,0,0,0,0,.)


svar FuturesShock SPXShock YTreasury SPXTotal GDP PCEPI, aeq(A) beq(B) //will check granger causality for best order

irf create VAR1, set(VAR1, replace)
irf graph irf, impulse(FuturesShock)
