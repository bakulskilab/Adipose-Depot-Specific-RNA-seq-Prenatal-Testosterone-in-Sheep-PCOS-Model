###############################
#QoRTs plots
###############################

# line to start interactive job on great lakes
# srun --nodes=1 --ntasks-per-node=1 --mem-per-cpu=4GB --pty /bin/bash

#load meta data
meta <- read.table("/nfs/turbo/bakulski1/Datasets/Padmanabhan/ruddle.brcf.med.umich.edu/ruddle.brcf.med.umich.edu/ruddle.brcf.med.umich.edu/Run_2878/Run_2878_padmanabha_DemuxStats.txt",header=T)
meta$id <- paste0('Sample_',meta$SampleID)
meta$Description <- as.character(meta$Description)
meta$tissue <- substring(meta$Description,1,3)
meta$sheep <- gsub('[A-Z]','',meta$Description)
meta$treat <- sapply(meta$Description, FUN=function(x) substring(x, nchar(x)))
meta <- meta[,c('id','tissue','sheep','treat')]
meta$group <- paste0(meta$tissue, meta$treat)


decoder <- data.frame(unique.ID=sub('.*/QoRTs/','',meta$id),
                      group.ID=meta$treat,
                      sample.ID=meta$sheep)
  
#done after running the QoRTs program on STAR output
library(QoRTs)
library(png)

res <- read.qc.results.data('/nfs/turbo/bakulski1/People/johndou/vsheep/Run_2878/QoRTs/', decoder=decoder)

makeMultiPlot.all(res, outfile.dir='/nfs/turbo/bakulski1/People/johndou/vsheep/Run_2878/QoRTs/',plot.device.name='pdf',chromosome.name.style="ENSEMBL")
