function  idx = runkMeans(X,initial_centeriods,max_iters)
	% Initialize values
	[m n] = size(X);
	K = size(initial_centeriods, 1);
	centroids = initial_centeriods;
	previous_centroids = centroids;
	idx = zeros(m, 1);

	% Run K-Means
		for i=1:max_iters  
    			idx = findClosestCentroids(X, centroids);
    
    			centroids = computeCentroids(X, idx, K);
		end
	
end
