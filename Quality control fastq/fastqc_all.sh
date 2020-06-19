#!/bin/bash

# for every SRR in the list of fastq file
for srr in $(cat ~/bladder_fastq/fastqnames.txt)
do
# call the bash script that does the fastq dump, passing it the SRR number next in file
sbatch fastqc.sh $srr
done