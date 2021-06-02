function influenceS = GreedyAlg(k,num_iter,graph,n,PO,Gset,Pro)
for i = 1:k-PO
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
    influenceS = maxN(1);
end
