function [path] = Dijkstra (initial, goal, adj)
%INPUTS
%goal a 1x2 vector stating the x and y coordinates of the goal cell
%initial a 1x2 vector stating the x and y coordinated of the initial cell
%map a ixj binary matrix describing occupancy with 1
%w=12;%cm, robot width
% map=inflate_map(map); %accounting for robot width in the map
%msize=size(map); % 2N

open=[initial,0,-1];
%open nodes,[current node,f(sum of weight of all previous nodes and included this+heuristic), previous node]
closed=[];%explored nodes
[m n] = min(open(:,2));
current=open(n,:);

%open min and extract
while ~isequal(current(1),goal)
    children= expand_node(current, 0, adj);
    %place the children with the lower cost in the open list if they are
    %redundant in that list
    closed=[closed;current]
    open=open([1:n-1,n+1:end],:); %deleting the current element from the open
    
    if isempty(children)==0
        for i=1:length(children(:,1))
            if BinA(open(:,1),children(i,1))~=0 %if the child is already present in the open list, update cost
                if(children(i,2)<open(BinA(open(:,1),children(i,1)),2))
                    BinA(open(:,1:2),children(i,1:2));
                    open(BinA(open(:,1),children(i,1)),:)=children(i,:);
                end
            else % children not in the open list
                if BinA(closed(:,1),children(i,1))==0 % children are not visited
                    open=[open; children(i,:)]
                else
                    if (children(i,2)<closed(BinA(closed(:,1),children(i,1)),2))
                        BinA(closed(:,1),children(i,1));
                        closed(BinA(closed(:,1),children(i,1)),:)=children(i,:);
                    end
                end
            end
        end
    end
    [m n] = min(open(:,2));
    current=open(n,:);
end
closed=[closed; current];
%reiterate to start to find path
node=current;
path=current(1);
while ~isequal(node(3),initial)
    path=[node(3); path];
    node=closed(BinA(closed(:,1),node(3)),:);
end
path = [initial(1); path]
end