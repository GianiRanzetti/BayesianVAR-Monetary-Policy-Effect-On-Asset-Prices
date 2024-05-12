% Step 1: Extract posterior draws of residuals
resid = res.resid_draws; % Residuals from the VAR model

num_draws = size(resid, 3); % Number of posterior draws

median_resid = median(resid, 3);
csvwrite('/Users/gianiranzetti/Github/Monetary-policy-effect-on-Stock-Prices/data/median_resid.csv', median_resid);