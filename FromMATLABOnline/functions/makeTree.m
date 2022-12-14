
%% set filtering parameters
function [tree,searchfrom, showfrom] = makeTree(MinRad, strict, MaxGen, plt, rad, vasc, edges, path)
% MinRad = 0.4;
% strict = 0.5;
% MaxGen = 20;

%% load data
% load rad.dat
% load vasc.dat

%% make segments
[seg, inlet, bifNodes, endpaths, ~] = load_and_sort(path, edges);

% plotthree(vasc(endpaths{1}, :), '-')
% plotthree(vasc(intersect(bifNodes, endpaths{1}), :), '+')
% view(3)
%% construct a tree from the segments
tree = trifPaths(seg, sortGens(MaxGen, seg, inlet));
gens = sortGens(MaxGen, tree , inlet);

%% First pass of the filter
IDS = [];
% map = colormap("lines"); close all; hold on; axis off equal; view(3)
for i = 1:length(gens)
    for j = gens{i}
        IN = (sum(rad(tree{j}) >= MinRad)/length(tree {j}) >= strict == 1);
        if IN; IDS = [IDS; j]; end
    end
end

%% prune the tree: remove disconnected and short segments
tree = tree(IDS);
tree = rmDisconn(tree, inlet);
tree = seriesJoins(tree);
tree = rmShort(tree);
tree = seriesJoins(tree);

% figure; treeplt(tree, [0 0 0]);
%% find terminal branches and the points in each to define compartments of perfusion
termNodeId = findterms_new(tree);
termVascPts = vasc(termNodeId, :);

for i = 1:length(tree); temp(i) = tree{i}(end); end
[~, termBranchID] = intersect(temp, termNodeId);
[~, BodyBranchID] = setdiff(temp, termNodeId);
clear temp

c = 1;
for i = termBranchID'
    TermBranches{c} = tree{i};
    searchfrom(c) = TermBranches{c}(2);
    showfrom(c) = TermBranches{c}(end);
    c = c+1;
end

c = 1; for i = BodyBranchID'; BodyBranches{c} = tree{i}; c = c+1; end

if plt == 1
% figure;
% treeplt(TermBranches, [1, 0, 1], vasc)
% hold on
% treeplt(BodyBranches, [0, 1, 1],  vasc)

treeplt(TermBranches, [0, 0, 0], vasc)
hold on
treeplt(BodyBranches, [0, 0, 0],  vasc)
plot3(vasc(searchfrom, 1), vasc(searchfrom, 2), vasc(searchfrom, 3),...
    'k+', 'MarkerSize', 4, 'LineWidth',4)
end
clear IN IDS ans c i j id seg
