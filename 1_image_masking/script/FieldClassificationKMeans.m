

%% Section 1 - Run each time. Need to change date (mmddyyyy) and fro each date the field (GC1, GC2, NC, or WiDiv)

% FieldClassificationKMeans.m
% Input: orthomosaic of desired planting after clipping
tic;
clear;

year = '2021'; %Change
date = '06282021'; %Change
planting = 'WiDiv'; 

file = strcat('QGIS_layers/', year, '/', date, '/', date, '_geotiff_', planting, '.tif');

[ortho_geo, R] = geotiffread (file); %// type uint8
ortho_subset = ortho_geo(:,:,1:3);  
% Classify each field image into plant(1) and background(0)

% Separating plants from soil using K-means clustering 
% K-Means clustering algorithm [24] is an unsupervised clustering algorithm that classifies the input data points into multiple classes based on their inherent distance from each other.
% https://www.mathworks.com/help/images/examples/color-based-segmentation-using-k-means-clustering.html
he = ortho_subset;
cform = makecform('srgb2lab'); % Convert Image from RGB Color Space to L*a*b* Color Space
lab_he = applycform(he,cform);

ab = double(lab_he(:,:,2:3)); % Classify the Colors in 'a*b*' Space Using K-Means Clustering
nrows = size(ab,1);
ncols = size(ab,2);
ab = reshape(ab,nrows*ncols,2);

nColors = 3; %number of clusters desired
rng default;
[cluster_idx, cluster_center] = kmeans(ab,nColors,'distance','sqEuclidean', ...
                                      'Replicates',3); % repeat the clustering 3 times to avoid local minima

figure; imshow(ortho_subset,[]);
toc;
%% Rerun Each Time you change values below
Ikm = reshape(cluster_idx,nrows,ncols); % Label Every Pixel in the Image Using the Results from KMEANS
 imshow(Ikm,[]);

 %% Save cluster image colorized
imwrite(ind2rgb(im2uint8(mat2gray(Ikm)), parula(256)), '/Users/jcooper/Desktop/thesis_writing/papers/canopy_cover/figures/figure1_imaging/colored_clusters.tif'); ;%Set pathway

%% Change value of 0 or 1 based on background (0) and plant (1) categories. Consider running each one with a "1" and all others as "zero" to determine what they are
Ikm(find(Ikm == 1)) = 0; %black 
Ikm(find(Ikm == 2)) = 0; %dark grey 
Ikm(find(Ikm == 3)) = 1; %light grey x
% Ikm(find(Ikm == 4)) = 0; %white 
% Ikm(find(Ikm == 5)) = 1; %white 
% Ikm(find(Ikm == 6)) = 0; %white 
% Ikm(find(Ikm == 7)) = 0; %white 
% Ikm(find(Ikm == 8)) = 0; %white 
% Ikm(find(Ikm == 9)) = 1; %white 

ortho_subset_appl = bsxfun(@times, ortho_subset, uint8(Ikm)); %create mask and apply to orthomosaic
 imshow(ortho_subset_appl); %show applied mask

 %imwrite(ortho_subset_appl, '/Users/jcooper/Desktop/thesis_writing/papers/canopy_cover/figures/figure1_imaging/mask_plant.tif')

%% Dilate
SE = strel('square', 3); % Set shape and pixel width
Ikm = imclose(Ikm,SE); 

SE = strel('octagon', 3); % Set shape and pixel width. Default is 3.
Ikm = imclose(Ikm,SE); 


ortho_subset_appl = bsxfun(@times, ortho_subset, uint8(Ikm)); %create mask and apply to orthomosaic
 imshow(ortho_subset_appl); %show applied mask

 %%
 imwrite(ortho_subset_appl, '/Users/jcooper/Desktop/thesis_writing/papers/canopy_cover/figures/figure1_imaging/mask_plant_dilated.tif')

%% save mask to desired folder
%fileIkm = strcat('data_analysis/', year, '/segmentation/', date, '_mask_', planting, '.mat'); 
fileIkm = strcat('data_analysis/2019_doubledilated/segmentation/', date, '_mask_', planting, '.mat'); %Set pathway
save(fileIkm, 'Ikm'); %Save Ikm
