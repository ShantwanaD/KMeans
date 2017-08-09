clear ; %clears all the variables 
close all; %closes extra windows
clc %clears the screen

% =============================================================== Part 1: K MEANS  ======================================================

% ----------------------------------------------------------(a)----------------------------------------------------------------
X = load('attr.txt');
y = load('label.txt');
[m n] = size(X);
K = 6;						%no. of clusters
tic
idx = randperm(m, K);		%generates unique K random integers between 1 to m inclusive. 
final_cost = k_means(X, K, idx)
toc
% ----------------------------------------------------------(b)----------------------------------------------------------------
tic 
J = zeros(10,1);
min_cost_idx = zeros(1,K);
min_cost = inf;
for i = 1 : 10
	i
	idx = randperm(m, K);
	J(i) = k_means(X, K, idx)
	if(J(i) < min_cost)
		min_cost = J(i);
		min_cost_idx = idx;
	end
end
J
min_cost
toc
mu = X(min_cost_idx,:);				%taking K random examples as the initial mu
J = zeros(60,1);
tic
for i = 1 : 60
	c = best_cluster(X, K, mu);				%Expectation Step
	mu = update_means(X, K, c);				%Minimization Step
	J(i) = computeErrorMetric(X, c, mu);	%finding the cost
end
toc
x = [1:60];

figure;
plot(x, J, '-', 'LineWidth', 0.7)
ylabel('Error'); % Set the y axis label
xlabel('No. of iterations'); % Set the x axis label

% ----------------------------------------------------------(c)----------------------------------------------------------------

mu = X(min_cost_idx,:);
accuracy_vector = zeros(60,1);
c_tmp = zeros(m, 1);

for iter = 1 : 60
	c = best_cluster(X, K, mu);				%Expectation Step
	mu = update_means(X, K, c);				%Minimization Step
	for i = 1 : K
		idx = find(c == i);
		c_tmp(idx) = mode(y(idx));
	end
	
	accuracy_vector(iter) = length(find(c_tmp == y)) * 100 / m ;
end

figure;
plot(x, accuracy_vector, '-', 'LineWidth', 0.7)
ylabel('Accuracy'); % Set the y axis label
xlabel('No. of iterations'); % Set the x axis label
