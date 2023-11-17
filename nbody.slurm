#!/bin/bash
#SBATCH --job-name=nbody
#SBATCH --partition=hype
#SBATCH --nodes=1
#SBATCH --ntasks=32
#SBATCH --time=1:00:00
#SBATCH --output=%x_%j.out
#SBATCH --error=%x_%j.err

gcc nbody.c -o nbody -fopenmp -lm
gcc bard.c  -o bard -fopenmp -lm

# Using a for loop with 8 iterations
for i in $(seq 1 8); do
    export OMP_NUM_THREADS=1
    ./nbody < nbody.in > ./nbody_t1_i$i.out
    ./bard  < nbody.in > ./bard_t1_i$i.out
done

# Using a for loop with 8 iterations
for i in $(seq 1 8); do
    export OMP_NUM_THREADS=2
    ./nbody < nbody.in > ./nbody_t2_i$i.out
    ./bard  < nbody.in > ./bard_t2_i$i.out
done

# Using a for loop with 8 iterations
for i in $(seq 1 8); do
    export OMP_NUM_THREADS=4
    ./nbody < nbody.in > ./nbody_t4_i$i.out
    ./bard  < nbody.in > ./bard_t4_i$i.out
done

# Using a for loop with 8 iterations
for i in $(seq 1 8); do
    export OMP_NUM_THREADS=8
    ./nbody < nbody.in > ./nbody_t8_i$i.out
    ./bard  < nbody.in > ./bard_t8_i$i.out
done

# Using a for loop with 8 iterations
for i in $(seq 1 8); do
    export OMP_NUM_THREADS=16
    ./nbody < nbody.in > ./nbody_t16_i$i.out
    ./bard  < nbody.in > ./bard_t16_i$i.out
done

# Using a for loop with 8 iterations
for i in $(seq 1 8); do
    export OMP_NUM_THREADS=32
    ./nbody < nbody.in > ./nbody_t32_i$i.out
    ./bard  < nbody.in > ./bard_t32_i$i.out
done