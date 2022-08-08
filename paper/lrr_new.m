function mn = lrr_new(gens, seg)
load xyz.mat
load rad.dat
    figure
for i = 1:length(gens)
    x{i} = [];
    y{i} = [];
    for j = 1:length(gens{i})
        k = seg{gens{i}(j)};
        pts = xyz(k, :);
        
        for j = 1:length(k)-1
            al(j) = sqrt(sum((pts(j, :)-pts(j+1, :)).^2));
        end
         x{i} = [x{i} sum(al)];
         y{i} = [y{i} mean(rad(k))];

       
    end
%     plot(i, x{i}./y{i}, 'o-'); hold on
    mn(i, :) = [min(x{i}./y{i}) mean(x{i}./y{i}) max(x{i}./y{i}) median(x{i}./y{i})];
    sd(i) = std(x{i}./y{i});
end
% sd = sd';
[~, c] = size(mn);
% for i = 1:c
%     plot(mn(:, i), 'LineWidth', 4)
% end

for j = 1:i
    plot(j*ones(1, length(mn(j, 1:3))), mn(j, 1:3), '-o')
    hold on
end
plot(mn(:, 2), 'r', 'LineWidth', 4)
plot(mn(:, 2)+sd', 'g', 'LineWidth', 4)
plot(mn(:, 2)-sd', 'b', 'LineWidth', 4)
end