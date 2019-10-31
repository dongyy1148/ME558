function [x, y] = num_to_coo(num, N)
% transfer number to the coordinate
x = floor(num/(2*N))+1;
y = mod(num, 2*N)+1;