# Lattice QCD With the TAU Profiling Tool

There are 4 steps to running QCD with TAU on KNL.  This is only running the sampling (interposition) method of TAU.
1) configure and install TAU in your home area with the same compiler as QCD for running on KNL (Intel compiler and Intel MPI 2017) - see build-tau-mpiicpc.sh
2) download and install QCD from link below - see QCD Makefile build-qcd-grid.sh
3) run tau_exec.sh with QCD binary just created
4) Obtain 1 profile for each thread, and 60 threads.  Concatenate them together using the command "paraprof --pkk outputName.pak" 

Quantum Chromodynamics (QCD) is the theory that describes the strong interactions between quarks and gluons that make up particles such as protons and neutrons. The numerical simulations of QCD are performed through the framework of Lattice QCD (LQCD), in which quarks and gluons are simulated in a discrete four-dimensional grid points. A typical LQCD workflow involves the following steps:
1.	Generation of gluon field ensembles, which is done through Monte Carlo simulations with Molecular Dynamics updates (Hybrid Monte Carlo). These gluon field configurations are written to disk for the analysis in Steps 2-4. This step is very expensive and will benefit greatly from good strong scaling as we need to run one single (or just a couple) long Monte Carlo streams. 
2.	Computation of quark propagators on the gluon field configurations, which involves sparse-matrix inversions and is another compute-intensive step. The quark propagator computation on each gluon field configuration is independent, and can be done in parallel. This step involves reading in the gluon field and sometimes writing out the quark propagators, which are huge files. Sometimes eigenvectors are needed to accelerate the propagator calculations. This would require generating O(1000) eigenvectors, saving them to disk, and reading them back to construct a reduced Krylov space. 
3.	Contraction of the quark propagators to construct particle correlators. This is relatively cheap, and involves mostly BLAS routines and global reduction at the end. 
4.	Extraction of physical results from the correlators. This is our final step to obtain LQCD physical results and can be usually done on a PC. 

The programming models used in LQCD software stack is MPI+OpenMP on CPUs and MPI+CUDA on GPUs. There are several different software libraries used in LQCD simulations by different groups, see http://www.usqcd.org/usqcd-software/. The main software packages the BNL LQCD group uses is Columbia Physics System (CPS) and the newly developed Grid library (https://github.com/paboyle/Grid).   

We can benefit from the following performance metrics to help optimize our software and determine optimal machine partition sizes. 

●	Call Tree

●	FLOPS 

●	Memory usage, grouped by function calls

●	L1, L2 cache data and instruction accesses, L2 cache misses

●	Number of Joins

●	Number of Forks

●	Communication Time

●	IO Read (size and time)

●	IO Write (size and time)

●	Interconnect Performance Metrics


The following provenance information will be useful:

●	Computer System Performance Characteristics

●	Interconnect Performance Characteristics 

●	Storage System Performance Characteristics



