function [] = Create_histoCAT_folders_MIBI(tiff_name)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

% Load image
image = zeros(1024,1024,26);
for i = 1:26
image(:,:,i) = imread...
    (tiff_name,i);
end

% Load marker names
ablist = readtable('MIBI_AB_LIST.csv','ReadVariableNames',false);

% Remove dash
Remove_dash = strsplit(tiff_name,{'-',' ','.'});
Folder_name_no_dash = strcat(Remove_dash{1:(end-1)});
mkdir(Folder_name_no_dash);

Mask_name = strsplit(tiff_name,'.');
Mask_name = strcat(Mask_name{1:(end-1)},'_Probabilities_mask.tiff');
copyfile(Mask_name, fullfile(pwd,Folder_name_no_dash,strcat...
    (Folder_name_no_dash,'_Probabilities_mask.tiff')));

for k = 1:26
imwrite(image(:,:,k),char(fullfile(Folder_name_no_dash,strcat(ablist{k,1},'.tiff'))));
end

end

