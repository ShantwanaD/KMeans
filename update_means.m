function mu = update_means(X, K, c)				%X = example matrix, K = no. of clusters, c = assigned cluster for all examples
	mu = zeros(K, size(X,2));					%matrix to hold the centroids
	for i = 1 : K
		tmpX = X(find(c == i), :);				% finding examples that belong to cluster i
		mu(i,:) = (sum(tmpX)) / size(tmpX,1);	%calculating mean of these examples
	end
end