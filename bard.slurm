#!/bin/bash
#SBATCH --job-name=bard
#SBATCH --partition=hype
#SBATCH --nodes=1
#SBATCH --ntasks=4
#SBATCH --time=1:00:00
#SBATCH --output=%x_%j.out
#SBATCH --error=%x_%j.err

gcc bard.c -o bard -fopenmp
./bard
