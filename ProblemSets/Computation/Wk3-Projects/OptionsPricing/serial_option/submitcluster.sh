#!/bin/bash

#SBATCH --job-name=BS

# send output to BS.out
#SBATCH --output=BS.out

# this job requests 1 core. Cores can be selected from various nodes.
#SBATCH --ntasks=1000

# Run the process 
srun bs.exe
