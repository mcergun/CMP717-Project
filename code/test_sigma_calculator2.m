clear
clc
ch1_path = '../data/TRI_A1/ch1';
ch2_path = '../data/TRI_A1/ch1/filter_out';
% ch3_path = '../data/TRI_A1/ch3';
sigma = 20;

% generate_noisy_image_folder(folder_path, sigma);

[sigma_m11, sigma_m21] = estimate_folder_variance(ch1_path, 0);
[sigma_m12, sigma_m22] = estimate_folder_variance(ch2_path, 0);
% [sigma_m13, sigma_m23] = estimate_folder_variance(ch3_path, 0);

% estimate_folder_variance