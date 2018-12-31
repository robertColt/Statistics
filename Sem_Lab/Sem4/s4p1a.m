%2 states Mode 1 andd mode 0
%homogenous markov chain with 2 states

P = [0.4 .6; .6, .4];

%5:30
P0 = [1,0];

%8:30 3 hours later -> 3 time steps later
%find p11(2) p12(2)
%p11(3)=P(x3=1|x0=1)
P3 = P^3;
print(P3)

P3(1,1)

%b
%.4pi1 + .6pi2 = pi1
%.6pi1 + .4pi2 = pi2
%pi1+pi2 = 1

%pi1 = pi2
%pi1+pi2 = 1 -> pi1=pi2=1/2






