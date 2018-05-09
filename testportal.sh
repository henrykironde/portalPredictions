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

git clone git@github.com:weecology/portalPredictions.git

cd portalPredictions
ls
whoami
Rscript install-packages.R
Rscript tools/prepare_data.R
Rscript PortalForecasts.R
