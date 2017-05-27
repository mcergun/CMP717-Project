function output_vals = evaluate_scenario(input_path, guidance_path, filter_params)

addpath fileio
addpath noiselevel
addpath SDFilter/algorithms
addpath SDFilter/graphAnalysisToolbox-1.0

output_path = [input_path '/filter_out'];

tic;

sd_denoise_folder(input_path, guidance_path, output_path, filter_params);

[sigma_m11, sigma_m12] = estimate_folder_variance(input_path, 0);
[sigma_m21, sigma_m22] = estimate_folder_variance(output_path, 0);

toc;

fprintf('Estimated sigma value for input image is %0.4f and %0.4f\n', ... 
    sigma_m11, sigma_m12);
fprintf('Estimated sigma value for output image is %0.4f and %0.4f\n', ... 
    sigma_m21, sigma_m22);

output_vals.input_m1 = m11;
output_vals.input_m2 = m12;
output_vals.output_m1 = m21;
output_vals.output_m1 = m22;
end