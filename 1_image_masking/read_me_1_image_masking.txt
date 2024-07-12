Julian Cooper
Hirsch Lab
University of Minnesota

Organization and contents of 1_image_masking
Performed in matlab, this step takes orthomosaic images of the WiDiv fields and extracts % canopy cover at the plot level.


protocols: Protocols and SOPs from Sarah Tirado and Dorothy Sweet from the Candy Hirsch Lab at University of Minnesota 
	- Drone Flight Mission: Protocol for UAV image acquisition
	- Getting world coordinatesf for Base Station SOP: Protocol for getting coordinates from RTK base station
	- Agisoft Photscan Pipeline: Protocol for stitching images into field orthomosaic
	- QGIS Plot Boundary SOP_Grid: Protocol for creating the plot delineation raster layer. 

scripts: Code for canopy cover extraction from field ortho-mosaics
	- FieldClassificationKMeans.m: Unsupervised k-means clustering of RGB field orthomosaic
	- CanopyClosure.m: Create classification mask using FieldClassificationKMeans.m
	- Using_canopy.m: Template for extracting canopy cover from multiple dates and environments