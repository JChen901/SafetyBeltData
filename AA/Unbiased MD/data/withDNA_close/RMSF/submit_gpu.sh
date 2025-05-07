#!/bin/bash
###plumed###
export PATH=/usr/local/plumed-2.8.3/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/plumed-2.8.3/lib:$LD_LIBRARY_PATH

###gromacs2022.5-plumed-2.8.3###
source /usr/local/gromacs-plumed/bin/GMXRC

target_folder="/data/jychen/MD_projects/SMC/All_Atoms/normalMD/Fullpro_DNA+1protonating"

for ((i=1; i<=3; i++)); do
    echo "4" | gmx rmsf -f ${target_folder}/$i/md.xtc -s ${target_folder}/$i/md.gro -n ${target_folder}/$i/index.ndx -o $i.xvg -b 500000 -e 1000000 -res
done
