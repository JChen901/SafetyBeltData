#!/bin/bash
###plumed###
export PATH=/usr/local/plumed-2.8.3/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/plumed-2.8.3/lib:$LD_LIBRARY_PATH

###gromacs2022.5-plumed-2.8.3###
source /usr/local/gromacs-plumed/bin/GMXRC
python make_ndx.py
wait
python3 ALL-RESID.py
wait
python3 SUM.py > SUM.xvg
