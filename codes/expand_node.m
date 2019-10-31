function [children]=expand_node (parent, h, adj)
children=[];
[m n]=size(adj(1,:));
for i=1:n
    if(adj(parent(1)+1, i)) %&& visit_test(i-1, closed))
        children = [children; [i-1, adj(parent(1)+1, i)+h, parent(1)]];
    end
end

end
