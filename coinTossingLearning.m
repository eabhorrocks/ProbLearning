%% coin tossing learning

% Bernoulli distribution, in exponential form
% parameter q, observation x

%P(x|q) = q^x (1-q)^(1-x)
%       = (1-q) exp(log(q/(1-q))
% natural param is log odds log(q/(1-q))
% sufficient statistics is number of heads

% prior has form of Beta distribution: 1/B(tau+1, v-tau+1)

% likelihood will also be beta distribution
% alpha1 = 1 + tau + sum(X), alpha2 = 1+(v+n) - (tau + sum(X))

qinterval = 0:0.01:1;

% 2 learners: A - all q equally plausible. B - fair q more likely

Aa1 = 1; Aa2 = 1;
Ba1 = 10; Ba2 = 10;

Abeta = betapdf(qinterval,Aa1,Aa2);
Bbeta = betapdf(qinterval,Ba1,Ba2);

subplot(121)
plot(qinterval,Abeta), grid on,
ylabel('P(q)')
title('Learner A')
subplot(122)
plot(qinterval,Bbeta), grid on,
title('Learner B')



coinP = 0.9; % probs of heads
nTosses = 100;

% generate coin tosses

tosses = rand(nTosses,1);
X = zeros(size(tosses));
X(tosses <= coinP) = 1;


for i = 1:numel(X)
    if X(i) == 1
        Aa1 = Aa1+1;
        Ba1 = Ba1+1;
    else
        Aa2 = Aa2+1;
        Ba2 = Ba2+1;
    end
    Abeta = betapdf(qinterval,Aa1,Aa2);
    Bbeta = betapdf(qinterval,Ba1,Ba2);
    pause
    X(i)
    subplot(121)
    plot(qinterval,Abeta), grid on,
    subplot(122)
    plot(qinterval,Bbeta), grid on,
    
end
    
    nHeads = sum(X);
    nTails = numel(X)-sum(X);
    
    % evidence for both models
    P_d_fair = 0.5^nTosses
    P_d_bent = beta(1+nHeads, 1+nTails)
    
