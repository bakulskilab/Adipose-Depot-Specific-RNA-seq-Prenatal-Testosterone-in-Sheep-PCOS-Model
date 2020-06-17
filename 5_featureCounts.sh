#!/bin/bash
#SBATCH --job-name featureCount_sheep_fat4
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=9
#SBATCH --mem-per-cpu=50mb
#SBATCH --time=3:00:00
#SBATCH --account=bakulski1
#SBATCH --partition=standard
#SBATCH --mail-user=johndou@umich.edu
#SBATCH --mail-type=BEGIN,FAIL,END


module load Bioinformatics
module load subread/1.6.0

ALIGNED=$(find /nfs/turbo/bakulski1/People/johndou/vsheep/Run_2878/STAR/ -name "Aligned.out.sam")

cd /nfs/turbo/bakulski1/People/johndou/vsheep/Run_2878/STAR/
 
featureCounts \
	-T 9 \
	-t exon \
	-g gene_id \
	-a /nfs/turbo/bakulski1/People/johndou/Sheep_Genome/Oar_rambouillet_1.0/GCF_002742125.1_Oar_rambouillet_v1.0_genomic.gtf  \
	-o /nfs/turbo/bakulski1/People/johndou/vsheep/Run_2878/featureCounts/counts \
	$ALIGNED


featureCounts -t exon -g gene_id -a /nfs/turbo/bakulski1/People/johndou/Sheep_Genome/Oar_rambouillet_1.0/GCF_002742125.1_Oar_rambouillet_v1.0_genomic.gtf  -o /nfs/turbo/bakulski1/People/johndou/vsheep/Run_2878/featureCounts/counts /nfs/turbo/bakulski1/People/johndou/vsheep/Run_2878/STAR/Sample_129862/Aligned.out.sam
