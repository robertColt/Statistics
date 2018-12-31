%Simulate Poisson using peccial method

lambda = input('lamda > 0 = ');

err = 1e-2;
alpha = input('alpha='); %probability of error 0.05, 0.01
%alpha = 0.01;

N = ceil(1/4 * (norminv(alpha/2,0,1)/err)^2);
fprintf('N = %7d\n',N) %number of simulations


for i=1:N
    X(i) = 0; %initial value
    U = rand;

    while U >= exp(-lambda)  %U1 U2 .... Uk >= exp(-1)
        U = U*rand;
        X(i) = X(i)+1;
    end
end

%comapre graphically
k=0:20;
pk = poisspdf(k,lambda);
UX = unique(X);
nX = hist(X, length(UX));

plot(k, pk, '*', UX, nX/N, 'ro')
legend('Poisson distr.', 'Poiss Simulation')







