import os

folder_path = "c:/Users/cambie_f/MMM/Molecular-and-Materials-Modelling-FS2023/exercise6/triplet_mol/diffs/o2/"
output_file = "c:/Users/cambie_f/MMM/Molecular-and-Materials-Modelling-FS2023/exercise6/triplet_mol/diffs/o2/output.txt"

with open(output_file, "w") as out_file:
    for filename in os.listdir(folder_path):
        if "WFN_" in filename:
            name = filename.split("_")[1:]
            file_name = "_".join(name)[:-5]
            with open(os.path.join(folder_path, filename), "r") as cube_file:
                lines = cube_file.readlines()
                wavefunction = lines[1].split()[1]
                spin = lines[1].split()[3]
                hl = lines[1].split()[5]
                hl_sign = lines[1].split()[6]
                hl_value = str(abs(int(lines[1].split()[7])))
                out_file.write(file_name + " " + wavefunction + " " + spin + " " + hl + hl_sign + hl_value + "\n")
            