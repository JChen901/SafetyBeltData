#!/bin/bash
conda activate gmxMMPBSA

mpirun -np 8 gmx_MMPBSA -O -i mmpbsa.in -cs combine/md.tpr -ct combine/combined_fitted.xtc -ci combine/index.ndx -cg 9 11 -cp combine/topol.top -o FINAL_RESULTS_MMPBSA.dat -eo FINAL_RESULTS_MMPBSA.csv -do FINAL_DECOMP_MMPBSA.dat -deo FINAL_DECOMP_MMPBSA.csv

#gmx_MMPBSA_ana -f _GMXMMPBSA_info