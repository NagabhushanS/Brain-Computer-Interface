function centroids = computeCentroids(X, idx, K)

  	[m n] = size(X);
 	centroids = zeros(K, n);
 	for i=1:K
     ids = idx==i;
     x = X(ids,:);
     centroids(i,:) = mean(x);
 	end;

end

