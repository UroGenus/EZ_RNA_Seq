#!/bin/bash
#SBATCH --mail-user=<eugenio.zoni@dbmr.unibe.ch>
#SBATCH --mail-type=end,fail
#SBATCH	--time=1-01:00:00 
#SBATCH --mem-per-cpu=200G
#SBATCH --job-name="hisat2ind"
#SBATCH --partition=all
#SBATCH --nodes=1

# Put your code below this line
module add vital-it/7
module add UHTS/Aligner/hisat/2.1.0
cd $HOME/RNA_HOME/RNA_REFS_DIR
hisat2-build -p 8 --ss splicesites.tsv --exon exons.tsv Homo_sapiens.GRCh38.dna_sm.primary_assembly.fa Homo_sapiens.GRCh38.dna_sm.primary_assembly