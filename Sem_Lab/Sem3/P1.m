%simulate geo distribution using inverse transformmethod
clf;
p = input('p(m(0,1))=');
X = ceil(log(rand)/log(1-p) - 1); %natural logarithm)

err = 1e-2;
alpha = input('alpha='); %probability of error 0.05, 0.01
%alpha = 0.01;

N = ceil(1/4 * (norminv(alpha/2,0,1)/err)^2);
fprintf('N = %7d\n',N) %number of simulations

for i=1:N
    X(i) = ceil(log(rand)/log(1-p) - 1);
end

k=0:20;
pk = geopdf(k,p);
UX = unique(X);
nX = hist(X, length(UX));

plot(k, pk, '*', UX, nX/N, 'ro')
legend('Geo distr.', 'Simulation')

