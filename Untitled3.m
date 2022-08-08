load trif.mat
load bif.mat

%%
clc
% clf
close all
trif_mn = lrr_new(trif_gens, trif_seg);
bif_mn = lrr_new(bif_gen, bif_seg);
%%
trif_grad = trif_mn(2:end, 2)-trif_mn(1:end-1, 2);
bif_grad = bif_mn(2:end, 2)-bif_mn(1:end-1, 2);

min(find(trif_grad<0))
min(find(bif_grad<0))
