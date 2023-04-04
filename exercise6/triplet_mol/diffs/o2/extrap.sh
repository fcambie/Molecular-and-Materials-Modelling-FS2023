#!/bin/bash

folder_path="c:/Users/cambie_f/MMM/Molecular-and-Materials-Modelling-FS2023/exercise6/triplet_mol/diffs/o2/"
output_file="c:/Users/cambie_f/MMM/Molecular-and-Materials-Modelling-FS2023/exercise6/triplet_mol/diffs/o2/output.txt"

for filename in $folder_path/*; do
    if [[ $filename == *"WFN_"* ]]; then
        name=$(echo $filename | cut -d "_" -f 2- | rev | cut -c 6- | rev)
        wavefunction=$(sed -n '2s/^\s*WAVEFUNCTION\s*\([0-9]*\)\s*spin\s*\([0-9]*\)\s*i.e.\s*HOMO\s*-\s*\(-\)\{0,1\}\([0-9]*\)/\1/p' $filename)
        spin=$(sed -n '2s/^\s*WAVEFUNCTION\s*\([0-9]*\)\s*spin\s*\([0-9]*\)\s*i.e.\s*HOMO\s*-\s*\(-\)\{0,1\}\([0-9]*\)/\2/p' $filename)
        hl=$(sed -n '2s/^\s*WAVEFUNCTION\s*\([0-9]*\)\s*spin\s*\([0-9]*\)\s*i.e.\s*HOMO\s*-\s*\(-\)\{0,1\}\([0-9]*\)/HOMO-\3/p' $filename)
        out_file=$(echo $output_file | sed 's/\//\\/g')
        hl_sign=$(sed -n '2s/^\s*WAVEFUNCTION\s*\([0-9]*\)\s*spin\s*\([0-9]*\)\s*i.e.\s*HOMO\s*-\s*\(-\)\{0,1\}\([0-9]*\)/\4/p' $filename)
        if [[ $hl_sign == "-" ]]; then
            hl_value=$(sed -n '2s/^\s*WAVEFUNCTION\s*\([0-9]*\)\s*spin\s*\([0-9]*\)\s*i.e.\s*HOMO\s*-\s*\(-\)\{0,1\}\([0-9]*\)/-\5/p' $filename)
        else
            hl_value=$(sed -n '2s/^\s*WAVEFUNCTION\s*\([0-9]*\)\s*spin\s*\([0-9]*\)\s*i.e.\s*HOMO\s*-\s*\(-\)\{0,1\}\([0-9]*\)/\5/p' $filename)
        fi
        echo "${name} ${wavefunction} ${spin} ${hl}${hl_sign}${hl_value}" >> $out_file
    fi
done