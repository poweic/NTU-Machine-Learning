%% Load Training Data for Problem 15, 16, 17
data = dlmread('hw1_15_train.dat');
trainingData.x = data(:, 1:4); trainingData.x(:, end + 1) = 1;
trainingData.y = data(:, end);

%% Problem 15
% Naive cycle PLA
[~, nUpdate] = PLA(trainingData);
fprintf('Problem 15:\t # of updates = %d (starting from w = [0 0 0 0 0] )\n', nUpdate);

%% Problem 16
% Random permutation
eta = 1;
avgUpdate = plaWithRandPerm(trainingData, eta, 2000);
fprintf('Problem 16:\t when eta = %.1f, average number of updates = %.2f\n', eta, avgUpdate);

%% Problem 17
% Eta (learning rate) = 0.5
eta = 0.5;
avgUpdate = plaWithRandPerm(trainingData, eta, 2000);
fprintf('Problem 17:\t when eta = %.1f, average number of updates = %.2f\n', eta, avgUpdate);

