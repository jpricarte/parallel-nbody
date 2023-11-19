#!/bin/bash
#SBATCH --job-name=nbody
#SBATCH --partition=hype
#SBATCH --nodes=1
#SBATCH --ntasks=32
#SBATCH --time=00:30:00
#SBATCH --output=%x_%j.out
#SBATCH --error=%x_%j.err

gcc nbody.c -o nbody -fopenmp -lm -O3 
gcc bard.c  -o bard  -fopenmp -lm -O3

OMP_NUM_THREADS=8
NUM_PARTICLES=25000
NUM_ITERATIONS=50

for i in $(seq 1 8); do
    echo -e "${NUM_PARTICLES}\n${NUM_ITERATIONS}" | ./nbody $i >> ./nbody.out
    echo -e "${NUM_PARTICLES}\n${NUM_ITERATIONS}" | ./bard  $i >> ./bard.out
done