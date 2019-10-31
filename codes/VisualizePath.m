function [map] = VisualizePath (path, map, N)
x=[];y=[];
n = N;
m = length(path);
% start point (small one)
x_coo = floor(path(1)/n)+1;
y_coo = mod(path(1),n)+1;
x(1)=6+(x_coo-1)*12;
y(1)=6+(y_coo-1)*12;
map(x(1)-1:x(1)+1,y(1)-1:y(1)+1)=0;

for i=2:m-1 % nodes in the path
    x_coo = floor(path(i)/n)+1;
    y_coo = mod(path(i),n)+1;
    x(i)=6+(x_coo-1)*12;
    y(i)=6+(y_coo-1)*12;
    map(x(i)-3:x(i)+3,y(i)-3:y(i)+3)=0.5;
end

% goal point (big one)
x_coo = floor(path(m)/n)+1;
y_coo = mod(path(m),n)+1;
x(m)=6+(x_coo-1)*12;
y(m)=6+(y_coo-1)*12;
map(x(m)-2:x(m)+2,y(m)-2:y(m)+2)=0;

imshow(map);
end
