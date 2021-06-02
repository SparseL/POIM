% Greedy Algorithm
clc
clear
graph = [];
graphTT = load('karate.txt');
n = size(graphTT,1);
for i = 1:n
   TT = find(graphTT(i,:) == 1);
   if ~isempty (TT)
   for  j = 1:length(TT)
       graph = [graph;[i,TT(j)]];
   end
   end
end
num_iter = 10000;
Pro = 0.01;
for k = 3:2:11
for iteration = 1:1:10
Gset = [];
% use the POSS_MSE function to select the variables
tic
for i = 1:k
    fprintf('G:%d,total:%d\n',i,k);
    Gtemp = Gset;
    % compute gain
    for s = 1:n
        if isempty(find(Gset == s))
            pos = [Gtemp,s];
            offFit(s)=ICrun(num_iter,pos,graph,n,Pro);
        else
            offFit(s) = 0;
        end
    end
    [maxN,maxI] = max(offFit);
    Gset = [Gset,maxI(1)];
    influenceS(iteration) = maxN(1);
end
t(iteration) = toc;
end
savefile=sprintf('k=%d_karate_GA',k);
save(savefile,'t','influenceS');
end

