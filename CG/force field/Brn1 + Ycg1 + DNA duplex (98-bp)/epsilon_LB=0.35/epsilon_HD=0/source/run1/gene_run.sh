#!/bin/bash
#SBATCH -J 0.35_SMC_AICG2+ 
#SBATCH --ntasks-per-node=64
#SBATCH --exclude cpu1-1,cpu1-65,cpu1-75
#SBATCH -p i64m512u

module load mpi/openmpi-4.1.5

export OMP_NUM_THREADS=8

BINDIR=/hpc2hdd/home/jchen901/data/genesis/genesis-2.1.2/bin

mpirun -np 8 ${BINDIR}/atdyn pro_DNA.inp > pro_DNA_md1.log
#mpirun -np 8 ${BINDIR}/atdyn min_pro_DNA.inp > min_run.log
