#!/bin/bash
# The following command will run the created lattice QCD binaries in the build/benchmarks directory using tau_exec, effectively using the TAU sampling method.
# The profile data will be dumped into the working directory. 
# You can pack the data using paraprof --pack command
mpirun -np 2 tau_exec -T ICPC,MPI,OMPT -ompt -ebs ./Benchmark_dwf --grid 16.16.16.16 --mpi 1.1.1.2 --dslash-asm --threads 30

paraprof --pack dwf.ppk
