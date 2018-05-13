#!/bin/sh
#SBATCH --job-name=git_test_models # Job name
#SBATCH --cpus-per-task=1 # Number of cores per MPI rank 
#SBATCH --nodes=1 #Number of nodes
#SBATCH --ntasks-per-node=1
#SBATCH --ntasks=1 # Number of MPI ranks
#SBATCH --mem-per-cpu=5gb # Memory per processor
#SBATCH --time=96:00:00 # Time limit hrs:min:sec
#SBATCH --qos=ewhite-b
#SBATCH --partition=hpg1-compute
#SBATCH --output=logs/git_test.out

module load git
module load R
module load singularity
module load java
java -jar agent.jar -jnlpUrl http://serenity.ifas.ufl.edu:8080/computer/portalpredictions-agent/slave-agent.jnlp -secret d57918ae5c84819d25d2e8dbe1dda68c9af337b2bb099d010bccbeb78c96d8f2 -workDir "/home/henrysenyondo/jenkins"
sleep 2m
ls
whoami
