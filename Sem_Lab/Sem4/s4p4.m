%Xt = number of concurrent users at time t in minutes
%3 states 0, 1 ,2 users connected

%a transition prob matrix
%a0 bino distr.
a0 = binopdf(0:2,2,0.2); %no of successes in 2 trials with 0.5 probabillity to connect

%a1 we have 1 connected user
%p10 = a1(1) = P(connectd User disconnect AND the disconnected user doesnt connect)
p10 = 0.5 * 0.8;
%p12 = P(teh connected doesnt disconnect and the disc connects
p12 = 0.5 * 0.2;
p11 = 1-p10 - p12;
a1 = [p10, p11, p12];

%2 connected users
%binopdf - nr of disconnections
a2 = binopdf(2:-1:0, 2, 0.5);

%a - probability transition matrix
p = [a0;a1;a2]


%b - 2 users connect at 10:00 prob that 1 users connected at 10:02
p0 = [0 0 1];

p2 = p0 * p^2 %[p20 p21 p22]

p21_2 = p2(2) %probability


%c - how many connections at noon
%find steady state distr. (exists bc trans prob matrix has all entries non zero -> E 1 state)
%[pi1 pi2 pi3] * p = [pi1 pi2 pi3]
%Ax=b
A = [p' - eye(3); [1 1 1]] %eye=identity matrix, last row in A pi1 + pi2 + pi3 = 1
b = [0;0;0;1]

x = A\b

%Expected value X120 = pi i.e. connections by noon after 120 minutes
E = 0.4082 + 2*0.0816
E = sum([0; 1; 2].*x) %same as above







