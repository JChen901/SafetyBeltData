###!/user/bin/python

import os
import sys 

for m in range (10,152):
    command1='echo 5 '+str(m)+'|gmx mindist -f /data/jychen/MD_projects/SMC/All_Atoms/normalMD/Fullpro_DNA+1protonating/1/md.xtc -s /data/jychen/MD_projects/SMC/All_Atoms/normalMD/Fullpro_DNA+1protonating/1/md.tpr -n test.ndx -on '+str(m)+'.xvg -tu ns -b 500 -e 1000'
    command2='rm ./#*'
    os.system(command1)
    os.system(command2)
    print(m)

#def file_name(file_dir):
#    L=[]
#    for root, dirs, files in os.walk(file_dir):
#        for file in files:
#            if os.path.splitext(file)[0] == '8':
#                L.append(os.path.join(root, file))
#    return L
#b=file_name('../298k-dppc-dlipc-4-3-3')
#print b

