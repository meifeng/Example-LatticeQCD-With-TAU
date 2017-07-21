#!/bin/bash
# A script to configure and build Grid QCD library on Intel Knights Landing
# Intel compiler and MPI should already be in your path
#
git clone https://github.com/paboyle/Grid
cd Grid
./bootstrap.sh
mkdir -p build
cd build
../configure --enable-simd=KNL --enable-precision=single --enable-comms=mpi3-auto --enable-mkl CXX=icpc MPICXX=mpiicpc
make -j8
