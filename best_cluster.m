function c = best_cluster(X, K, mu)				%X = example matrix, K = no. of clusters, mu = centroids 
	[m n] = size(X);
	c = zeros(m, 1);			%m-sized vector to hold the cluster no. for each example
	tmp = zeros(K, 1);			%K-sized vector to hold the euclidean distance of an example from all the centroids
	for i = 1 : m
		for j = 1 : K
			tmp(j) = sum((X(i,:) - mu(j,:)) .^ 2);
		end
		c(i) = find(tmp == min(tmp));
	end
end