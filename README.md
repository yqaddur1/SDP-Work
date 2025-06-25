# Estimating Euclidean Distortion using Semidefinite Programming
 
This repository contains code for estimating the **Euclidean distortion** of metric quotients by **wallpaper groups**, using **semidefinite programming (SDP)**. This empirical investigation builds on the work of [1,2].

## Overview

Euclidean distortion quantifies how well a metric space can be approximated by Euclidean distance. This concept is especially relevant in transferring Euclidean machine learning algorithms to the metric space settings, especially ones arising in the context of **invariant machine learning**.

Mathematically, the Euclidean distortion of a metric space can be expressed as the supremum of optimal values from an infinite sequence of semidefinite programs.

## Contributions

- Implementation of SDP formulations in files prefixed with `cvx_for_...` for a few quotients by wallpaper groups.
- Experiments for training the sampling process in the `python/` directory
- Precomputed outputs and logs in the `saved data/` folder

## Status

🚧 This is still a **work in progress**.

## References

[1] J. Cahill, J. W. Iverson, D. G. Mixon, *Towards a bilipschitz invariant theory*, Appl. Comput. Harmon. Anal. (2024).

[2] B. Blum-Smith, H. Derksen, D. G. Mixon, **Y. Qaddura**, B. Vose, *Estimating the Euclidean distortion of orbit spaces*, arXiv:2506.04425.

---

Feel free to explore, use, or adapt the code. Suggestions and collaborations are welcome!
