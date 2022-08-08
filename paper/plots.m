mg = 6;
%mg = 15;

load xyz.mat
load t.mat
load trif.mat
load rad.dat

MinRad = 0.6;
inlet = 5367;


tree = trifPaths(trif_seg, sortGens(mg, trif_seg, inlet));
% gens = sortGens(MaxGen, tree , inlet);
tree = MercTree(sortGens(mg, tree, inlet), tree, t, xyz(:, 3), mg); length(tree)
gens = sortGens(mg, tree , inlet);
tr = {};
IDS = [];
c =1;

for i = 1:length(gens)
    for j = 1:length(gens{i})
%         IN = (sum(rad(tree{j}) >= MinRad)/length(tree {j}) >= strict == 1); % strictness based
        IN = [mean(rad(tree{gens{i}(j)})) >= MinRad];
        if IN;
            tr{c} = tree{gens{i}(j)};
            c = c+1;
%             IDS = [IDS; j]; 
        end
    end
end
clear tree
tree = tr;
tree = MercTree(sortGens(mg, tree, inlet), tree, t, xyz(:, 3), mg);length(tree)

tree = seriesJoins(tree);
tree = MercTree(sortGens(mg, tree, inlet), tree, t, xyz(:, 3), mg);length(tree)


tree = rmShort(tree);%tree = MercTree(sortGens(mg, tree, inlet), tree, t, xyz(:, 3), mg);length(tree)

tree = seriesJoins(tree);tree = MercTree(sortGens(mg, tree, inlet), tree, t, xyz(:, 3), mg);length(tree)