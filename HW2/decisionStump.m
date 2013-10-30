function [ Ein, Eout, s, theta ] = decisionStump( x, y )
%DECISIONSTUMP Summary of this function goes here
%   Detailed explanation goes here

N = numel(y);
[err(1), t(1)] = findThreshold(x, y, -1);
[err(2), t(2)] = findThreshold(x, y, +1);

[~, idx] = min(err);

Ein = err(idx) / N;
theta = t(idx);
s = sign(idx - 1.5);

Eout = 0.5 + 0.3*s * (abs(theta) - 1);
% fprintf('Ein = %.4f \n', Ein);
% fprintf('Eout = %.4f \n', Eout);
end

function [err, threshold] = findThreshold(x, y, s)
    N = numel(y);
    error = zeros(1, N + 1);
    for t = 0: N
        h = s * [-ones(1, t), ones(1, N-t)];
        error(t + 1) = sum( y ~= h );
    end
    [err, idx] = min(error);
    x = [x(1), x, x(end)];
    threshold = mean( x(idx : idx+1) );
end
