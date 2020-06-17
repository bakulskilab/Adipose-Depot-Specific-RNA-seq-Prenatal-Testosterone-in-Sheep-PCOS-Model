#!/bin/bash
#SBATCH --job-name STAR_map_sheep_4fat
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=6
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=6g
#SBATCH --time=36:00:00
#SBATCH --account=bakulski1
#SBATCH --partition=standard
#SBATCH --mail-user=johndou@umich.edu
#SBATCH --mail-type=BEGIN,FAIL,END


for path in /nfs/turbo/bakulski1/People/johndou/vsheep/Run_2878/trim/Sample*; do
	
	SAMPLEID="$(basename "${path}")"
	
	rm -r /nfs/turbo/bakulski1/People/johndou/vsheep/Run_2878/STAR/$SAMPLEID/
	mkdir /nfs/turbo/bakulski1/People/johndou/vsheep/Run_2878/STAR/$SAMPLEID/
 
  /nfs/turbo/bakulski1/Software/STAR/bin/Linux_x86_64_static/STAR \
  --genomeDir /nfs/turbo/bakulski1/People/johndou/Sheep_Genome/Oar_ram_refSTAR/ \
  --readFilesIn \
  /nfs/turbo/bakulski1/People/johndou/vsheep/Run_2878/trim/$SAMPLEID/*.fastq.gz \
  --readFilesCommand gunzip -c \
  --runThreadN 6 \
  --outFilterMultimapNmax 10 \
  --outSAMmode Full \
  --sjdbScore 2 \
  --outFileNamePrefix \
  /nfs/turbo/bakulski1/People/johndou/vsheep/Run_2878/STAR/$SAMPLEID/ \
  --outReadsUnmapped Fastx
   
done