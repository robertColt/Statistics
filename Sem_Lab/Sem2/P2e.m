%poisson distribution
clear all;


lamda = input('lamda > 0 ='); %parameter of distribution
N = input('no of simulations = ');
if lamda < 0
    lamda = -lamda
end

for j=1:N
    i=0;
    U = rand;
    F(j)=exp(-lamda); %initial value of th ecdf

    while U>=F(j)
        i=i+1;
        F(j)=F(j)+exp(-lamda)*lamda^i / gamma(i+1); %gamma is n!
    end
    X(j) = i;
end

%see if its a good simulation
%compare it to the Nbin(n,p) graphically
UX = unique(X); %distinct values in X
nX = hist(X,length(UX));
rel_freq = nX/N;  %approx of probability

k=0:50; %trial and error because it goes to infinity
pk = poisspdf(k,lamda); %probability for every k, true Geo(p)
clf;
plot(k,pk,'*', UX, rel_freq, 'ro')
legend('Poisson', 'simulation')






