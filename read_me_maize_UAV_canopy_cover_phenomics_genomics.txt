Julian Cooper
Cory Hirsch Lab
University of Minnesota

This directory contains the code and data for Cooper et al., 2024: Dissecting the temporal phenomics and genomics of maize canopy cover using UAV mediated image capture

1__image_masking
Performed in matlab, this step takes orthomosaic images of the WiDiv fields and extracts % canopy cover at the plot level.

2_canopy_traits
Performed in R, these scripts QC each year and fit Loess growth curves to standardize GDD.
Weather data was obtained from the St Paul Research Station. Combined script merges % cover data frames and calculates growth rates. Also calculates area under the canopy progress curve and growth rate of the adult vegetative growth phase, however these results are not included in the final manuscript.

3_percent_variance
Performed in R, calculates the percent explained variance from each factor (Genotype, Environment, GxE, Rep, Block) for each canopy cover trait metric.

4_trait_stability
Performed in R, performs AMMI and FW stability for each canopy cover trait metric.

5_BLUP_calculation
Performed in R, calculate best linear unbiased predictions for inter and intra-year environments, and extracts standardized BLUP files for all traits including stability metrics.

6) 6_temporal_GWAS
Performed locally in R and remotely via the Minnesota Supercomputing Institute.
Formats phenomic and genomic data and runs temporal GWAS on all canopy cover traits BLUPs. Merges significant SNP results based on linkage disequilibrium.
