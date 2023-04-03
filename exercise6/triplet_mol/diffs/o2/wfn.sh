#!/bin/bash

# Set the folder path and output file name
folder_path="./"
output_file="output.txt"

# Write the header to the output file
echo "file,wavefunction,spin,orbital" > "$output_file"

# Loop over all files in the folder
for file in "$folder_path"/WFN_*.cube
do
    # Extract the file number
    file_number=$(echo "$file" | grep -oP '\d+(?=_\d+-\d+_\d+\.cube)')

    # Use sed to extract the information from the file header
    sed -n '2{s/^\s*//;s/\s\+/ /g;p;q}' "$file" > "$file.tmp"

    # Extract the wavefunction, spin, and orbital information using grep
    wavefunction=$(grep -oP '(?<=wavefunction )\S+' "$file.tmp")
    spin=$(grep -oP '(?<=spin )\S+' "$file.tmp")
    orbital=$(grep -oP '(?<=i\.e\. )\S+' "$file.tmp")

    # Write the information to the output file
    echo "$file_number,$wavefunction,$spin,$orbital" >> "$output_file"

    # Remove the temporary file
    rm "$file.tmp"
done