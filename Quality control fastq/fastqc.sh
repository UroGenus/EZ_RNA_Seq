#!/bin/bash
#SBATCH --mail-user=<eugenio.zoni@dbmr.unibe.ch>
#SBATCH --mail-type=none
#SBATCH	--time=5:00:00 
#SBATCH --job-name="fastqc"
#SBATCH --partition=all
#SBATCH --nodes=1

# Put your code below this line 24592865
module add vital-it/7
module add UHTS/Quality_control/fastqc/0.11.7
fastqc $1 -O $HOME/bladder_fastqc