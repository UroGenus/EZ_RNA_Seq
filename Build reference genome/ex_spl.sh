#!/bin/bash
#SBATCH --mail-user=<eugenio.zoni@dbmr.unibe.ch>
#SBATCH --mail-type=fail
#SBATCH	--time=1:00:00 
#SBATCH --job-name="ex_spl"
#SBATCH --partition=all
#SBATCH --nodes=1

RNA_REFS_DIR=$HOME/RNA_HOME/RNA_REFS_DIR
RNA_REF_GTF=$HOME/RNA_HOME/RNA_REF_GTF


# Put your code below this line
module add vital-it/7
module add UHTS/Aligner/hisat/2.1.0
hisat2_extract_splice_sites.py $RNA_REF_GTF/Homo_sapiens.GRCh38.99.gtf > $RNA_REFS_DIR/splicesites.tsv
hisat2_extract_exons.py $RNA_REF_GTF/Homo_sapiens.GRCh38.99.gtf > $RNA_REFS_DIR/exons.tsv
