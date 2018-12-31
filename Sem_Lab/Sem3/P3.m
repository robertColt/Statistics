%EXP(lambda) using inverse transform method

lambda = input('lambda = ');

err = 1e-2;
alpha = input('alpha='); %probability of error 0.05, 0.01
%alpha = 0.01;

N = ceil(1/4 * (norminv(alpha/2,0,1)/err)^2);
fprintf('N = %7d\n',N) %number of simulations

for i=1:N
    X(i) = -1/lambda * log(rand);
end

%compare graphiclly with exp(1/lamda) matlab uses 1/lambda we use lambda
x = -0.1:0.01:(1/lambda) * log(lambda/err);
xcdf = expcdf(x,1/lambda);

for i=1:length(x)
    mysim(i) = mean(X<x(i)); %compare how many values computed are less
end

plot(x, xcdf, x, mysim, 'r:')
legend('cdf EXP', 'Simulation of Exp')
