Julian Cooper
Hirsch Lab
University of Minnesota

Organization and contents of 5_trait_stability
Performed in R, this step calculates best linear unbiased predictions of canopy cover and associated traits

R markdown file
data: Text list and new df renaming field trial genotypes to match SNP hap map data 
	- canopy_cover_phenotypes_hapmapnames.csv: Canopy cover measurements with field genotype names formatted to match hapmap genotype names
	- taxa_field_hapmap_dictionary.csv: Dictionary of field and hap map genotype names
	- model_factors: P-values of each factor (Genotype, Env, GxE, Rep, Block, Error) for each trait-environment or inter-environment-time BLUP. 
		- insignificant: Factors and GDD that were not significant (p>.05)

