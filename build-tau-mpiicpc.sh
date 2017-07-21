#!/bin/bash
# Use this script to download and build TAU with Intel compiler and MPI.
# 
	wget http://tau.uoregon.edu/ext.tgz
	wget http://tau.uoregon.edu/tau.tgz
	tar -zxvf tau.tgz
	tar -zxvf ext.tgz
	mv external_dependencies tau-2.26.2p1
	cd tau-2.26.2p1
	./configure -c++=mpiicpc -cc=mpiicc -mpi -ompt=download -bfd=download -unwind=download 
	make install
	
