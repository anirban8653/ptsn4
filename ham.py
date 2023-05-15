import numpy as np
from numba import njit
hrfile = np.loadtxt('hr.dat')
# print(hrfile)

# this code separates different ry value file from hr.dat 
le = len(hrfile)


# %%
#@njit() 
def j_file(pln_idx):
    hjfile = []
    for i in range(0, le):
        if hrfile[i, 1] == pln_idx:
            hjfile.append(hrfile[i])
            print(i)
    np.savetxt(f'hjfile_yplane_{pln_idx}_deg_rm.dat',hjfile, fmt="%12.6f")        
#     print(hjfile)
#    return hjfile


print('========================')
print('start calculation')
print('========================')
j_file(0)
j_file(1)
j_file(-1)
j_file(2)
j_file(-2)
# j_file(3)
# j_file(-3)
# j_file(4)
# j_file(-4)

print('end !')
