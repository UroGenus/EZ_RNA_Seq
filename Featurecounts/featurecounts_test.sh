#!/bin/bash
#SBATCH --mail-user=eugenio.zoni@dbmr.unibe.ch
#SBATCH --mail-type=end,fail
#SBATCH --job-name="ftc"
#SBATCH --nodes=4
#SBATCH --ntasks-per-node=4
#SBATCH --time=2:00:00
#SBATCH --mem-per-cpu=2G
#SBATCH -o output.%j.%N.txt

GTF_DIR=$HOME/RNA_HOME/RNA_REF_GTF
BAM_DIR=$HOME/bladder_sam/bam
COUNT_DIR=$HOME/bladder_ftcounts

#load modules
module add vital-it/7
module add UHTS/Analysis/subread/1.6.0

featureCounts -T 4 -s 2 -a $GTF_DIR/Homo_sapiens.GRCh38.99.gtf -o $COUNT_DIR/GSE103990_featurecounts.txt $BAM_DIR/*.sorted.bam
