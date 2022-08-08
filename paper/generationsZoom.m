load t.mat
load xyz.mat
load bif.mat
load trif.mat
cent = [-0.7169   -8.6702];
% map = colormap('parula');
map = {'ko-', 'r-o', 'go-', 'o-b', '-om'};
mg = 4;
dc = floor(linspace(1, length(map), mg+1));
% close all
p = [150 460 290*2.5 420];
h = figure;
count = 0;
for i = 1:3%length(bif_gen)
    
    for j = bif_gen{i}
        k = bif_seg{j};
%         subplot(1, 2, 1)
%         plot(t(k), xyz(k, 3),...
%         'Color', map(dc(i), :),...
%         'linewidth', 6-i); hold on
%         axis off
%     
%         subplot(1, 2, 2)
        plot(xyz(k, 1), xyz(k, 2),...%         'Color', map(dc(i), :),...
        map{i}, ...
        'linewidth', 6-i); hold on
        axis off equal    
    end
end
xlim([cent(1)-w/2 cent(1)+w/2])
ylim([cent(2)-w/2 cent(2)+w/2])
h.Position = p;
n = sprintf('./PaperFigs/gens-bif-zoom');
savefig(n)
n = sprintf('%s.png', n);
saveas(gcf, n, 'png');
load seg.mat
load path.mat

% trif_seg = trifPaths(seg, sortGens(100 , seg, path{1}(1)));
% trif_gens = sortGens(100, trif_seg ,  path{1}(1));

count = 0;
h = figure;
for i = 1:2%length(bif_gen)
    for j = trif_gens{i}
        k = trif_seg{j};
%         subplot(1, 2, 1)
%         plot(t(k), xyz(k, 3),...
%         'Color', map(dc(i), :),...
%         'linewidth', 6-i); hold on
%         axis off
%     
%         subplot(1, 2, 2)
        plot(xyz(k, 1), xyz(k, 2),...
                map{i}, ...%     'Color', map(dc(i), :),...
        'linewidth', 6-i); hold on
    axis off equal
    count = count + 1;
    
    end
end
xlim([cent(1)-w/2 cent(1)+w/2])
ylim([cent(2)-w/2 cent(2)+w/2])
h.Position = p;
axis off

n = sprintf('./PaperFigs/gens-trif-zoom');
savefig(n)
n = sprintf('%s.png', n);
saveas(gcf, n, 'png');

h = figure;
leg = {};
for i = 1:3
    plot([0 0], [0 0], map{i}, 'linewidth', mg+1-i)
    hold on
    leg{i} = sprintf('Gen. %i', i-1);
end
legend(leg, 'fontsize', 15, 'interpreter', 'latex')
axis off image
h.Position = [680 969 147 129];
n = sprintf('./PaperFigs/gens-leg-zoom-bif');
savefig(n)
n = sprintf('%s.png', n);
saveas(gcf, n, 'png');


leg = {};
for i = 1:2
    plot([0 0], [0 0], map{i}, 'linewidth', mg+1-i)
    hold on
    leg{i} = sprintf('Gen. %i', i-1);
end
legend(leg, 'fontsize', 15, 'interpreter', 'latex')
axis off image
h.Position = [680 969 147 129];
n = sprintf('./PaperFigs/gens-leg-zoom-trif');
savefig(n)
n = sprintf('%s.png', n);
saveas(gcf, n, 'png');