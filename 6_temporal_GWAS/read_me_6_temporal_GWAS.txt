Julian Cooper
Hirsch Lab
University of Minnesota

Organization and contents of 6_temporal_GWAS

Performed using Minnesota Supercomputer Institute resources to run GAPIT in R. This step runs a separate GWAS for each trait-model-time iteration. Input is from 5_BLUP_calculation.

R markdown files
	- canopy_cover_GWAS_pipeline_05022022: Contains multiple R and shell scripts for GWAS implementation
	- canopy_cover_SNP_analysis_02042023: Calculate LD between significant SNPs and merge markers in significant LD
results
	- LD_merged_sig_snps_FarmCPU.txt: Canopy cover significant SNPs identified by FarmCPU method in GAPIT and filtered to remove redundant markers based on LD
