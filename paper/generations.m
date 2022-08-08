load t.mat
load xyz.mat
load bif.mat
load trif.mat

% map = colormap('parula');
map = {'k', 'r', 'g', 'b', 'm'};
mg = 4;
dc = floor(linspace(1, length(map), mg+1));
% close all
p = [150 460 290*2.5 420];
h = figure;
count = 0;
for i = 1:mg%length(bif_gen)
    
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
    count = count +1;
    
    end
end
count
h.Position = p;
axis off
n = sprintf('./PaperFigs/gens-bif');
savefig(n)
n = sprintf('%s.png', n);
saveas(gcf, n, 'png');
load seg.mat
load path.mat



count = 0;
h = figure;
for i = 1:mg%length(bif_gen)
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
h.Position = p;
axis off
count
n = sprintf('./PaperFigs/gens-trif');
savefig(n)
n = sprintf('%s.png', n);
saveas(gcf, n, 'png');

a = xlim;
MF = 30;
w = (a(2)-a(1))/MF;

%%
h = figure;
leg = {};
for i = 1:mg
    plot([0 0], [0 0], map{i}, 'linewidth', mg+1-i)
    hold on
    leg{i} = sprintf('Gen. %i', i-1);
end
legend(leg, 'fontsize', 15, 'interpreter', 'latex')
axis off off image
h.Position = [680 969 147 129];
n = sprintf('./PaperFigs/gens-leg');
savefig(n)
n = sprintf('%s.png', n);
saveas(gcf, n, 'png');


generationsZoom
