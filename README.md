# Estimating Euclidean Distortion using Semidefinite Programming
 
This repository contains code for estimating the **Euclidean distortion** of metric quotients by **wallpaper groups**, using **semidefinite programming (SDP)**. This empirical investigation builds on the work of [1,2].

## Overview

Euclidean distortion quantifies how well a metric space can be approximated by Euclidean distance. This concept is especially relevant in theoretical computer science and machine learning, where algorithms often rely on geometric structure.

Mathematically, the Euclidean distortion of a metric space can be expressed as the supremum of optimal values from an infinite sequence of semidefinite programs.

## Contributions

- Implementation of SDP formulations in files prefixed with `cvx_for_...`
- Supporting scripts and experiments in the `python/` directory
- Precomputed outputs and logs in the `saved data/` folder

## Status

🚧 This is still a **work in progress**.

## References

1. J. Cahill, J. Iverson, D. G. Mixon, "Towards a bilipschitz invariant theory", ACHA 2024.
2. B. Blum-Smith, H. Derksen, D. G. Mixon, **Y. Qaddura**, B. Voss, "Estimating the Euclidean distortion of orbit spaces", arxiv:2506.04425.

---

Feel free to explore, use, or adapt the code. Suggestions and collaborations are welcome!
