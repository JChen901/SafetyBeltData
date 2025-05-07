#!/bin/bash
#SBATCH -J plumed
#SBATCH --ntasks-per-node=1
#SBATCH --exclude cpu1-1,cpu1-65,cpu1-75,cpu1-104,cpu1-107
#SBATCH -p i64m512u

#module load compilers/gcc-12.2.0
#module load mpi/openmpi-4.1.5
module load plumed_2.9.0

for ((i=1; i<=50; i++)); do
plumed driver --plumed plumed$i.dat --pdb /hpc2hdd/home/jchen901/data/genesis/GENESIS_Tutorials-2022/Works/SMC_AICG2+/Full_removLig+98bp/021_delPartGo/021_nonspecific_DNAout_0.3/para_0.6/0.3-$i/run1/pro_dna_test_run.pdb --mf_dcd /hpc2hdd/home/jchen901/data/genesis/GENESIS_Tutorials-2022/Works/SMC_AICG2+/Full_removLig+98bp/021_delPartGo/021_nonspecific_DNAout_0.3/para_0.6/0.3-$i/run1/pro_dna_test_run.dcd --timestep 100
wait
done
