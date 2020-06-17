#!/bin/bash
#SBATCH --job-name trim_fat_depo
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=1500m
#SBATCH --time=4:00:00
#SBATCH --account=bakulski1
#SBATCH --partition=standard
#SBATCH --mail-user=johndou@umich.edu
#SBATCH --mail-type=BEGIN,FAIL,END

module load Bioinformatics
module load trimmomatic

for path in /nfs/turbo/bakulski1/Datasets/Padmanabhan/ruddle.brcf.med.umich.edu/ruddle.brcf.med.umich.edu/ruddle.brcf.med.umich.edu/Run_2878/padmanabha/Sample_12*; do

	SAMPLEID="$(basename "${path}")"
	
	mkdir /nfs/turbo/bakulski1/People/johndou/vsheep/Run_2878/trim/$SAMPLEID/
	
	TrimmomaticSE \
	/nfs/turbo/bakulski1/Datasets/Padmanabhan/ruddle.brcf.med.umich.edu/ruddle.brcf.med.umich.edu/ruddle.brcf.med.umich.edu/Run_2878/padmanabha/$SAMPLEID/*.fastq.gz \
	/nfs/turbo/bakulski1/People/johndou/vsheep/Run_2878/trim/$SAMPLEID/${SAMPLEID}_trim.fastq.gz \
	ILLUMINACLIP:/nfs/turbo/bakulski1/People/johndou/TruSeq3-SE.fa:2:30:10 HEADCROP:11 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15

done



module load fastqc/0.11.8

for path in /nfs/turbo/bakulski1/People/johndou/vsheep/Run_2878/trim/Sample_*; do

	SAMPLEID="$(basename "${path}")"
	
	mkdir /nfs/turbo/bakulski1/People/johndou/vsheep/Run_2878/fastqc_post_trim/$SAMPLEID/
	
	fastqc \
	/nfs/turbo/bakulski1/People/johndou/vsheep/Run_2878/trim/$SAMPLEID/*.fastq.gz \
	--outdir=/nfs/turbo/bakulski1/People/johndou/vsheep/Run_2878/fastqc_post_trim/$SAMPLEID/

done


module load python3.7-anaconda

cd /nfs/turbo/bakulski1/People/johndou/vsheep/Run_2878/fastqc_post_trim/

multiqc \
/nfs/turbo/bakulski1/People/johndou/vsheep/Run_2878/fastqc_post_trim/Sample_*
