%geometric distribution
clear all;

p = input('p in (0,1)='); %parameter of distribution
N = input('nr of simulations='); %size of monte carlo study try 10, 1e3(1000) 1e5

for i=1:N
    X(i) = 0; %no of failures

    while rand>=p
        X(i) = X(i)+1;
    end
end

%see if its a good simulation
%compare it to the Geo(p) graphically
UX = unique(X); %distinct values in X
nX = hist(X,length(UX));
rel_freq = nX/N;  %approx of probability

k=0:50; %trial and error because it goes to infinity
pk = geopdf(k,p); %probability for every k, true Geo(p)
clf;
plot(k,pk,'*', UX, rel_freq, 'ro')
legend('Geo distr', 'simulation')






