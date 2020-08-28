# DHPE
This is a sample implementation of "[Dynamic High-order Proximity preserved Embedding (DHPE)](https://zw-zhang.github.io/files/2018_TKDE_DHPE.pdf)" (TKDE 2018).

### Requirements
```
MATLAB
```

### Usage
##### Static Model
Run `embed_static.m` with matlab as the static model of DHPE
```
Input:
    A: N*N adjacency matrix (sparse)
    K: dimensionality of embedding space
    beta: decaying constant, default is 0.8 / spectral radius
Output:
    U, S, V: the GSVD result of the high-order proximity (katz) matrix
```
The high-order proximity (katz) matrix is approximated by U * S * V' (see "[Asymmetric Transitivity Preserving Graph Embedding](https://zw-zhang.github.io/files/2016_KDD_HOPE.pdf)", KDD 2016)
##### Dynamic Model
Run `embed_update.m` with matlab as the dynamic model of DHPE
```
Input:
    detA: N*N sparse matrix (the changed edges)
    U, S, V: the GSVD result of the high-order proximity (katz) matrix
    mA = Fa in paper 
    mB = Fb in paper
Output:
    nU, nS, nV: update the GSVD result of the high-order proximity (katz) matrix
    nA = update Fa in paper
    nB = update Fb in paper
```
### Cite
If you find this code useful, please cite our paper:
```
@article{zhu2018high,
  title={High-order proximity preserved embedding for dynamic networks},
  author={Zhu, Dingyuan and Cui, Peng and Zhang, Ziwei and Pei, Jian and Zhu, Wenwu},
  journal={IEEE Transactions on Knowledge and Data Engineering},
  volume={30},
  number={11},
  pages={2134--2144},
  year={2018},
  publisher={IEEE}
}
```





