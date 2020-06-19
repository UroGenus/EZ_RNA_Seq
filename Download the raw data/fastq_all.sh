#!/bin/bash

# for every SRR in the list of SRRs file
for srr in $(cat ~/SRR_list/SRR_Acc_List.txt)
do
# call the bash script that does the fastq dump, passing it the SRR number next in file
sbatch fastq.sh $srr
done
