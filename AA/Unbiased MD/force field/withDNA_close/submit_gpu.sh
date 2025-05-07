#!/bin/bash
###plumed###
export PATH=/usr/local/plumed-2.8.3/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/plumed-2.8.3/lib:$LD_LIBRARY_PATH

###gromacs2022.5-plumed-2.8.3###
source /usr/local/gromacs-plumed/bin/GMXRC

gro=step3_input.gro
top=topol.top

# step6.0
gmx grompp -f step4.0_minimization.mdp -o step4.0_minimization.tpr -c $gro -r $gro -p $top -maxwarn 2
gmx mdrun -deffnm step4.0_minimization -ntmpi 1 -ntomp 16

# Equilibration
gmx grompp -f step4.1_equilibration.mdp -o step4.1_equilibration.tpr -c step4.0_minimization.gro -r $gro -p $top -n index.ndx -maxwarn 1
gmx mdrun -deffnm step4.1_equilibration -nb gpu -pme gpu -bonded gpu -update gpu -gpu_id 1 -ntmpi 1 -ntomp 16 -cpi

# Production
gmx grompp -f step5_production.mdp -o md.tpr -c step4.1_equilibration.gro -p topol.top -r step4.1_equilibration.gro -n index.ndx

gmx mdrun -deffnm md -nb gpu -pme gpu -bonded gpu -update gpu  -gpu_id 1 -ntmpi 1 -ntomp 16 -cpi
