clc
clear all
close all

load('C:\Users\sypark\Desktop\Projects\w_MinSeok\1SERSNet\cdcl2\sers_785.mat')
data = squeeze(mean(double(imread('peppers.png')),3));
subplot(3,2,1), imshow(data,[]);
title('LABEL')
subplot(3,2,2), hist(data(:));
title('LABEL')

label = uint8(data);
% data = double(imnoise(uint8(data),'speckle',0.1));
% data = double(imnoise(uint8(data),'gaussian',0.1));
% data = double(imnoise(uint8(data),'salt & pepper',0.1));
% data = double(imnoise(uint8(data),'poisson'));

data_sc = double(imnoise(uint8(data),'speckle',0.2));
data_ga = double(imnoise(uint8(data),'gaussian',0.1));
data_sp = double(imnoise(uint8(data),'salt & pepper',0.2));
data_ps = double(imnoise(uint8(data),'poisson'));

data = [data_sc(:)'; data_ga(:)'; data_sp(:)'; data_ps(:)'];

subplot(3,2,3), imshow(reshape(mean(data),size(data_ga)),[]);
title('MEAN')
subplot(3,2,4), hist(data(:));
title('MEAN')
num_samples = size(data,2);
%% minimum-variance-beamformer
input_set = {};
output_set = {};

% input_set = gpuArray(input_set);
% ouput_set = gpuArray(ouput_set);

sub_arr_L = 1; % sub-aperture averaging window size (spatial averaging)

max_data = max(abs(data(:)));
data = data./max_data;

MV_data = max_data*gather(min_var_BF_single(data,sub_arr_L));
data = data*max_data;
mean_data = mean(data);

subplot(3,2,5), imshow(reshape(MV_data,size(data_ga)),[]);
title('MV')
subplot(3,2,6), hist(MV_data(:));
title('MV')

%%%%%%%%%%
mean_var = sum(var((data-repmat(mean_data,size(data,1),1))'));
mv_var = sum(var((data-repmat(MV_data,size(data,1),1))'));
[mean_var, mv_var]

mean_var = sum(var((data-repmat(mean_data,size(data,1),1))));
mv_var = sum(var((data-repmat(MV_data,size(data,1),1))));
[mean_var, mv_var]

mean_img = uint8(reshape(mean_data,size(data_ga)));
MV_img = uint8(reshape(MV_data,size(data_ga)));
[ssim(label,mean_img),ssim(label,MV_img);psnr(label,mean_img),psnr(label,MV_img)]