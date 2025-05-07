#!/bin/bash
###plumed###
export PATH=/usr/local/plumed-2.8.3/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/plumed-2.8.3/lib:$LD_LIBRARY_PATH

###gromacs2022.5-plumed-2.8.3###
source /usr/local/gromacs-plumed/bin/GMXRC

gro=step3_input.gro
top=topol.top
'''
# EM
gmx grompp -f em.mdp -o em.tpr -c $gro -r $gro -p $top -maxwarn 2
gmx mdrun -deffnm em -ntmpi 1 -ntomp 16

# Equilibration
gmx grompp -f eq.mdp -o eq.tpr -c em.gro -r $gro -p $top -n index.ndx -maxwarn 1
gmx mdrun -deffnm eq -nb gpu -pme gpu -bonded gpu -update gpu -gpu_id 1 -ntmpi 1 -ntomp 16
'''
#Steer MD

gmx grompp -f pull.mdp -o pull.tpr -c eq.gro -r $gro -p $top -n index.ndx -t eq.cpt -maxwarn 1 
gmx mdrun -deffnm pull -nb gpu -pme gpu -bonded gpu -update gpu -gpu_id 1 -ntmpi 1 -ntomp 16
