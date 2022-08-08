function tr = MercTree(g, s, theta, z, mg)

figure
map = colormap('parula');
dc = floor(linspace(1, length(map), length(g)+1));
% subplot(1, 2, 1)
tr = {};
c = 1;
for i = 1:length(g)
    for j = 1:length(g{i})
        k = s{g{i}(j)};
        plot(theta(k), z(k), '-', LineWidth=mg+2-i, color = map(dc(i), :)); hold on
        tr{c} = k;
        c = c+1;
    end
end
axis off
% subplot(1, 2, 2)
% 
% for i = 1:length(s)
%     
%         k = s{i};
%         plot(theta(k), z(k), '-', color = map(mod(i, 256)+1, :)); hold on
%     
% end
