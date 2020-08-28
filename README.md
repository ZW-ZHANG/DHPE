run `embed_static.m` with matlab as the static model of DHPE

Input:

A: N*N adjacency matrix (sparse)

K: dimensionality of embedding space

beta: decaying constant, default is 0.8 / spectral radius

Output:

U, S, V: the GSVD result of the high-order proximity (katz) matrix

The high-order proximity (katz) matrix is approximated by U * S * V'

--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------

run `embed_update.m` with matlab as the dynamic model of DHPE

Input:

detA: N*N sparse matrix (the changed edges)

U, S, V: the GSVD result of the high-order proximity (katz) matrix

mA = Fa in paper 

mB = Fb in paper

Output:

nU, nS, nV: update the GSVD result of the high-order proximity (katz) matrix

nA = update Fa in paper

nB = update Fb in paper


