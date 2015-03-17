function idx = K_mean_clustering(X,K,max_inters)
    
%     centroids = zeros(K, size(X, 2));

    randidx = randperm(size(X, 1));

    centroids = X(randidx(1:K),:);
    
    initial_centroids = centroids;
    
	%initial_centroids = kMeansInitCentroids(X,K);
    idx = runkMeans(X,initial_centroids,max_inters);
    
	
end




