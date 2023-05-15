import numpy as np
# from numba import njit

deg_file = np.loadtxt('deg_data.dat')
# print(deg_file)
nbasis = 136
# this code separates different ry value file from hr.dat
le = len(deg_file)

deg_data = deg_file.flatten()
# print(deg_data)

hrfile = np.loadtxt('wann_hr.dat')
print(len(hrfile))
#%%
for i in range(len(hrfile)):
    hrfile[i,5] = hrfile[i,5] / deg_data[i // (nbasis * nbasis)]
    hrfile[i,6] = hrfile[i,6] / deg_data[i // (nbasis * nbasis)]
    print(i)

np.savetxt("wann_hr_deg.dat", hrfile, fmt="%12.6f")
# a = np.array([[1,2,3,4],[3,4,5,6],[5,6,7,8]],dtype='float')

# for i in range(3):
#     a[i,3] = a[i,3]/3

# print(a)