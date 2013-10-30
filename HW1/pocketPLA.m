function [ w_pocket, w, nUpdates ] = pocketPLA(  data, eta, maxUpdate )
%POCKETPLA Summary of this function goes here
%   Detailed explanation goes here

nData = numel(data.y);

w = zeros(1, 5);
w_pocket = zeros(1, 5);

nUpdates = 0;
while nUpdates <= maxUpdate
    idx = randi(nData);
    x = data.x(idx, :);
    y = data.y(idx);

    s = sign( x * w' );
    if s ~= y
        w = w + eta * y * x;
        nUpdates = nUpdates + 1;

        better = isBetter(w_pocket, w, data);
        if better; w_pocket = w; end

    end
end

end


function [better] = isBetter(w_pocket, w, data)
x = data.x;
y = data.y;
e1 = sum( sign( x * w_pocket' ) ~= y);
e2 = sum( sign( x * w' ) ~= y);

if e2 < e1
    better = true;
else
    better = false;
end

end