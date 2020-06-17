#!/bin/bash
#SBATCH --job-name QoRTs_sheep_4fat
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem-per-cpu=5g
#SBATCH --time=44:00:00
#SBATCH --account=bakulski1
#SBATCH --partition=standard
#SBATCH --mail-user=johndou@umich.edu
#SBATCH --mail-type=BEGIN,FAIL,END

module load Bioinformatics
module load samtools/1.5


for path in /nfs/turbo/bakulski1/People/johndou/vsheep/Run_2878/STAR/Sample*; do
	
	SAMPLEID="$(basename "${path}")"
  
  rm -r /nfs/turbo/bakulski1/People/johndou/vsheep/Run_2878/QoRTs/$SAMPLEID/
  mkdir /nfs/turbo/bakulski1/People/johndou/vsheep/Run_2878/QoRTs/$SAMPLEID/
    
  java -Xmx16G -jar /nfs/turbo/bakulski1/People/johndou/BeWo_RNAseq/QoRTs.jar QC\
  --maxReadLength 90 \
  --singleEnded \
  /nfs/turbo/bakulski1/People/johndou/vsheep/Run_2878/STAR/$SAMPLEID/Aligned.out.sam  \
  /nfs/turbo/bakulski1/People/johndou/Sheep_Genome/Oar_rambouillet_1.0/Oar_rambouillet_v1.0.gtf  \
  /nfs/turbo/bakulski1/People/johndou/vsheep/Run_2878/QoRTs/$SAMPLEID/

done

java -Xmx16G -jar /nfs/turbo/bakulski1/People/johndou/BeWo_RNAseq/QoRTs.jar QC --singleEnded /nfs/turbo/bakulski1/People/johndou/vsheep/Run_2878/STAR/Sample_126135/Aligned.out.sam  /nfs/turbo/bakulski1/People/johndou/Sheep_Genome/Oar_rambouillet_1.0/Oar_rambouillet_v1.0.gtf  /nfs/turbo/bakulski1/People/johndou/vsheep/Run_2878/QoRTs/Sample_126135/