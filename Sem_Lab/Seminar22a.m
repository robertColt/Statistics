%2.a simulate Bern(p) distr.
clear all;
p = input('p in (0,1)='); %parameter of distribution
U = rand;
X = (U<p); %x = 1 if U<p -> success, X=0 if not

N = input('nr of simulations='); %size of monte carlo study try 10, 1e3(1000) 1e5

for i=1:N
    U=rand;
    X(i)=(U<p);
end

%see if its a good simulation
%compare it to the Bern(p)
UX = unique(X);
nX = hist(X,length(UX));
rel_freq = nX/N  %without simcolon will list the values