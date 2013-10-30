%% Load Training Data and Testing Data for Problem 18, 19, 20
data = dlmread('hw1_18_train.dat');
trainingData.x = data(:, 1:4);  trainingData.x(:, end + 1) = 1;
trainingData.y = data(:, end);

data = dlmread('hw1_18_test.dat');
testingData.x = data(:, 1:4);  testingData.x(:, end + 1) = 1;
testingData.y = data(:, end);

%% Problem 18, 19
[errorRate_pocket, errorRate] = pocketPLAwithPurelyRandom(trainingData, testingData, 2000, 50);
fprintf('Problem 18:\tError Rate using Pocket = %.2f %%\n', errorRate_pocket);
fprintf('Problem 19:\tError Rate using W only = %.2f %%\n', errorRate);

%% Problem 20
[errorRate_pocket] = pocketPLAwithPurelyRandom(trainingData, testingData, 2000, 100);
fprintf('Problem 20:\tError Rate using Pocket = %.2f %%\n', errorRate_pocket);