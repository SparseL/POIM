clc
clear
for ii = 3
% if ii == 1
% graphTT = load('football.txt');
% end
% if ii == 2
% graphTT = load('karate.txt');
% end
% if ii == 3
% graphTT = load('dolphins.txt');
% end
L = [];
for iteration = 1:1:10
% use the POSS_MSE function to select the variables
savefile=sprintf('ii=%d_iter_%dPOIM',ii,iteration);
load(savefile);
L = [L;LL];
end
end
