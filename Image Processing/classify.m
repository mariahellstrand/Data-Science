function out = classify(x, a, b)
 labels = flip(unique(b));
 nbrlabels = length(unique(b));
 K = 4;
 distances = [];
 data = length(b);
 
 %calculate distances
 for i = 1:data
        D = norm(x - a(:,i));
        distances(i) = D;
 end
 
 %sort distances and save positions
 [ ~ , position] = sort(distances,'ascend');

 result = zeros(1, nbrlabels);
 
 %calculate nbr of labels of K neighbours
 for i = 1:K
     for j = 1:nbrlabels
         if b(position(i)) == labels(j)
             result(j) = result(j) + 1;
         end
     end
 end
 
 [~, index] = max(result, [], 2);

 out  = labels(index);

end
