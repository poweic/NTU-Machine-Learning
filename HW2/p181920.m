%% Load Data
train = load('hw2_train.dat');
test = load('hw2_test.dat');

%% Decision Stump
y = train(:, end);
x = train(:, 1:end-1);

[Ein_best, s, idx, theta] = multiDecisionStump(x, y);

fprintf('Problem 18: \t Best of best Ein = %.4f\n', Ein_best);
fprintf('Problem 19: \t (s, i, theta) = (%d, %d, %.4f) \n', s, idx, theta);
%% Evaluate on testing data
tx = test(:, idx);
ty = test(:, end);
predicts = s * sign(tx - theta);
Eout = sum(predicts ~= ty) / length(ty);

fprintf('Problem 20: \t Eout = %.4f \n', Eout);