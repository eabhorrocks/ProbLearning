%% MLE estimate of multivariate gaussian data

clear c
mu = [4, 42];
sigma = [30 3/5; 3/5 10];
N = 10000;

r = mvnrnd(mu,sigma, N);
plot(r(:,1), r(:,2), '.')

r_resid = r - mu_MLE;

for i = 1:N
    c(:,:,i) = r_resid(i,:).*r_resid(i,:)';
end


mu_MLE = 1/N * sum(r)
sigma_MLE = 1/N * sum(c,3)
