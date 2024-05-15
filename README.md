# The effect of monetary policy on US stock prices: 
## A Bayesian Vectored Autoregressive Model Methodology

1. The data processing is done in python using 'Data treatment.ipynb' and 'original code/industry csv creation.ipynb'
2. The first Structural VAR model is done in R in 'original code/Model 1 in R.ipynb'
3. The Bayesian Structural VAR mdeol is done in MATLAB in 'replication_file/work_matlab/main1.m'

Model is derived from Marek Jarociński and Peter Karadi's 2018 paper: Deconstructing Monetary Policy Surprises—The Role of Information Shocks

We intrumentalise Montary policy using Central Bank annoucements surprise and distinguish between true monetary policy shocks and Central Bank Information shocks. Creating the distrinction allows to remove the noise in the data.
