#!/bin/bash
#SBATCH --mail-user=eugenio.zoni@dbmr.unibe.ch
#SBATCH --mail-type=end,fail
#SBATCH --job-name="align"
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --time=7:00:00
#SBATCH --mem-per-cpu=8G
#SBATCH --array=1-5

HISAT_INDEX=$HOME/RNA_HOME/RNA_REFS_DIR/Homo_sapiens.GRCh38.dna_sm.primary_assembly

FASTQ_DIR=$HOME/bladder_fastq
HISAT_DIR=$HOME/bladder_sam

#load modules
module add vital-it/7
module add UHTS/Aligner/hisat/2.1.0
module add UHTS/Analysis/samtools/1.10

case "$SLURM_ARRAY_TASK_ID" in 

1) SAMPLE="SRR6050287" ;;
2) SAMPLE="SRR6050288" ;;
3) SAMPLE="SRR6050289" ;;
4) SAMPLE="SRR6050290" ;;
5) SAMPLE="SRR6050291" ;;

esac

echo $SAMPLE
echo ${SAMPLE}

hisat2 -p 8 -t --rg-id $SAMPLE -x $HISAT_INDEX --dta --rna-strandness RF -1 $FASTQ_DIR/${SAMPLE}_1.fastq -2 $FASTQ_DIR/${SAMPLE}_2.fastq -S $HISAT_DIR/$SAMPLE.sam

samtools view -S -b $HISAT_DIR/$SAMPLE.sam  > $HISAT_DIR/$SAMPLE.bam

samtools sort $HISAT_DIR/$SAMPLE.sam -o $HISAT_DIR/bam/$SAMPLE.sorted.bam