% Gamma(a, lambda) = sum of Exp(1/lambda) variables

a = input('a pos int = ');
lambda = input('lambda > 0 = ');

err = 1e-2;
alpha = input('alpha='); %probability of error 0.05, 0.01
%alpha = 0.01;

N = ceil(1/4 * (norminv(alpha/2,0,1)/err)^2);
fprintf('N = %7d\n',N) %number of simulations

for i=1:N
    X(i) = sum(-lambda * log(rand(a,1)));
end

%compare graphiclly with exp(1/lamda) matlab uses 1/lambda we use lambda
x = -0.1:0.01:-a*lambda * log(alpha * err);
xcdf = gamcdf(x,a,lambda);

for i=1:length(x)
    mysim(i) = mean(X<x(i)); %compare how many values computed are less
end

plot(x, xcdf, x, mysim, 'r:')
legend('cdf Gamma', 'Simulation of Gamma')
