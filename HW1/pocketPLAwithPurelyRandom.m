function [ errorRate1, errorRate2 ] = pocketPLAwithPurelyRandom(train, test, N, maxUpdates )
%POCKETPLAWITHPURELYRANDOM Summary of this function goes here
%   Detailed explanation goes here
err1 = zeros(1, N);
err2 = zeros(1, N);
tx = test.x;
ty = test.y;

for idx = 1 : N
    [w_pocket, w, ~] = pocketPLA(train, 1, maxUpdates);
    
    err1(idx) = sum( sign( tx * w_pocket') ~= ty );
    err2(idx) = sum( sign( tx * w') ~= ty );
end
errorRate1  = mean(err1) / numel(ty) * 100;
errorRate2  = mean(err2) / numel(ty) * 100;
end

