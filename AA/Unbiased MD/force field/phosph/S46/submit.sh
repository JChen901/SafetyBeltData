#!/bin/bash

export OMP_NUM_THREADS=8
module load plumed
source /usr/local/gromacs-2022.5_plumed/bin/GMXRC

cd R1/process_files/
CUDA_VISIBLE_DEVICES=1 nohup numactl --cpunodebind=0 bash simulation.sh 5xjh.pdb > sim.log &
echo "Task is successfully submitted!"

gro=step3_input.gro
top=topol.top

# step6.0
#gmx grompp -f step4.0_minimization.mdp -o step4.0_minimization.tpr -c $gro -r $gro -p $top -maxwarn 2
#gmx mdrun -deffnm step4.0_minimization -ntmpi 1 -ntomp 8

# Equilibration
#gmx grompp -f step4.1_equilibration.mdp -o step4.1_equilibration.tpr -c step4.0_minimization.gro -r $gro -p $top -n index.ndx -maxwarn 1
#gmx mdrun -deffnm step4.1_equilibration -nb gpu -pme gpu -bonded gpu -update gpu -gpu_id 0 -ntmpi 1 -ntomp 8 -cpi

# Production
#gmx grompp -f step5_production.mdp -o md.tpr -c step4.1_equilibration.gro -p topol.top -r step4.1_equilibration.gro -n index.ndx

gmx mdrun -deffnm md -nb gpu -pme gpu -bonded gpu -update gpu  -gpu_id 2 -ntmpi 1 -ntomp 8 -cpi


