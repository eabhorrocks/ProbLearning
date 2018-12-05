%% Multivariate linear regression

% input vector, x
% output vector/scalar, y
% Weights, W. W = sum(yi xi') * (sum(xi xi')^-1

% ridge regression:
% conjugate prior for w is a multivariate defined by A-1 (precision
% matrix). if just a multiplicative of identity then it acts as a scalar

% wmap = (alpha*eye + sum (xi xi'))^-1 sum(yixi)