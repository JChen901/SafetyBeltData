#!/bin/bash
#SBATCH -J 0.5--
#SBATCH --ntasks-per-node=32
#SBATCH --exclude cpu1-1,cpu1-65,cpu1-75,cpu1-107
#SBATCH -p i64m512u

module load mpi/openmpi-4.1.5
module load genesis-2.1.2

export OMP_NUM_THREADS=4

mpirun -np 8 atdyn min_pro_DNA.inp > min_run.log
wait
mpirun -np 8 atdyn pro_DNA.inp > pro_DNA_md1.log
