#C:/Users/cambie_f/MMM/Molecular-and-Materials-Modelling-FS2023/exercise6/triplet_mol/diffs/o2

import numpy as np

# load the cube file
with open('C:/Users/cambie_f/MMM/Molecular-and-Materials-Modelling-FS2023/exercise6/triplet_mol/diffs/o2/o2-WFN_00001_1-1_0.cube', 'r') as f:
    data = f.readlines()

# extract the number of grid points
nx, ny, nz = map(int, [round(float(x)) for x in data[3].split()[0:3]])

print(f"nx={nx}, ny={ny}, nz={nz}")

# extract the data from the cube file
cube_data = np.genfromtxt(data[6:], delimiter=None)
print(f"cube_data.shape={cube_data.shape}")

# reshape the data to the correct shape
cube_data = np.reshape(cube_data, (nx, ny, nz))
print(f"cube_data.shape={cube_data.shape}")

