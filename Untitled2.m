clear all; close all;

load rad.dat
load xyz.mat
load trif.mat
c = 1;
for i = trif_seg
    
    for j = 1:length(i{1})-1
        al(j) = sqrt(sum((xyz(i{1}(j), :)-xyz(i{1}(j+1), :)).^2));
    end
    x(c) = sum(al);
       
    
    
%     for j = 1:1
%         xyz(i{1}, :)
%     end
%     
    
    y(c) = mean(rad(i{1}, :));
    c = c+1;
%     break
end