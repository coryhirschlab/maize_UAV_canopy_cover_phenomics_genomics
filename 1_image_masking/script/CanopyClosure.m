%% Canopy CLosure Extraction
% inputs: date, planting
% prior: create classification mask using FieldClassificationKMeans.m
% Functions needed: Ortho_PlotSubset_FromField_Classified.m


function [PlantRatio] = CanopyClosure (date, planting, year)

% year = '2020'; %Change
% date = '07082020'; %Change
% planting = 'WIDIV';

file = strcat('QGIS_layers/', year, '/', date, '/', date, '_geotiff_', planting, '.tif');
shapefile = strcat('QGIS_layers/', year, '/', date, '/Plots_', planting, '.shp');
roi = shaperead(shapefile);

fileIkm = strcat('data_analysis/', year, '/segmentation/', date, '_mask_', planting, '.mat');

IkmFile = matfile(fileIkm);
Ikm2 = IkmFile.Ikm;
%imshow(Ikm2,[]);

PlantRatio = zeros(length(roi), 1);

for plot = 1:length(roi)

[ortho_plot] = Ortho_PlotSubset_FromField_Classified(file, shapefile, plot, Ikm2);

    plantnumber = sum(sum(ortho_plot==1));
    othernumber = sum(sum(ortho_plot==0));
    ratio = plantnumber / (plantnumber + othernumber);
    
    PlantRatio(plot,1) = ratio; 
    
end

dlmwrite( strcat('data_analysis/', year, '/canopy_closure/', 'PlantRatio_', date, '_', planting, '.txt'), PlantRatio, 'delimiter', '\t');

%%

end
