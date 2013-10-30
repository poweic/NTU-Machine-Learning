function [ w, nUpdates ] = PLA( data, eta )
if nargin < 2; eta = 1; end

w = zeros(1, 5);

[w, e] = plaCycle(w, data, eta);
nUpdates = e;

while e > 0
    [w, e] = plaCycle(w, data, eta);
    nUpdates = nUpdates + e;
end
end


function [w, nUpdates] = plaCycle(w, data, eta)
    nUpdates = 0;
    nData = numel(data.y);
    
    for idx = 1 : nData
        x = data.x(idx, :);
        y = data.y(idx);
        
        s = sign( sum(w .* x) );
        if s ~= y
            w = w + eta * y * x;
            nUpdates = nUpdates + 1;
        end
       
    end
end