function IS = ICrun(num_iter,set,graph,n,Pro)
% 获得节点数
targetSize = length(set);
resultSize = 0;
% n为节点数

for it = 1:1:num_iter
%     fprintf('R:%d\n',it);
%     list = [];
    active = zeros(n,1);
    list = zeros(n,1);
	list(1:targetSize) = set;
	active(set) = 1;
	resultSize = resultSize+targetSize;
	h = 1;t = targetSize;
	while (h <= t)
        P = find(graph(:,1)==list(h));
		k = length(P);
%         if (k==0)
%            h = h+1;
%         else
%             e = graph(P,2);
%             rnd = rand(1,k);
%             rndI = find(rnd<0.01);
%             list = [list,e(rndI)'];
%             active(e(rndI)) = 1;
%             t = t+length(rndI);
		for i = 1:1:k
			e = graph(P(i),2);
			if (active(e))
                continue;
            end
			if (rand<Pro)
				list(t) = e;
				active(e) = 1;
				t = t+1;
				resultSize = resultSize+1;
            end
        end
%         end
        h = h+1;
    end
end
IS = resultSize / num_iter;