clear
cls

// what if you can save the ceoffeicients after the sign restriction and then force it into a VAR??

import excel using "$data/spy_data_ordered.xlsx", firstrow
//irf drop myirf

gen month = mofd(Date)
format month %tm
tsset month

//var FuturesShock SPXShock YTreasury SPXTotal GDP PCEPI, lags(1)
//will check granger causality for best order
 
matrix A = (-1,0,0,0,0,0\0,-1,0,0,0,0\.,.,1,0,0,0\.,.,.,1,0,0\.,.,.,.,1,0\.,.,.,.,.,1)
matrix B = (.,0,0,0,0,0\0,.,0,0,0,0\0,0,.,0,0,0\0,0,0,.,0,0\0,0,0,0,.,0\0,0,0,0,0,.)


svar FuturesShock SPXShock YTreasury SPXTotal GDP PCEPI, aeq(A) beq(B)

var_nr sr, varname("v") opt("opts")
var_nr_options_display , optname("opts") all

mata
// load matrices into associative array to prep for calculations
s = shock_create(v)
shock_name(("MP Shock", "CBI Shock", "GDP", "CPI"), s)

shock_set(1,1,"+","MP Shock","FuturesShock",s)
shock_set(1,1,"-","MP Shock","SPXShock",s)

shock_set(1,1,"+","CBI Shock","FuturesShock",s)
shock_set(1,1,"+","CBI Shock","SPXShock",s)

// set options
opts = opt_set()
opts.ndraws = 1000
opts.err_lmt = 10000
opts.updt = "yes"
opts.updt_frqcy = 1000
opts.err_lmt = 10000
opts.shut = 1
opts.shck_plt = "MP Shock"
opts.save_fmt="png"
opts.pctg=68
opt_display(opts)

// run narrative sign restrictions routine
stata("set seed 42069")
SR = sign_restrict(v,s,opts)

// IRF, FEVD, HD calculations
IRF_set = sr_analysis_funct("irf",SR,opts)

// plot and save
irf_plot(asarray(IRF_set,"median"),asarray(IRF_set,"bands"),v,opts)
end
