%% Settings
N = 20;
pNoise = 0.2;

%% Decision Stump
MAX_ITERATION = 5000;
Ein = zeros(1, MAX_ITERATION);
Eout = Ein;
for i = 1 : MAX_ITERATION
    x = 2 * rand(1, N) - 1;
    x = sort(x);
    y = sign(x) .* sign(rand(1, N) - pNoise);
    
    [Ein(i), Eout(i)] = decisionStump(x, y);
end

%% Summary
fprintf('Problem 17: \t Average of Ein = %.4f, Average of Eout = %.4f \n', mean(Ein), mean(Eout));