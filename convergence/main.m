% We take sparse regression on the sonar data set as an example.
% function main()
clc
clear
% load graph
graph = [];
% set the size constraint k 
num_iter = 10000;
Pro = 0.01;
% for ii = 2:3
for ii = 3
% if ii == 1
% graphTT = load('football.txt');
% end
% if ii == 2
% graphTT = load('karate.txt');
% end
if ii == 3
graphTT = load('dolphins.txt');
end
n = size(graphTT,1);
for i = 1:n
   TT = find(graphTT(i,:) == 1);
   if ~isempty (TT)
   for  j = 1:length(TT)
       graph = [graph;[i,TT(j)]];
   end
   end
end
k = 5;
for iteration = 1:1:10
% use the POSS_MSE function to select the variables
tic
[selectedVariables,fitness,LL]=POIM(k,num_iter,graph,n,Pro);
t(iteration) = toc;
savefile=sprintf('ii=%d_iter_%dPOIM',ii,iteration);
save(savefile,'t','LL');
end
% clear graph
end
