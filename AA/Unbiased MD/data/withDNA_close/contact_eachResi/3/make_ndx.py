import os
import sys 
import numpy as np

n1 =int(849)                                #int(input ("start:"))
n2 =int(990)                                #int(input ("end:"))
Alink=[]
store=[]
for n in range (n1,n2+1):
    number = str(n)
    Alink.append(number+'\n')
    regular = 'ri'
    store.append(regular+Alink[n-n1])
store.append('q')
step=''.join(store)

#print(step)
command1='echo "'+str(step)+'"|gmx make_ndx -f /data/jychen/MD_projects/SMC/All_Atoms/normalMD/Fullpro_DNA+1protonating/1/md.gro -n /data/jychen/MD_projects/SMC/All_Atoms/normalMD/Fullpro_DNA+1protonating/1/index.ndx -o test.ndx'
os.system(command1)
