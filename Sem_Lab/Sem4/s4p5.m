p = [0.7 .3; .4 .6]

%a st state
pi1_pi2 = [4/7 3/7]

%b, c - foreccast for next 30 days
p0 = [.2 .8]

NM = input('length of sample path = '); %30
N = input('no of simulations = '); %first 2 to vizualize then more 

for j=1:N
    p0= [.2 .8]; % initial distr of sunny vs rainy days
    p = [.7 .3; .4 .6]; %trans prob matrix
    p1(1,:) = p0; %the forecast for day t=1
    
    for t=1:NM
        %generaate [1 2:p1 p2]
        U = rand;
        X(t) = 1 * (U<p0(1)) + 2*(U>=p0(1)) ;%gen X(t) as a Bern(p0(1)
        p1(t+1,:) = p1(t,:)*p; %Pt+1 = Pt * P forecast for next day
        
        %update
        p0 = p(X(t),:);
    end
    %X %forecast for NM days
    %find number of consecutive sunny rainy days for estimating a flood happening
    ichange = [find(X(1:end-1) ~= X(2:end)), NM]; %indices where states change
    
    %vector of long streaks of sunny or rainy
    long_streaks(1) = ichange(1);
    
    for i=2:length(ichange)
        %calculate the differences of the indices -> length of streaks
        long_streaks(i) = ichange(i) - ichange(i-1); 
    end
    %fprintf('\nStreaaks of sunny rainy\n')
    %fprintf(num2str(long_streaks))
    
    if X(1) == 1
        sunny = long_streaks(1:2:end);
        rainy = long_streaks(2:2:end);
    else
        rainy = long_streaks(1:2:end);
        sunny = long_streaks(2:2:end);
    end
    
    max_sunny(j) = max(sunny);
    max_rainy(j) = max(rainy);
end

fprintf('\nProb of water shrotage is %1.4f\n', mean(max_sunny >= 7))
fprintf('Prob of flooding is %1.4f', mean(max_rainy >= 7))
    
    
    
    



