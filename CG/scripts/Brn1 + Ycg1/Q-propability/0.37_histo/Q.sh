#!/bin/bash
#SBATCH -J plumed
#SBATCH --ntasks-per-node=1
#SBATCH --exclude cpu1-1
#SBATCH -p i64m512u

#module load compilers/gcc-12.2.0
#module load mpi/openmpi-4.1.5
module load plumed_2.9.0

for i in {1..10}
do
    plumed driver --plumed plumed_$i.dat --pdb /hpc2hdd/home/jchen901/data/genesis/GENESIS_Tutorials-2022/Works/SMC_AICG2+/Kleisin_interaction_test/replica/para_0.37/w0.37-$i/run1/pro_dna_test_run.pdb --mf_dcd /hpc2hdd/home/jchen901/data/genesis/GENESIS_Tutorials-2022/Works/SMC_AICG2+/Kleisin_interaction_test/replica/para_0.37/w0.37-$i/run1/pro_dna_test_run.dcd --timestep 100
done