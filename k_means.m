function cost = k_means(X, K, idx)
	[m n] = size(X);
	mu = X(idx,:);				%taking K random examples as the initial mu
	epsilon = 0.0001; 			%for convergence

	J = [0; 0];
	condition = true; %for implementing a do-while loop
	while condition

		c = best_cluster(X, K, mu);				%Expectation Step
		mu = update_means(X, K, c);				%Minimization Step
		
		J(1,1) = J(2,1);
		J(2,1) = computeErrorMetric(X, c, mu);	%finding the cost
		
		condition = (abs(J(1,1) - J(2,1)) > epsilon); %convergence criteria
	
	end
	cost = J(2);
end