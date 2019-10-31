function [adj]= GenerateAdjMatrix(N)
% generate 2N adjacency matrix with N
adj = [0 1;
       1 0]; % 1,0
for i = 1:N-1
    adj = [adj 2^i.*eye(2^i);
           2^i.*eye(2^i) adj];
end

for j = 1:N
    adj = [adj 2^(j-1).*eye(2^(N+j-1));
           2^(j-1).*eye(2^(N+j-1)) adj];
end

end