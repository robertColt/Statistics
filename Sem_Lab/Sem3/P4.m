%try with k = 4

err = 1e-2;
alpha = input('alpha='); %probability of error 0.05, 0.01
%alpha = 0.01;

N = ceil(1/4 * (norminv(alpha/2,0,1)/err)^2);
fprintf('N = %7d\n',N) %number of simulations

kdays = input('no of prev days: ');
inlast = input('no of errors in last k days (vector of size k): ');
tmax = input('max time after which software sent back (days): ');

%Ttotal tge time to find all errors
%nTotalErr total num of errors

for i=1:N
    %T time from now on (measured in days)
    %X num of errors on day T
    %nrErr num of error detected so far
    T = 0;
    X = inlast(kdays);
    nrerr = sum(inlast);
    last = inlast;
    
    while X > 0
        lambda = min(last);
        U = rand;
        X = 0;
        while U>= exp(-lambda)
            U = U*rand;
            X = X+1;
        end
        
        T = T+1;
        nrerr = nrerr + X; %new nr of errors inthe last k days
        last = [last(2:kdays), X];
    end
    
    Ttotal(i) = T-1;
    nTotalErr(i) = nrerr;
end

fprintf('a) %.3f\n',mean(Ttotal)) % ~7
fprintf('b) %.3f\n',mean(nTotalErr)) %~52.9
fprintf('c) %.3f\n', mean(Ttotal > tmax)) %0.18





    