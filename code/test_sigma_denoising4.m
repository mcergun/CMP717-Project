addpath fileio
addpath noiselevel
addpath SDFilter/algorithms
addpath SDFilter/graphAnalysisToolbox-1.0

input_folder = '../data/TRI_A1/ch2';
guidance_folder = '../data/TRI_A1/ch1';
output_folder = [input_folder '/filter_out'];

sigma = 10;
noisy_folder = [input_folder sprintf('/noisy%02d', sigma)];

% SD Denoising Parameters
filter_params.nei = 0;
filter_params.lambda = 7;
filter_params.mu = 6000;
filter_params.nu = 300;
filter_params.step = 10;
filter_params.issparse = false;

generate_noisy_image_folder(input_folder, noisy_folder, sigma);

tic;

sd_denoise_folder(noisy_folder, guidance_folder, output_folder, filter_params);

[sigma_m11, sigma_m12] = estimate_folder_variance(noisy_folder, 0);
[sigma_m21, sigma_m22] = estimate_folder_variance(output_folder, 0);

toc;

fprintf('Estimated sigma value for input image is %0.4f and %0.4f\n', ... 
    sigma_m11, sigma_m12);
fprintf('Estimated sigma value for output image is %0.4f and %0.4f\n', ... 
    sigma_m21, sigma_m22);