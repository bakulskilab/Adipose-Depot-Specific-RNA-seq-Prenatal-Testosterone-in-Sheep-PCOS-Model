# Developmental Programming: Adipose Depot-Specific Transcriptional Regulation by Prenatal Testosterone Excess in a Sheep Model of PCOS 

## Citation Information
Dou, J., Puttabyatappa, M., Padmanabhan, V., & Bakulski, K. M. (2021). Developmental programming: Adipose depot-specific transcriptional regulation by prenatal testosterone excess in a sheep model of PCOS. Molecular and cellular endocrinology, 523, 111137. https://doi.org/10.1016/j.mce.2020.111137. PMID: 33359827

This Github repository contains the data management and analytic scripts to produce the following manuscript: [Developmental Programming: Adipose Depot-Specific Transcriptional Regulation by Prenatal Testosterone Excess in a Sheep Model of PCOS](https://pubmed.ncbi.nlm.nih.gov/33359827/)


## Abstract
Prenatal testosterone (T)-treated female sheep manifest adipose depot-specific disruptions in inflammatory/oxidative state, adipocyte differentiation and thermogenic adipocyte distribution. The objective of this study was to identify common and divergent gene pathways underlying prenatal T excess-induced adipose depot-specific disruptions. RNA sequencing and network analyses were undertaken with visceral (VAT), subcutaneous (SAT), epicardiac (ECAT) and perirenal (PRAT) adipose tissues from control and prenatal T-treated (100 mg T propionate twice a week from days 30-90 of gestation) female sheep at 21 months of age. Increased expression of adiposity and inflammation-related genes in VAT and genes that promote differentiation of white adipocytes in SAT were congruous with their metabolic roles with SAT favoring uptake/storage of free fatty acids and triglycerides and VAT favoring higher rate of fatty acid turnover and lipolysis. Selective upregulation of cardiac muscle and renoprotection genes in ECAT and PRAT respectively are suggestive of protective paracrine actions. Expression profile in prenatal T-treated sheep paralleled depot-specific dysfunctions with increased proinflammatory genes in VAT, reduced adipocyte differentiation genes in VAT and SAT and increased vascular related gene expression in PRAT. The high expression of genes involved in cardiomyocyte function in ECAT is suggestive of cardioprotective function being maintained to overcome the prenatal T-induced cardiac dysfunction and hypertension. These findings coupled with changes in gene pathways and networks involved in chromatin modification, extracellular matrix, immune and mitochondrial function, and endoplasmic reticulum to Golgi transport suggest that dysregulation in gene expression underlie prenatal T-treatment induced functional differences among adipose depots and manifestation of metabolic dysfunction.

Please contact Kelly Bakulski (bakulski@umich.edu) to if you have any questions or comments.

## Funding
Research reported in this publication was supported by Eunice Kennedy Shriver National Institute of Child Health & Human Development, National Institutes of Health (NIH) under award P01 HD44232 and R01 HD099096 to VP. MP is supported via Ruth L. Kirschstein Institutional Training Grant T32 ES007062.

## Script Files
1_fastqc.sh: using fastQC and multiQC for raw RNA sequencing data

2_trimming.sh: trimming read

3_STAR_gl.sh: aligning raw data to human genome

4_QoRTs.sh: quality control of the aligned data

4_QoRTs_plots.R: saving complied QC plots

5_featureCounts.sh: generating gene counts data

6_diff_exp_analysis.Rmd: differential expression analysis
