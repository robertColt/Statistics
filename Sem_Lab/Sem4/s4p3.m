%2 states green-1 red-2
%discrete time (every streetlight)

P = [.6 .4 ; .3 .7];
P0 = [1 0]; %first light is green
P2 = P0 * P^2

%a-prob that the 3rd light is red
P2(1,2) %prob of 3rd light to be red

%b-prob of last to be red
%steady state distr.
%pi*P = pi
%pi1 + pi2 = 1

