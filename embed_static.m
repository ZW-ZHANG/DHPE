function [U,S,V] = embed_static(A, K, beta)
% Input: 
% A: N*N adjacency matrix (sparse)
% K: dimensionality of embedding space
% beta: decaying constant, default is 0.8 / spectral radius
% Output:
% U, S, V: the GSVD result of the high-order proximity (katz) matrix
% The high-order proximity (katz) matrix is approximated by U * S * V'

[N, ~] = size(A);
% Katz: S = sum_{l=1}^{+inf}{beta*A}^l
if nargin < 3
    beta = 0.8 / getRadius(A);
end
A = beta .* A;
M = speye(N)-A;
[V, S, U] = jdgsvds(A', M', K, 0.0001, 100); % the 0.0001 error tolerance can be modified to speed up while reducing accuracy
U = U(:,1:K);
S = S(1:K,1:K);
V = V(:,1:K);

end

