all:
	gcc nbody.c -o nbody -fopenmp -lm -O3 
	gcc bard.c  -o bard  -fopenmp -lm -O3