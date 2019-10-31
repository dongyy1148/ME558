% Run the dimiBot

N = 2; % binary states

% create map with N binary state, use for visualzation only
[map]=GenerateMap(2*N);

% create  adjacency matrix
adj = GenerateAdjMatrix(N);

% add obstacles later, change cost in matrix to be zero


initial = 3;
goal = 15;
%[xi, yi] = num_to_coo(initial, N);
%[xg, yg] = num_to_coo(goal, N);

path = Dijkstra(initial,goal,adj);
%path = Astar(map,initial,goal,adj);
VisualizePath(path,map, 2*N); 