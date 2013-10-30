function [ data ] = randPermuteData( data )
%PERMUTEDATA Summary of this function goes here
%   Detailed explanation goes here
nData = numel(data.y);
rp = randperm(nData);

data.x = data.x(rp, :);
data.y = data.y(rp, :);

end

