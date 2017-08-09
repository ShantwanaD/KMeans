function J = computeErrorMetric(X, c, mu)				%X = example matrix, mu = centroid matrix, c = assigned cluster for all examples
	[m n] = size(X);
	J = 0;								
	for i = 1 : m
		J = J + sum((X(i,:) - mu(c(i),:)) .^ 2);		%calculating error
	end
end