function [ avgUpdates ] = plaWithRandPerm( data, eta, N )

nUpdates = zeros(1, N);

for idx = 1 : N
    rpData = randPermuteData(data);
    [~, nUpdates(idx)] = PLA(rpData, eta);
end
avgUpdates = mean(nUpdates);

end

