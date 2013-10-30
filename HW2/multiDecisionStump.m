function [ Ein_best, s, idx, theta ] = multiDecisionStump( x, y )
%MULTIDECISIONSTUMP Summary of this function goes here
%   Detailed explanation goes here
dim = size(x, 2);

Ein = zeros(1, dim);
s = zeros(1, dim);
theta = zeros(1, dim);

for d = 1:dim
    [x_sorted, index] = sort(x(:, d));
    y_sorted = y(index);
    [Ein(d), ~, s(d), theta(d)] = decisionStump(x_sorted', y_sorted');
end

[Ein_best, idx] = min(Ein);
s = s(idx);
theta = theta(idx);

end

