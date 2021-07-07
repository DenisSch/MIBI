%% Script to create histoCAT loading for MIBI dataset
% Move to folder
cd /Users/denis/Desktop/Postdoc/Fellow_Broad/MIBI/Will_Pancreas/all/Will-pancrease/
addpath(genpath(pwd));

% Read folder
folder_info= dir(pwd);

% Remove all tiffs with "probabilties"
Index_Probabilities = regexp({folder_info.name},'_Probabilities.tiff|_mask.tiff');
Remove_Probabilities = find(cellfun(@isempty,Index_Probabilities));

% Select only ".tiff"
Index_tiff = regexp({folder_info(Remove_Probabilities).name},'.tiff');
Select_tiff = find(~cellfun(@isempty,Index_tiff));
Tiff_files = Remove_Probabilities(Select_tiff);

% Create histoCAT folders
for i=1:size(Tiff_files,2)
   tiff_name = folder_info(Tiff_files(1,i)).name; 
   Create_histoCAT_folders_MIBI(tiff_name);  
end
