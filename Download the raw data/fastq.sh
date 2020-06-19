#!/bin/bash
#SBATCH --mail-user=<eugenio.zoni@dbmr.unibe.ch>
#SBATCH --mail-type=none
#SBATCH	--time=5:00:00 
#SBATCH --job-name="dsra_fq"
#SBATCH --partition=all
#SBATCH --nodes=1

# Put your code below this line 24592865
module add vital-it/7
module add UHTS/Analysis/sratoolkit/2.9.6.1
fastq-dump --split-3 $1 -O $HOME/bladder_fastq 
