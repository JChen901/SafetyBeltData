#!/bin/bash
###plumed###
export PATH=/usr/local/plumed-2.8.3/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/plumed-2.8.3/lib:$LD_LIBRARY_PATH

###gromacs2022.5-plumed-2.8.3###
source /usr/local/gromacs-plumed/bin/GMXRC

target_folder="/data/jychen/MD_projects/SMC/All_Atoms/SteeredMD/2SMD_1protonataing+DNA"

for ((i=1; i<=4; i++)); do
    echo "7 10" | gmx mindist -f ${target_folder}/$i/pull.xtc -s ${target_folder}/$i/pull.tpr -n ${target_folder}/$i/index.ndx -on $i.xvg
done
