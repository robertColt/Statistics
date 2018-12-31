%binomial distribution
clear all;

n = input('no trials = ');
p = input('p in (0,1)='); %parameter of distribution
U = rand(n,1);
X = sum(U<p);

N = input('nr of simulations='); %size of monte carlo study try 10, 1e3(1000) 1e5

for i=1:N
    U=rand(n,1);
    X(i)=sum(U<p);
end

%see if its a good simulation
%compare it to the Bino(n,p) graphically
UX = unique(X); %distinct values in X
nX = hist(X,length(UX));
rel_freq = nX/N;  %approx of probability

k=0:n;
pk = binopdf(k,n,p); %probability for every k, true Bino*n.p)
clf;
plot(k,pk,'*', UX, rel_freq, 'ro')
legend('Bino distr', 'simulation')






