load trif.mat
load rad.dat
load vasc.dat

s = trif_seg;
g = trif_gens;
map = colormap('parula');
step = floor(length(map)/length(g));

for i = 1:length(g)
    vol{i} = [];
    for j = 1:length(g{i})
        rs = rad(s{g{i}(j)});
        as = arclength(vasc(s{g{i}(j)}, :));
        vol{i}(j) = sum(seg_vol(rs, as));
    end
%     mean_vol(i) = sum(vol{i})/length(vol{i});
    no_per_gen(i) = length(g{i});
    cumulative_vol(i) = sum(vol{i});
end


h = figure;
subplot(1, 3, 1);
plot(0:length(no_per_gen)-1, no_per_gen); xlabel('Generation Number', ...
    'Interpreter', 'latex', 'fontsize', 12);
ylabel('Number of Vessels', ...
    'Interpreter', 'latex', 'fontsize', 12);
title({'Segment Count', 'Per Generation'}, ...
    'Interpreter', 'latex', 'fontsize', 12);
xlim([0 30])



subplot(1, 3, 2);plot(0:length(cumulative_vol)-1, cumulative_vol); 
xlabel('Generation Number', ...
    'Interpreter', 'latex', 'fontsize', 12);
title({'Total Segment Volume', 'Per Generation'}, 'Interpreter', 'latex', 'fontsize', 12);
ylabel('Volume, mm$^3$', 'Interpreter', 'latex', 'fontsize', 12);
xlim([0 30])
subplot(1, 3, 3);plot(0:length(cumulative_vol)-1,cumulative_vol./no_per_gen); 
xlabel('Generation Number', 'Interpreter', 'latex', 'fontsize', 12);
title({'Mean Segment Volume', 'Per Generation'}, 'Interpreter', 'latex', 'fontsize', 12);
ylabel('Volume, mm$^3$', 'Interpreter', 'latex', 'fontsize', 12);
ylabel('Volume, mm$^3$', 'Interpreter', 'latex', 'fontsize', 12);

xlim([1 30])
h.Position =[718 519 878 247];
%%
y = cumulative_vol./no_per_gen;
dy = y(2:end)-y(1:end-1);
ddy = dy(2:end)-dy(1:end-1)
clf; 
plot(dy, '-o'); hold on
plot([0 31], -[max(dy) max(dy)]/100)
plot([0 31], [max(dy) max(dy)]/100)

%%

function vol = seg_vol(rad, len)
for i = 1:length(len)
    v(i) = frustum(rad(i), rad(i+1), len(i));
end
vol = sum(v);
% vol = 0
end
