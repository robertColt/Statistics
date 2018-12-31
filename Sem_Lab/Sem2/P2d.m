%negative binomial distribution
clear all;

p = input('p in (0,1)='); %parameter of distribution
n = input('rank of the success=');
N = input('nr of simulations='); %size of monte carlo study try 10, 1e3(1000) 1e5



for i=1:N
    for j=1:n
        Y(j)=0;
        while rand>=p
            Y(j)=Y(j)+1;
        end
    end
    X(i) = sum(Y);
end

%see if its a good simulation
%compare it to the Nbin(n,p) graphically
UX = unique(X); %distinct values in X
nX = hist(X,length(UX));
rel_freq = nX/N;  %approx of probability

k=0:50; %trial and error because it goes to infinity
pk = nbinpdf(k,n,p); %probability for every k, true Geo(p)
clf;
plot(k,pk,'*', UX, rel_freq, 'ro')
legend('Nbin', 'simulation')






