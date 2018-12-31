%2 states black-1 brown-2
%markov property future can be predicted from current state

P = [.6 .4 ; .2 .8];
P0 = [0 1]; %Rex is brown 1 prob black 0 prob
%p21(2) = ?

P2 = P0 * P^2; %probability for grandchildren
P2(1,1) %ans
